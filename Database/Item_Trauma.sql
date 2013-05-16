-- Trauma (item) never procced.
DELETE FROM `spell_proc_event` WHERE `entry` IN (71865,71868);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(71865, 0, 0, 0, 0, 0, 0x44000, 0, 0, 0, 0),
(71868, 0, 0, 0, 0, 0, 0x44000, 0, 0, 0, 0);