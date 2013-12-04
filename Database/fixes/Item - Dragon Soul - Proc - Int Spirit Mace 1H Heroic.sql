-- Item - Dragon Soul - Proc - Int Spirit Mace 1H Heroic.
DELETE FROM `spell_proc_event` WHERE  `entry`=109850;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(109850, 32, 0, 0x00000000, 0x00000000, 0x00000000, 0x00044000, 0, 0, 15, 15);