import copy
import importlib.util
import json
from pathlib import Path
import unittest

ROOT=Path(__file__).resolve().parents[1]
spec=importlib.util.spec_from_file_location('generator', ROOT/'scripts/generate_assignments.py')
generator=importlib.util.module_from_spec(spec)
spec.loader.exec_module(generator)

class AssignmentTests(unittest.TestCase):
    def setUp(self):
        self.data=json.loads((ROOT/'data/recipients.json').read_text(encoding='utf-8'))

    def test_both_steam2_bits_and_universes(self):
        self.assertEqual(generator.account_id('STEAM_0:1:18872973'),37745947)
        self.assertEqual(generator.account_id('STEAM_1:1:18872973'),37745947)
        self.assertEqual(generator.account_id('STEAM_0:0:39544726'),79089452)
        for invalid in ('[U:1:37745947]','STEAM_0:2:10','STEAM_0:0:0','STEAM_0:1:2147483648'):
            with self.assertRaises(ValueError): generator.account_id(invalid)

    def test_current_manifest_and_promotions(self):
        awards,grants=generator.validate(self.data)
        self.assertEqual(len(awards),16)
        self.assertEqual(set(grants[37745947]),{'ensl_lost_s13_d3_gold','ensl_lost_s14_bronze'})
        for badge in ('ensl_lost_s13_d1_gold','ensl_lost_s14_gold','ensl_lost_s15_d1_gold'):
            self.assertEqual((awards[badge]['published_place'],awards[badge]['awarded_place']),(2,1))
        self.assertNotIn('ensl_lost_s13_d1_bronze',awards)
        self.assertNotIn('ensl_lost_s15_d1_bronze',awards)

    def test_unverified_award_cannot_be_granted(self):
        row=next(r for r in self.data['assignments'] if r['status']=='needs_confirmation')
        row['account']=copy.deepcopy(row['candidates'][0])
        with self.assertRaises(AssertionError): generator.validate(self.data)

    def test_inconsistent_id_is_rejected(self):
        row=next(r for r in self.data['assignments'] if r['status']=='verified')
        row['account']['ns2_id']+=1
        with self.assertRaises(AssertionError): generator.validate(self.data)

    def test_duplicate_account_award_is_rejected(self):
        rows=[r for r in self.data['assignments'] if r['badge']=='ensl_lost_s13_d3_gold' and r['status']=='verified']
        rows[1]['account']=copy.deepcopy(rows[0]['account'])
        with self.assertRaises(AssertionError): generator.validate(self.data)

if __name__=='__main__':unittest.main()
