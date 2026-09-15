-- Run using Lua 5.4. Engine services are simulated; the badge implementation is
-- the actual installed NS2 code. This checks integration logic, not rendering.
local repo = assert(arg[1], 'Pass the repository path')
local game = assert(arg[2], 'Pass the installed ns2 directory')
local source = repo .. '/source/'
local badgeName = 'ensl_lost_s13_d3_gold'
local formalName = 'The ENSL Season 13 Division 3 Winner'
local ownerId = 37745947
local connections, clientVMs = {}, {}
local sharedFile = assert(io.open(source .. 'lua/ENSLLostSeasonBadges/Shared.lua', 'r'))
local customNames = {}
for name in sharedFile:read('*a'):gmatch('name = "(ensl_lost_[^"]+)"') do
    customNames[#customNames + 1] = name
end
sharedFile:close()
assert(#customNames == 16, 'Expected the 16 established award definitions')
local server
local function exists(file)
    local f = io.open(file, 'rb')
    if f then f:close(); return true end
    return false
end

local function newVM(isServer, clientIndex, savedOptions)
    local env = setmetatable({}, { __index = _G })
    env._G = env
    env.events, env.network, env.loaded, env.postHooks = {}, {}, {}, {}
    env.options = savedOptions or {}
    env.bit = {
        band = function(a,b) return a & b end,
        bor = function(a,b) return a | b end,
        lshift = function(a,b) return a << b end
    }
    env.enum = function(list)
        local result = {}
        for i,name in ipairs(list) do result[i-1] = name; result[name] = i-1 end
        return result
    end
    env.Log, env.PROFILE, env.Print = function() end, function() end, function() end
    env.GetHasDLC, env.GetOwnsItem = function() return false end, function() return false end
    env.GetBadgeCustomizer = function() return nil end
    env.Locale = { ResolveString = function(s) return s end }
    env.Shared = {
        Message = function() end,
        RegisterNetworkMessage = function() end,
        GetMatchingFileNames = function(pattern,recursive,files)
            assert(pattern == 'ui/badges/*.dds' and recursive == false)
            for _, name in ipairs(customNames) do
                assert(exists(source .. 'ui/badges/' .. name .. '.dds'), 'Missing award texture')
                files[#files+1] = 'ui/badges/' .. name .. '.dds'
            end
            files[#files+1] = 'ui/badges/ensl_2018_gold.dds'
        end
    }
    env.Event = { Hook = function(name,fn)
        env.events[name] = env.events[name] or {}
        table.insert(env.events[name],fn)
    end }
    env.ModLoader = { SetupFileHook = function(original,hook,mode)
        assert(mode == 'post' and not env.loaded[original])
        env.postHooks[original] = env.postHooks[original] or {}
        table.insert(env.postHooks[original],hook)
    end }
    env.Script = { Load = function(file)
        if env.loaded[file] then return end
        env.loaded[file] = true
        local path = exists(source .. file) and source .. file or game .. '/' .. file
        assert(loadfile(path,'t',env))()
        for _,hook in ipairs(env.postHooks[file] or {}) do env.Script.Load(hook) end
    end }
    if isServer then
        env.Server = {
            GetClientById = function(id) return connections[id] end,
            RequestUserStats = function() end,
            GetHasUserStat_Int = function() return false end,
            GetHasUserStat_Float = function() return false end,
            HookNetworkMessage = function(name,fn) env.network[name] = fn end,
            SendNetworkMessage = function(a,b,c)
                local target,name,msg
                if type(a) == 'string' then name,msg = a,b else target,name,msg = a,b,c end
                for id,vm in pairs(clientVMs) do
                    if not target or id == target:GetId() then
                        if vm.network[name] then vm.network[name](msg) end
                    end
                end
            end
        }
    else
        env.Client = {
            HookNetworkMessage = function(name,fn) env.network[name] = fn end,
            GetIsConnected = function() return connections[clientIndex] ~= nil end,
            GetOptionString = function(key,default) return env.options[key] or default end,
            SetOptionString = function(key,value) env.options[key] = value end,
            SendNetworkMessage = function(name,msg) server.network[name](connections[clientIndex],msg) end
        }
    end
    env.Script.Load('lua/entry/ENSLLostSeasonBadges.entry')
    env.Script.Load(env.modEntry.FileHooks)
    env.Script.Load(isServer and 'lua/Badges_Server.lua' or 'lua/Badges_Client.lua')
    return env
end

local function event(vm,name,...)
    for _,fn in ipairs(vm.events[name] or {}) do fn(...) end
end
local function connect(index,userId,options,virtual)
    local client = {
        GetId = function() return index end,
        GetUserId = function() return userId end,
        GetIsVirtual = function() return virtual or false end
    }
    connections[index] = client
    clientVMs[index] = newVM(false,index,options)
    event(server,'ClientConnect',client)
    return clientVMs[index],client
end

server = newVM(true)
local badgeId = assert(server.gBadges[badgeName])
local data = server.Badges_GetBadgeDataByName(badgeName)
assert(data.name == formalName and data.columns == 960 and not data.isOfficial)
assert(data.itemId == nil and data.productId == nil)
assert(data.scoreboardTexture == data.unitStatusTexture and exists(source .. data.scoreboardTexture))
assert(server.Badges_GetBadgeDataByName('ensl_s12_d3_gold').isOfficial)
assert(server.Badges_GetBadgeDataByName('ensl_s12_d3_gold').name ~= formalName)

local bleu,bleuClient = connect(21,ownerId)
assert(bleu.gBadges[badgeName] == badgeId, 'Server/client registration mismatch')
assert(bleu.Badges_GetOwnedBadges()[badgeId] == 960, 'Owner did not receive four eligible slots')
local secondBadge = 'ensl_lost_s14_bronze'
local secondId = assert(server.gBadges[secondBadge])
assert(bleu.Badges_GetOwnedBadges()[secondId] == 960, 'Bleu did not receive earned S14 bronze')
assert(bleu.options.Badge7 == badgeName or bleu.options.Badge8 == badgeName, 'Native empty-slot auto-selection failed')
assert(not bleu.loaded['lua/ENSLLostSeasonBadges/Recipients_Server.lua'], 'Client loaded server assignment logic')
local textures,names = bleu.Badges_GetBadgeTextures(21,'scoreboard')
local function contains(list,value)
    for _,item in ipairs(list) do if item == value then return true end end
    return false
end
assert(#textures == 2 and contains(textures,data.scoreboardTexture) and contains(names,formalName))
assert(contains(names, 'The ENSL Season 14 Second Runner-Up'), 'S14 hover name missing')
assert(server.Badges_SetBadge(21,badgeId,10), 'Allowed slot rejected')
assert(not server.Badges_SetBadge(21,badgeId,5), 'Disallowed slot accepted')
textures = bleu.Badges_GetBadgeTextures(21,'scoreboard')
assert(#textures == 2, 'Moving one badge duplicated it or removed another award')

local other,otherClient = connect(22,ownerId+1)
server.Badges_FetchBadges(22,{}) -- Simulate vanilla's later stats callback.
assert(not other.Badges_GetOwnedBadges()[badgeId], 'Unlisted account received ownership')
assert(not server.Badges_OnClientBadgeRequest(22,{badge=badgeId,column=7}), 'Unlisted account selected badge')
textures,names = other.Badges_GetBadgeTextures(21,'scoreboard')
assert(#textures == 2 and contains(names,formalName), 'Late joiner did not see owner badge and name')

event(server,'ClientDisconnect',bleuClient)
connections[21],clientVMs[21] = nil,nil
local saved = { Badge7='ensl_s12_d3_gold', Badge8='ensl_s16_gold', Badge9='dev', Badge10='none' }
local rejoined = connect(23,ownerId,saved)
assert(rejoined.Badges_GetOwnedBadges()[badgeId] == 960, 'Reconnect lost ownership')
assert(rejoined.options.Badge7 == 'ensl_s12_d3_gold' and rejoined.options.Badge8 == 'ensl_s16_gold' and rejoined.options.Badge9 == 'dev', 'Existing choices overwritten')
assert(rejoined.options.Badge10 == badgeName or rejoined.options.Badge10 == secondBadge, 'Native selection did not use available slot')

local bot = connect(24,ownerId,nil,true)
assert(not bot.Badges_GetOwnedBadges()[badgeId], 'Virtual connection received grant')
connections,clientVMs = {},{}
server = newVM(true) -- Fresh VM represents a map/server reload.
local afterReload = connect(25,ownerId)
assert(afterReload.Badges_GetOwnedBadges()[server.gBadges[badgeName]] == 960, 'Reload lost configured award')

-- Validate every real configured account against native ownership, and reject
-- every unearned custom award, including accounts earning medals in two seasons.
local checkedAccounts, checkedAwards = 0, 0
for userId, earned in pairs(server.ENSL_LostSeasonBadges.Recipients) do
    local expected = {}
    for _,name in ipairs(earned) do expected[name] = true end
    local vm,client = connect(100,userId)
    for _,award in ipairs(server.ENSL_LostSeasonBadges.Awards) do
        local id = server.gBadges[award.name]
        assert(vm.gBadges[award.name] == id, 'Badge ordering mismatch')
        local meta = vm.Badges_GetBadgeDataByName(award.name)
        assert(meta.name == award.formalName and meta.columns == 960 and not meta.isOfficial)
        if expected[award.name] then
            assert(vm.Badges_GetOwnedBadges()[id] == 960, 'Missing earned award')
            checkedAwards = checkedAwards + 1
        else
            assert(not vm.Badges_GetOwnedBadges()[id], 'Unearned award granted')
            assert(not server.Badges_OnClientBadgeRequest(100,{badge=id,column=7}), 'Unearned award selectable')
        end
    end
    checkedAccounts = checkedAccounts + 1
    event(server,'ClientDisconnect',client)
    connections[100],clientVMs[100] = nil,nil
end
print('Verified all native entitlements: ' .. checkedAwards .. ' awards across ' .. checkedAccounts .. ' accounts')

print('PASS: native registration, metadata, owner-only grants, permitted slots, selection, exact hover name, late-join visibility, reconnect, existing choices, virtual-client exclusion and fresh-VM reload')
