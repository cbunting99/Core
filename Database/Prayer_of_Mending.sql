DELETE FROM `spell_proc_event` WHERE `entry` IN (14892,15362,15363);
INSERT INTO `spell_proc_event` (`entry`, `SchoolMask`, `SpellFamilyName`, `SpellFamilyMask0`, `SpellFamilyMask1`, `SpellFamilyMask2`, `procFlags`, `procEx`, `ppmRate`, `CustomChance`, `Cooldown`) VALUES
(14892,0,6,268443136,65572,0,0,0x40002,0,0,0), -- Inspiration (Rank 1)
(15362,0,6,268443136,65572,0,0,0x40002,0,0,0), -- Inspiration (Rank 2)
(15363,0,6,268443136,65572,0,0,0x40002,0,0,0); -- Inspiration (Rank 3)