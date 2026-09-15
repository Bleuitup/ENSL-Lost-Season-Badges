$ErrorActionPreference = 'Stop'
$repoDir = [System.IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..'))
$sourceDir = Join-Path $repoDir 'source'
$outputDir = [System.IO.Path]::GetFullPath((Join-Path $repoDir 'output'))
if ([System.IO.Path]::GetDirectoryName($outputDir) -ne $repoDir -or [System.IO.Path]::GetFileName($outputDir) -ne 'output') {
    throw 'Build output must be the output folder directly inside this repository.'
}
if (!(Test-Path -LiteralPath (Join-Path $sourceDir 'lua\entry\ENSLLostSeasonBadges.entry'))) { throw 'Mod source entry is missing.' }
if (Test-Path -LiteralPath $outputDir) {
    $item = Get-Item -LiteralPath $outputDir -Force
    if ($item.Attributes -band [System.IO.FileAttributes]::ReparsePoint) { throw 'Refusing to replace a linked output folder.' }
    # Source and output are fully resolved and checked above before this deletion.
    Remove-Item -LiteralPath $outputDir -Recurse -Force
}
[System.IO.Directory]::CreateDirectory($outputDir) | Out-Null
Get-ChildItem -LiteralPath $sourceDir -Force | ForEach-Object { Copy-Item -LiteralPath $_.FullName -Destination $outputDir -Recurse -Force }
$commit = & git -C $repoDir rev-parse HEAD
$dirty = [bool](& git -C $repoDir status --porcelain --untracked-files=normal)
$build = @{ commit = "$commit"; dirty = $dirty; built_at_utc = [DateTime]::UtcNow.ToString('o'); source = 'source'; output = 'output' }
$build | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $repoDir '.output-build-info') -Encoding utf8
Write-Output "Launchpad output prepared from $commit (working changes: $dirty)."
