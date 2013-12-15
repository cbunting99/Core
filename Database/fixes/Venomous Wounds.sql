-- Venomous Wounds.
DELETE FROM `spell_proc_event` WHERE  `entry`=79133;
DELETE FROM `spell_proc_event` WHERE  `entry`=79134;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(79133, 1, 11, 0x00100000, 0x00000000, 0x00000000, 0x00040000, 0, 0, 30, 0),
(79134, 1, 11, 0x00100000, 0x00000000, 0x00000000, 0x00040000, 0, 0, 60, 0);