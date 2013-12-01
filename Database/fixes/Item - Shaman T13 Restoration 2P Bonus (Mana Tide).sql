-- Item - Shaman T13 Restoration 2P Bonus (Mana Tide).
DELETE FROM `spell_proc_event` WHERE  `entry`=105764;
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES 
(105764, 1, 11, 0x20000000, 0x00000000, 0x00000000, 0x00004400, 0, 0, 100, 0);