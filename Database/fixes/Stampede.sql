-- Stampede.
DELETE FROM `spell_proc_event` WHERE  `entry`=81021;
DELETE FROM `spell_proc_event` WHERE  `entry`=81022;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(81021, 1, 11, 0x00000000, 0x00000004, 0x00000000, 0x00001010, 0, 0, 100, 0),
(81022, 1, 11, 0x00000000, 0x00000004, 0x00000000, 0x00001010, 0, 0, 100, 0);