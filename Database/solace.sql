DELETE FROM `spell_proc_event` WHERE entry=67698;
DELETE FROM `spell_proc_event` WHERE entry=67752;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (67698, 0, 0, 0, 0, 0, 348176, 65536, 0, 0, 0);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES (67752, 0, 0, 0, 0, 0, 348176, 65536, 0, 0, 0);
-- Fix Solace trinket to proc on all positive spells, not only ones which heal the caster