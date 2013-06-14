SET @ENTRY := 176;
DELETE FROM `trinity_string` WHERE `entry` IN(@ENTRY, @ENTRY+1);
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES 
(@ENTRY,   'Invalid gameobject type, must be a destructible building.'),
(@ENTRY+1, 'Gameobject %s (GUID: %u) damaged %u (actual health: %u).');
ALTER TABLE `spell_target_position` ADD COLUMN `effIndex` tinyint(3) UNSIGNED NOT NULL DEFAULT '0' AFTER `id`;
ALTER TABLE `spell_target_position` DROP INDEX `PRIMARY`, ADD PRIMARY KEY (`id`, `effIndex`);
 
UPDATE `spell_target_position` SET `effIndex`='1' WHERE `id` IN (53821, 68081, 46473, 73655, 72546, 72340, 67838, 67835, 67836, 67837, 67834, 49098, 49097, 54963, 11012, 8606);
UPDATE `spell_target_position` SET `effIndex`='2' WHERE `id` IN (36801, 71765, 71763, 71762, 71744, 71712, 71751, 43209, 51852);
-- NPCs
SET @VOICE_OF_YOGG_SARON := 33280;
SET @YOGG_SARON := 33288;
SET @YOGG_SARON_H := 33955;
SET @SARA := 33134;
SET @SARA_H := 34332;
SET @BRAIN_OF_YOGG_SARON := 33890;
SET @BRAIN_OF_YOGG_SARON_H := 33954;
SET @OMINOUS_CLOUD := 33292;
SET @GUARDIAN_OF_YOGG_SARON := 33136;
SET @GUARDIAN_OF_YOGG_SARON_H := 33968;
SET @CORRUPTOR_TENTACLE := 33985;
SET @CORRUPTOR_TENTACLE_H := 33986;
SET @CONSTRICTOR_TENTACLE := 33983;
SET @CONSTRICTOR_TENTACLE_H := 33984;
SET @CRUSHER_TENTACLE := 33966;
SET @CRUSHER_TENTACLE_H := 33967;
SET @LAUGHING_SKULL := 33990;
SET @DEATH_RAY := 33881;
SET @DEATH_ORB := 33882;
SET @GARONA := 33436;
SET @KING_LLANE := 33437;
SET @SUIT_OF_ARMOR := 33433;
SET @THE_LICH_KING := 33441;
SET @IMMOLATED_CHAMPION := 33442;
SET @TURNED_CHAMPION := 33962;
SET @DEATHSWORN_ZEALOT := 33567;
SET @NELTHARION := 33523;
SET @ALEXSTRASZA := 33536;
SET @YSERA := 33495;
SET @MALYGOS := 33535;
SET @OBSIDIAN_CONSORT := 33720;
SET @AZURE_CONSORT := 33717;
SET @EMERALD_CONSORT := 33719;
SET @RUBY_CONSORT := 33716;
SET @YOGG_SARON_ILLUSIONS := 33552;
SET @TRIGGER := 28332; -- Generic Trigger LAB (Large AOI), maybe to start illusion events?
SET @FREYA_GOSSIP := 33241;
SET @HODIR_GOSSIP := 33213;
SET @THORIM_GOSSIP := 33242;
SET @MIMIRON_GOSSIP := 33244;
SET @FREYA_YS := 33410;
SET @HODIR_YS := 33411;
SET @MIMIRON_YS := 33412;
SET @THORIM_YS := 33413;
SET @IMMORTAL_GUARDIAN := 33988;
SET @IMMORTAL_GUARDIAN_H := 33989;
SET @MARKED_IMMORTAL_GUARDIAN := 36064;
SET @MARKED_IMMORTAL_GUARDIAN_H := 36067;
SET @SANITY_WELL := 33991;
SET @INFLUENCE_TENTACLE := 33943;
SET @INFLUENCE_TENTACLE_H := 33959;
SET @DESCEND_INTO_MADNESS := 34072;

SET @GUID := 62015;

-- GameObjects
SET @FLEE_TO_THE_SURFACE := 194625;
SET @DRAGON_SOUL := 194462;
SET @INSTANCE_PORTAL := 194338;
SET @CHAIR := 194360;

SET @GO_GUID := 17800;

DELETE FROM `creature_text` WHERE `entry` IN (@SARA,@YOGG_SARON,@VOICE_OF_YOGG_SARON,@GARONA,@KING_LLANE,@THE_LICH_KING,@IMMOLATED_CHAMPION,@NELTHARION,@YSERA,@MALYGOS,@YOGG_SARON_ILLUSIONS,@FREYA_GOSSIP,@HODIR_GOSSIP,@THORIM_GOSSIP,@MIMIRON_GOSSIP,@OMINOUS_CLOUD,@BRAIN_OF_YOGG_SARON);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@SARA,0,0,'Help me! Please get them off me!',14,0,100,0,0,15771,'Sara - SAY_SARA_ULDUAR_SCREAM_1'),
(@SARA,1,0,'What do you want from me? Leave me alone!',14,0,100,0,0,15772,'Sara - SAY_SARA_ULDUAR_SCREAM_2'),
(@SARA,2,0,'The time to strike at the head of the beast will soon be upon us! Focus your anger and hatred on his minions!',14,0,100,457,0,15775,'Sara - SAY_SARA_AGGRO'),
(@SARA,3,0,'Yes! YES! Show them no mercy! Give no pause to your attacks!',14,0,100,0,0,15773,'Sara - SAY_SARA_FERVOR_HIT'),
(@SARA,4,0,'Let hatred and rage guide your blows!',14,0,100,0,0,15774,'SAY_SARA_BLESSING_HIT'),
(@SARA,5,0,'Could they have been saved?',14,0,100,0,0,15779,'Sara - SAY_SARA_KILL'),
(@SARA,5,1,'Powerless to act...',14,0,100,0,0,15778,'Sara - SAY_SARA_KILL'),
(@SARA,6,0,'I am the lucid dream.',14,0,100,457,0,15754,'Sara - SAY_SARA_TRANSFORM_1'),
(@SARA,7,0,'The monster in your nightmares.',14,0,100,457,0,0,'Sara - SAY_SARA_TRANSFORM_2'),
(@SARA,8,0,'The fiend of a thousand faces.',14,0,100,457,0,0,'Sara - SAY_SARA_TRANSFORM_3'),
(@SARA,9,0,'Cower before my true form.',14,0,100,457,0,0,'Sara - SAY_SARA_TRANSFORM_4'),
(@SARA,10,0,'Tremble, mortals, before the coming of the end!',14,0,100,0,0,15777,'Sara - SAY_SARA_DEATH_RAY'),
(@SARA,11,0,'Suffocate upon your own hate!',14,0,100,0,0,15776,'Sara - SAY_SARA_PSYCHOSIS_HIT'),
(@OMINOUS_CLOUD,0,0,'%s begins to boil upon touching $n!',16,0,100,0,0,0,'Ominous Cloud - EMOTE_OMINOUS_CLOUD_PLAYER_TOUCH'),
(@YOGG_SARON,0,0,'BOW DOWN BEFORE THE GOD OF DEATH!',14,0,100,0,0,0,'Yogg-Saron - SAY_YOGG_SARON_SPAWN'),
(@YOGG_SARON,1,0,'MADNESS WILL CONSUME YOU!',14,0,100,0,0,15756,'Yogg-Saron - SAY_YOGG_SARON_MADNESS'),
(@YOGG_SARON,2,0,'Portals open into %s''s mind!',41,0,100,0,0,0,'Yogg-Saron - EMOTE_YOGG_SARON_MADNESS'),
(@YOGG_SARON,3,0,'Look upon the true face of death and know that your end comes soon!',14,0,100,0,0,15755,'Yogg-Saron - SAY_YOGG_SARON_PHASE_3'),
(@YOGG_SARON,4,0,'Eternal suffering awaits!',14,0,100,0,0,15758,'Yogg-Saron - SAY_YOGG_SARON_DEAFENING_ROAR'),
(@YOGG_SARON,5,0,'%s opens his mouth wide!',41,0,100,0,0,0,'Yogg-Saron - EMOTE_YOGG_SARON_DEAFENING_ROAR'),
(@YOGG_SARON,6,0,'Your fate is sealed. The end of days is finally upon you and ALL who inhabit this miserable little seedling. Uulwi ifis halahs gag erh''ongg w''ssh.',14,0,100,0,0,15761,'Yogg-Saron - SAY_YOGG_SARON_DEATH'),
(@YOGG_SARON,7,0,'%s prepares to unleash Empowering Shadows!',41,0,100,0,0,0,'Yogg-Saron - EMOTE_YOGG_SARON_EMPOWERING_SHADOWS'),
(@YOGG_SARON,8,0,'%s goes berserk, extinguishing all life!',41,0,100,0,0,0,'Yogg-Saron - EMOTE_YOGG_SARON_EXTINGUISH_ALL_LIFE'),
(@VOICE_OF_YOGG_SARON,0,0,'Weak-minded fools!',15,0,100,0,0,15780,'Voice of Yogg-Saron - WHISPER_VOICE_PHASE_1_WIPE'),
(@VOICE_OF_YOGG_SARON,1,0,'Your will is no longer your own...',15,0,100,0,0,15759,'Voice of Yogg-Saron - WHISPER_VOICE_INSANE'),
(@VOICE_OF_YOGG_SARON,1,1,'Destroy them minion, your master commands it!',15,0,100,0,0,15760,'Voice of Yogg-Saron - WHISPER_VOICE_INSANE'),
(@BRAIN_OF_YOGG_SARON,0,0,'The illusion shatters and a path to the central chamber opens!',41,0,100,0,0,0,'Brain of Yogg-Saron - EMOTE_BRAIN_ILLUSION_SHATTERED'),
(@GARONA,0,0,'Bad news sire.',12,0,100,66,0,15538,'Garona'),
(@GARONA,1,0,'The clans are united under Blackhand in this assault. They will stand together until Stormwind has fallen.',12,0,100,274,0,15539,'Garona'),
(@GARONA,2,0,'Gul''dan is bringing up his warlocks by nightfall. Until then, the Blackrock clan will be trying to take the Eastern Wall.',12,0,100,1,0,15540,'Garona'),
(@GARONA,3,0,'The orc leaders agree with your assessment.',12,0,100,0,0,15541,'Garona'),
(@KING_LLANE,0,0,'We will hold until the reinforcements come. As long as men with stout hearts are manning the walls and throne Stormwind will hold.',12,0,100,274,0,15585,'King Llane'),
(@THE_LICH_KING,0,0,'Your resilience is admirable.',12,0,100,0,0,15598,'The Lich King'),
(@THE_LICH_KING,1,0,'I will break you as I broke him.',12,0,100,0,0,15599,'The Lich King'),
(@IMMOLATED_CHAMPION,0,0,'Arrrrrrgh!',14,0,100,0,0,15470,'Immolated Champion'),
(@IMMOLATED_CHAMPION,1,0,'I''m not afraid of you!',12,0,100,0,0,15471,'Immolated Champion'),
(@NELTHARION,0,0,'It is done... All have been given that which must be given. I now seal the Dragon Soul forever...',12,0,100,0,0,15631,'Neltharion'),
(@NELTHARION,1,0,'For it to be as it must, yes.',12,0,100,273,0,15632,'Neltharion'),
(@YSERA,0,0,'That terrible glow... should that be?',12,0,100,0,0,15702,'Ysera'), -- or sound 15784? they are the same
(@MALYGOS,0,0,'It is a weapon like no other. It must be like no other.',12,0,100,1,0,15610,'Malygos'),
(@YOGG_SARON_ILLUSIONS,0,0,'A thousand deaths... or one murder.',12,0,100,0,0,15762,'Yogg-Saron'), -- sound splited! 15763 - "or one murder".
(@YOGG_SARON_ILLUSIONS,1,0,'Your petty quarrels only make me stronger!',12,0,100,0,0,15764,'Yogg-Saron'),
(@YOGG_SARON_ILLUSIONS,2,0,'Yrr n''lyeth... shuul anagg!',12,0,100,0,0,15766,'Yogg-Saron'),
(@YOGG_SARON_ILLUSIONS,3,0,'He will learn... no king rules forever; only death is eternal!',12,0,100,0,0,15767,'Yogg-Saron'),
(@YOGG_SARON_ILLUSIONS,4,0,'His brood learned their lesson before too long. You will soon learn yours!',12,0,100,0,0,15765,'Yogg-Saron'),
(@FREYA_GOSSIP,0,0,'As you wish, $N.',12,0,100,0,0,0,'Freya (Observation Ring) - On Gossip Select'),
(@FREYA_GOSSIP,1,0,'Eonar, your servant calls for your blessing!',14,0,100,0,0,15535,'Freya (Observation Ring) - On Gossip Select'),
(@HODIR_GOSSIP,0,0,'As you wish, $N.',12,0,100,0,0,0,'Hodir (Observation Ring) - On Gossip Select'),
(@HODIR_GOSSIP,1,0,'The veil of winter will protect you, champions!',14,0,100,0,0,15559,'Hodir (Observation Ring) - On Gossip Select'),
(@THORIM_GOSSIP,0,0,'As you wish, $N.',12,0,100,0,0,0,'Thorim (Observation Ring) - On Gossip Select'),
(@THORIM_GOSSIP,1,0,'Golganneth, lend me your strengh! Grant my mortal allies the power of thunder!',14,0,100,0,0,15750,'Thorim (Observation Ring) - On Gossip Select'),
(@MIMIRON_GOSSIP,0,0,'As you wish, $N.',12,0,100,0,0,0,'Mimiron (Observation Ring) - On Gossip Select'),
(@MIMIRON_GOSSIP,1,0,'Combat matrix enhanced. Behold wonderous rapidity!',14,0,100,0,0,15630,'Mimiron (Observation Ring) - On Gossip Select');

DELETE FROM `npc_text` WHERE `ID` IN (14332,14333);
INSERT INTO `npc_text` (`ID`,`text0_0`,`text0_1`,`lang0`,`prob0`,`em0_0`,`em0_1`,`em0_2`,`em0_3`,`em0_4`,`em0_5`,`text1_0`,`text1_1`,`lang1`,`prob1`,`em1_0`,`em1_1`,`em1_2`,`em1_3`,`em1_4`,`em1_5`,`text2_0`,`text2_1`,`lang2`,`prob2`,`em2_0`,`em2_1`,`em2_2`,`em2_3`,`em2_4`,`em2_5`,`text3_0`,`text3_1`,`lang3`,`prob3`,`em3_0`,`em3_1`,`em3_2`,`em3_3`,`em3_4`,`em3_5`,`text4_0`,`text4_1`,`lang4`,`prob4`,`em4_0`,`em4_1`,`em4_2`,`em4_3`,`em4_4`,`em4_5`,`text5_0`,`text5_1`,`lang5`,`prob5`,`em5_0`,`em5_1`,`em5_2`,`em5_3`,`em5_4`,`em5_5`,`text6_0`,`text6_1`,`lang6`,`prob6`,`em6_0`,`em6_1`,`em6_2`,`em6_3`,`em6_4`,`em6_5`,`text7_0`,`text7_1`,`lang7`,`prob7`,`em7_0`,`em7_1`,`em7_2`,`em7_3`,`em7_4`,`em7_5`,`WDBVerified`) VALUES
(14332,'Mortals, I am indebted to you for freeing me from the terrible corruption that besets this place. Though I have not yet recovered fully, I can help you battle Yogg-Saron.$B$BI can grant you and your friends the Resilience of Nature, increasing your damage and increasing healing taken from spells and effects. In addition, I can conjure Sanity Wells that will allow you to recover your Sanity when your grip on reality falters.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,1),
(14333,'Mortals, I am indebted to you for freeing me from the terrible corruption that besets this place. Though I have not yet recovered fully, I can help you battle Yogg-Saron.$B$BI can grant you and your friends the Fury of the Storm, increasing your damage and maximum health. Should you be faced with evil so malevolent that it cannot be destroyed, I can channel all my power into a final Titanic Storm that will destroy even Immortals.','',0,1,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,'','',0,0,0,0,0,0,0,0,1);

DELETE FROM `gossip_menu` WHERE `entry` IN (10324,10333,10335,10336,10337);
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(10324,14332),
(10333,14325),
(10335,14326),
(10337,14333),
(10336,14334);

DELETE FROM `gossip_menu_option` WHERE `menu_id` IN (10324,10333,10335,10336,10337);
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(10324,0,0,'Lend us your aid, keeper. Together we will defeat Yogg-Saron.',1,1,10333,0,0,0,''),
(10333,0,0,'Yes.',1,1,0,0,0,0,''), -- not sure if this menu_id is shared for all keepers
(10335,0,0,'Lend us your aid, keeper. Together we will defeat Yogg-Saron.',1,1,10333,0,0,0,''),
(10337,0,0,'Lend us your aid, keeper. Together we will defeat Yogg-Saron.',1,1,10333,0,0,0,''),
(10336,0,0,'Lend us your aid, keeper. Together we will defeat Yogg-Saron.',1,1,10333,0,0,0,'');

DELETE FROM `gameobject` WHERE `id` IN (@FLEE_TO_THE_SURFACE,@DRAGON_SOUL,@INSTANCE_PORTAL+0,@INSTANCE_PORTAL+1,@CHAIR+0,@CHAIR+1,@CHAIR+2,@CHAIR+3,@CHAIR+4,@CHAIR+5);
DELETE FROM `gameobject` WHERE `guid` BETWEEN @GO_GUID+0 AND @GO_GUID+11;
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES
(@GO_GUID+0,@FLEE_TO_THE_SURFACE,603,3,1,1999.761,-57.29888,243.5464,0,0,0,0,1,604800,0,0),
(@GO_GUID+1,@FLEE_TO_THE_SURFACE,603,3,1,1943.855,-25.59109,243.7952,0,0,0,0,1,604800,0,0),
(@GO_GUID+2,@FLEE_TO_THE_SURFACE,603,3,1,2000.26,5.519748,243.1853,0,0,0,0,1,604800,0,0),
(@GO_GUID+3,@DRAGON_SOUL,603,3,1,2104.028,-25.21278,242.6467,0,0,0,0,1,604800,0,0),
(@GO_GUID+4,@INSTANCE_PORTAL+0,603,2,1,2178.255,-24.15329,248.345,3.141593,0,0,-1,0,604800,0,0),
(@GO_GUID+5,@INSTANCE_PORTAL+1,603,1,1,2178.255,-24.15329,248.345,3.141593,0,0,-1,0,604800,0,0),
(@GO_GUID+6,@CHAIR+0,603,3,1,1954.696,91.8725,239.6242,5.989951,0,0,-0.1460924,0.9892709,604800,0,0),
(@GO_GUID+7,@CHAIR+1,603,3,1,1961.835,65.23161,239.6471,3.686116,0,0,-0.9631653,0.2689101,604800,0,0),
(@GO_GUID+8,@CHAIR+2,603,3,1,1886.634,72.21145,239.6242,1.713894,0,0,0.755847,0.6547483,604800,0,0),
(@GO_GUID+9,@CHAIR+3,603,3,1,1944.326,106.1581,239.6471,3.686116,0,0,-0.9631653,0.2689101,604800,0,0),
(@GO_GUID+10,@CHAIR+4,603,3,1,1899.228,45.58289,239.6471,1.417184,0,0,0.6507654,0.7592788,604800,0,0),
(@GO_GUID+11,@CHAIR+5,603,3,1,1923.472,28.16412,239.6471,2.289849,0,0,0.9106789,0.413115,604800,0,0);

DELETE FROM `creature` WHERE `id` IN (@VOICE_OF_YOGG_SARON,@SARA,@BRAIN_OF_YOGG_SARON,@OMINOUS_CLOUD,@LAUGHING_SKULL,@THE_LICH_KING,@IMMOLATED_CHAMPION,@DEATHSWORN_ZEALOT,@GARONA,@KING_LLANE,@SUIT_OF_ARMOR,@NELTHARION,@MALYGOS,@ALEXSTRASZA,@YSERA,@OBSIDIAN_CONSORT,@AZURE_CONSORT,@EMERALD_CONSORT,@RUBY_CONSORT,@YOGG_SARON_ILLUSIONS,@TRIGGER,@SANITY_WELL);
DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+0 AND @GUID+7;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,@VOICE_OF_YOGG_SARON,603,3,1,0,0,1980.137,-25.74376,326.4671,0,604800,0,0,0,0,0,0,0,0),
(@GUID+1,@SARA,603,3,1,0,0,1980.43,-25.7708,329.3963,3.124139,604800,0,0,0,0,0,0,0,0),
(@GUID+2,@BRAIN_OF_YOGG_SARON,603,3,1,0,0,1981.622,-25.89063,261.6898,0.1047198,604800,0,0,0,0,0,0,0,0),
(@GUID+3,@SANITY_WELL,603,3,1,0,0,1899.941,0.330621,332.2957,0,604800,0,0,0,0,0,0,0,0),
(@GUID+4,@SANITY_WELL,603,3,1,0,0,1900.478,-51.23861,332.1303,0,604800,0,0,0,0,0,0,0,0),
(@GUID+5,@SANITY_WELL,603,3,1,0,0,1987.125,-91.27024,330.1858,0,604800,0,0,0,0,0,0,0,0),
(@GUID+6,@SANITY_WELL,603,3,1,0,0,1975.885,40.02165,331.0996,0,604800,0,0,0,0,0,0,0,0),
(@GUID+7,@SANITY_WELL,603,3,1,0,0,2042.559,-40.3667,329.2744,0,604800,0,0,0,0,0,0,0,0);
-- (@GUID+8,@TRIGGER,603,3,1,0,0,,604800,0,0,0,0,0,0,0,0), -- spawn was not found in sniffs (Icecrown vision)
-- (@GUID+9,@TRIGGER,603,3,1,0,0,1928.978,67.9108,242.4596,0,604800,0,0,0,0,0,0,0,0),
-- (@GUID+10,@TRIGGER,603,3,1,0,0,2113.323,-28.4375,242.8768,0,604800,0,0,0,0,0,0,0,0);

DELETE FROM `creature_summon_groups` WHERE `summonerId` IN (@VOICE_OF_YOGG_SARON,@BRAIN_OF_YOGG_SARON);
INSERT INTO `creature_summon_groups` (`summonerId`,`summonerType`,`groupId`,`entry`,`position_x`,`position_y`,`position_z`,`orientation`,`summonType`,`summonTime`) VALUES
(@VOICE_OF_YOGG_SARON,0,0,@OMINOUS_CLOUD,1993.538,-17.93403,324.9728,0,6,0),
(@VOICE_OF_YOGG_SARON,0,0,@OMINOUS_CLOUD,1968.158,-42.65644,324.9676,0,6,0),
(@VOICE_OF_YOGG_SARON,0,0,@OMINOUS_CLOUD,1952.901,-27.36388,325.6934,0,6,0),
(@VOICE_OF_YOGG_SARON,0,0,@OMINOUS_CLOUD,1991.673,-65.39913,328.3430,0,6,0),
(@VOICE_OF_YOGG_SARON,0,0,@OMINOUS_CLOUD,2018.573,4.088733,328.8741,0,6,0),
(@VOICE_OF_YOGG_SARON,0,0,@OMINOUS_CLOUD,2034.443,-25.29962,329.0554,0,6,0),
(@VOICE_OF_YOGG_SARON,0,1,@DESCEND_INTO_MADNESS,1964.596,-42.70562,325.0845,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,1,@DESCEND_INTO_MADNESS,1986.936,-46.21083,324.9798,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,1,@DESCEND_INTO_MADNESS,1989.495,-6.69694,325.0786,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,1,@DESCEND_INTO_MADNESS,1965.521,-8.089301,324.9476,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,2,@DESCEND_INTO_MADNESS,2000.841,-25.40006,325.192,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,2,@DESCEND_INTO_MADNESS,1960.216,-26.14138,325.0096,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,2,@DESCEND_INTO_MADNESS,1976.303,-47.82541,325.1116,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,2,@DESCEND_INTO_MADNESS,1997.688,-37.46083,325.039,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,2,@DESCEND_INTO_MADNESS,1998.07,-13.35666,325.1668,0,3,60000),
(@VOICE_OF_YOGG_SARON,0,2,@DESCEND_INTO_MADNESS,1976.992,-3.959093,325.1694,0,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@NELTHARION,2117.713,-25.27073,242.73,3.141593,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@MALYGOS,2107.963,-37.29351,242.73,2.024582,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@ALEXSTRASZA,2092.347,-25.26042,242.7301,6.265732,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@YSERA,2109.765,-14.37967,242.73,4.206244,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@OBSIDIAN_CONSORT,2146.88,-17.03125,239.8058,3.351032,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@OBSIDIAN_CONSORT,2146.24,-34.40451,239.8058,3.01942,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@AZURE_CONSORT,2113.33,-65.71007,239.8058,1.780236,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@AZURE_CONSORT,2139.83,-50.28646,239.8058,2.460914,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@EMERALD_CONSORT,2116.931,11.375,239.8058,4.415683,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@EMERALD_CONSORT,2136.641,-1.996528,239.8058,3.839724,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@RUBY_CONSORT,2069.479,-5.699653,239.8058,5.427974,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@RUBY_CONSORT,2069.298,-43.53168,239.8006,0.4712389,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@YOGG_SARON_ILLUSIONS,2109.695,-25.09549,222.3250,0,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2134.533,18.86881,239.8042,1.850049,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2063.156,27.95839,244.2707,5.288348,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2070.133,-73.0108,242.5237,1.308997,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2135.219,-41.44271,239.8027,5.846853,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2088.254,5.053657,239.8672,0.9948376,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2119.228,1.421441,239.8039,0,3,60000),
(@BRAIN_OF_YOGG_SARON,0,0,@LAUGHING_SKULL,2102.441,-75.04541,239.8635,1.658063,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@THE_LICH_KING,1908.557,-152.4427,240.0719,4.328416,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@IMMOLATED_CHAMPION,1903.599,-160.3576,240.1064,1.082104,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@TURNED_CHAMPION,1919.113,-160.9657,240.0659,2.700784,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1917.559,-135.7448,240.0730,4.188790,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1919.125,-140.9566,240.0730,3.979351,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1948.469,-136.2951,240.0707,3.438299,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1956.444,-138.4028,240.1078,3.368485,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1952.965,-130.5295,240.1347,3.804818,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1902.132,-111.3594,240.0698,4.852015,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1905.326,-104.7865,240.0523,4.764749,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1897.345,-106.6076,240.1444,4.939282,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@DEATHSWORN_ZEALOT,1912.129,-136.9340,240.0730,4.188790,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@YOGG_SARON_ILLUSIONS,1906.226,-155.8941,223.4727,0,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1863.897,-100.9364,240.073,5.235988,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1948.668,-152.4481,240.073,1.919862,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1932.213,-93.62798,240.073,4.852015,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1964.457,-149.5943,240.073,3.385939,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1992.463,-131.2119,240.073,3.455752,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1901.194,-90.4624,240.073,0.1396263,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1923.746,-164.5339,240.073,3.455752,3,60000),
(@BRAIN_OF_YOGG_SARON,0,1,@LAUGHING_SKULL,1905.937,-133.1651,240.073,5.77704,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@GARONA,1931.064,60.5659,241.5013,2.084251,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@KING_LLANE,1928.349,66.05186,242.4596,5.113815,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1956.503,72.19462,239.7495,3.281219,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1951.04,49.88875,239.7495,2.495821,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1931.14,38.46949,239.7495,1.710423,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1908.993,44.26659,239.7495,0.9250245,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1897.344,64.31419,239.7495,0.1396263,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1903.393,86.60285,239.7495,5.61996,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1923.342,98.01228,239.7495,4.834562,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@SUIT_OF_ARMOR,1945.442,92.17952,239.7495,4.049164,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@YOGG_SARON_ILLUSIONS,1929.160,67.75694,221.7322,0,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1941.561,109.4812,239.7496,3.316126,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1922.55,54.68001,241.1263,0.1919862,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1893.146,44.24343,239.7496,0,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1926.526,43.26215,239.7496,0.9948376,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1904.3,73.70443,239.7496,4.276057,3,60000),
(@BRAIN_OF_YOGG_SARON,0,2,@LAUGHING_SKULL,1955.173,85.26153,239.7496,4.049164,3,60000);

-- ScriptNames
UPDATE `creature_template` SET `ScriptName`='boss_voice_of_yogg_saron' WHERE `entry`=@VOICE_OF_YOGG_SARON;
UPDATE `creature_template` SET `ScriptName`='boss_yogg_saron' WHERE `entry`=@YOGG_SARON;
UPDATE `creature_template` SET `ScriptName`='boss_sara' WHERE `entry`=@SARA;
UPDATE `creature_template` SET `ScriptName`='boss_brain_of_yogg_saron' WHERE `entry`=@BRAIN_OF_YOGG_SARON;
UPDATE `creature_template` SET `ScriptName`='npc_ominous_cloud' WHERE `entry`=@OMINOUS_CLOUD;
UPDATE `creature_template` SET `ScriptName`='npc_guardian_of_yogg_saron' WHERE `entry`=@GUARDIAN_OF_YOGG_SARON;
UPDATE `creature_template` SET `ScriptName`='npc_immortal_guardian' WHERE `entry` IN (@IMMORTAL_GUARDIAN,@MARKED_IMMORTAL_GUARDIAN);
UPDATE `creature_template` SET `ScriptName`='npc_corruptor_tentacle' WHERE `entry`=@CORRUPTOR_TENTACLE;
UPDATE `creature_template` SET `ScriptName`='npc_constrictor_tentacle' WHERE `entry`=@CONSTRICTOR_TENTACLE;
UPDATE `creature_template` SET `ScriptName`='npc_crusher_tentacle' WHERE `entry`=@CRUSHER_TENTACLE; -- should have UNIT_FLAG_PACIFIED? but it breaks tentacle's AI
UPDATE `creature_template` SET `ScriptName`='npc_descend_into_madness' WHERE `entry`=@DESCEND_INTO_MADNESS;
UPDATE `creature_template` SET `ScriptName`='npc_influence_tentacle' WHERE `entry` IN (@SUIT_OF_ARMOR,@DEATHSWORN_ZEALOT,@RUBY_CONSORT,@EMERALD_CONSORT,@OBSIDIAN_CONSORT,@AZURE_CONSORT,@INFLUENCE_TENTACLE);
UPDATE `creature_template` SET `ScriptName`='npc_observation_ring_keeper' WHERE `entry` IN (@FREYA_GOSSIP,@HODIR_GOSSIP,@THORIM_GOSSIP,@MIMIRON_GOSSIP);
UPDATE `creature_template` SET `ScriptName`='npc_yogg_saron_keeper' WHERE `entry` IN (@FREYA_YS,@HODIR_YS,@THORIM_YS,@MIMIRON_YS);
UPDATE `creature_template` SET `ScriptName`='npc_laughing_skull' WHERE `entry`=@LAUGHING_SKULL;
UPDATE `creature_template` SET `ScriptName`='npc_yogg_saron_illusions' WHERE `entry`=@YOGG_SARON_ILLUSIONS;
UPDATE `creature_template` SET `ScriptName`='npc_garona' WHERE `entry`=@GARONA;
UPDATE `creature_template` SET `ScriptName`='npc_turned_champion' WHERE `entry`=@TURNED_CHAMPION;

-- Difficulty entries
UPDATE `creature_template` SET `difficulty_entry_1`=@BRAIN_OF_YOGG_SARON_H WHERE `entry`=@BRAIN_OF_YOGG_SARON;
UPDATE `creature_template` SET `difficulty_entry_1`=@GUARDIAN_OF_YOGG_SARON_H WHERE `entry`=@GUARDIAN_OF_YOGG_SARON;
UPDATE `creature_template` SET `difficulty_entry_1`=@CORRUPTOR_TENTACLE_H WHERE `entry`=@CORRUPTOR_TENTACLE;
UPDATE `creature_template` SET `difficulty_entry_1`=@CONSTRICTOR_TENTACLE_H WHERE `entry`=@CONSTRICTOR_TENTACLE;
UPDATE `creature_template` SET `difficulty_entry_1`=@CRUSHER_TENTACLE_H WHERE `entry`=@CRUSHER_TENTACLE;
UPDATE `creature_template` SET `difficulty_entry_1`=@IMMORTAL_GUARDIAN_H WHERE `entry`=@IMMORTAL_GUARDIAN;
UPDATE `creature_template` SET `difficulty_entry_1`=@MARKED_IMMORTAL_GUARDIAN_H WHERE `entry`=@MARKED_IMMORTAL_GUARDIAN;
UPDATE `creature_template` SET `difficulty_entry_1`=@INFLUENCE_TENTACLE_H WHERE `entry`=@INFLUENCE_TENTACLE;

-- creature_template updates
UPDATE `creature_template` SET `gossip_menu_id`=10324,`npcflag`=1 WHERE `entry`=@FREYA_GOSSIP;
UPDATE `creature_template` SET `gossip_menu_id`=10335,`npcflag`=1 WHERE `entry`=@HODIR_GOSSIP;
UPDATE `creature_template` SET `gossip_menu_id`=10337,`npcflag`=1 WHERE `entry`=@THORIM_GOSSIP;
UPDATE `creature_template` SET `gossip_menu_id`=10336,`npcflag`=1 WHERE `entry`=@MIMIRON_GOSSIP;
UPDATE `creature_template` SET `minlevel`=81,`maxlevel`=81,`unit_flags`=33554432 WHERE `entry`=@SANITY_WELL;
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`minlevel`=80,`maxlevel`=80,`unit_flags`=33554432 WHERE `entry` IN (@VOICE_OF_YOGG_SARON,@DEATH_ORB);
UPDATE `creature_template` SET `faction_A`=14,`faction_H`=14,`minlevel`=81,`maxlevel`=81,`unit_flags`=33554432 WHERE `entry` IN (@LAUGHING_SKULL,@DEATH_RAY);
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16,`minlevel`=82,`maxlevel`=82 WHERE `entry` IN (@CRUSHER_TENTACLE,@CRUSHER_TENTACLE_H);
UPDATE `creature_template` SET `exp`=2,`faction_A`=16,`faction_H`=16,`minlevel`=82,`maxlevel`=82 WHERE `entry` IN (@GUARDIAN_OF_YOGG_SARON,@GUARDIAN_OF_YOGG_SARON_H);
UPDATE `creature_template` SET `faction_A`=190,`faction_H`=190,`minlevel`=82,`maxlevel`=82 WHERE `entry` IN (@SUIT_OF_ARMOR,@DEATHSWORN_ZEALOT,@RUBY_CONSORT,@EMERALD_CONSORT,@OBSIDIAN_CONSORT,@AZURE_CONSORT,@INFLUENCE_TENTACLE,@INFLUENCE_TENTACLE_H);
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry` IN (@YOGG_SARON,@YOGG_SARON_H,@BRAIN_OF_YOGG_SARON,@BRAIN_OF_YOGG_SARON_H,@IMMORTAL_GUARDIAN,@IMMORTAL_GUARDIAN_H,@CONSTRICTOR_TENTACLE,@CONSTRICTOR_TENTACLE_H,@CORRUPTOR_TENTACLE,@CORRUPTOR_TENTACLE_H);
UPDATE `creature_template` SET `InhabitType`=4 WHERE `entry` IN (@SARA,@SARA_H,@BRAIN_OF_YOGG_SARON,@BRAIN_OF_YOGG_SARON_H,@VOICE_OF_YOGG_SARON,@DEATH_ORB);
UPDATE `creature_template` SET `minlevel`=60,`maxlevel`=60,`unit_flags`=33554688,`InhabitType`=4 WHERE `entry`=@YOGG_SARON_ILLUSIONS;
UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry`=@DESCEND_INTO_MADNESS;

-- Creature immunities
UPDATE `creature_template` SET `mechanic_immune_mask`=617299839 WHERE `entry` IN (@YOGG_SARON,@YOGG_SARON_H,@BRAIN_OF_YOGG_SARON,@BRAIN_OF_YOGG_SARON_H);
UPDATE `creature_template` SET `mechanic_immune_mask`=13312063 WHERE `entry` IN (@CRUSHER_TENTACLE,@CRUSHER_TENTACLE_H,@CONSTRICTOR_TENTACLE,@CONSTRICTOR_TENTACLE_H,@CORRUPTOR_TENTACLE,@CORRUPTOR_TENTACLE_H,@SUIT_OF_ARMOR,@DEATHSWORN_ZEALOT,@RUBY_CONSORT,@EMERALD_CONSORT,@OBSIDIAN_CONSORT,@AZURE_CONSORT,@INFLUENCE_TENTACLE,@INFLUENCE_TENTACLE_H);

UPDATE `creature_model_info` SET `bounding_radius`=0.31,`combat_reach`=33 WHERE `modelid`=28951;

DELETE FROM `creature_template_addon` WHERE `entry` IN (@OMINOUS_CLOUD,@VOICE_OF_YOGG_SARON,@BRAIN_OF_YOGG_SARON,@BRAIN_OF_YOGG_SARON_H,@SARA,@SARA_H,@DEATH_ORB,@DEATHSWORN_ZEALOT);
INSERT INTO `creature_template_addon`(`entry`,`path_id`,`mount`,`bytes1`,`bytes2`,`emote`,`auras`) VALUES
(@OMINOUS_CLOUD,0,0,0,0,0,'63029'),
(@VOICE_OF_YOGG_SARON,0,0,50331648,0,0,''),
(@BRAIN_OF_YOGG_SARON,0,0,33554432,0,0,''),
(@BRAIN_OF_YOGG_SARON_H,0,0,33554432,0,0,''),
(@SARA,0,0,50331648,0,0,''),
(@SARA_H,0,0,50331648,0,0,''),
(@DEATH_ORB,0,0,50331648,0,0,''),
(@DEATHSWORN_ZEALOT,0,0,8,0,0,'');

DELETE FROM `spell_dbc` WHERE `Id`=63029;
INSERT INTO `spell_dbc` (`Id`,`Dispel`,`Mechanic`,`Attributes`,`AttributesEx`,`AttributesEx2`,`AttributesEx3`,`AttributesEx4`,`AttributesEx5`,`AttributesEx6`,`AttributesEx7`,`Stances`,`StancesNot`,`Targets`,`CastingTimeIndex`,`AuraInterruptFlags`,`ProcFlags`,`ProcChance`,`ProcCharges`,`MaxLevel`,`BaseLevel`,`SpellLevel`,`DurationIndex`,`RangeIndex`,`StackAmount`,`EquippedItemClass`,`EquippedItemSubClassMask`,`EquippedItemInventoryTypeMask`,`Effect1`,`Effect2`,`Effect3`,`EffectDieSides1`,`EffectDieSides2`,`EffectDieSides3`,`EffectRealPointsPerLevel1`,`EffectRealPointsPerLevel2`,`EffectRealPointsPerLevel3`,`EffectBasePoints1`,`EffectBasePoints2`,`EffectBasePoints3`,`EffectMechanic1`,`EffectMechanic2`,`EffectMechanic3`,`EffectImplicitTargetA1`,`EffectImplicitTargetA2`,`EffectImplicitTargetA3`,`EffectImplicitTargetB1`,`EffectImplicitTargetB2`,`EffectImplicitTargetB3`,`EffectRadiusIndex1`,`EffectRadiusIndex2`,`EffectRadiusIndex3`,`EffectApplyAuraName1`,`EffectApplyAuraName2`,`EffectApplyAuraName3`,`EffectAmplitude1`,`EffectAmplitude2`,`EffectAmplitude3`,`EffectMultipleValue1`,`EffectMultipleValue2`,`EffectMultipleValue3`,`EffectMiscValue1`,`EffectMiscValue2`,`EffectMiscValue3`,`EffectMiscValueB1`,`EffectMiscValueB2`,`EffectMiscValueB3`,`EffectTriggerSpell1`,`EffectTriggerSpell2`,`EffectTriggerSpell3`,`EffectSpellClassMaskA1`,`EffectSpellClassMaskA2`,`EffectSpellClassMaskA3`,`EffectSpellClassMaskB1`,`EffectSpellClassMaskB2`,`EffectSpellClassMaskB3`,`EffectSpellClassMaskC1`,`EffectSpellClassMaskC2`,`EffectSpellClassMaskC3`,`MaxTargetLevel`,`SpellFamilyName`,`SpellFamilyFlags1`,`SpellFamilyFlags2`,`SpellFamilyFlags3`,`MaxAffectedTargets`,`DmgClass`,`PreventionType`,`DmgMultiplier1`,`DmgMultiplier2`,`DmgMultiplier3`,`AreaGroupId`,`SchoolMask`,`Comment`) VALUES
(63029,0,0,0x00000100,0x10000000,0,0,0,0,0,0,0,0,0,1,0,0,101,0,0,70,70,21,1,0,-1,0,0,6,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,23,0,0,1000,0,0,0,0,0,0,0,0,0,0,0,63030,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,'Ominous Cloud - SPELL_BOIL_OMINOUSLY_PERIODIC');

DELETE FROM `spelldifficulty_dbc` WHERE `id` IN (63795,62714,64468,64159,64125);
INSERT INTO `spelldifficulty_dbc` (`id`,`spellid0`,`spellid1`,`spellid2`,`spellid3`) VALUES
(63795,63795,65301,0,0),
(62714,62714,65209,0,0),
(64468,64468,64486,0,0),
(64159,64159,64160,0,0),
(64125,64125,64126,0,0);

DELETE FROM `spell_script_names` WHERE `spell_id` IN (62650,62670,62671,62702,63030,63050,63120,63305,63802,63830,63881,63984,64125,64174,64465,64466,64467,64132,64131,64161,63744,63745,63747,65206,64172,64059,64069,65238,63882,63993,64010,64013,64012,64148,64164,64168,64184,63795,63803,65301,64555);
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(62650,'spell_yogg_saron_keeper_aura'),
(62670,'spell_yogg_saron_keeper_aura'),
(62671,'spell_yogg_saron_keeper_aura'),
(62702,'spell_yogg_saron_keeper_aura'),
(63030,'spell_yogg_saron_boil_ominously'),
(63050,'spell_yogg_saron_sanity'),
(63120,'spell_yogg_saron_insane'),
(63305,'spell_yogg_saron_grim_reprisal'),
(63802,'spell_yogg_saron_brain_link'),
(63803,'spell_yogg_saron_brain_link_damage'),
(63795,'spell_yogg_saron_psychosis'),
(65301,'spell_yogg_saron_psychosis'),
(63830,'spell_yogg_saron_malady_of_the_mind'),
(63881,'spell_yogg_saron_malady_of_the_mind'),
(63984,'spell_yogg_saron_hate_to_zero'),
(64125,'spell_yogg_saron_squeeze'),
(64174,'spell_yogg_saron_hodirs_protective_gaze'),
(64465,'spell_yogg_saron_shadow_beacon'),
(64466,'spell_yogg_saron_empowering_shadows_range_check'),
(64467,'spell_yogg_saron_empowering_shadows_missile'),
(64132,'spell_yogg_saron_constrictor_tentacle'),
(64131,'spell_yogg_saron_lunge'),
(64161,'spell_yogg_saron_empowered'),
(63744,'spell_yogg_saron_target_selectors'),
(63745,'spell_yogg_saron_target_selectors'),
(63747,'spell_yogg_saron_target_selectors'),
(65206,'spell_yogg_saron_target_selectors'),
(64172,'spell_yogg_saron_titanic_storm'),
(64059,'spell_yogg_saron_induce_madness'),
(64069,'spell_yogg_saron_match_health'),
(65238,'spell_yogg_saron_shattered_illusion'),
(63882,'spell_yogg_saron_death_ray_warning_visual'),
(63993,'spell_yogg_saron_cancel_illusion_room_aura'),
(64010,'spell_yogg_saron_nondescript'),
(64013,'spell_yogg_saron_nondescript'),
(64012,'spell_yogg_saron_revealed_tentacle'),
(64148,'spell_yogg_saron_diminsh_power'),
(64164,'spell_yogg_saron_lunatic_gaze'),
(64168,'spell_yogg_saron_lunatic_gaze'),
(64184,'spell_yogg_saron_in_the_maws_of_the_old_god'),
(64555,'spell_yogg_saron_insane_periodic');

DELETE FROM `spell_target_position` WHERE `id` IN (63989,63997,63998,63992);
INSERT INTO `spell_target_position` (`id`,`target_map`,`target_position_x`,`target_position_y`,`target_position_z`,`target_orientation`) VALUES
(63989,603,1954.14,21.522,239.718,2.09439),
(63997,603,2043.12,-25.6981,239.721,0),
(63998,603,1949.13,-80.6744,239.99,4.18879),
(63992,603,1970.61,-25.5988,324.55,3.10346);

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@DESCEND_INTO_MADNESS;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@DESCEND_INTO_MADNESS,63989,2,0),
(@DESCEND_INTO_MADNESS,63997,2,0),
(@DESCEND_INTO_MADNESS,63998,2,0);

DELETE FROM `disables` WHERE `SourceType`=4 AND `entry` IN (10187,10189,10293,10294,10388,10409,10410,10412,10414,10415,10416,10417);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10185,10187,10189,10296,10321,10322,10323,10324,10325,10326,10388,10409,10410,10412,10414,10415,10416,10417);
INSERT INTO `achievement_criteria_data` (`criteria_id`,`type`,`value1`,`value2`,`ScriptName`) VALUES
(10185,18,0,0,''),
(10185,12,0,0,''),
(10187,1,@SARA,0,''),
(10187,7,65157,0,''),
(10187,12,0,0,''),
(10189,1,@SARA,0,''),
(10189,7,65157,0,''),
(10189,12,1,0,''),
(10296,18,0,0,''),
(10296,12,1,0,''),
(10321,18,0,0,''),
(10321,12,1,0,''),
(10322,18,0,0,''),
(10322,12,1,0,''),
(10323,18,0,0,''),
(10323,12,1,0,''),
(10324,18,0,0,''),
(10324,12,0,0,''),
(10325,18,0,0,''),
(10325,12,0,0,''),
(10326,18,0,0,''),
(10326,12,0,0,''),
(10388,18,0,0,''),
(10388,12,0,0,''),
(10409,18,0,0,''),
(10409,12,0,0,''),
(10410,18,0,0,''),
(10410,12,0,0,''),
(10412,18,0,0,''),
(10412,12,0,0,''),
(10414,18,0,0,''),
(10414,12,1,0,''),
(10415,18,0,0,''),
(10415,12,1,0,''),
(10416,18,0,0,''),
(10416,12,1,0,''),
(10417,18,0,0,''),
(10417,12,1,0,'');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (62714,65209,62978,63037,63882,63884,63886,64059,64063,64069,64172,64173,64184,65238,63744,63745,63747,64465,64466,64555,65719,65206);
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=17 AND `SourceEntry`=64184;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=@DESCEND_INTO_MADNESS;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,@DESCEND_INTO_MADNESS,63997,0,0,13,0,38,0,0,0,0,0,'','Required instance data for spellclick'),
(18,@DESCEND_INTO_MADNESS,63998,0,0,13,0,38,1,0,0,0,0,'','Required instance data for spellclick'),
(18,@DESCEND_INTO_MADNESS,63989,0,0,13,0,38,2,0,0,0,0,'','Required instance data for spellclick'),
(13,2,62714,0,0,31,0,3,@GUARDIAN_OF_YOGG_SARON,0,0,0,0,'','Shadow Nova'),
(13,2,65209,0,0,31,0,3,@GUARDIAN_OF_YOGG_SARON,0,0,0,0,'','Shadow Nova'),
(13,1,62978,0,0,31,0,3,@OMINOUS_CLOUD,0,0,0,0,'','Summon Guardian'),
(13,1,63037,0,0,31,0,3,@IMMOLATED_CHAMPION,0,0,0,0,'','Deathgrasp'),
(13,1,63744,0,0,31,0,3,@GUARDIAN_OF_YOGG_SARON,0,0,0,0,'','Sara''s Anger'),
(13,1,63745,0,0,31,0,4,0,0,0,0,0,'','Sara''s Blessing'),
(13,1,63747,0,0,31,0,4,0,0,0,0,0,'','Sara''s Fervor'),
(13,1,63882,0,0,31,0,3,@DEATH_ORB,0,0,0,0,'','Death Ray Warning Visual'),
(13,1,63884,0,0,1,0,63120,0,0,1,0,0,'','Death Ray damage'),
(13,1,63884,0,0,1,0,63830,1,0,1,0,0,'','Death Ray damage'),
(13,1,63884,0,0,1,0,63881,1,0,1,0,0,'','Death Ray damage'),
(13,1,63886,0,0,31,0,3,@DEATH_ORB,0,0,0,0,'','Death Ray Damage Visual'),
(13,1,64059,0,0,31,0,4,0,0,0,0,0,'','Induce Madness'),
(13,1,64059,0,0,1,0,63988,0,0,0,0,0,'','Induce Madness'),
(13,1,64063,0,0,31,0,3,@KING_LLANE,0,0,0,0,'','Assassinate'),
(13,1,64069,0,0,31,0,3,@YOGG_SARON,0,0,0,0,'','Match Health'),
(13,1,64172,0,0,31,0,3,@IMMORTAL_GUARDIAN,0,0,0,0,'','Titanic Storm'),
(13,1,64172,0,0,1,0,64162,0,0,0,0,0,'','Titanic Storm'),
(13,1,64172,0,1,31,0,3,@MARKED_IMMORTAL_GUARDIAN,0,0,0,0,'','Titanic Storm'),
(13,1,64172,0,1,1,0,64162,0,0,0,0,0,'','Titanic Storm'),
(13,1,64173,0,0,31,0,3,@SARA,0,0,0,0,'','Shattered Illusion'),
(13,1,64173,0,1,31,0,3,@YOGG_SARON,0,0,0,0,'','Shattered Illusion'),
(13,1,64173,0,2,31,0,3,@CRUSHER_TENTACLE,0,0,0,0,'','Shattered Illusion'),
(13,1,64173,0,3,31,0,3,@CONSTRICTOR_TENTACLE,0,0,0,0,'','Shattered Illusion'),
(13,1,64173,0,4,31,0,3,@CORRUPTOR_TENTACLE,0,0,0,0,'','Shattered Illusion'),
(13,1,64184,0,0,31,0,3,@YOGG_SARON,0,0,0,0,'','In the Maws of the Old God'),
(13,1,65238,0,0,31,0,3,@SARA,0,0,0,0,'','Shattered Illusion remove'),
(13,1,65238,0,1,31,0,3,@YOGG_SARON,0,0,0,0,'','Shattered Illusion remove'),
(13,1,65238,0,2,31,0,3,@CRUSHER_TENTACLE,0,0,0,0,'','Shattered Illusion remove'),
(13,1,65238,0,3,31,0,3,@CONSTRICTOR_TENTACLE,0,0,0,0,'','Shattered Illusion remove'),
(13,1,65238,0,4,31,0,3,@CORRUPTOR_TENTACLE,0,0,0,0,'','Shattered Illusion remove'),
(13,1,64465,0,0,31,0,3,@IMMORTAL_GUARDIAN,0,0,0,0,'','Shadow Beacon'),
(13,1,64465,0,0,1,0,64497,0,0,1,0,0,'','Shadow Beacon'),
(13,1,64466,0,0,31,0,3,@YOGG_SARON,0,0,0,0,'','Empowering Shadows'),
(13,1,64555,0,0,1,0,63050,0,0,1,0,0,'','Insane Periodic'),
(13,1,65719,0,0,31,0,3,@SARA,0,0,0,0,'','Shadow Nova'),
(13,1,65206,0,0,31,0,3,@CORRUPTOR_TENTACLE,0,0,0,0,'','Destabilization Matrix'),
(13,1,65206,0,1,31,0,3,@CRUSHER_TENTACLE,0,0,0,0,'','Destabilization Matrix');

-- Loot
UPDATE `creature_loot_template` SET `lootmode`=32-`lootmode` WHERE `entry` IN (@YOGG_SARON,@YOGG_SARON_H);
UPDATE `creature_loot_template` SET `ChanceOrQuestChance`=-100,`lootmode`=32 WHERE `entry`=@YOGG_SARON_H AND `item`=45897;
-- only for 3.3.5
UPDATE spell_target_position SET effIndex='0' WHERE id IN (68081, 67837, 67836, 67835, 67838, 67834);
DELETE FROM `creature_addon` WHERE `guid`=136437;
-- Prevent multiple template installation tries
UPDATE `smart_scripts` SET `event_type`=37 WHERE `entryorguid` IN (474,881,26257) AND `source_type`=0 AND `id`=0;
UPDATE `smart_scripts` SET `event_type`=37 WHERE `entryorguid` IN (18716,18719) AND `source_type`=0 AND `id`=1;

-- Remove not existing event links
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=61 AND `id`=0 AND `source_type`=1;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=3594 AND `id`=0 AND `source_type`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=1399 AND `id`=3 AND `source_type`=0;
UPDATE `smart_scripts` SET `link`=0 WHERE `entryorguid`=305400 AND `id`=0 AND `source_type`=9;

-- Convert EAI to SAI and add conditions to prevent multiple SMART_ACTION_UPDATE_TEMPLATE calls
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=20778;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=20778;

DELETE FROM `smart_scripts` WHERE `entryorguid`=20778 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(20778,0,0,2000,6000,7000,10000,11,36519,32,5,'Void Waste - Cast Toxic Burst'),
(20778,1,8,35686,0,0,0,36,20805,0,1,'Void Waste - Change Entry after (proc) Spell 35686');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=2 AND `SourceEntry`=20778 AND `SourceId`=0;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ConditionTarget`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`NegativeCondition`,`Comment`) VALUE
(22,2,20778,0,1,31,3,20805,1,'Void Waste may not already be transformed to template entry 20805 when trying to update template to 20805');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=20501;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=20501;

DELETE FROM `smart_scripts` WHERE `entryorguid`=20501 AND `source_type`=0;
INSERT INTO `smart_scripts`(`entryorguid`,`id`,`event_type`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`target_type`,`comment`) VALUES
(20501,0,2,0,50,30000,45000,11,36465,0,1,'Seeping Sludge - Cast Seeping Split at 50% HP'),
(20501,1,8,35686,0,0,0,36,20806,0,1,'Seeping Sludge - Change Entry after (proc) Spell 35686'),
(20501,2,11,0,0,0,0,11,35242,0,1,'Seeping Sludge - Darkstalker Birth');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceGroup`=2 AND `SourceEntry`=20501 AND `SourceId`=0;
INSERT INTO `conditions`(`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ConditionTarget`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`NegativeCondition`,`Comment`) VALUE
(22,2,20501,0,1,31,3,20805,1,'Seeping Sludge may not already be transformed to template entry 20806 when trying to update template to 20806');
DELETE FROM `areatrigger_teleport` WHERE `id` IN (2547, 2548, 2549);
INSERT INTO `areatrigger_teleport` (`id`, `target_map`, `target_position_x`, `target_position_y`, `target_position_z`, `target_orientation`, `name`) VALUES
(2547, 0, 1399.42, -2574.59, 107.786, 6.28319, 'Scholomance - Exit Porch Target 001'),
(2548, 0, 1399.42, -2574.59, 107.786, 6.28319, 'Scholomance - Exit Porch Target 001'),
(2549, 0, 1399.42, -2574.59, 107.786, 6.28319, 'Scholomance - Exit Porch Target 001');
DELETE FROM `trinity_string` WHERE entry IN (453, 548, 549, 550, 714, 716, 749, 752, 843, 844, 845, 846, 847, 848, 849, 850, 851, 852, 853, 854, 855, 856); 
INSERT INTO `trinity_string` (entry, content_default) VALUES
(453,'│Player %s %s (guid: %u)'),
(548,'│ GM Mode active, Phase: -1'),
(549,'├─ Banned: (Type: %s, Reason: %s, Time: %s, By: %s)'),
(550,'├─ Muted: (Reason: %s, Time: %s, By: %s)'),
(714,'│ Account: %s (ID: %u), GMLevel: %u'),
(716,'│ Last Login: %s (Failed Logins: %u)'),
(749,'│ OS: %s - Latency: %u ms - Mail: %s'),
(752,'│ Last IP: %s (Locked: %s)'),
(843,'│ Level: %u (%u/%u XP (%u XP left))'),
(844,'│ Race: %s %s, %s'),
(845,'│ Alive ?: %s'),
(846,'│ Phase: %u'),
(847,'│ Money: %ug%us%uc'),
(848,'│ Map: %s, Area: %s, Zone: %s'),
(849,'│ Guild: %s (ID: %u)'),
(850,'├─ Rank: %s'),
(851,'├─ Note: %s'),
(852,'├─ O. Note: %s'),
(853,'│ Played time: %s'),
(854,'└ Mails: %d Read/%I64u Total'),
(855,'Male'),
(856,'Female');
DELETE FROM `command` WHERE `name` LIKE 'arena%';
INSERT INTO `command` (`name`, `security`, `help`) VALUES
('arena create', 3, 'Syntax: .arena create $name \"arena name\" #type\n\nA command to create a new Arena-team in game. #type  = [2/3/5]'),
('arena disband', 3, 'Syntax: .arena disband #TeamID\n\nA command to disband Arena-team in game.'),
('arena rename', 3, 'Syntax: .arena rename \"oldname\" \"newname\"\n\nA command to rename Arena-team name.'),
('arena captain', 3, 'Syntax: .arena captain #TeamID $name\n\nA command to set new captain to the team $name must be in the team'),
('arena info', 2, 'Syntax: .arena info #TeamID\n\nA command that show info about arena team'),
('arena lookup', 2, 'Syntax: .arena lookup $name\n\nA command that give a list of arenateam with the given $name');

DELETE FROM `trinity_string` WHERE `entry` BETWEEN 857 AND 870;
INSERT INTO `trinity_string` (`entry`, `content_default`) VALUES
(857, 'Arena team [%u] not found'),
(858, 'There is already an arena team named \"%s\"'),
(859, '%s is already in an arena team of that size'),
(860, 'Arena Team In Combat'),
(861, 'Arena with name: \"%s\" or silmilar not found'),
(862, '[%s] not member of the team \"%s\"'),
(863, '[%s] already capitan in the team \"%s\"'),
(864, 'New ArenaTeam created [Name: \"%s\"][Id: %u][Type: %u][Captain GUID: %u]'),
(865, 'Arena team Name: \"%s\"[Id: %u] disbanded'),
(866, 'Arena team [Id: %u] change from \"%s\" to \"%s\"'),
(867, 'Arena team Name: \"%s\"[Id: %u] change capitan from[%s] to [%s]'),
(868, 'Arena team: \"%s\"[%u] - Rating: %u - Type: %ux%u'),
(869, 'Name:\"%s\"[guid:%u] - PR: %u - %s'),
(870, '|\"%s\"[ID:%u](%ux%u)|');
-- Matthias Lehner quest chain in Icecrown. Sniffed info.
SET @GUID               := 62064; -- Need 4 Matthias Lehner guids; one is already spawned.
SET @CGUID              := 142254; -- Needs 81 creature guids
SET @OGUID              := 76647; -- Needs 85 misc gameobject guids
SET @MATT1              := 32408;  -- Matthias Lehner (Near demolisher)
SET @MATT2              := 32404;  -- Matthias Lehner (1)
SET @MATT3              := 32423;  -- Matthias Lerner (2)
SET @MATT4              := 32497;  -- Matthias Lerner (3)
SET @PLSP_FC            := 58989;  -- Prodigal Leader Force Cast
SET @REF_DEMOLISHER     := 32370;  -- Refurbished Demolisher
SET @DEMOLISHER         := 31868;  -- Wrecked Demolisher
SET @L_CAPTAIN          := 32414;  -- Lordaeron Captain
SET @L_FOOTSOLDIER      := 31254;  -- Lordaeron Footsoldier
SET @G_MINION           := 31276;  -- Ghoulish Minion
SET @SFKCB              := 58988;  -- Skeletal Footsoldier Kill Credit Base
SET @TPL                := 31268;  -- The Prodigal Leader
SET @NPC_LK             := 32443;  -- The Lich King
SET @NPC_SIND           := 32446;  -- Sindragosa
SET @LK                 := 32326;   -- Lich King
SET @ILLIDAN            := 32588;   -- Illidan Stormrage 
SET @BLOODSTAINED_S1    := 194023;  -- GO:194023  Event:20722
SET @BLOODSTAINED_S2    := 194024;  -- GO:194024  Event:20723
SET @BLOODSTAINED_S3    := 193980;  -- GO:193980  Event:20724
SET @EVENT_1            := 20722;   -- Spell Event 1
SET @EVENT_2            := 20723;   -- Spell Event 2
SET @EVENT_3            := 20724;   -- Spell Event 3

DELETE FROM `creature` WHERE `guid`=@GUID;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID,@MATT1,571,1,1,0,0,7269.866,1178.146,317.4561,1.954769,300,0,0,12600,0,0,0,0,0);
UPDATE `creature_template` SET `exp`=2,`npcflag`=0x2 WHERE `entry`=@MATT1;
DELETE FROM `creature_template_addon` WHERE `entry`=@MATT1;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@MATT1,0,0x10000,0x1,'10848 49414'); -- Quest Invisibility, Shroud of Death

-- Apply aura (Generic Quest Invisibility Detection 1) when Field Repairs has been rewarded
DELETE FROM `spell_area` WHERE `spell`=49416 AND `area`=4537;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(49416,4537,13393,13394,0,1101,2,1,64,9), -- Alliance
(49416,4537,13304,13305,0,690,2,1,64,9);  -- Horde
-- Remove aura (Generic Quest Invisibility Detection 1) when "Do Your Worst" (13394/13305) has been completed

UPDATE `creature_template` SET `exp`=2,`unit_flags`=0x20040000,`dynamicflags`=0x20,`npcflag`=0x2 WHERE `entry`=@DEMOLISHER;

DELETE FROM `creature_addon` WHERE `guid`=122757; -- Guid based
DELETE FROM `creature_template_addon` WHERE `entry`=@DEMOLISHER;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@DEMOLISHER,0,0x10000,0x1,'49415 29266'); -- Generic Quest Invisibility 2 & Permanent Feign Death

-- Apply aura (Generic Quest Invisibility Detection 2) when "Field Repairs" has been taken
DELETE FROM `spell_area` WHERE `spell`=49417 AND `area`=4537;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(49417,4537,13393,13393,0,1101,2,1,11,11), 	-- Alliance
(49417,4537,13304,13304,0,690,2,1,11,11); 	-- Horde
-- Remove aura (Generic Quest Invisibility Detection 1) when Field Repairs has been rewarded

UPDATE `creature_template` SET `exp`=2,`npcflag`=16777216 WHERE `entry`=@REF_DEMOLISHER;

DELETE FROM `creature_template_addon` WHERE `entry`=@REF_DEMOLISHER;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@REF_DEMOLISHER,0,0x10000,0x1,'49414'); -- Generic Quest Invisibility 1

DELETE FROM `npc_spellclick_spells` WHERE `npc_entry`=@REF_DEMOLISHER;
INSERT INTO `npc_spellclick_spells` (`npc_entry`,`spell_id`,`cast_flags`,`user_type`) VALUES
(@REF_DEMOLISHER,59724,1,0); -- Summon (Refurbished Demolisher)

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=@REF_DEMOLISHER;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(18,@REF_DEMOLISHER,59724,0,0,9,0,13394,0,0,0,0,0,'','Requires quest to be active for spellclick'),
(18,@REF_DEMOLISHER,59724,0,0,28,0,13394,0,0,1,0,0,'','Requires quest not to be completed for spellclick');


DELETE FROM `creature` WHERE `guid`=@GUID+1;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+1,@REF_DEMOLISHER,571,1,1,0,0,7259.758,1176.801,316.8752,0.9599311,300,0,0,36860,0,0,0,0,0);

-- Refurbished Demolisher (31830) -- The vehicle
UPDATE `creature_template` SET `exp`=2,`spell1`=59733,`spell2`=50652,`spell3`=59737 WHERE `entry`=31830;

UPDATE `creature_template` SET `exp`=2,`AIName`='SmartAI',`npcflag`=0x3,`gossip_menu_id`=10226 WHERE `entry`=@MATT2;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@MATT2 AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@MATT2,0,0,0,19,0,100,0,13395,0,0,0,11,@PLSP_FC,0,0,0,0,0,7,0,0,0,0,0,0,0,'On quest accept - Cast spell - Invoker'),
(@MATT2,0,1,0,19,0,100,0,13236,0,0,0,11,@PLSP_FC,0,0,0,0,0,7,0,0,0,0,0,0,0,'On quest accept - Cast spell - Invoker');

DELETE FROM `creature_template_addon` WHERE `entry`=@MATT2;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@MATT2,0,0x10000,0x1,'10848 49414'); -- Quest Invisibility, Shroud of Death

DELETE FROM `gossip_menu` WHERE `entry`=10226 AND `text_id`=14218;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(10226,14218);

DELETE FROM `creature` WHERE `guid`=@GUID+2;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+2,@MATT2,571,1,1,0,0,7587.631,1398.042,332.4734,0.8203048,300,0,0,12600,0,0,0,0,0);

-- Apply aura (Generic Quest Invisibility Detection 1) when Do Your Worst has been completed|rewarded.
DELETE FROM `spell_area` WHERE `spell`=49416 AND `area`=4622;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(49416,4622,13394,13396,0,1101,2,1,66,11), -- Alliance
(49416,4622,13305,13348,0,690,2,1,66,11); -- Horde
-- Remove aura (Generic Quest Invisibility Detection 1) when Futility is rewarded

UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80 WHERE `entry`=@MATT3;

DELETE FROM `creature` WHERE `guid`=@GUID+3;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+3,@MATT3,571,1,3,0,0,7854.05,957.014,450.898,0.628319,300,0,0,12600,0,0,0,0,0);

DELETE FROM `creature_template_addon` WHERE `entry`=@MATT3;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@MATT3,0,0x10000,0x1,'10848 49414'); -- Quest Invisibility, Shroud of Death

-- Apply aura (Generic Quest Invisibility Detection 1) when Sindragosa's Fall/Cradle of the Frostbrood has been Taken.
DELETE FROM `spell_area` WHERE `spell`=49416 AND `area`=4533;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(49416,4533,13397,13399,0,1101,2,1,74,11), -- Alliance
(49416,4533,13349,13360,0,690,2,1,74,11);  -- Horde
-- Remove aura (Generic Quest Invisibility Detection 1) when Time for Answers is rewarded

UPDATE `creature_template` SET `exp`=2,`minlevel`=80,`maxlevel`=80 WHERE `entry`=@MATT4;

DELETE FROM `creature` WHERE `guid`=@GUID+4;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+4,@MATT4,571,1,1,0,0,6369.59,2360.84,471.656,1.22173,300,0,0,12600,0,0,0,0,0);

DELETE FROM `creature_template_addon` WHERE `entry`=@MATT4;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@MATT4,0,0x10000,0x1,'10848 49414'); -- Quest Invisibility, Shroud of Death

-- Apply aura (Generic Quest Invisibility Detection 1) when Time for Answers has been completed/rewarded.
DELETE FROM `spell_area` WHERE `spell`=49416 AND `area`=4519;
INSERT INTO `spell_area` (`spell`,`area`,`quest_start`,`quest_end`,`aura_spell`,`racemask`,`gender`,`autocast`,`quest_start_status`,`quest_end_status`) VALUES
(49416,4519,13399,0,0,1101,2,1,66,0), -- Alliance
(49416,4519,13360,0,0,690,2,1,66,0);  -- Horde
-- Remove aura (Generic Quest Invisibility Detection 1) when

-- Army of the Damned (13395/13236)
-- http://www.youtube.com/watch?v=Rimu18yrSx8

UPDATE `creature_template` SET `AIName`='SmartAI',`exp`=2,`spell1`=58912,`spell2`=58913,`spell3`=58916,`spell4`=58917,`speed_run`=0.992062866687775,`VehicleId`=269,`minlevel`=82,`maxlevel`=82,`unit_flags`=0x8,`baseattacktime`=3000,`unit_class`=2 WHERE `entry`=@TPL;

DELETE FROM `smart_scripts` WHERE `entryorguid`=@TPL AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@TPL,0,0,0,8,0,100,0,@SFKCB,0,0,0,11,58987,0,0,0,0,0,23,0,0,0,0,0,0,0,'On Spellhit - Cast Spell - Owner'),
(@TPL,0,1,0,27,0,100,1,0,0,0,0,45,1,1,0,0,0,0,11,@L_CAPTAIN,50,0,0,0,0,0,'On Passenger Boarded - Set Data - Creature Distance');


DELETE FROM `creature_equip_template` WHERE `entry`=@TPL;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@TPL,33475,0,0);

DELETE FROM `spell_scripts` WHERE `id` IN (58916,58917);
INSERT INTO `spell_scripts` (`id`,`effIndex`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(58916,0,0,15,58915,0,0,0,0,0,0),
(58917,0,0,15,58919,0,0,0,0,0,0);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (58916,58917);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorType`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,58916,0,0,31,0,3,@L_CAPTAIN,0,0,0,0,'','Gift of the Lich King target Lordaeron Captain'),
(13,1,58916,0,1,31,0,3,@L_FOOTSOLDIER,0,0,0,0,'','Gift of the Lich King target Lordaeron Footsoldier'),
(13,1,58916,0,0,36,0,0,0,0,1,0,0,'','Target needs to be dead'),
(13,1,58916,0,1,36,0,0,0,0,1,0,0,'','Target needs to be dead'),
(13,1,58917,0,0,31,0,3,@G_MINION,0,0,0,0,'','Consume Minions target Ghoulish Minion');


DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+80;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`curhealth`,`MovementType`) VALUES
(@CGUID+0, @L_CAPTAIN, 571, 1, 2, 7590.981, 1393.571, 332.805, 1.396263, 120, 0, 12600, 0), -- @L_CAPTAIN (Area: 4622)
(@CGUID+1, @L_FOOTSOLDIER, 571, 1, 2, 7597.618, 1305.04, 337.8358, 1.692969, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+2, @L_FOOTSOLDIER, 571, 1, 2, 7592.61, 1305.417, 336.9066, 1.623156, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+3, @L_FOOTSOLDIER, 571, 1, 2, 7587.983, 1305.996, 335.96, 1.570796, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+4, @L_FOOTSOLDIER, 571, 1, 2, 7575.548, 1310.397, 333.8244, 1.43117, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+5, @L_FOOTSOLDIER, 571, 1, 2, 7580.698, 1310.446, 334.4726, 1.500983, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+6, @L_FOOTSOLDIER, 571, 1, 2, 7581.648, 1306.047, 334.8738, 1.518436, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+7, @L_FOOTSOLDIER, 571, 1, 2, 7575.075, 1306.437, 333.991, 1.43117, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+8, @L_FOOTSOLDIER, 571, 1, 2, 7581.489, 1318.208, 334.0107, 1.448623, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+9, @L_FOOTSOLDIER, 571, 1, 2, 7576.248, 1318.982, 333.3188, 1.37881, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+10, @L_FOOTSOLDIER, 571, 1, 2, 7592.329, 1309.999, 336.3537, 1.623156, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+11, @L_FOOTSOLDIER, 571, 1, 2, 7586.704, 1310.507, 335.3659, 1.570796, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+12, @L_FOOTSOLDIER, 571, 1, 2, 7598.781, 1325.946, 335.8446, 1.692969, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+13, @L_FOOTSOLDIER, 571, 1, 2, 7594.156, 1325.512, 335.1556, 1.623156, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+14, @L_FOOTSOLDIER, 571, 1, 2, 7588.168, 1325.119, 334.319, 1.553343, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+15, @L_FOOTSOLDIER, 571, 1, 2, 7582.48, 1325.178, 333.5676, 1.466077, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+16, @L_FOOTSOLDIER, 571, 1, 2, 7577.097, 1325.809, 332.8546, 1.37881, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+17, @L_FOOTSOLDIER, 571, 1, 2, 7598.016, 1318.954, 336.3169, 1.675516, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+18, @L_FOOTSOLDIER, 571, 1, 2, 7592.37, 1318.074, 335.5277, 1.58825, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+19, @L_FOOTSOLDIER, 571, 1, 2, 7587.729, 1318.605, 334.7913, 1.53589, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+20, @L_FOOTSOLDIER, 571, 1, 2, 7581.285, 1353.305, 331.5094, 1.343904, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+21, @L_FOOTSOLDIER, 571, 1, 2, 7578.252, 1356.313, 331.3191, 1.239184, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+22, @L_FOOTSOLDIER, 571, 1, 2, 7574.283, 1359.968, 331.2968, 1.099557, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+23, @L_FOOTSOLDIER, 571, 1, 2, 7570.327, 1363.058, 330.5497, 0.9424778, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+24, @L_FOOTSOLDIER, 571, 1, 2, 7566.075, 1366.799, 329.6888, 0.7853982, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+25, @L_FOOTSOLDIER, 571, 1, 2, 7578.452, 1348.972, 331.6236, 1.291544, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+26, @L_FOOTSOLDIER, 571, 1, 2, 7574.736, 1352.336, 330.9636, 1.186824, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+27, @L_FOOTSOLDIER, 571, 1, 2, 7570.568, 1356.494, 330.5071, 1.047198, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+28, @L_FOOTSOLDIER, 571, 1, 2, 7566.392, 1359.588, 329.7618, 0.9250245, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+29, @L_FOOTSOLDIER, 571, 1, 2, 7562.342, 1362.778, 329.0039, 0.7853982, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+30, @L_FOOTSOLDIER, 571, 1, 2, 7558.438, 1359.295, 328.2628, 0.7853982, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+31, @L_FOOTSOLDIER, 571, 1, 2, 7562.093, 1356.335, 328.9453, 0.8901179, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+32, @L_FOOTSOLDIER, 571, 1, 2, 7566.872, 1352.062, 329.6797, 1.029744, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+33, @L_FOOTSOLDIER, 571, 1, 2, 7571.022, 1348.635, 330.5304, 1.151917, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+34, @L_FOOTSOLDIER, 571, 1, 2, 7575.356, 1345.213, 331.7339, 1.256637, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+35, @L_FOOTSOLDIER, 571, 1, 2, 7555.554, 1355.546, 328.1983, 0.7853982, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+36, @L_FOOTSOLDIER, 571, 1, 2, 7558.832, 1352.613, 329.0146, 0.8901179, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+37, @L_FOOTSOLDIER, 571, 1, 2, 7563.994, 1349.025, 329.8778, 1.012291, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+38, @L_FOOTSOLDIER, 571, 1, 2, 7568.353, 1344.57, 330.5612, 1.134464, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+39, @L_FOOTSOLDIER, 571, 1, 2, 7572.892, 1341.369, 331.6706, 1.239184, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+40, @L_FOOTSOLDIER, 571, 1, 2, 7597.866, 1354.706, 334.6848, 1.762783, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+41, @L_FOOTSOLDIER, 571, 1, 2, 7597.885, 1367.288, 334.5932, 1.867502, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+42, @L_FOOTSOLDIER, 571, 1, 2, 7593.319, 1367.276, 333.7295, 1.692969, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+43, @L_FOOTSOLDIER, 571, 1, 2, 7589.114, 1367.378, 332.953, 1.518436, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+44, @L_FOOTSOLDIER, 571, 1, 2, 7583.886, 1367.601, 331.9132, 1.308997, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+45, @L_FOOTSOLDIER, 571, 1, 2, 7579.366, 1368.245, 331.3056, 1.117011, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+46, @L_FOOTSOLDIER, 571, 1, 2, 7598.125, 1372.082, 334.4693, 1.954769, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+47, @L_FOOTSOLDIER, 571, 1, 2, 7593.253, 1372.027, 333.6238, 1.710423, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+48, @L_FOOTSOLDIER, 571, 1, 2, 7589.304, 1371.93, 333.0089, 1.518436, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+49, @L_FOOTSOLDIER, 571, 1, 2, 7584.049, 1372.177, 332.2688, 1.239184, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+50, @L_FOOTSOLDIER, 571, 1, 2, 7579.457, 1372.116, 331.681, 1.047198, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+51, @L_FOOTSOLDIER, 571, 1, 2, 7598.163, 1375.465, 334.3708, 2.042035, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+52, @L_FOOTSOLDIER, 571, 1, 2, 7593.275, 1375.512, 333.6264, 1.745329, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+53, @L_FOOTSOLDIER, 571, 1, 2, 7589.806, 1375.822, 333.1504, 1.53589, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+54, @L_FOOTSOLDIER, 571, 1, 2, 7584.474, 1376.15, 332.5364, 1.186824, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+55, @L_FOOTSOLDIER, 571, 1, 2, 7580.116, 1376.351, 331.8188, 0.9424778, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+56, @L_FOOTSOLDIER, 571, 1, 2, 7573.417, 1379.314, 330.5734, 0.5759587, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+57, @L_FOOTSOLDIER, 571, 1, 2, 7577.173, 1385.125, 331.072, 0.3839724, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+58, @L_FOOTSOLDIER, 571, 1, 2, 7597.55, 1310.817, 337.1335, 1.692969, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+59, @L_FOOTSOLDIER, 571, 1, 2, 7604.912, 1343.7, 336.2978, 1.867502, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+60, @L_FOOTSOLDIER, 571, 1, 2, 7609.108, 1346.246, 336.7637, 1.954769, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+61, @L_FOOTSOLDIER, 571, 1, 2, 7614.414, 1348.76, 337.1829, 2.094395, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+62, @L_FOOTSOLDIER, 571, 1, 2, 7618.95, 1352.026, 337.3129, 2.199115, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+63, @L_FOOTSOLDIER, 571, 1, 2, 7624.063, 1355.433, 337.9718, 2.321288, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+64, @L_FOOTSOLDIER, 571, 1, 2, 7601.938, 1347.675, 335.5448, 1.832596, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+65, @L_FOOTSOLDIER, 571, 1, 2, 7606.248, 1349.914, 336.0553, 1.937315, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+66, @L_FOOTSOLDIER, 571, 1, 2, 7611.866, 1352.601, 336.4185, 2.076942, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+67, @L_FOOTSOLDIER, 571, 1, 2, 7617.08, 1355.108, 336.8806, 2.216568, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+68, @L_FOOTSOLDIER, 571, 1, 2, 7622.682, 1358.639, 337.6412, 2.356194, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+69, @L_FOOTSOLDIER, 571, 1, 2, 7600.038, 1350.75, 334.9453, 1.797689, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+70, @L_FOOTSOLDIER, 571, 1, 2, 7603.683, 1353.315, 335.4449, 1.902409, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+71, @L_FOOTSOLDIER, 571, 1, 2, 7609.594, 1356.689, 336.257, 2.076942, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+72, @L_FOOTSOLDIER, 571, 1, 2, 7614.948, 1359.268, 337.0087, 2.234021, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+73, @L_FOOTSOLDIER, 571, 1, 2, 7621.068, 1362.548, 337.6258, 2.391101, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+74, @L_FOOTSOLDIER, 571, 1, 2, 7601.229, 1356.915, 335.2959, 1.867502, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+75, @L_FOOTSOLDIER, 571, 1, 2, 7607.468, 1359.978, 336.2152, 2.076942, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+76, @L_FOOTSOLDIER, 571, 1, 2, 7613.156, 1363.574, 336.9086, 2.268928, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+77, @L_FOOTSOLDIER, 571, 1, 2, 7618.365, 1366.665, 337.358, 2.426008, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+78, @L_FOOTSOLDIER, 571, 1, 2, 7600.953, 1385.339, 334.186, 2.687807, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+79, @L_FOOTSOLDIER, 571, 1, 2, 7608.228, 1378.985, 334.8071, 2.565634, 120, 0, 12600, 0), -- @L_FOOTSOLDIER (Area: 4622)
(@CGUID+80, @L_FOOTSOLDIER, 571, 1, 2, 7604.285, 1378.747, 334.8669, 2.443461, 120, 0, 12600, 0); -- @L_FOOTSOLDIER (Area: 4622)

-- Misc gameobjects
DELETE FROM `gameobject` WHERE `guid` BETWEEN @OGUID+0 AND @OGUID+84;
INSERT INTO `gameobject` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `rotation0`, `rotation1`, `rotation2`, `rotation3`, `spawntimesecs`, `animprogress`, `state`) VALUES
(@OGUID+0, 193813, 571, 1, 2, 7541.28, 1320.396, 328.9124, -1.500982, 0, 0, 0, 1, 120, 255, 1), -- 193813 (Area: 4622)
(@OGUID+1, 193814, 571, 1, 2, 7543.634, 1320.439, 329.0549, 2.775071, 0, 0, 0, 1, 120, 255, 1), -- 193814 (Area: 4622)
(@OGUID+2, 193816, 571, 1, 2, 7545.142, 1315.035, 329.4462, -3.010669, 0, 0, 0, 1, 120, 255, 1), -- 193816 (Area: 4622)
(@OGUID+3, 193817, 571, 1, 2, 7543.001, 1315.064, 329.2274, 0.130899, 0, 0, 0, 1, 120, 255, 1), -- 193817 (Area: 4622)
(@OGUID+4, 193818, 571, 1, 2, 7540.648, 1315.594, 328.9768, 1.701696, 0, 0, 0, 1, 120, 255, 1), -- 193818 (Area: 4622)
(@OGUID+5, 193819, 571, 1, 2, 7560.569, 1300.758, 333.2082, 1.806415, 0, 0, 0, 1, 120, 255, 1), -- 193819 (Area: 4622)
(@OGUID+6, 193820, 571, 1, 2, 7554.927, 1309.58, 330.9437, -1.771509, 0, 0, 0, 1, 120, 255, 1), -- 193820 (Area: 4622)
(@OGUID+7, 193807, 571, 1, 2, 7559.165, 1301.401, 332.9652, 2.015855, 0, 0, 0, 1, 120, 255, 1), -- 193807 (Area: 4622)
(@OGUID+8, 193808, 571, 1, 2, 7561.399, 1303.66, 332.1848, 1.370081, 0, 0, 0, 1, 120, 255, 1), -- 193808 (Area: 4622)
(@OGUID+9, 193809, 571, 1, 2, 7557.444, 1303.104, 331.5889, 1.30027, 0, 0, 0, 1, 120, 255, 1), -- 193809 (Area: 4622)
(@OGUID+10, 193815, 571, 1, 2, 7542.429, 1320.442, 329.6358, 1.911133, 0, 0, 0, 1, 120, 255, 1), -- 193815 (Area: 4622)
(@OGUID+11, 193800, 571, 1, 2, 7554.204, 1314.124, 330.6833, 2.338742, 0, 0, 0, 1, 120, 255, 1), -- 193800 (Area: 4622)
(@OGUID+12, 193801, 571, 1, 2, 7545.629, 1307.18, 329.9126, 0.7243106, 0, 0, 0, 1, 120, 255, 1), -- 193801 (Area: 4622)
(@OGUID+13, 193802, 571, 1, 2, 7541.902, 1316.621, 328.9081, 0.1134449, 0, 0, 0, 1, 120, 255, 1), -- 193802 (Area: 4622)
(@OGUID+14, 193810, 571, 1, 2, 7557.45, 1303.402, 332.9673, -1.832593, 0, 0, 0, 1, 120, 255, 1), -- 193810 (Area: 4622)
(@OGUID+15, 193821, 571, 1, 2, 7550.283, 1316.339, 329.959, 2.836153, 0, 0, 0, 1, 120, 255, 1), -- 193821 (Area: 4622)
(@OGUID+16, 193822, 571, 1, 2, 7553.371, 1304.985, 331.0674, -2.277654, 0, 0, 0, 1, 120, 255, 1), -- 193822 (Area: 4622)
(@OGUID+17, 193823, 571, 1, 2, 7551.499, 1304.395, 330.7182, 1.596977, 0, 0, 0, 1, 120, 255, 1), -- 193823 (Area: 4622)
(@OGUID+18, 193824, 571, 1, 2, 7553.543, 1304.755, 331.1079, 0.9424764, 0, 0, 0, 1, 120, 255, 1), -- 193824 (Area: 4622)
(@OGUID+19, 193825, 571, 1, 2, 7550.23, 1316.46, 330.6128, -2.330011, 0, 0, 0, 1, 120, 255, 1), -- 193825 (Area: 4622)
(@OGUID+20, 193826, 571, 1, 2, 7556.107, 1309.794, 331.7017, 1.021015, 0, 0, 0, 1, 120, 255, 1), -- 193826 (Area: 4622)
(@OGUID+21, 193827, 571, 1, 2, 7540.02, 1320.733, 329.4276, 1.596974, 0, 0, 0, 1, 120, 255, 1), -- 193827 (Area: 4622)
(@OGUID+22, 193805, 571, 1, 2, 7560.395, 1300.322, 332.0938, -1.335177, 0, 0, 0, 1, 120, 255, 1), -- 193805 (Area: 4622)
(@OGUID+23, 193811, 571, 1, 2, 7616.356, 1305.621, 341.7527, -1.553341, 0, 0, 0, 1, 120, 255, 1), -- 193811 (Area: 4622)
(@OGUID+24, 193829, 571, 1, 2, 7628.698, 1313.042, 341.731, 2.510756, 0, 0, 0, 1, 120, 255, 1), -- 193829 (Area: 4622)
(@OGUID+25, 193836, 571, 1, 2, 7623.703, 1306.834, 341.2804, -1.304631, 0, 0, 0, 1, 120, 255, 1), -- 193836 (Area: 4622)
(@OGUID+26, 193837, 571, 1, 2, 7623.346, 1306.82, 341.664, 0.3035969, 0, 0, 0, 1, 120, 255, 1), -- 193837 (Area: 4622)
(@OGUID+27, 193812, 571, 1, 2, 7616.432, 1305.333, 340.4039, 1.579521, 0, 0, 0, 1, 120, 255, 1), -- 193812 (Area: 4622)
(@OGUID+28, 193839, 571, 1, 2, 7620.775, 1303.785, 341.3588, 1.776699, 0, 0, 0, 1, 120, 255, 1), -- 193839 (Area: 4622)
(@OGUID+29, 193840, 571, 1, 2, 7619.116, 1305.521, 340.8146, -1.292454, 0, 0, 0, 1, 120, 255, 1), -- 193840 (Area: 4622)
(@OGUID+30, 193833, 571, 1, 2, 7611.557, 1304.096, 341.6903, 2.46209, 0, 0, 0, 1, 120, 255, 1), -- 193833 (Area: 4622)
(@OGUID+31, 193834, 571, 1, 2, 7611.44, 1305.623, 341.8747, 2.385941, 0, 0, 0, 1, 120, 255, 1), -- 193834 (Area: 4622)
(@OGUID+32, 193828, 571, 1, 2, 7628.804, 1312.444, 341.1812, -0.5995114, 0, 0, 0, 1, 120, 255, 1), -- 193828 (Area: 4622)
(@OGUID+33, 193830, 571, 1, 2, 7631.086, 1311.507, 341.5322, 2.199114, 0, 0, 0, 1, 120, 255, 1), -- 193830 (Area: 4622)
(@OGUID+34, 193838, 571, 1, 2, 7628.428, 1307.566, 341.7274, 2.481837, 0, 0, 0, 1, 120, 255, 1), -- 193838 (Area: 4622)
(@OGUID+35, 193831, 571, 1, 2, 7630.328, 1312.191, 341.3887, 1.474802, 0, 0, 0, 1, 120, 255, 1), -- 193831 (Area: 4622)
(@OGUID+36, 193832, 571, 1, 2, 7631.078, 1312.427, 341.4087, 1.210786, 0, 0, 0, 1, 120, 255, 1), -- 193832 (Area: 4622)
(@OGUID+37, 193845, 571, 1, 2, 7625.171, 1305.658, 341.5322, 2.274172, 0, 0, 0, 1, 120, 255, 1), -- 193845 (Area: 4622)
(@OGUID+38, 193803, 571, 1, 2, 7634.984, 1315.54, 341.3336, 0.3839723, 0, 0, 0, 1, 120, 255, 1), -- 193803 (Area: 4622)
(@OGUID+39, 193804, 571, 1, 2, 7612.716, 1303.828, 340.1033, 2.403463, 0, 0, 0, 1, 120, 255, 1), -- 193804 (Area: 4622)
(@OGUID+40, 193799, 571, 1, 2, 7629.829, 1308.381, 341.4977, 2.495816, 0, 0, 0, 1, 120, 255, 1), -- 193799 (Area: 4622)
(@OGUID+41, 193474, 571, 1, 2, 7594.459, 1387.242, 335.4896, 1.509709, 0, 0, 0, 1, 120, 255, 1), -- 193474 (Area: 4622)
(@OGUID+42, 193477, 571, 1, 2, 7565.28, 1388.165, 328.3016, 2.646745, 0, 0, 0, 1, 120, 255, 1), -- 193477 (Area: 4622)
(@OGUID+43, 193478, 571, 1, 2, 7573.998, 1396.272, 329.3516, 1.903219, 0, 0, 0, 1, 120, 255, 1), -- 193478 (Area: 4622)
(@OGUID+44, 193479, 571, 1, 2, 7574.192, 1387.192, 330.1734, -0.721683, 0, 0, 0, 1, 120, 255, 1), -- 193479 (Area: 4622)
(@OGUID+45, 193515, 571, 1, 2, 7572.924, 1386.133, 330.0977, -0.1943158, 0, 0, 0, 1, 120, 255, 1), -- 193515 (Area: 4622)
(@OGUID+46, 193475, 571, 1, 2, 7594.464, 1387.608, 334.2297, -1.596976, 0, 0, 0, 1, 120, 255, 1), -- 193475 (Area: 4622)
(@OGUID+47, 193511, 571, 1, 2, 7572.461, 1387.348, 329.9952, -2.310437, 0, 0, 0, 1, 120, 255, 1), -- 193511 (Area: 4622)
(@OGUID+48, 193523, 571, 1, 2, 7569.051, 1379.311, 329.6375, 0.26714, 0, 0, 0, 1, 120, 255, 1), -- 193523 (Area: 4622)
(@OGUID+49, 193524, 571, 1, 2, 7569.593, 1378.756, 331.6182, 0.2884431, 0, 0, 0, 1, 120, 255, 1), -- 193524 (Area: 4622)
(@OGUID+50, 193525, 571, 1, 2, 7569.944, 1380.115, 331.8074, 0.2884431, 0, 0, 0, 1, 120, 255, 1), -- 193525 (Area: 4622)
(@OGUID+51, 193526, 571, 1, 2, 7578.941, 1388.341, 331.1905, 2.510151, 0, 0, 0, 1, 120, 255, 1), -- 193526 (Area: 4622)
(@OGUID+52, 193527, 571, 1, 2, 7578.064, 1388.368, 330.8582, 0.952802, 0, 0, 0, 1, 120, 255, 1), -- 193527 (Area: 4622)
(@OGUID+53, 193528, 571, 1, 2, 7578.356, 1387.903, 331.3766, 2.996104, 0, 0, 0, 1, 120, 255, 1), -- 193528 (Area: 4622)
(@OGUID+54, 193514, 571, 1, 2, 7587.764, 1391.348, 333.9012, 3.10851, 0, 0, 0, 1, 120, 255, 1), -- 193514 (Area: 4622)
(@OGUID+55, 193472, 571, 1, 2, 7584.512, 1387.774, 335.2943, 1.52716, 0, 0, 0, 1, 120, 255, 1), -- 193472 (Area: 4622)
(@OGUID+56, 193473, 571, 1, 2, 7584.511, 1388.14, 334.0347, -1.579522, 0, 0, 0, 1, 120, 255, 1), -- 193473 (Area: 4622)
(@OGUID+57, 193510, 571, 1, 2, 7585.269, 1391.078, 333.9027, -2.382504, 0, 0, 0, 1, 120, 255, 1), -- 193510 (Area: 4622)
(@OGUID+58, 193529, 571, 1, 2, 7611.424, 1384.339, 335.7021, 0.4115172, 0, 0, 0, 1, 120, 255, 1), -- 193529 (Area: 4622)
(@OGUID+59, 193498, 571, 1, 2, 7608.75, 1388.728, 335.8158, -3.031208, 0, 0, 0, 1, 120, 255, 1), -- 193498 (Area: 4622)
(@OGUID+60, 193512, 571, 1, 2, 7607.569, 1380.687, 334.6062, -2.615315, 0, 0, 0, 1, 120, 255, 1), -- 193512 (Area: 4622)
(@OGUID+61, 193513, 571, 1, 2, 7602.882, 1392.214, 333.8481, 2.86819, 0, 0, 0, 1, 120, 255, 1), -- 193513 (Area: 4622)
(@OGUID+62, 193499, 571, 1, 2, 7607.803, 1387.896, 334.5514, 1.181878, 0, 0, 0, 1, 120, 255, 1), -- 193499 (Area: 4622)
(@OGUID+63, 193500, 571, 1, 2, 7607.761, 1388.981, 335.6974, 2.752486, 0, 0, 0, 1, 120, 255, 1), -- 193500 (Area: 4622)
(@OGUID+64, 193501, 571, 1, 2, 7608.067, 1387.847, 335.6891, 1.57918, 0, 0, 0, 1, 120, 255, 1), -- 193501 (Area: 4622)
(@OGUID+65, 193502, 571, 1, 2, 7606.78, 1387.013, 335.4621, 0.4406689, 0, 0, 0, 1, 120, 255, 1), -- 193502 (Area: 4622)
(@OGUID+66, 193507, 571, 1, 2, 7603.438, 1393.474, 333.8636, 0.8205906, 0, 0, 0, 1, 120, 255, 1), -- 193507 (Area: 4622)
(@OGUID+67, 193508, 571, 1, 2, 7604.211, 1394.048, 334.0117, 0.553567, 0, 0, 0, 1, 120, 255, 1), -- 193508 (Area: 4622)
(@OGUID+68, 193521, 571, 1, 2, 7603.405, 1381.198, 334.5134, 1.028245, 0, 0, 0, 1, 120, 255, 1), -- 193521 (Area: 4622)
(@OGUID+69, 193522, 571, 1, 2, 7609.946, 1383.467, 334.8445, 2.07127, 0, 0, 0, 1, 120, 255, 1), -- 193522 (Area: 4622)
(@OGUID+70, 193505, 571, 1, 2, 7614.041, 1383.107, 335.3358, -1.199282, 0, 0, 0, 1, 120, 255, 1), -- 193505 (Area: 4622)
(@OGUID+71, 193506, 571, 1, 2, 7604.289, 1393.07, 334.0316, -0.001746883, 0, 0, 0, 1, 120, 255, 1), -- 193506 (Area: 4622)
(@OGUID+72, 193466, 571, 1, 2, 7603.318, 1390.261, 333.631, -1.944215, 0, 0, 0, 1, 120, 255, 1), -- 193466 (Area: 4622)
(@OGUID+73, 193467, 571, 1, 2, 7611.13, 1380.281, 334.9095, -2.729541, 0, 0, 0, 1, 120, 255, 1), -- 193467 (Area: 4622)
(@OGUID+74, 193503, 571, 1, 2, 7613.502, 1382.34, 335.2786, 0.381168, 0, 0, 0, 1, 120, 255, 1), -- 193503 (Area: 4622)
(@OGUID+75, 193504, 571, 1, 2, 7613.352, 1382.993, 335.6254, 0.8341318, 0, 0, 0, 1, 120, 255, 1), -- 193504 (Area: 4622)
(@OGUID+76, 193509, 571, 1, 2, 7600.531, 1392.637, 333.3486, 1.351323, 0, 0, 0, 1, 120, 255, 1), -- 193509 (Area: 4622)
(@OGUID+77, 193806, 571, 1, 2, 7559.955, 1299.04, 333.1187, 2.809974, 0, 0, 0, 1, 120, 255, 1), -- 193806 (Area: 4622)
(@OGUID+78, 193798, 571, 1, 2, 7554.067, 1301.211, 331.2181, 1.195549, 0, 0, 0, 1, 120, 255, 1), -- 193798 (Area: 4622)
(@OGUID+79, 193841, 571, 1, 2, 7625.241, 1304.634, 341.6619, 2.192614, 0, 0, 0, 1, 120, 255, 1), -- 193841 (Area: 4622)
(@OGUID+80, 193843, 571, 1, 2, 7626.075, 1302.194, 342.0533, 1.939992, 0, 0, 0, 1, 120, 255, 1), -- 193843 (Area: 4622)
(@OGUID+81, 193842, 571, 1, 2, 7625.737, 1303.095, 341.8933, 2.157538, 0, 0, 0, 1, 120, 255, 1), -- 193842 (Area: 4622)
(@OGUID+82, 193835, 571, 1, 2, 7621.549, 1301.871, 341.7209, -1.390356, 0, 0, 0, 1, 120, 255, 1), -- 193835 (Area: 4622)
(@OGUID+83, 193797, 571, 1, 2, 7622.559, 1303.291, 341.1438, 1.823867, 0, 0, 0, 1, 120, 255, 1), -- 193797 (Area: 4622)
(@OGUID+84, 193844, 571, 1, 2, 7626.616, 1302.82, 342.0193, 1.37313, 0, 0, 0, 1, 120, 255, 1); -- 193844 (Area: 4622)

-- 193471
UPDATE `gameobject` SET `phaseMask`=3 WHERE `guid`=62737;

UPDATE `creature_template` SET `AIName`='SmartAI',`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=2136,`faction_H`=2136 WHERE `entry`=@L_FOOTSOLDIER;
UPDATE `creature_template` SET `AIName`='SmartAI',`exp`=2,`minlevel`=80,`maxlevel`=80,`faction_A`=2136,`faction_H`=2136 WHERE `entry`=@L_CAPTAIN;

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@L_CAPTAIN,@L_FOOTSOLDIER) AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
 -- We hide the body; this way to prevent multiple ghoul spawns from the same body
(@L_CAPTAIN,0,0,0,8,0,100,0,58916,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lordaeron Captain - On Spellhit - Set Invisible'),
(@L_CAPTAIN,0,1,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lordaeron Captain - On Data Set - Talk'),
(@L_FOOTSOLDIER,0,0,0,8,0,100,0,58916,0,0,0,47,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lordaeron Footsoldier - On Spellhit -Set Invisible'),
(@L_FOOTSOLDIER,0,1,0,4,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lordaeron Footsoldier - On Aggro - Talk');


DELETE FROM `creature_equip_template` WHERE `entry` IN (@L_CAPTAIN,@L_FOOTSOLDIER);
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@L_CAPTAIN,1895,0,36636), -- Lordaeron Captain @L_CAPTAIN
(@L_FOOTSOLDIER,1895,0,36636); -- Lordaeron Footsoldier @L_FOOTSOLDIER

DELETE FROM `creature_text` WHERE `entry` IN (@L_FOOTSOLDIER,@L_CAPTAIN);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@L_FOOTSOLDIER,0,0,'The undead are upon us!',12,0,10,0,0,0,'Lordaeron Footsoldier to Ghoulish Minion'),
(@L_FOOTSOLDIER,0,1,'The rumors were true!  The prince has gone mad!',12,0,10,0,0,0,'Lordaeron Footsoldier to Ghoulish Minion'),
(@L_CAPTAIN,0,0,'You''ve come to address the men, sir?', 12,0,100,66,0,0,'Lordaeron Captain');

UPDATE `creature_template` SET `AIName`='SmartAI',`speed_walk`=0.777776,`minlevel`=82,`maxlevel`=82,`unit_flags`=0x8 WHERE `entry`=@G_MINION;
DELETE FROM `creature_template_addon` WHERE `entry`=@G_MINION;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@G_MINION,0,0x0,0x1,'58946'); -- Hate Aura


DELETE FROM `smart_scripts` WHERE `entryorguid`=@G_MINION AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@G_MINION,0,0,0,54,0,100,1,0,0,0,0,11,@SFKCB,0,0,0,0,0,23,0,0,0,0,0,0,0,'On Just Summoned - Cast Spell - Owner');

-- Where Dragons Fell (13398/13359)
-- http://www.youtube.com/watch?v=v3FsLm1oY8k

UPDATE `creature_template` SET `minlevel`=83, `maxlevel`=83, `exp`=2, `unit_class`=2, `InhabitType`=7 WHERE  `entry`=@NPC_SIND;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC_LK,@NPC_SIND,@NPC_LK*100,@MATT3);
DELETE FROM `smart_scripts` WHERE (`entryorguid` IN (@NPC_LK,@NPC_SIND,@MATT3,@NPC_LK*100) AND `source_type`IN (0,9));
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@MATT3,0,0,0,20,0,100,0,13398,1,0,0,12,@NPC_LK,1,27000,0,0,0,8,0,0,0,7863.779, 943.377, 451.502, 1.556,'Matthias Lehner - On Quest rewarded - Summon Lich King'),
(@MATT3,0,1,0,20,0,100,0,13359,0,0,0,12,@NPC_LK,1,27000,0,0,0,8,0,0,0,7863.779, 943.377, 451.502, 1.556,'Matthias Lehner - On Quest rewarded - Summon Lich King '),

(@NPC_LK,0,0,0,54,0,100,0,0,0,0,0,53,0,@NPC_LK,0,0,0,0,1,0,0,0,0,0,0,0,'Lich King - On Summoned - Start WP-Movement'),
(@NPC_LK,0,1,2,58,0,100,0,1,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lich King - On WP-End - Talk'),
(@NPC_LK,0,2,3,61,0,100,0,0,0,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lich King - On Link -Add unit field bytes - Kneel'),
(@NPC_LK,0,3,4,61,0,100,0,0,0,0,0,12,@NPC_SIND,8,0,0,0,0,8,0,0,0,7837.523,1054.987,421.766,5.00,'Lich King - On WP-End - Summon Sindragosa'),
(@NPC_LK,0,4,0,61,0,100,0,0,0,0,0,80,@NPC_LK*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Lich King - On Link - Start timed script'),
(@NPC_LK,0,5,0,38,0,100,0,1,1,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lich King - On data set - Remove unit field bytes'),
(@NPC_LK*100,9,0,0,0,0,100,0,2000,2000,2000,2000,45,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'Lich King - On Script - Set Data'),

(@NPC_SIND,0,0,0,54,0,100,0,0,0,0,0,53,1,@NPC_SIND,0,0,0,0,1,0,0,0,0,0,0,0,'Sindragosa - On Summoned - Start WP-Movement'),
(@NPC_SIND,0,1,2,58,0,100,0,1,0,0,0,45,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'Sindragosa - On WP-Ended - Set Data on self'),
(@NPC_SIND,0,2,3,61,0,100,0,1,1,0,0,46,200,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sindragosa - On data set - Move forward'),
(@NPC_SIND,0,3,0,61,0,100,0,0,0,0,0,41,15000,0,0,0,0,0,1,0,0,0,0,0,0,0,'Sindragosa - On data set - Despawn');

DELETE FROM `creature_template_addon` WHERE entry =@NPC_SIND;
INSERT INTO `creature_template_addon` (`entry`, `path_id`, `mount`, `bytes1`, `bytes2`, `emote`, `auras`) VALUES 
(@NPC_SIND,0,0,33554432,0,0,'43775');

DELETE FROM `waypoints` WHERE `entry`=@NPC_LK;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@NPC_LK,1,7863.453, 960.661, 450.491,'Lich King - WP1');

DELETE FROM `waypoints` WHERE `entry`=@NPC_SIND;
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@NPC_SIND,1,7848.635,1027.209,480.763,'Sindragosa- WP1');

DELETE FROM `creature_text` WHERE `entry`= @NPC_LK;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_LK,0,0,'Rise, Sindragosa! Rise and lead the Frostbrood into war!',12,0,100,16,0,0,'Lich King');


-- The Hunter and the Prince (13400/13361)
-- Bloodstained Stone
-- GO:194023  Event:20722
-- GO:194024  Event:20723
-- GO:193980  Event:20724
     
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@MATT4;

DELETE FROM `smart_scripts` WHERE (`entryorguid`=@MATT4 AND `source_type`=0) OR (`entryorguid` IN (@MATT4*100,@MATT4*100+1,@MATT4*100+2) AND `source_type`=9);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@MATT4,0,0,0,19,0,100,0,13400,0,0,0,87,@MATT4*100,@MATT4*100+1,@MATT4*100+2,0,0,0,1,0,0,0,0,0,0,0,'On Quest Accepted - Run Script - Self'),
(@MATT4,0,1,0,19,0,100,0,13361,0,0,0,87,@MATT4*100,@MATT4*100+1,@MATT4*100+2,0,0,0,1,0,0,0,0,0,0,0,'On Quest Accepted - Run Script - Self'),
(@MATT4*100,9,0,0,0,0,100,0,0,0,0,0,50,@BLOODSTAINED_S1,30000,0,0,0,0,8,0,0,0,6331.721,2360.052,477.274,0,'On Script - Summon GO - Location'),
(@MATT4*100+1,9,0,0,0,0,100,0,0,0,0,0,50,@BLOODSTAINED_S2,30000,0,0,0,0,8,0,0,0,6359.744,2342.196,472.701,0,'On Script - Summon GO - Location'),
(@MATT4*100+2,9,0,0,0,0,100,0,0,0,0,0,50,@BLOODSTAINED_S3,30000,0,0,0,0,8,0,0,0,6358.710,2383.027,474.682,0,'On Script - Summon GO - Location');

-- LK
UPDATE `creature_template` SET `AIName`='',`minlevel`=82,`maxlevel`=82,`EXP`=2,`mindmg`=417,`maxdmg`=582,`attackpower`=608,`baseattacktime`=3000,`unit_class`=2,`minrangedmg`=341,`maxrangedmg`=506,`rangedattackpower`=80,`spell1`=60617,`spell2`=60644,`spell3`=60672,`spell4`=60642,`VehicleId`=300 WHERE `entry`=@LK;
UPDATE `creature_template` SET `Health_mod`=160,`EXP`=0,`rank`=3,`type_flags`=0,`AIName`='SmartAI',`faction_A`=14,`faction_H`=14,`minlevel`=82,`maxlevel`=82,`mindmg`=452,`maxdmg`=678,`attackpower`=169,`baseattacktime`=2000,`unit_class`=1,`minrangedmg`=362,`maxrangedmg`=542,`rangedattackpower`=135 WHERE `entry`= @ILLIDAN;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ILLIDAN AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ILLIDAN,0,0,0,54,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Illidan - On Just Summoned - Talk - Self'),
(@ILLIDAN,0,1,0,0,0,100,0,15000,16000,15000,16000,11,60744,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Illidan - In combat - Immolate'),
(@ILLIDAN,0,2,0,0,0,100,0,6000,7000,6000,7000,11,61101,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Illidan - In combat - Heart Rip'),
(@ILLIDAN,0,4,0,0,0,100,0,19000,19000,19000,19000,11,60742,0,0,0,0,0,2,0,0,0,0,0,0,0, 'Illidan - In combat - Shear'),
(@ILLIDAN,0,5,0,6,0,100,0,0,0,0,0,33,32797,0,0,0,0,0,21,20,0,0,0,0,0,0, 'Illidan - On death - Give quest credit');

-- Removing spell from this table in order for Energize (60628) to refund mana.
DELETE FROM `spell_proc_event` WHERE  `entry`=60617;

DELETE FROM `creature_text` WHERE `entry`=@ILLIDAN;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`TEXT`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ILLIDAN,0,0,'Prepare to die!',12,0,100,0,0,0,'Illidan Stormrage');

DELETE FROM `event_scripts` WHERE `id` IN (@EVENT1,@EVENT2,@EVENT3);
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(@EVENT_1,0,10,@ILLIDAN,60000,0,6342.646,2399.023,478.483,5.5137),
(@EVENT_2,0,10,@ILLIDAN,60000,0,6313.481,2345.141,479.379,1.0173),
(@EVENT_3,0,10,@ILLIDAN,60000,0,6351.155,2315.504,474.698,1.2568);

-- These don't work ...
-- 61752 Illidan Kill Credit Master
-- 61748 Illidan Kill Credit
 
-- Addition Dr-j
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=18 AND `SourceGroup`=32370 AND `SourceEntry`=59724 AND `ConditionValue1`=13305;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(18,32370,59724,0,1,9,0,13305,0,0,0,0,0, '', 'Required quest active for spellclick'),
(18,32370,59724,0,1,28,0,13305,0,0,1,0,0, '', 'Required quest not completed for spellclick');
-- Update Frozen Halls & ICC Meeting stone positions from 4.3.4 sniff
UPDATE `gameobject` SET `position_x`=5633.551, `position_y`=2029.531, `position_z`=798.499, `orientation`=4.515394, `rotation2`=0.976296, `rotation3`=-0.2164396 WHERE `guid`=151101;
UPDATE `gameobject` SET `position_x`=5842.831, `position_y`=2218.624, `position_z`=636.288, `orientation`=5.327191, `rotation2`=0.976296, `rotation3`=-0.2164396 WHERE `guid`=151102;
-- Creature_AI to Smart_AI Conversion for Proto-Drake Egg (ID 23777)
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` =23777;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=23777;
DELETE FROM `smart_scripts` WHERE `entryorguid` =23777;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23777,0,0,1,25,0,100,0,0,0, 0, 0, 21 ,0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - On Spawn - Prevent Combat Movement"),
(23777,0,1,0,61,0,100,0,0,0, 0, 0, 20 ,0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - Linked with Previous Event - Disable Combat"),
(23777,0,2,3,8 ,0,100,0,46606,0, 0, 0, 12 ,24160, 1, 300000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - On Spellhit Tillinghast's Plague Canister Dummy - Spawn Plagued Proto-Whelp"),
(23777,0,3,0,61,0,100,0,0,0, 0, 0, 37 ,0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - Linked with Previous Event - Die"),
(23777,0,4,0,6 ,1,100,0,0,0, 0, 0, 12 ,23688, 1, 300000, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, "Proto-Drake Egg - On Death - Spawn Proto-Whelp"),
(23777,0,5,0,4, 0,100,1,0,0,0,0,23,1,0,0,0,0,0,1,0,0,0,0,0,0,0, "Proto-Drake Egg - On Aggro - Set Phase 2");
SET @MYSTIC := 430;
SET @POACHER := 424;
SET @SCOUT  := 578;
DELETE FROM `smart_scripts` WHERE entryorguid IN (@POACHER,@MYSTIC,@SCOUT);
-- Redridge Poacher
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@POACHER, 0, 0, 1, 1, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - Out Of Combat - Allow Combat Movement'),
(@POACHER, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - Out Of Combat - Start Auto Attack'),
(@POACHER, 0, 2, 0, 4, 0, 10, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - On Aggro - Say Line 0'),
(@POACHER, 0, 3, 4, 4, 0, 100, 0, 0, 0, 0, 0, 11, 6660, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - On Aggro - Cast Shoot'),
(@POACHER, 0, 4, 0, 61, 0, 100, 0, 0, 0, 0, 0, 23, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - On Aggro - Increment Phase'),
(@POACHER, 0, 5, 6, 9, 0, 100, 0, 5, 30, 3400, 3700, 11, 6660, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 5 - 30 Range - Cast Shoot'),
(@POACHER, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 40, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 5 - 30 Range - Display ranged weapon'),
(@POACHER, 0, 7, 0, 9, 0, 100, 0, 25, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 25 - 80 Range - Allow Combat Movement'),
(@POACHER, 0, 8, 0, 9, 0, 100, 0, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 0 - 5 Range - Allow Combat Movement'),
(@POACHER, 0, 9, 10, 9, 0, 100, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 0 - 5 Range - Display melee weapon'),
(@POACHER, 0, 10, 0, 61, 0, 100, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 0 - 5 Range - Start Auto Attack'),
(@POACHER, 0, 11, 0, 9, 0, 100, 0, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 5 - 15 Range - Allow Combat Movement'),
(@POACHER, 0, 12, 13, 2, 0, 100, 1, 0, 15, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 15% HP - Allow Combat Movement'),
(@POACHER, 0, 13, 0, 61, 0, 100, 0, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - At 15% HP - Flee For Assist'),
(@POACHER, 0, 14, 0, 7, 0, 100, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Poacher - On Evade - Display melee weapon');
-- Redridge Mystic
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@MYSTIC, 0, 0, 0, 1, 0, 100, 1, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - Out Of Combat - Allow Combat Movement'),
(@MYSTIC, 0, 1, 0, 4, 0, 10, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - On Aggro - Say Line 0'),
(@MYSTIC, 0, 2, 3, 4, 0, 100, 0, 0, 0, 0, 0, 11, 20802, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - On Aggro - Cast Lightning Bolt'),
(@MYSTIC, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 23, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - On Aggro - Increment Phase'),
(@MYSTIC, 0, 4, 0, 9, 0, 100, 0, 0, 40, 600, 1800, 11, 20802, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 0 - 40 Range - Cast Lightning Bolt'),
(@MYSTIC, 0, 5, 6, 3, 0, 100, 0, 0, 15, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 15% Mana - Allow Combat Movement'),
(@MYSTIC, 0, 6, 0, 61, 0, 100, 0, 0, 0, 0, 0, 23, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 15% Mana - Increment Phase'),
(@MYSTIC, 0, 7, 0, 9, 0, 100, 1, 35, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 35 - 80 Range - Allow Combat Movement'),
(@MYSTIC, 0, 8, 0, 9, 0, 100, 1, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 5 - 15 Range - Allow Combat Movement'),
(@MYSTIC, 0, 9, 0, 9, 0, 100, 1, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 0 - 5 Range - Allow Combat Movement'),
(@MYSTIC, 0, 10, 0, 3, 0, 100, 0, 30, 100, 100, 100, 23, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 100% Mana - Increment Phase'),
(@MYSTIC, 0, 11, 12, 14, 0, 100, 0, 0, 30, 35800, 35800, 11, 547, 0, 0, 0, 0, 0, 7, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - On Friendly Unit At 0 - 30% Health - Cast Healing Wave'),
(@MYSTIC, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - On Friendly Unit At 0 - 30% Health - Say Line 1'),
(@MYSTIC, 0, 13, 14, 2, 0, 100, 1, 0, 15, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 15% HP - Allow Combat Movement'),
(@MYSTIC, 0, 14, 0, 61, 0, 100, 0, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Redridge Mystic - At 15% HP - Flee For Assist');
-- Murloc Scout
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@SCOUT, 0, 0, 1, 1, 0, 100, 0, 0, 0, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - Out Of Combat - Allow Combat Movement'),
(@SCOUT, 0, 1, 0, 61, 0, 100, 0, 0, 0, 0, 0, 20, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - Out Of Combat - Start Auto Attack'),
(@SCOUT, 0, 2, 3, 4, 0, 100, 0, 0, 0, 0, 0, 11, 6660, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - On Aggro - Cast Shoot'),
(@SCOUT, 0, 3, 0, 61, 0, 100, 0, 0, 0, 0, 0, 23, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - On Aggro - Increment Phase'),
(@SCOUT, 0, 4, 5, 9, 0, 100, 0, 5, 30, 2600, 3700, 11, 6660, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 5 - 30 Range - Cast Shoot'),
(@SCOUT, 0, 5, 0, 61, 0, 100, 0, 0, 0, 0, 0, 40, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 5 - 30 Range - Display ranged weapon'),
(@SCOUT, 0, 6, 0, 9, 0, 100, 0, 25, 80, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 25 - 80 Range - Allow Combat Movement'),
(@SCOUT, 0, 7, 8, 9, 0, 100, 0, 0, 5, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 0 - 5 Range - Allow Combat Movement'),
(@SCOUT, 0, 8, 9, 61, 0, 100, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 0 - 5 Range - Display melee weapon'),
(@SCOUT, 0, 9, 0, 61, 0, 100, 0, 0, 0, 0, 0, 20, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 0 - 5 Range - Start Auto Attack'),
(@SCOUT, 0, 10, 0, 9, 0, 100, 0, 5, 15, 0, 0, 21, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 5 - 15 Range - Allow Combat Movement'),
(@SCOUT, 0, 11, 12, 2, 0, 100, 1, 0, 15, 0, 0, 21, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 15% HP - Allow Combat Movement'),
(@SCOUT, 0, 12, 0, 61, 0, 100, 0, 0, 0, 0, 0, 25, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - At 15% HP - Flee For Assist'),
(@SCOUT, 0, 13, 0, 7, 0, 100, 0, 0, 0, 0, 0, 40, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 'Murloc Scout - On Evade - Display melee weapon');
SET @GUID := 62851;

SET @TRIGGER := 4951;
SET @ELM_BUNNY := 23837;
SET @ELM_BUNNY_LARGE := 24110;
SET @OACHANOA := 26648;
SET @PEARL := 188422;

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI', `ScriptName`='' WHERE `entry`=@PEARL;
UPDATE `creature_template` SET `speed_run`=2.14286, `faction_A`=190, `faction_H`=190, `unit_flags`=33536, `unit_flags2`=2080, `AIName`='SmartAI', `InhabitType`=4 WHERE `entry`=@OACHANOA;

DELETE FROM `creature` WHERE `guid` BETWEEN @GUID+0 AND @GUID+3;
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`,`npcflag`,`unit_flags`,`dynamicflags`) VALUES
(@GUID+0,@ELM_BUNNY,571,1,1,11686,0,2452.865,1722.222,61.8313,5.654867,300,0,0,42,0,0,0,0,0),
(@GUID+1,@ELM_BUNNY_LARGE,571,1,1,11686,0,2427.382,1680.861,-0.05963766,2.356194,300,0,0,42,0,0,0,0,0),
(@GUID+2,@ELM_BUNNY_LARGE,571,1,1,11686,0,2407.345,1733.472,7.560452,2.443461,300,0,0,42,0,0,0,0,0),
(@GUID+3,@ELM_BUNNY_LARGE,571,1,1,11686,0,2436.226,1710.697,-0.01387666,5.183628,300,0,0,42,0,0,0,0,0);

DELETE FROM `areatrigger_scripts` WHERE `entry`=@TRIGGER;
INSERT INTO `areatrigger_scripts` (`entry`, `ScriptName`) VALUES
(@TRIGGER,'SmartTrigger');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@TRIGGER AND `SourceId`=2;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@PEARL AND `SourceId`=1;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,1,@PEARL,1,0,9,0,12032,0,0,0,0,'','SAI only activates if player is on quest Conversing With the Depths'),
(22,1,@TRIGGER,2,0,9,0,12032,0,0,0,0,'','SAI only activates if player is on quest Conversing With the Depths'),
(22,1,@TRIGGER,2,0,1,0,47098,0,0,0,0,'','SAI only activates if player has aura Oacha''noa''s Compulsion');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (-(@GUID+0),-(@GUID+1),-(@GUID+2),-(@GUID+3),@OACHANOA) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@PEARL AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@TRIGGER AND `source_type`=2;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@OACHANOA*100,@OACHANOA*100+1,@PEARL*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(-(@GUID+0),0,0,0,38,0,100,0,0,1,0,0,11,38497,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 1 set - Spellcast Cyclone Water Visual'),
(-(@GUID+0),0,1,0,38,0,100,0,0,2,0,0,28,38497,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny - On data 0 2 set - Remove aura Cyclone Water Visual'),
(-(@GUID+1),0,0,0,38,0,100,0,0,1,0,0,11,47479,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On data 0 1 set - Spellcast Water Spout'),
(-(@GUID+2),0,0,0,38,0,100,0,0,1,0,0,11,45849,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On data 0 1 set - Spellcast Camera Shake - Tremor'),
(-(@GUID+3),0,0,0,38,0,100,0,0,1,0,0,11,47479,0,0,0,0,0,1,0,0,0,0,0,0,0, 'ELM General Purpose Bunny Large - On data 0 1 set - Spellcast Water Spout'),

(@OACHANOA,0,0,1,11,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On Spawn - Set event phase 1'),
(@OACHANOA,0,1,2,61,0,100,0,0,0,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On Spawn - Set run'),
(@OACHANOA,0,2,0,61,0,100,0,0,0,0,0,69,1,0,0,0,0,0,8,0,0,0,2367.975,1712.07,43.56623,0, 'Oacha''noa - On Spawn - Move to position'),
(@OACHANOA,0,3,0,34,1,100,0,0,1,0,0,80,@OACHANOA*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On movement inform (phase 1) - Run script 0'),
(@OACHANOA,0,4,0,52,1,100,0,3,@OACHANOA,0,0,1,4,10100,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On text 3 over (phase 1) - Say line'),
(@OACHANOA,0,5,6,52,1,100,0,4,@OACHANOA,0,0,1,9,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa - On text 4 over (phase 1) - Say line'),
(@OACHANOA,0,6,7,61,0,100,0,0,0,0,0,6,12032,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa - On text 4 over (phase 1) - Fail quest'),
(@OACHANOA,0,7,0,61,0,100,0,0,0,0,0,41,2000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On text 4 over (phase 1) - Despawn after 2 seconds'),
(@OACHANOA,0,8,9,38,1,100,0,0,1,0,0,22,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On data 0 1 set (phase 1) - Set event phase 0'),
(@OACHANOA,0,9,0,61,0,100,0,0,0,0,0,80,@OACHANOA*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa - On data 0 1 set (phase 1) - Run script 1'),

(@TRIGGER,2,0,0,46,0,100,0,0,0,0,0,45,0,1,0,0,0,0,14,21195,@PEARL,0,0,0,0,0, 'On trigger - Set data 0 1 Pearl of the Depths'),

(@PEARL,1,0,0,70,0,100,0,2,0,0,0,80,@PEARL*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Pearl of the Depths - On state changed - Run script'),
(@PEARL,1,1,0,38,0,100,0,0,1,0,0,45,0,1,0,0,0,0,19,@OACHANOA,100,0,0,0,0,0, 'Pearl of the Depths - On data 0 1 set - Set data 0 1 Oacha''noa'),

(@OACHANOA*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 0 - Turn to'),
(@OACHANOA*100,9,1,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+1,@ELM_BUNNY_LARGE,0,0,0,0,0, 'Oacha''noa script 0 - Set data 0 1 ELM General Purpose Bunny Large'),
(@OACHANOA*100,9,2,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+2,@ELM_BUNNY_LARGE,0,0,0,0,0, 'Oacha''noa script 0 - Set data 0 1 ELM General Purpose Bunny Large'),
(@OACHANOA*100,9,3,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+3,@ELM_BUNNY_LARGE,0,0,0,0,0, 'Oacha''noa script 0 - Set data 0 1 ELM General Purpose Bunny Large'),
(@OACHANOA*100,9,4,0,0,0,100,0,1200,1200,0,0,1,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),
(@OACHANOA*100,9,5,0,0,0,100,0,8500,8500,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),
(@OACHANOA*100,9,6,0,0,0,100,0,9700,9700,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),
(@OACHANOA*100,9,7,0,0,0,100,0,0,0,0,0,11,47098,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 0 - Spellcast Oacha''noa''s Compulsion'),
(@OACHANOA*100,9,8,0,0,0,100,0,10900,10900,0,0,1,3,10000,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 0 - Say line'),

(@OACHANOA*100+1,9,0,0,0,0,100,0,0,0,0,0,15,12032,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Complete quest'),
(@OACHANOA*100+1,9,1,0,0,0,100,0,0,0,0,0,1,5,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,2,0,0,0,100,0,10600,10600,0,0,1,6,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,3,0,0,0,100,0,10800,10800,0,0,1,7,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,4,0,0,0,100,0,10700,10700,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.281219, 'Oacha''noa script 1 - Turn to'),
(@OACHANOA*100+1,9,5,0,0,0,100,0,200,200,0,0,1,8,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Oacha''noa script 1 - Say line'),
(@OACHANOA*100+1,9,6,0,0,0,100,0,1000,1000,0,0,5,374,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 1 - Play emote'),
(@OACHANOA*100+1,9,7,0,0,0,100,0,0,0,0,0,4,11561,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 1 - Play sound'),
(@OACHANOA*100+1,9,8,0,0,0,100,0,2300,2300,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Oacha''noa script 1 - Despawn'),

(@PEARL*100,9,0,0,0,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Pearl of the Depths script - Store targetlist'),
(@PEARL*100,9,1,0,0,0,100,0,0,0,0,0,99,0,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Pearl of the Depths script - Set state'),
(@PEARL*100,9,2,0,0,0,100,0,0,0,0,0,45,0,1,0,0,0,0,10,@GUID+0,@ELM_BUNNY,0,0,0,0,0, 'Pearl of the Depths script - Set data 0 1 ELM General Purpose Bunny'),
(@PEARL*100,9,3,0,0,0,100,0,20000,20000,0,0,45,0,2,0,0,0,0,10,@GUID+0,@ELM_BUNNY,0,0,0,0,0, 'Pearl of the Depths script - Set data 0 2 ELM General Purpose Bunny'),
(@PEARL*100,9,4,0,0,0,100,0,0,0,0,0,12,@OACHANOA,8,0,0,0,0,8,0,0,0,2367.975,1712.07,0.232847,0, 'Pearl of the Depths script - Summon Oacha''noa'),
(@PEARL*100,9,5,0,0,0,100,0,1000,1000,0,0,100,1,0,0,0,0,0,19,@OACHANOA,100,0,0,0,0,0, 'Pearl of the Depths script - Send targetlist'),
(@PEARL*100,9,6,0,0,0,100,0,74000,74000,0,0,99,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Pearl of the Depths script - Set state');

DELETE FROM `creature_text` WHERE `entry`=@OACHANOA;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@OACHANOA,0,0,'Little $N, why do you call me forth? Are you working with the trolls of this land? Have you come to kill me and take my power as your own?',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,1,0,'I sense uncertainty in you, and I do not trust it whether you are with them, or not. If you wish my augury for the Kalu''ak, you will have to prove yourself first.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,2,0,'I will lay a mild compulsion upon you. Jump into the depths before me so that you put yourself into my element and thereby display your submission.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,3,0,'Though you are compelled, the choice, and the last step before you leap, are yours. You have twenty more seconds to decide.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,4,0,'I''m rather curious as to what will happen, should you ignore this and NOT jump into the water.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,5,0,'Well done, $N. Your display of respect is duly noted. Now, I have information for you that you must convey to the Kalu''ak.',14,0,100,33,0,11557,'Oacha''noa'),
(@OACHANOA,6,0,'Simply put, you must tell the tuskarr that they cannot run. If they do so, their spirits will be destroyed by the evil rising within Northrend.',15,0,100,0,0,0,'Oacha''noa'),
(@OACHANOA,7,0,'Tell the mystic that his people are to stand and fight alongside the Horde and Alliance against the forces of Malygos and the Lich King.',15,0,100,0,0,0,'Oacha''noa'),
(@OACHANOA,8,0,'Now swim back with the knowledge I have granted you. Do what you can for them, $r.',15,0,100,0,0,0,'Oacha''noa'),
(@OACHANOA,9,0,'Very well, $N, you have failed to act. The prophecy is not yours to learn. Do not call upon me again until you have found your backbone.',14,0,100,33,0,11557,'Oacha''noa');
SET @NARVIR := 30299;
SET @HEART := 192181;

UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@HEART;
UPDATE `creature_template` SET `speed_run`=0.99206, `faction_H`=1954, `faction_A`=1954, `unit_flags`=768, `AIName`='SmartAI' WHERE `entry`=@NARVIR;

DELETE FROM `creature_equip_template` WHERE `entry`=@NARVIR;
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@NARVIR,1,35727,0,0);

DELETE FROM `smart_scripts` WHERE `entryorguid`=@NARVIR AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@HEART AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NARVIR*100,@HEART*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NARVIR,0,0,0,11,0,100,0,0,0,0,0,80,@NARVIR*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir - On spawn - Run script'),
(@NARVIR,0,1,2,8,0,100,0,40163,0,0,0,33,@NARVIR,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Overseer Narvir - On spellhit Teleport - Quest credit'),
(@NARVIR,0,2,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir - On spellhit Teleport - Despawn'),

(@HEART,1,0,0,70,0,100,0,2,0,0,0,80,@HEART*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'The Heart of the Storm - On state changed - Run script'),

(@NARVIR*100,9,0,0,0,0,100,0,20,20,0,0,11,56485,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Overseer Narvir script - Spellcast The Storm''s Fury'),
(@NARVIR*100,9,1,0,0,0,100,0,500,500,0,0,69,0,0,0,0,0,0,8,0,0,0,7312.406,-726.3165,791.6095,0, 'Overseer Narvir script - Move to position'),
(@NARVIR*100,9,2,0,0,0,100,0,6500,6500,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,1.919862, 'Overseer Narvir script - Turn to'),
(@NARVIR*100,9,3,0,0,0,100,0,1500,1500,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Say line'),
(@NARVIR*100,9,4,0,0,0,100,0,6000,6000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Say line'),
(@NARVIR*100,9,5,0,0,0,100,0,3000,3000,0,0,5,274,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Play emote'),
(@NARVIR*100,9,6,0,0,0,100,0,3000,3000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,3.385939, 'Overseer Narvir script - Turn to'),
(@NARVIR*100,9,7,0,0,0,100,0,500,500,0,0,17,69,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Play emotestate'),
(@NARVIR*100,9,8,0,0,0,100,0,3500,3500,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Stop emotestate'),
(@NARVIR*100,9,9,0,0,0,100,0,1500,1500,0,0,11,40163,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Overseer Narvir script - Spellcast Teleport'),

(@HEART*100,9,0,0,0,0,100,0,0,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'The Heart of the Storm script - Store targetlist'),
(@HEART*100,9,1,0,0,0,100,0,0,0,0,0,12,@NARVIR,8,0,0,0,0,8,0,0,0,7313.231,-711.5209,791.6917,5.61996, 'The Heart of the Storm script - Summon Overseer Narvir'),
(@HEART*100,9,2,0,0,0,100,0,10,10,0,0,100,1,0,0,0,0,0,19,@NARVIR,50,0,0,0,0,0, 'The Heart of the Storm script - Send targetlist to Overseer Narvir');

DELETE FROM `creature_text` WHERE `entry`=@NARVIR;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NARVIR,0,0,'You didn''t think that I was going to let you walk in here and take the Heart of the Storm, did you?',12,0,100,6,0,0,'Overseer Narvir'),
(@NARVIR,1,0,'You may have killed Valduran, but that will not stop me from completing the colossus.',12,0,100,1,0,0,'Overseer Narvir');
-- Halls Of Reflexion WIP

DELETE FROM `creature` WHERE `guid` IN (202308,202294,202301,202293);
-- extra spawned Uther -- 202294
-- extra LK spawn -- 202301
-- Loralen -- 202293
-- Lady Jaina Proudmoore -- 202308
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(202308,38112,668,3,1,0,0,5276.583,2037.45,709.4025,5.532694,604800,0,0,0,0,0,0,0,0),
(202294,38113,668,3,1,0,0,5342.232,1975.696,709.4025,2.391101,604800,0,0,0,0,0,0,0,0),
(202301,36723,668,3,2,0,0,5415.538,2117.842,707.7781,3.944444,604800,0,0,0,0,0,0,0,0);
-- Lady Jaina Proudmoore
UPDATE `creature_template` SET `ScriptName`='npc_jaina_or_sylvanas_hor' WHERE `entry`=37221;
-- Lady Sylvanas Windrunner
UPDATE `creature_template` SET `ScriptName`='npc_jaina_or_sylvanas_hor' WHERE `entry`=37223;
-- Frostmourne Altar Bunny (Quel'Delar)
UPDATE `creature_template` SET `InhabitType`=4,`flags_extra`=128 WHERE `entry`=37704;
-- Frostsworn General
UPDATE `creature_template` SET `ScriptName`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=37720; -- for hc
-- Spiritual Reflection
UPDATE `creature_template` SET /*`modelid1`=57,*/`ScriptName`='npc_spiritual_reflection' WHERE `entry`=37068;
-- Falric and Marwyn bind players to instance on heroic
UPDATE `creature_template` SET `flags_extra`=1 WHERE `entry` IN (38599,38603);

DELETE FROM `areatrigger_scripts` WHERE `entry` IN (5697,5632);
INSERT INTO `areatrigger_scripts` VALUES
-- AreaTrigger for waves restarter
(5697,'at_hor_waves_restarter'),
-- AreaTrigger for intro start
(5632,'at_hor_intro_start');

DELETE FROM `creature_text` WHERE (`entry`=37226 AND `groupid` IN (3,4)) OR `entry`=36723 OR `entry`=36954 OR `entry`=36955 OR `entry`=37554 OR `entry`=30344 OR `entry`=30824;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
-- The Lich King (at start)
(37226,3,0,'Foolish girl. You seek that, which I killed long ago. He is nearly a ghost now. A fate ago in my mind.',14,0,100,0,0,17229,'Lich King SAY_LK_JAINA_INTRO_END'),
(37226,4,0,'I will not make the same mistake again. This time there will be no escape. You fail to serve me in undead. Now, all that remains for you is oblivion!',14,0,100,0,0,17228,'Lich King SAY_LK_SYLVANAS_INTRO_END'),
-- Frostsworn General
(36723,0,0,'You are not worthy to face the Lich King!',14,0,100,0,0,16921,'general SAY_AGGRO'),
(36723,1,0,'Master, I have failed...',14,0,100,0,0,16922,'general SAY_DEATH'),
-- The Lich King (at chase event)
(36954,0,0,'Your allies have arrived, Jaina, just as you promised. You will all become powerful agents of the Scourge.',14,0,100,0,0,17212, 'Lich King SAY_LICH_KING_AGGRO_A'),
(36954,1,0,'I will not make the same mistake again, Sylvanas. This time there will be no escape. You will all serve me in death!',14,0,100,0,0,17213,'Lich King SAY_LICH_KING_AGGRO_H'),
(36954,2,0,'Succumb to the chill of the grave.',14,0,100,0,0,17218,'Lich King SAY_LICH_KING_WALL_02'),
(36954,3,0,'Another dead end.',14,0,100,0,0,17219,'Lich King SAY_LICH_KING_WALL_03'),
(36954,4,0,'How long can you fight it?',14,0,100,0,0,17220,'Lich King SAY_LICH_KING_WALL_04'),
(36954,5,0,'There is no escape!', 14,0,100,0,0,17217,'Lich King SAY_LICH_KING_WALL_01'),
(36954,6,0,'Rise minions, do not left them us!',14,0,100,0,0,17216,'Lich King SAY_LICH_KING_GNOUL'),
(36954,7,0,'Minions sees them. Bring their corpses back to me!',14,0,100,0,0,17222,'Lich King SAY_LICH_KING_ABON'),
(36954,8,0,'Death''s cold embrace awaits.',14,0,100,0,0,17221,'Lich King SAY_LICH_KING_WINTER'),
(36954,9,0,'Nowhere to run! You''re mine now...',14,0,100,0,0,17223,'Lich King SAY_LICH_KING_END_DUN'),
(36954,10,0,'All is lost!',14,0,100,0,0,17215,'Lich King SAY_LICH_KING_WIN'),
-- Lady Jaina Proudmoore (at chase event)
(36955,0,0,'He is too powerful, we must leave this place at once! My magic will hold him in place for only a short time! Come quickly, heroes!',14,0,100,1,0,16644,'Jaina SAY_JAINA_AGGRO'),
(36955,1,0,'I will destroy this barrier. You must hold the undead back!',14,0,100,0,0,16607,'Jaina SAY_JAINA_WALL_01'),
(36955,2,0,'Another ice wall! Keep the undead from interrupting my incantation so that I may bring this wall down!',14,0,100,0,0,16608,'Jaina SAY_JAINA_WALL_02'),
(36955,3,0,'He is toying with us! I will show him what happens to ice when it meets fire!',14,0,100,0,0,16609,'Jaina SAY_JAINA_WALL_03'),
(36955,4,0,'Your barriers can''t hold us back much longer, monster. I will shatter them all!',14,0,100,0,0,16610,'Jaina SAY_JAINA_WALL_04'),
(36955,5,0,'There''s an opening up ahead. GO NOW!', 14,0,100,1,0,16645,'Jaina SAY_JAINA_ESCAPE_01'),
(36955,6,0,'We''re almost there... Don''t give up!',14,0,100,0,0,16646,'Jaina SAY_JAINA_ESCAPE_02'),
(36955,7,0,'It... It''s a dead end. We have no choice but to fight. Steel yourself heroes, for this is our last stand!',14,0,100,1,0,16647,'Jaina SAY_JAINA_TRAP'),
(36955,8,0,'Forgive me heroes, I should have listened to Uther. I ... I had to see for myself, to look into his eyes one last time ... I am sorry.',14,0,100,1,0,16648,'Jaina SAY_JAINA_FINAL_2'),
(36955,9,0,'We now know what must be done. I will deliver this news to King Varian and Highlord Fordring.',14,0,100,1,0,16649,'Jaina SAY_JAINA_FINAL_3'),
-- Lady Sylvanas Windrunner (at chase event)
(37554,0,0,'He''s too powerful! Heroes, quickly, come to me! We must leave this place immediately! I will do what I can do hold him in place while we flee.',14,0,100,0,0,17058,'Sylvanas SAY_SYLVANA_AGGRO'),
(37554,1,0,'No wall can hold the Banshee Queen! Keep the undead at bay, heroes! I will tear this barrier down!',14,0,100,0,0,17029,'Sylvanas SAY_SYLVANA_WALL_01'),
(37554,2,0,'Another barrier? Stand strong, champions! I will bring the wall down!',14,0,100,0,0,17030,'Sylvanas SAY_SYLVANA_WALL_02'),
(37554,3,0,'I grow tired of these games, Arthas! Your walls can\'t stop me!',14,0,100,0,0,17031,'Sylvanas SAY_SYLVANA_WALL_03'),
(37554,4,0,'You won''t impede our escape, fiend. Keep the undead off me while I bring this barrier down!',14,0,100,0,0,17032,'Sylvanas SAY_SYLVANA_WALL_04'),
(37554,5,0,'There''s an opening up ahead. GO NOW!',14,0,100,1,0,17059,'Sylvanas SAY_SYLVANA_ESCAPE_01'),
(37554,6,0,'We''re almost there! Don''t give up!',14,0,100,0,0,17060,'Sylvanas SAY_SYLVANA_ESCAPE_02'),
(37554,7,0,'BLASTED DEAD END! So this is how it ends. Prepare yourselves, heroes, for today we make our final stand!',14,0,100,5,0,17061,'Sylvanas SAY_SYLVANA_TRAP'),
(37554,8,0,'We are safe... for now. His strength has increased tenfold since our last battle. It will take a mighty army to destroy the Lich King. An army greater than even the Horde can rouse.',14,0,100,1,0,17062,'Sylvanas SAY_SYLVANA_FINAL_2'),
-- High Captain Justin Bartlett
(30344,0,0,'Fire, fire!',14,0,100,0,0,16721,'Bartlett SAY_BARTLETT_FIRE'),
(30344,1,0,'Quickly, climb aboard! We mustn''t tarry here. There''s no telling when this whole mountainside will collapse!',14,0,100,0,0,16722,'Bartlett SAY_BARTLETT_FINAL_1'),
-- Sky-Reaver Korm Blackscar
(30824,0,0,'FIRE! FIRE!',14,0,100,0,0,0,'Korm SAY_KORM_FIRE'),
(30824,1,0,'Quickly, climb aboard! We mustn''t tarry here. There''s no telling when this whole mountainside will collapse!',14,0,100,0,0,0,'Korm SAY_KORM_FINAL_1');

/*
# 3+4+4+5 +4+4+5+5 = 16+18
# if 1st boss is dead and we wipe counter starts at wave 6
SET @CGUID  := 400000;
DELETE FROM `creature` WHERE `guid` BETWEEN @CGUID+0 AND @CGUID+33;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `MovementType`) VALUES
-- pos 1
(@CGUID+4, 38177, 668, 3, 1, 5277.365, 1993.229, 707.7781, 0.4014257, 7200, 0, 0),
(@CGUID+31, 38172, 668, 3, 1, 5280.513, 1997.842, 707.7781, 0.296706, 7200, 0, 0),
(@CGUID+5, 38175, 668, 3, 1, 5275.479, 2001.135, 707.7781, 0.1745329, 7200, 0, 0),
(@CGUID+19, 38172, 668, 3, 1, 5279.649, 2004.656, 707.7781, 0.06981317, 7200, 0, 0),
(@CGUID+10, 38172, 668, 3, 1, 5275.076, 2008.724, 707.7781, 6.213372, 7200, 0, 0),
(@CGUID+25, 38176, 668, 3, 1, 5280.632, 2012.156, 707.7781, 6.056293, 7200, 0, 0),
(@CGUID+15, 38175, 668, 3, 1, 5277.739, 2016.882, 707.7781, 5.969026, 7200, 0, 0),
(@CGUID+29, 38176, 668, 3, 1, 5282.897, 2019.597, 707.7781, 5.88176, 7200, 0, 0),
-- pos 2
(@CGUID+1, 38172, 668, 3, 1, 5295.885, 2040.342, 707.7781, 5.078908, 7200, 0, 0),
(@CGUID+33, 38176, 668, 3, 1, 5299.25, 2035.998, 707.7781, 5.026548, 7200, 0, 0),
(@CGUID+6, 38172, 668, 3, 1, 5302.448, 2042.222, 707.7781, 4.904375, 7200, 0, 0),
(@CGUID+20, 38173, 668, 3, 1, 5306.057, 2037.002, 707.7781, 4.817109, 7200, 0, 0),
(@CGUID+0, 38175, 668, 3, 1, 5309.577, 2042.668, 707.7781, 4.694936, 7200, 0, 0),
(@CGUID+23, 38175, 668, 3, 1, 5312.752, 2037.122, 707.7781, 4.590216, 7200, 0, 0),
(@CGUID+11, 38173, 668, 3, 1, 5316.701, 2041.55, 707.7781, 4.502949, 7200, 0, 0),
(@CGUID+30, 38177, 668, 3, 1, 5318.704, 2036.108, 707.7781, 4.223697, 7200, 0, 0),
(@CGUID+16, 38173, 668, 3, 1, 5322.964, 2040.288, 707.7781, 4.34587, 7200, 0, 0),
-- pos 3
(@CGUID+28, 38173, 668, 3, 1, 5336.599, 2017.278, 707.7781, 3.473205, 7200, 0, 0),
(@CGUID+17, 38176, 668, 3, 1, 5343.467, 2015.951, 707.7781, 3.490659, 7200, 0, 0),
(@CGUID+32, 38173, 668, 3, 1, 5337.833, 2010.057, 707.7781, 3.228859, 7200, 0, 0),
(@CGUID+12, 38173, 668, 3, 1, 5344.15, 2007.168, 707.7781, 3.159046, 7200, 0, 0),
(@CGUID+21, 38176, 668, 3, 1, 5337.865, 2003.403, 707.7781, 2.984513, 7200, 0, 0),
(@CGUID+7, 38177, 668, 3, 1, 5343.293, 1999.384, 707.7781, 2.9147, 7200, 0, 0),
(@CGUID+24, 38173, 668, 3, 1, 5335.724, 1996.859, 707.7781, 2.740167, 7200, 0, 0),
(@CGUID+2, 38173, 668, 3, 1, 5340.836, 1992.458, 707.7781, 2.75762, 7200, 0, 0),
-- pos 4
(@CGUID+3, 38176, 668, 3, 1, 5325.072, 1977.597, 707.7781, 2.076942, 7200, 0, 0),
(@CGUID+8, 38176, 668, 3, 1, 5295.635, 1973.757, 707.7781, 1.186824, 7200, 0, 0),
(@CGUID+9, 38177, 668, 3, 1, 5311.031, 1972.229, 707.7781, 1.64061, 7200, 0, 0),
(@CGUID+13, 38176, 668, 3, 1, 5319.158, 1973.998, 707.7781, 1.919862, 7200, 0, 0),
(@CGUID+14, 38177, 668, 3, 1, 5302.247, 1972.415, 707.7781, 1.37881, 7200, 0, 0),
(@CGUID+18, 38172, 668, 3, 1, 5313.82, 1978.146, 707.7781, 1.745329, 7200, 0, 0),
(@CGUID+22, 38177, 668, 3, 1, 5299.434, 1979.009, 707.7781, 1.239184, 7200, 0, 0),
(@CGUID+26, 38172, 668, 3, 1, 5320.369, 1980.125, 707.7781, 2.007129, 7200, 0, 0),
(@CGUID+27, 38172, 668, 3, 1, 5306.572, 1977.474, 707.7781, 1.500983, 7200, 0, 0);
*/

/*
-- Uther the Lightbringer missing emotes
UPDATE `creature_text` SET `emote`=5 WHERE `entry`=37225 AND `groupid` IN (0,4,8,15) AND `id`=0;
UPDATE `creature_text` SET `emote`=1 WHERE `entry`=37225 AND `groupid` IN (1,2,3,5,6,7,9,10,11,12,13,14) AND `id`=0;
-- Falric missing emotes
UPDATE `creature_text` SET `emote`=2 WHERE `entry`=38112 AND `groupid`=5 AND `id`=0;
-- Marwyn missing emotes
UPDATE `creature_text` SET `emote`=2 WHERE `entry`=38113 AND `groupid`=4 AND `id`=0;
UPDATE `creature_text` SET `emote`=397 WHERE `entry`=38113 AND `groupid`=0 AND `id`=0;

-- Falric and Marwyn bind players to instance on heroic
UPDATE `creature_template` SET `flags_extra`=1 WHERE `entry` IN (38599,38603);
-- Frostsworn General
UPDATE `creature_template` SET `ScriptName`='npc_frostworn_general' WHERE `entry`=36723;
UPDATE `creature_template` SET `faction_A`=16,`faction_H`=16 WHERE `entry`=37720; -- for hc
-- Spiritual Reflection
-- UPDATE `creature_template` SET `modelid1`=57 WHERE `entry`=37068;
UPDATE `creature_template` SET `ScriptName`='npc_spiritual_reflection' WHERE `entry`=37068;
-- The Lich King (at chase event)
UPDATE `creature_template` SET `ScriptName`='boss_lich_king_hor' WHERE `entry`=36954;
-- Lady Jaina Proudmoore (at chase event)
UPDATE `creature_template` SET `faction_A`=1770,`faction_H`=1770,`unit_flags`=64|256|32768,`ScriptName`='npc_jaina_and_sylvana_hor_part2' WHERE `entry`=36955;
-- Lady Sylvanas Windrunner (at chase event)
UPDATE `creature_template` SET `ScriptName`='npc_jaina_and_sylvana_hor_part2' WHERE `entry`=37554;
-- High Captain Justin Bartlett
#UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=30344;
-- Sky-Reaver Korm Blackscar
#UPDATE `creature_template` SET `npcflag`=3 WHERE `entry`=30824;
-- Raging Ghoul
UPDATE `creature_template` SET `AIName`='',`Scriptname`='npc_raging_ghoul' WHERE `entry`=36940;
-- Risen Witch Doctor
UPDATE `creature_template` SET `AIName`='',`Scriptname`='npc_risen_witch_doctor' WHERE `entry`=36941;
-- Lumbering Abomination
UPDATE `creature_template` SET `AIName`='',`Scriptname`='npc_lumbering_abomination' WHERE `entry`=37069;
-- Frostmourne Altar Bunny (Quel''Delar)
UPDATE `creature_template` SET `InhabitType`=4,`flags_extra`=128 WHERE `entry`=37704;

DELETE FROM `conditions` WHERE `SourceEntry`=70063 AND `SourceTypeOrReferenceId`=13;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,70063,0,0,32,0,144,0,0,0,0,'','Fury of Frostmourne - target players');

-- AreaTrigger for waves restarter
DELETE FROM `areatrigger_scripts` WHERE `entry`=5697;
INSERT INTO `areatrigger_scripts` VALUES
(5697,'at_hor_waves_restarter');

SET @GUID_CREATURE := 400000;
DELETE FROM `creature` WHERE `map`=668 AND `guid` BETWEEN @GUID_CREATURE+0 AND @GUID_CREATURE+3;
INSERT INTO `creature` (`guid`, `id`, `map`, `spawnMask`, `phaseMask`, `modelid`, `equipment_id`, `position_x`, `position_y`, `position_z`, `orientation`, `spawntimesecs`, `spawndist`, `currentwaypoint`, `curhealth`, `curmana`, `MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES
(@GUID_CREATURE+0,37704,668,3,1,0,0,5309.135,2006.21,715.7825,3.961897,604800,0,0,0,0,0,0,0,0),
(@GUID_CREATURE+1,38112,668,3,1,0,0,5276.583,2037.45,709.4025,5.532694,604800,0,0,0,0,0,0,0,0),
(@GUID_CREATURE+2,38113,668,3,1,0,0,5342.232,1975.696,709.4025,2.391101,604800,0,0,0,0,0,0,0,0),
(@GUID_CREATURE+3,36723,668,3,1,0,0,5415.538,2117.842,707.7781,3.944444,604800,0,0,0,0,0,0,0,0);

DELETE FROM `script_waypoint` WHERE `entry` IN(36955,36954,37554);
INSERT INTO `script_waypoint` VALUES
-- Jaina
(36955,0,5587.682,2228.586,733.011,0,'WP1'),
(36955,1,5600.715,2209.058,731.618,0,'WP2'),
(36955,2,5606.417,2193.029,731.129,0,'WP3'),
(36955,3,5598.562,2167.806,730.918,0,'WP4 - Summon IceWall 01'),
(36955,4,5556.436,2099.827,731.827,0,'WP5 - Spell Channel'),
(36955,5,5543.498,2071.234,731.702,0,'WP6'),
(36955,6,5528.969,2036.121,731.407,0,'WP7'),
(36955,7,5512.045,1996.702,735.122,0,'WP8'),
(36955,8,5504.490,1988.789,735.886,0,'WP9 - Spell Channel'),
(36955,9,5489.645,1966.389,737.653,0,'WP10'),
(36955,10,5475.517,1943.176,741.146,0,'WP11'),
(36955,11,5466.930,1926.049,743.536,0,'WP12'),
(36955,12,5445.157,1894.955,748.757,0,'WP13 - Spell Channel'),
(36955,13,5425.907,1869.708,753.237,0,'WP14'),
(36955,14,5405.118,1833.937,757.486,0,'WP15'),
(36955,15,5370.324,1799.375,761.007,0,'WP16'),
(36955,16,5335.422,1766.951,767.635,0,'WP17 - Spell Channel'),
(36955,17,5311.438,1739.390,774.165,0,'WP18'),
(36955,18,5283.589,1703.755,784.176,0,'WP19'),
(36955,19,5260.400,1677.775,784.301,3000,'WP20'),
(36955,20,5262.439,1680.410,784.294,0,'WP21'),
(36955,21,5260.400,1677.775,784.301,0,'WP22'),
-- Sylvana
(37554,0,5587.682,2228.586,733.011,0,'WP1'),
(37554,1,5600.715,2209.058,731.618,0,'WP2'),
(37554,2,5606.417,2193.029,731.129,0,'WP3'),
(37554,3,5598.562,2167.806,730.918,0,'WP4 - Summon IceWall 01'),
(37554,4,5556.436,2099.827,731.827,0,'WP5 - Spell Channel'),
(37554,5,5543.498,2071.234,731.702,0,'WP6'),
(37554,6,5528.969,2036.121,731.407,0,'WP7'),
(37554,7,5512.045,1996.702,735.122,0,'WP8'),
(37554,8,5504.490,1988.789,735.886,0,'WP9 - Spell Channel'),
(37554,9,5489.645,1966.389,737.653,0,'WP10'),
(37554,10,5475.517,1943.176,741.146,0,'WP11'),
(37554,11,5466.930,1926.049,743.536,0,'WP12'),
(37554,12,5445.157,1894.955,748.757,0,'WP13 - Spell Channel'),
(37554,13,5425.907,1869.708,753.237,0,'WP14'),
(37554,14,5405.118,1833.937,757.486,0,'WP15'),
(37554,15,5370.324,1799.375,761.007,0,'WP16'),
(37554,16,5335.422,1766.951,767.635,0,'WP17 - Spell Channel'),
(37554,17,5311.438,1739.390,774.165,0,'WP18'),
(37554,18,5283.589,1703.755,784.176,0,'WP19'),
(37554,19,5260.400,1677.775,784.301,3000,'WP20'),
(37554,20,5262.439,1680.410,784.294,0,'WP21'),
(37554,21,5260.400,1677.775,784.301,0,'WP22'),
-- Lich King
(36954,1,5577.19,2236,733.012,0,'HoR WP LichKing'),
(36954,2,5580.57,2232.22,733.012,0,'HoR WP LichKing'),
(36954,3,5586.67,2225.54,733.012,0,'HoR WP LichKing'),
(36954,4,5590.45,2221.41,733.012,0,'HoR WP LichKing'),
(36954,5,5595.75,2215.62,732.101,0,'HoR WP LichKing'),
(36954,6,5601.21,2206.49,731.54,0,'HoR WP LichKing'),
(36954,7,5605.01,2197.9,731.667,0,'HoR WP LichKing'),
(36954,8,5606.55,2191.39,730.977,0,'HoR WP LichKing'),
(36954,9,5604.68,2186.11,730.998,0,'HoR WP LichKing'),
(36954,10,5602.26,2179.9,730.967,0,'HoR WP LichKing'),
(36954,11,5600.06,2174.38,730.924,0,'HoR WP LichKing'),
(36954,12,5597.29,2166.81,730.924,0,'HoR WP LichKing'),
(36954,13,5596.25,2160.36,730.931,0,'HoR WP LichKing'),
(36954,14,5591.79,2152.87,731.008,0,'HoR WP LichKing'),
(36954,15,5585.47,2146.63,731.109,0,'HoR WP LichKing'),
(36954,16,5579.1,2140.34,731.18,0,'HoR WP LichKing'),
(36954,17,5572.56,2134.21,731.092,0,'HoR WP LichKing'),
(36954,18,5564.08,2126.53,730.816,0,'HoR WP LichKing'),
(36954,19,5559.04,2117.64,730.812,0,'HoR WP LichKing'),
(36954,20,5555.77,2111.88,730.995,0,'HoR WP LichKing'),
(36954,21,5550.82,2103.14,731.123,0,'HoR WP LichKing'),
(36954,22,5546.02,2094.68,731.16,0,'HoR WP LichKing'),
(36954,23,5541.53,2084.42,730.999,0,'HoR WP LichKing'),
(36954,24,5537.5,2075.18,730.901,0,'HoR WP LichKing'),
(36954,25,5533.76,2063.84,730.87,0,'HoR WP LichKing'),
(36954,26,5530.97,2052.98,730.981,0,'HoR WP LichKing'),
(36954,27,5526.75,2041.73,731.193,0,'HoR WP LichKing'),
(36954,28,5522.88,2031.65,731.7,0,'HoR WP LichKing'),
(36954,29,5521.01,2023.02,732.396,0,'HoR WP LichKing'),
(36954,30,5516.55,2015.36,733.12,0,'HoR WP LichKing'),
(36954,31,5513.06,2007.33,733.99,0,'HoR WP LichKing'),
(36954,32,5510.43,1997.9,735.016,0,'HoR WP LichKing'),
(36954,33,5504.53,1990.39,735.748,0,'HoR WP LichKing'),
(36954,34,5499.34,1983.78,736.29,0,'HoR WP LichKing'),
(36954,35,5493.11,1975.86,736.852,0,'HoR WP LichKing'),
(36954,36,5487.58,1968.81,737.394,0,'HoR WP LichKing'),
(36954,37,5483.12,1961.78,738.06,0,'HoR WP LichKing'),
(36954,38,5478.33,1954.2,739.343,0,'HoR WP LichKing'),
(36954,39,5475.2,1945.84,740.697,0,'HoR WP LichKing'),
(36954,40,5472.15,1938.02,741.884,0,'HoR WP LichKing'),
(36954,41,5469.26,1931.34,742.813,0,'HoR WP LichKing'),
(36954,42,5464.23,1922.25,744.055,0,'HoR WP LichKing'),
(36954,43,5458.43,1912.96,745.229,0,'HoR WP LichKing'),
(36954,44,5452.26,1902.95,747.091,0,'HoR WP LichKing'),
(36954,45,5442.44,1892.51,749.208,0,'HoR WP LichKing'),
(36954,46,5435.67,1879.7,751.776,0,'HoR WP LichKing'),
(36954,47,5429.03,1870.73,753.151,0,'HoR WP LichKing'),
(36954,48,5423.72,1862.16,754.263,0,'HoR WP LichKing'),
(36954,49,5417.21,1851.7,755.507,0,'HoR WP LichKing'),
(36954,50,5408.94,1838.38,757.002,0,'HoR WP LichKing'),
(36954,51,5398.8,1829.61,757.742,0,'HoR WP LichKing'),
(36954,52,5388.47,1817.95,759.285,0,'HoR WP LichKing'),
(36954,53,5378.23,1808.5,760.316,0,'HoR WP LichKing'),
(36954,54,5368.5,1801.35,760.845,0,'HoR WP LichKing'),
(36954,55,5360.86,1793.16,762.271,0,'HoR WP LichKing'),
(36954,56,5353.62,1785.4,763.868,0,'HoR WP LichKing'),
(36954,57,5344.78,1776.09,765.759,0,'HoR WP LichKing'),
(36954,58,5336.38,1768.67,767.324,0,'HoR WP LichKing'),
(36954,59,5327.56,1760.12,769.332,0,'HoR WP LichKing'),
(36954,60,5319.62,1750.7,771.487,0,'HoR WP LichKing'),
(36954,61,5313.12,1742.99,773.424,0,'HoR WP LichKing'),
(36954,62,5305.41,1735.79,775.473,0,'HoR WP LichKing'),
(36954,63,5298.93,1728.16,777.573,0,'HoR WP LichKing'),
(36954,64,5292.54,1720.37,779.862,0,'HoR WP LichKing'),
(36954,65,5287.11,1713.96,781.667,0,'HoR WP LichKing'),
(36954,66,5280.14,1705.21,784.65,0,'HoR WP LichKing'),
(36954,67,5277.98,1701.28,785.224,0,'HoR WP LichKing');
*/
-- Halls of Reflexion WIP
SET @NPC_LANDGREN := 29542;
SET @NPC_ARETE    := 29560;
SET @NPC_SOUL     := 29572;
SET @NPC_SOUL_TARGET := 29577;
SET @GO_FOCUS      := 191578;
SET @GO_GATE      := 191579;

UPDATE `gameobject_template` SET `faction`=114, `AIName`='SmartGameObjectAI' WHERE `entry`=@GO_GATE;
DELETE FROM `gameobject_template` WHERE `entry`=@GO_FOCUS;
INSERT INTO `gameobject_template` (`entry`,`type`,`displayId`,`name`,`data0`,`data1`,`data6`,`AIName`) VALUES
(@GO_FOCUS,8,0,'Archbishop Landgren''s Corpse',1566,20,0,'SmartGameObjectAI');

UPDATE `creature_template` SET `npcflag`=2, `unit_flags`=33280 WHERE `entry`=@NPC_ARETE;
UPDATE `creature_template` SET `faction_A`=14, `faction_H`=14, `speed_walk`=0.4, `unit_flags`=256, `dynamicflags`=0, `InhabitType`=4 WHERE `entry`=@NPC_SOUL;
UPDATE `creature_template` SET `unit_flags`=33555200, `InhabitType`=4 WHERE `entry`=@NPC_SOUL_TARGET;

UPDATE `creature_model_info` SET `bounding_radius`=0.5745, `combat_reach`=2.25 WHERE `modelid`=26197;
UPDATE `creature_model_info` SET `bounding_radius`=0.3825, `combat_reach`=1.875 WHERE `modelid`=26346;

DELETE FROM `creature_template_addon` WHERE `entry`=@NPC_SOUL;
INSERT INTO `creature_template_addon` (`entry`,`bytes2`,`emote`,`auras`) VALUES
(@NPC_SOUL,1,0,'36545');

DELETE FROM `creature_equip_template` WHERE `entry`=@NPC_ARETE;
INSERT INTO `creature_equip_template` (`entry`,`id`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@NPC_ARETE,1,40276,0,0);

DELETE FROM `creature_text` WHERE `entry` IN (@NPC_LANDGREN,@NPC_ARETE,@NPC_SOUL);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_LANDGREN,0,0,'I will not die so quickly this time!',14,0,100,0,0,0,''),

(@NPC_ARETE,0,0,'Well done. Let''s get this over with.',12,0,100,1,0,0,''),
(@NPC_ARETE,1,0,'Come, Landgren, cough up your soul so that I can ask you a very important question.',12,0,100,0,0,0,''),
(@NPC_ARETE,2,0,'YOU WILL TELL ME WHERE WESTWIND IS OR I WILL DESTROY YOUR SOUL!',14,0,100,25,0,0,''),
(@NPC_ARETE,3,0,'Then you leave me no choice. I won''t say that I won''t enjoy this.',12,0,100,1,0,0,''),
(@NPC_ARETE,4,0,'Very well. Tell me!',12,0,100,0,0,0,''),
(@NPC_ARETE,5,0,'A hidden hollow? How very interesting. You''ve served your purpose, Landgren, but I''m afraid there''ll be no resurrection for you this time!',12,0,100,6,0,0,''),
(@NPC_ARETE,6,0,'Now that the unpleasantness is finished with, let''s talk about you dealing with Grand Admiral Westwind.',12,0,100,11,0,0,''),

(@NPC_SOUL,0,0,'You''ll get nothing out of me, monster. I am beyond your ability to influence.',12,0,100,0,0,0,''),
(@NPC_SOUL,1,0,'No.',12,0,100,0,0,0,''),
(@NPC_SOUL,2,0,'STOP! It isn''t worth it. I''ll tell you where he is.',12,0,100,0,0,0,''),
(@NPC_SOUL,3,0,'On the south end of the island is a cave -- a hidden hollow. The grand admiral has holed himself up in there, preparing for the final battle against the Lich King.',12,0,100,0,0,0,''),
(@NPC_SOUL,4,0,'AAAEEEEIIIiiiiiiiiiiiiiiiiiiiiiiiiiiii........................................',14,0,100,0,0,0,'');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (22966,26560);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(13,1,22966,0,0,31,0,3,@NPC_LANDGREN,0,0,0,'','Spell Soul Coax targets Archbishop Landgren'),
(13,2,26560,0,0,31,0,3,@NPC_LANDGREN,0,0,0,'','Spell Summon Arete''s Gate effect1 targets Archbishop Landgren');

DELETE FROM `spell_script_names` WHERE `spell_id`=12601;
INSERT INTO `spell_script_names` (`spell_id`, `ScriptName`) VALUES
(12601,'spell_q12847_summon_soul_moveto_bunny');

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (@NPC_LANDGREN,@NPC_ARETE,@NPC_SOUL);
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_LANDGREN,@NPC_ARETE,@NPC_SOUL) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@GO_FOCUS,@GO_GATE) AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@NPC_LANDGREN*100,@NPC_ARETE*100,@NPC_SOUL*100,@GO_GATE*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@NPC_LANDGREN,0,0,0,25,0,100,0,0,0,0,0,28,60449,0,0,0,0,0,1,0,0,0,0,0,0,0,'Archbishop Landgren - On reset - Remove aura Shadowform'),
(@NPC_LANDGREN,0,1,0,0,0,100,0,10000,12000,9000,10000,11,60453,0,0,0,0,0,2,0,0,0,0,0,0,0,'Archbishop Landgren - On update IC - Spellcast Mind Blast'),
(@NPC_LANDGREN,0,2,0,0,0,100,0,15000,16000,18000,20000,11,60446,0,0,0,0,0,2,0,0,0,0,0,0,0,'Archbishop Landgren - On update IC - Spellcast Shadow Word: Pain'),
(@NPC_LANDGREN,0,3,0,0,0,100,0,30000,35000,35000,40000,11,60440,0,0,0,0,0,2,0,0,0,0,0,0,0,'Archbishop Landgren - On update IC - Spellcast Mind Sear'),
(@NPC_LANDGREN,0,4,5,2,0,100,1,0,50,0,0,11,60449,0,0,0,0,0,1,0,0,0,0,0,0,0,'Archbishop Landgren - On health below 50% - Spellcast Shadowform'),
(@NPC_LANDGREN,0,5,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Archbishop Landgren - On health below 50% - Say line'),
(@NPC_LANDGREN,0,6,0,6,0,100,0,0,0,0,0,11,22965,0,0,0,0,0,1,0,0,0,0,0,0,0,'Archbishop Landgren - On death - Spellcast Summon Archbishop Landgren''s Corpse Spell Focus'),
(@NPC_LANDGREN,0,7,8,8,0,100,0,26560,0,0,0,45,0,1,0,0,0,0,20,@GO_GATE,50,0,0,0,0,0,'Archbishop Landgren - On spellhit Summon Arete''s Gate - Set data 0 1 Arete''s Gate'),
(@NPC_LANDGREN,0,8,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,20,@GO_FOCUS,5,0,0,0,0,0,'Archbishop Landgren - On spellhit Summon Arete''s Gate - Set data 0 1 Arete''s Gate'),
(@NPC_LANDGREN,0,9,10,38,0,100,0,0,1,0,0,11,12601,2,0,0,0,0,1,0,0,0,0,0,0,0,'Archbishop Landgren - On data 0 1 set - Spellcast Summon Landgren''s Soul Moveto Target Bunny'),
(@NPC_LANDGREN,0,10,0,61,0,100,0,0,0,0,0,11,12600,2,0,0,0,0,1,0,0,0,0,0,0,0,'Archbishop Landgren - On data 0 1 set - Spellcast Summon Landgren''s Soul'),

(@NPC_ARETE,0,0,1,1,0,100,1,0,0,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete - Just summoned - Spellcast Ethereal Teleport'),
(@NPC_ARETE,0,1,2,61,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete - Just summoned - Remove npcflag questgiver'),
(@NPC_ARETE,0,2,3,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,@NPC_LANDGREN,20,0,0,0,0,0,'Lord-Commander Arete - Just summoned - Turn to Archbishop Landgren'),
(@NPC_ARETE,0,3,0,61,0,100,0,0,0,0,0,80,@NPC_ARETE*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete - Just summoned - Run script'),

(@NPC_SOUL,0,0,0,54,0,100,0,0,0,0,0,80,@NPC_SOUL*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul - Just summoned - Run script'),

(@GO_FOCUS,1,0,0,38,0,100,0,0,1,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Archbishop Landgren''s Corpse Spell Focus - On data 0 1 set - Set phase 2'),

(@GO_GATE,1,0,0,38,0,100,0,0,1,0,0,80,@GO_GATE*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Arete''s Gateway - On data 0 1 set - Run script'),

(@GO_GATE*100,9,0,0,0,0,100,0,4000,4000,0,0,11,18280,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arete''s Gateway script - Spellcast Summon Arete'),
(@GO_GATE*100,9,1,0,0,0,100,0,180000,180000,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arete''s Gateway script - Set phase 2'),

(@NPC_ARETE*100,9,0,0,0,0,100,0,500,500,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Say line'),
(@NPC_ARETE*100,9,1,0,0,0,100,0,0,0,0,0,46,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Move forward'),
(@NPC_ARETE*100,9,2,0,0,0,100,0,4000,4000,0,0,66,0,0,0,0,0,0,19,@NPC_LANDGREN,20,0,0,0,0,0,'Lord-Commander Arete script - Turn to Archbishop Landgren'),
(@NPC_ARETE*100,9,3,0,0,0,100,0,1000,1000,0,0,11,22966,0,0,0,0,0,19,@NPC_LANDGREN,20,1,0,0,0,0,'Lord-Commander Arete script - Spellcast Soul Coax'),
(@NPC_ARETE*100,9,4,0,0,0,100,0,0,0,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Say line'),
(@NPC_ARETE*100,9,5,0,0,0,100,0,8000,8000,0,0,45,0,1,0,0,0,0,19,@NPC_LANDGREN,20,1,0,0,0,0,'Lord-Commander Arete script - Set data 0 1 Archbishop Landgren'),
(@NPC_ARETE*100,9,6,0,0,0,100,0,12000,12000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Say line'),
(@NPC_ARETE*100,9,7,0,0,0,100,0,7000,7000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Say line'),
(@NPC_ARETE*100,9,8,0,0,0,100,0,4000,4000,0,0,11,27765,0,0,0,0,0,19,@NPC_SOUL,20,0,0,0,0,0,'Lord-Commander Arete script - Spellcast Soul Wrack'),
(@NPC_ARETE*100,9,9,0,0,0,100,0,15000,15000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Say line'),
(@NPC_ARETE*100,9,10,0,0,0,100,0,0,0,0,0,92,0,27765,1,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Interrupt spellcast'),
(@NPC_ARETE*100,9,11,0,0,0,100,0,10000,10000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Say line'),
(@NPC_ARETE*100,9,12,0,0,0,100,0,4000,4000,0,0,5,25,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Play emote'),
(@NPC_ARETE*100,9,13,0,0,0,100,0,4000,4000,0,0,11,54723,0,0,0,0,0,19,@NPC_SOUL,20,0,0,0,0,0,'Lord-Commander Arete script - Spellcast Soul Wrack'),
(@NPC_ARETE*100,9,14,0,0,0,100,0,8000,8000,0,0,92,0,54723,1,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Interrupt spellcast'),
(@NPC_ARETE*100,9,15,0,0,0,100,0,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Say line'),
(@NPC_ARETE*100,9,16,0,0,0,100,0,0,0,0,0,82,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Set npcflag questgiver'),
(@NPC_ARETE*100,9,17,0,0,0,100,0,98000,98000,0,0,69,0,0,0,0,0,0,20,@GO_GATE,10,0,0,0,0,0,'Lord-Commander Arete script - Move to position'),
(@NPC_ARETE*100,9,18,0,0,0,100,0,2000,2000,0,0,11,34427,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Spellcast Ethereal Teleport'),
(@NPC_ARETE*100,9,19,0,0,0,100,0,500,500,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Lord-Commander Arete script - Despawn'),

(@NPC_SOUL*100,9,0,0,0,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,@NPC_ARETE,20,0,0,0,0,0,'Landgren''s Soul script - Turn to Lord-Commander Arete'),
(@NPC_SOUL*100,9,1,0,0,0,100,0,500,500,0,0,11,36545,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Spellcast Floating Drowned'),
(@NPC_SOUL*100,9,2,0,0,0,100,0,6500,6500,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Say line'),
(@NPC_SOUL*100,9,3,0,0,0,100,0,10000,10000,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Say line'),
(@NPC_SOUL*100,9,4,0,0,0,100,0,15000,15000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Say line'),
(@NPC_SOUL*100,9,5,0,0,0,100,0,10000,10000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Say line'),
(@NPC_SOUL*100,9,6,0,0,0,100,0,16000,16000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Say line'),
(@NPC_SOUL*100,9,7,0,0,0,100,0,5000,5000,0,0,11,35426,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Spellcast Arcane Explosion Visual'),
(@NPC_SOUL*100,9,8,0,0,0,100,0,1000,1000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Landgren''s Soul script - Despawn');
SET @THANE          := 29919;
SET @SPELL          := 31696;
SET @B_STRIKE       := 58460;
SET @REND           := 16509;
SET @P_SMASH        := 60868;
SET @EVENT          := 19490;

DELETE FROM `disables` WHERE `sourceType`=0 AND `entry` IN (@SPELL);
INSERT INTO `disables`(`sourceType`,`entry`,`flags`,`comment`) VALUES
(0,@SPELL,64,'Ignore LOS on Thane');

DELETE FROM `event_scripts` WHERE `id`=@EVENT;
INSERT INTO `event_scripts` (`id`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) VALUES
(@EVENT,0,15,53799,4,29919,30,0,0,0);

DELETE FROM `creature_text` WHERE `entry` IN (@THANE);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@THANE,1,0, 'By order of Duke Lankral, Commander of the Knights of the Ebon Blade, Vanquisher of the Scourge and Conquerer of The Shadow Vault, you are hearby served notice to cease and desist from all activities providing materiel assistance, vrykul, and any other type of support to the Lich King. Failure to comply will result in your immediate destruction. My messenger will serve as the instrument of my will. What is your decision?',12,0,100,0,0,0,'Thane'),
(@THANE,2,0, 'What is this?',14,0,100,0,0,0,'Thane'),
(@THANE,3,0, 'My answer? Here''s my answer, little messenger!',14,0,100,0,0,0,'Thane'),
(@THANE,4,0, 'I will feed you to the dogs!',14,0,100,0,0,0,'Thane');

UPDATE `creature_template` SET AIName='SmartAI' WHERE entry = @THANE;
DELETE FROM `smart_scripts` WHERE source_type=0 AND entryorguid = @THANE;
DELETE FROM `smart_scripts` WHERE source_type=9 AND entryorguid = @THANE*100;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@THANE,0,0,1,4,0,100,0,0,0,0,0,1,2,12000,0,0,0,0,1,0,0,0,0,0,0,0,'Thane - On spellhit - Say text2'),
(@THANE,0,1,2,61,0,100,0,0,0,0,0,18,33685504,0,0,0,0,0,1,0,0,0,0,0,0,0,'Thane - On Link - Set Unit Flags'),
(@THANE,0,2,0,61,0,100,0,0,0,0,0,84,1,0,0,0,0,0,7,0,0,0,0,0,0,0,'Thane - On Link - Make player say Text1'),
(@THANE,0,3,0,52,0,100,0,2,@THANE,0,0,1,3,4000,0,0,0,0,1,0,0,0,0,0,0,0,'Thane - On Text2 over - Say Text3'),
(@THANE,0,4,5,52,0,100,0,3,@THANE,0,0,1,4,4000,0,0,0,0,1,0,0,0,0,0,0,0,'Thane - On Text3 over - Say Text4'),
(@THANE,0,5,0,61,0,100,0,0,0,0,0,19,33685504,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Thane - On Link - Remove unit flags'),
(@THANE,0,6,0,0,0,100,0,4000,7000,4000,7000,11,@B_STRIKE,0,0,0,0,0,5,0,0,0,0,0,0,0,'Thane - In Combat - Cast Brutal Strike'),
(@THANE,0,7,0,0,0,100,0,4000,15000,4000,15000,11,@REND,0,0,0,0,0,5,0,0,0,0,0,0,0,'Thane - In Combat - Cast Rend'),
(@THANE,0,8,0,0,0,100,0,12000,25000,12000,25000,11,@P_SMASH,0,0,0,0,0,5,0,0,0,0,0,0,0,'Thane - In Combat - Cast Powerful Smash');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 13 AND `SourceEntry`=@SPELL;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13,1,@SPELL,0,0,31,0,3,@THANE,0,0,0,'','Shadow Decree hits only Thane');
-- Not-So-Honorable Combat (13137)
SET @GO_SIGNAL_FIRE             := 193024;  -- Battlescar Signal Fire
SET @EVENT_SCRIPT               := 20069;   -- Event Script
SET @NPC_POSSESSED_ISKALDER     := 30924;   -- Possessed Iskalder <The Ancient Hero>
SET @NPC_VARDMADRA              := 30945;   -- Vadmadra
SET @NPC_LADY_NIGHTSWOOD        := 30955;   -- Lady Nightswood
SET @MOVE_TARGET_BUNNY          := 25715;   -- Not-So-Honorable Combat: Summon Lady Nightswood's Moveto Target Bunny
SET @TARGET_BUNNY               := 30959;   -- Lady Nightswood's Moveto Target Bunny
SET @SUMMON_NIGHTSWOOD          := 25727;   -- Not-So-Honorable Combat: Summon Lady Nightswood
SET @POSSESS_VARDMADRA          := 25745;   -- Possession

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 13 AND `SourceEntry`IN (@SUMMON_NIGHTSWOOD,@MOVE_TARGET_BUNNY,@POSSESS_VARDMADRA);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(13,1,@SUMMON_NIGHTSWOOD,0,0,31,0,3,@TARGET_BUNNY,0,0,0,'','Summon Nightswood only hits Target Bunny'),
(13,1,@MOVE_TARGET_BUNNY,0,0,31,0,3,@NPC_POSSESSED_ISKALDER,0,0,0,'','Move Target Bunny only hits Target Bunny'),
(13,1,@POSSESS_VARDMADRA,0,0,31,0,3,@NPC_VARDMADRA,0,0,0,'','Possess Vardmadra only hits Vardmadra');

UPDATE `creature_template` SET `AIName`='SmartAI',`faction_A`=2116,`faction_H`=2116,`unit_flags`=33088,`mindmg`=422,`maxdmg`=586,`attackpower`=642,`minrangedmg`=345,`maxrangedmg`=509,`rangedattackpower`=103 WHERE `entry`=@NPC_POSSESSED_ISKALDER;
UPDATE `creature_template` SET `faction_A`=2116,`faction_H`=2116,`unit_flags`=33536,`AIName`='SmartAI',`minlevel`=80, `maxlevel`=80 WHERE `entry`=@NPC_VARDMADRA;
UPDATE `creature_template` SET `AIName`='SmartAI', `InhabitType`=7 WHERE  `entry` IN (@TARGET_BUNNY,@NPC_LADY_NIGHTSWOOD);
UPDATE `creature_template` SET `modelid1`=11686, `modelid2`=0 WHERE  `entry`=@TARGET_BUNNY;
DELETE FROM `creature_template_addon` WHERE `entry` IN (@NPC_POSSESSED_ISKALDER,@NPC_VARDMADRA);
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@NPC_POSSESSED_ISKALDER,0,0x0,0x1,'58102'),
(@NPC_VARDMADRA,0,0x3000000,0x1,'');

DELETE FROM `creature_equip_template` WHERE `entry`=@NPC_POSSESSED_ISKALDER;
INSERT INTO `creature_equip_template` (`entry`,`itemEntry1`,`itemEntry2`,`itemEntry3`) VALUES
(@NPC_POSSESSED_ISKALDER,43296,43295,0);

DELETE FROM `creature_text` WHERE `entry` IN (@NPC_POSSESSED_ISKALDER,@NPC_VARDMADRA,@NPC_LADY_NIGHTSWOOD);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@NPC_POSSESSED_ISKALDER,0,0,'Now fight me, $N! Kill Iskalder!',14,0,100,0,0,1167,'Possessed Iskalder'),
(@NPC_VARDMADRA,0,0, 'Iskalder, there you are. What is this? Engaged in battle already?',14,0,100,457,0,13824,'Vardmadra'),
(@NPC_VARDMADRA,1,0, 'NO! How is this possible?',14,0,100,457,0,13825,'Vardmadra'),
(@NPC_VARDMADRA,2,0, 'I know not how this was possible, but you must still be judged Iskalder. Wait... what is this?',14,0,100,457,0,13824,'Vardmadra'),
(@NPC_VARDMADRA,3,0, 'Stay away from me creature! Do not touch me!',14,0,100,0,0,1168,'Vardmadra to Nightswood'),
(@NPC_VARDMADRA,4,0, 'Ahahahahahaha! It is done. Return to my cave. We have much to discuss!',14,0,100,457,0,1167,'Vardmadra to '),
(@NPC_LADY_NIGHTSWOOD,0,0, 'This? This is me taking control of you. This is me setting up my final revenge!',14,0,100,457,0,13824,'Lady Nightswood');

-- Possessed Iskalder <The Ancient Hero>
DELETE FROM `event_scripts` WHERE `id`=@EVENT_SCRIPT;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(@EVENT_SCRIPT,5,10,@NPC_POSSESSED_ISKALDER,180000,0,7229.436,3642.27,809.0175,0);

DELETE FROM `smart_scripts` WHERE `source_type` IN (0,9) AND `entryorguid` IN (@NPC_POSSESSED_ISKALDER,@NPC_VARDMADRA,@NPC_LADY_NIGHTSWOOD,@TARGET_BUNNY,@TARGET_BUNNY*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_POSSESSED_ISKALDER,0,0,1,54,0,100,0,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iskalder - On Summon - Remove unit flag'),
(@NPC_POSSESSED_ISKALDER,0,1,0,61,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iskalder - On Link - Talk'),
(@NPC_POSSESSED_ISKALDER,0,2,0,2,0,100,1,0,65,0,0,12,@NPC_VARDMADRA,3,180000,0,0,0,8,0,0,0,7182.766602,3661.931885, 826.149292, 5.838641, 'Possessed Iskalder - on 65% HP - Spawn Vardmara'),
(@NPC_POSSESSED_ISKALDER,0,3,0,4,0,100,1,0,0,0,0,11,60108,0,0,0,0,0,2,0,0,0,0,0,0,0,'Iskalder - On Aggro - Cast Heroic Leap'),
(@NPC_POSSESSED_ISKALDER,0,4,0,0,0,100,0,3500,3500,14500,16700,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Iskalder - In Combat - Cast Cleave'),
(@NPC_POSSESSED_ISKALDER,0,5,0,0,0,100,0,5000,6000,11200,15800,11,57846,0,0,0,0,0,2,0,0,0,0,0,0,0,'Iskalder - In Combat - Cast Heroic Strike'),
(@NPC_POSSESSED_ISKALDER,0,6,0,0,0,100,0,9000,11000,25000,25000,11,60121,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iskalder - In Combat - Cast Ancient Curse'),
(@NPC_POSSESSED_ISKALDER,0,7,0,2,0,100,1,0,50,0,0,1,0,0,0,0,0,0,11,@NPC_VARDMADRA,200,0,0,0,0,0,'Iskalder - On HPC - Make Vardmadra Say'),
(@NPC_POSSESSED_ISKALDER,0,8,0,6,0,100,1,0,0,0,0,45,1,1,0,0,0,0,11,@NPC_VARDMADRA,200,0,0,0,0,0,' Iskalder - On event death - Send Data to Vardmadra'),
(@NPC_POSSESSED_ISKALDER,0,9,10,1,0,100,1,0,0,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0,'Iskalder - OOC - Remove unit flag'),
(@NPC_POSSESSED_ISKALDER,0,10,0,61,0,100,1,0,0,0,0,45,2,2,0,0,0,0,11,@NPC_VARDMADRA,300,0,0,0,0,0, 'Possessed Iskalder - On link - Set Data on Vardmara'),

(@NPC_VARDMADRA,0,0,1,38,0,100,0,1,1,0,0,59,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vardmadra - On Receive Data - Set Run'),
(@NPC_VARDMADRA,0,1,2,61,0,100,0,1,1,0,0,69,0,0,0,0,0,0,8,0,0,0,7234.742,3643.584,811.8065,5.507,'Vardmadra - Linked with Previous Event - Move to position'),
(@NPC_VARDMADRA,0,2,3,61,0,100,0,0,0,0,0,1,1,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Vardmadra - Linked with Previous Event - Say'),
(@NPC_VARDMADRA,0,3,4,61,0,100,1,0,0,0,0,11,@MOVE_TARGET_BUNNY,2,0,0,0,0,19,@NPC_POSSESSED_ISKALDER,200,1,0,0,0,0,'Vardmadra - Linked with Previous Event - Cast Not-So-Honorable Combat: Summon Lady Nightswood''s Moveto Target Bunny'),
(@NPC_VARDMADRA,0,4,5,52,0,100,0,1,@NPC_VARDMADRA,0,0,1,2,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Vardmadra - On Text Over - Say'),
(@NPC_VARDMADRA,0,5,0,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,@NPC_POSSESSED_ISKALDER,200,1,0,0,0,0,'Vardmadra - On Link - Turn to Iskalder'),
(@NPC_VARDMADRA,0,6,7,52,0,100,0,2,@NPC_VARDMADRA,0,0,1,0,10000,0,0,0,0,11,@NPC_LADY_NIGHTSWOOD,200,0,0,0,0,0,'Vardmadra - On Text Over - Say'),
(@NPC_VARDMADRA,0,7,8,61,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,@NPC_LADY_NIGHTSWOOD,200,0,0,0,0,0,'Vardmadra - On Link - Turn to Lady Nightswood'),
(@NPC_VARDMADRA,0,8,0,61,0,100,0,0,0,0,0,45,1,1,0,0,0,0,11,@NPC_LADY_NIGHTSWOOD,200,0,0,0,0,0,'Vardmadra - On link - Send Data to Lady Nightswood'),
(@NPC_VARDMADRA,0,9,0,52,0,100,0,0,@NPC_LADY_NIGHTSWOOD,0,0,1,3,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Vardmadra - On Text Over - Say'),
(@NPC_VARDMADRA,0,10,0,52,0,100,0,3,@NPC_VARDMADRA,0,0,1,4,10000,0,0,0,0,1,0,0,0,0,0,0,0,'Vardmadra- On Text Over - Say'),
(@NPC_VARDMADRA,0,11,0,52,0,100,0,4,@NPC_VARDMADRA,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vardmadra - On Text Over - Despawn'),
(@NPC_VARDMADRA,0,12,0,38,0,100,0,2,2,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Vardmadra - On Receive Data - Despawn'),

(@TARGET_BUNNY,0,0,0,54,0,100,0,0,0,0,0,80,@TARGET_BUNNY*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Lady Nightswood Move-to-Bunny - On Summon - Start Timed Script'),
(@TARGET_BUNNY*100,9,0,0,0,0,100,0,7000,7000,7000,7000,69,0,0,0,0,0,0,8,0,0,0,7242.77,3631.67,814.0644,2.227,'Lady Nightswood Move-to-Bunny - On Script - Go to position'),
(@TARGET_BUNNY*100,9,1,0,0,0,100,0,8000,8000,8000,8000,11,@SUMMON_NIGHTSWOOD,2,0,0,0,0,1,0,0,0,0,0,0,0,'Lady Nightswood Move-to-Bunny - Linked with Previous Event - Cast Not-So-Honorable Combat: Summon Lady Nightswood''s Moveto Target Bunny'),

(@NPC_LADY_NIGHTSWOOD,0,0,0,54,0,100,0,0,0,0,0,66,0,0,0,0,0,0,19,@NPC_VARDMADRA,200,0,0,0,0,0,'Lady Nightswood - On Summon - Turn to Vardmadra'),
(@NPC_LADY_NIGHTSWOOD,0,1,0,38,0,100,0,1,1,0,0,11,@POSSESS_VARDMADRA,0,0,0,0,0,19,@NPC_VARDMADRA,200,0,0,0,0,0,'Lady Nigtswood - On Receive Data - Possess Vardmadra');
SET @SUMMON_ARETE       := 18280; -- LC Arete Summon Spell
SET @ARETE_GATE         := 191579; -- Arete Gateway Object
DELETE FROM `smart_scripts` WHERE `entryorguid`=@ARETE_GATE*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@ARETE_GATE*100,9,0,0,0,0,100,0,4000,4000,0,0,11,@SUMMON_ARETE,0,0,0,0,0,1,0,0,0,0,0,0,0,'Arete''s Gateway - On Script - Spellcast Summon Arete');
-- Pathing for Entry 5934 Heartrazor
SET @NPC := 51821;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-5183.809,`position_y`=-1170.219,`position_z`=45.11078 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,1,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-5183.809,-1170.219,45.11078,0,0,0,100,0),
(@PATH,2,-5181.056,-1184.849,45.97993,0,0,0,100,0),
(@PATH,3,-5169.914,-1200.506,47.15270,0,0,0,100,0),
(@PATH,4,-5159.998,-1216.499,48.38121,0,0,0,100,0),
(@PATH,5,-5173.076,-1229.047,49.04836,0,0,0,100,0),
(@PATH,6,-5194.938,-1230.641,48.47133,0,0,0,100,0),
(@PATH,7,-5207.135,-1229.340,47.92607,0,0,0,100,0),
(@PATH,8,-5215.482,-1216.020,46.70019,0,0,0,100,0),
(@PATH,9,-5207.343,-1200.787,46.16835,0,0,0,100,0),
(@PATH,10,-5184.156,-1170.526,45.12170,0,0,0,100,0),
(@PATH,11,-5183.285,-1153.094,44.87883,0,0,0,100,0),
(@PATH,12,-5183.285,-1153.094,44.87883,0,0,0,100,0),
(@PATH,13,-5177.142,-1130.755,43.77563,0,0,0,100,0),
(@PATH,14,-5164.937,-1121.575,43.77023,0,0,0,100,0),
(@PATH,15,-5145.432,-1115.095,43.74949,0,0,0,100,0),
(@PATH,16,-5138.181,-1109.642,44.04351,0,0,0,100,0),
(@PATH,17,-5154.783,-1119.312,43.67305,0,0,0,100,0),
(@PATH,18,-5176.401,-1127.441,43.71729,0,0,0,100,0),
(@PATH,19,-5183.811,-1149.325,44.34430,0,0,0,100,0);
SET @OGUID := 7080;

SET @ARTHAS := 27455;
SET @MURADIN := 27480;
SET @THELZAN := 27851;
SET @ALTAR := 190332;

UPDATE `creature` SET `spawndist`=0,`MovementType`=0 WHERE `id`=@THELZAN;

DELETE FROM `gameobject` WHERE `map`=571 AND `id` IN (192066,192065,192064,190191,@ALTAR);
INSERT INTO `gameobject` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`position_x`,`position_y`,`position_z`,`orientation`,`rotation0`,`rotation1`,`rotation2`,`rotation3`,`spawntimesecs`,`animprogress`,`state`) VALUES 
(@OGUID,192066,571,1,1,4816.637,-582.2271,163.1873,-1.240983,-0.5743933,0.2897787,-0.5093117,0.5715788,120,0,1),
(@OGUID+1,192065,571,1,1,4816.552,-581.2853,163.0618,1.043091,0.5583439,0.3292217,0.3740091,0.6633116,120,0,1),
(@OGUID+2,192064,571,1,1,4823.089,-581.7293,164.1632,2.408346,-0.3306689,-0.6249218,0.6858006,0.1726511,120,0,1),
(@OGUID+3,190191,571,1,1,4819.284,-583.5658,163.5637,1.343901,0,0,0.6225138,0.7826088,120,0,1),
(@OGUID+4,@ALTAR,571,1,1,4819.374,-583.699,163.5065,1.500983,0,0,0.6819983,0.7313538,120,0,1);

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@THELZAN;
UPDATE `creature_template` SET `InhabitType`=1, `AIName`='SmartAI' WHERE `entry` IN (@MURADIN,@ARTHAS);

DELETE FROM `event_scripts` WHERE `id`=18281;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`x`,`y`,`z`,`o`) VALUES
(18281,0,10,@THELZAN,20000,4819.284,-583.5658,163.5637,1.343901);

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=49825;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@THELZAN;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`Comment`) VALUES
(13,1,49825,0,0,31,3,@MURADIN,0,0,0, 'Arthas Calls to Spirits targets Muradin'),
(22,2,@THELZAN,0,0,29,@MURADIN,100,0,1,0, 'SAI activates only if Muradin is not around');

DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@ARTHAS,@MURADIN,@THELZAN);
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ARTHAS*100,@MURADIN*100,@MURADIN*100+1,@THELZAN*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@ARTHAS,0,0,0,38,0,100,0,0,10,0,0,80,@ARTHAS*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - On dataset - Run script'),

(@MURADIN,0,0,0,38,0,100,0,0,10,0,0,80,@MURADIN*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - On dataset - Run script'),
(@MURADIN,0,1,0,8,0,100,0,49825,0,0,0,80,@MURADIN*100+1,2,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - On spellhit - Run script'),

(@THELZAN,0,0,0,54,0,100,0,0,0,0,0,3,0,17200,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Just summoned - Run script'),
(@THELZAN,0,1,0,54,0,100,0,0,0,0,0,80,@THELZAN*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Just summoned - Run script'),

(@ARTHAS*100,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - reset data 0'),
(@ARTHAS*100,9,1,0,0,0,100,0,0,0,0,0,69,0,0,0,0,0,0,8,0,0,0,4820.175,-581.226,163.6158,0,'Prince Arthas - Script - moveto'),
(@ARTHAS*100,9,2,0,0,0,100,0,8000,8000,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - say 6'),
(@ARTHAS*100,9,3,0,0,0,100,0,6000,6000,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - say 7'),
(@ARTHAS*100,9,4,0,0,0,100,0,6000,6000,0,0,11,49824,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Spellcast Arthas Calls to Spirits'),
(@ARTHAS*100,9,5,0,0,0,100,0,10000,10000,0,0,69,0,0,0,0,0,0,8,0,0,0,4819.658,-582.5223,163.752,0,'Prince Arthas - Script - moveto'),
(@ARTHAS*100,9,6,0,0,0,100,0,0,0,0,0,71,0,7,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Change weapon'),
(@ARTHAS*100,9,7,0,0,0,100,0,1000,1000,0,0,5,397,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Emote OneShotPointNoSheathe'),
(@ARTHAS*100,9,8,0,0,0,100,0,0,0,0,0,71,0,7,33350,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Change weapon'),
(@ARTHAS*100,9,9,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,@ALTAR,5,0,0,0,0,0,'Prince Arthas - Script - Activate Altar'),
(@ARTHAS*100,9,10,0,0,0,100,0,4000,4000,0,0,69,0,0,0,0,0,0,8,0,0,0,4814.56,-577.2604,162.2522,0,'Prince Arthas - Script - moveto'),
(@ARTHAS*100,9,11,0,0,0,100,0,3500,3500,0,0,5,15,0,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Emote OneShotRoar'),
(@ARTHAS*100,9,12,0,0,0,100,0,4000,4000,0,0,53,1,@ARTHAS,0,0,0,0,1,0,0,0,0,0,0,0,'Prince Arthas - Script - Start WP movement'),

(@MURADIN*100,9,0,0,0,0,100,0,0,0,0,0,45,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - reset data 0'),
(@MURADIN*100,9,1,0,0,0,100,0,500,500,0,0,69,0,0,0,0,0,0,8,0,0,0,4818.622,-582.4843,163.5883,0,'Muradin - Script - moveto'),
(@MURADIN*100,9,2,0,0,0,100,0,2000,2000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.305801,'Muradin - Script - turnto'),
(@MURADIN*100,9,3,0,0,0,100,0,1000,1000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 2'),
(@MURADIN*100,9,4,0,0,0,100,0,500,500,0,0,90,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - kneel'),
(@MURADIN*100,9,5,0,0,0,100,0,15000,15000,0,0,91,8,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - stand'),
(@MURADIN*100,9,6,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - turnto Prince Arthas'),
(@MURADIN*100,9,7,0,0,0,100,0,2000,2000,0,0,5,274,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Emote no'),
(@MURADIN*100,9,8,0,0,0,100,0,2500,2500,0,0,5,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Emote Exclamation'),
(@MURADIN*100,9,9,0,0,0,100,0,7000,7000,0,0,69,0,0,0,0,0,0,8,0,0,0,4817.42,-581.4944,163.2614,0,'Muradin - Script - moveto'),
(@MURADIN*100,9,10,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - turnto Prince Arthas'),
(@MURADIN*100,9,11,0,0,0,100,0,1500,1500,0,0,1,5,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - Prince Arthas say 5'),
(@MURADIN*100,9,12,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 3'),
(@MURADIN*100,9,13,0,0,0,100,0,0,0,0,0,45,0,10,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Muradin - Script - set data 0 10 on Prince Arthas'),
(@MURADIN*100,9,14,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,5.323254,'Muradin - Script - turnto'),

(@MURADIN*100+1,9,0,0,0,0,100,0,0,0,0,0,40,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Set sheath'),
(@MURADIN*100+1,9,1,0,0,0,100,0,0,0,0,0,18,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Set unit_flag2'),
(@MURADIN*100+1,9,2,0,0,0,100,0,13000,13000,0,0,19,1,1,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Remove unit_flag2'),
(@MURADIN*100+1,9,3,0,0,0,100,0,500,500,0,0,17,64,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - emotestate stun'),
(@MURADIN*100+1,9,4,0,0,0,100,0,5000,5000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 4'),
(@MURADIN*100+1,9,5,0,0,0,100,0,3000,3000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - say 5'),
(@MURADIN*100+1,9,6,0,0,0,100,0,4000,4000,0,0,17,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - emotestate none'),
(@MURADIN*100+1,9,7,0,0,0,100,0,1000,1000,0,0,11,49829,3,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Spellcast Frostmourne Cavern Quest Credit'),
(@MURADIN*100+1,9,8,0,0,0,100,0,0,0,0,0,53,1,@MURADIN,0,0,0,0,1,0,0,0,0,0,0,0,'Muradin - Script - Start WP movement'),

(@THELZAN*100,9,0,0,0,0,100,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Say 0'),
(@THELZAN*100,9,1,0,0,0,100,0,0,0,0,0,11,33271,0,0,0,0,0,1,0,0,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Spellcast Internal Shake Camera w/ rumble sound'),
(@THELZAN*100,9,2,0,0,0,100,0,7000,7000,0,0,12,@MURADIN,3,116000,0,0,0,8,0,0,0,4817.494,-579.6047,163.0956,5.102134,'Thel''zan Spell Dummy - Script - Summon Muradin'),
(@THELZAN*100,9,3,0,0,0,100,0,0,0,0,0,12,@ARTHAS,3,102000,0,0,0,8,0,0,0,4821.529,-579.8818,163.5944,4.167512,'Thel''zan Spell Dummy - Script - Summon Prince Arthas'),
(@THELZAN*100,9,4,0,0,0,100,0,0,0,0,0,9,0,0,0,0,0,0,20,@ALTAR,5,0,0,0,0,0,'Thel''zan Spell Dummy - Script - set data 0 10 on Frostmourne Altar'),
(@THELZAN*100,9,5,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Prince Arthas Say 4'),
(@THELZAN*100,9,6,0,0,0,100,0,3000,3000,0,0,5,25,0,0,0,0,0,19,@ARTHAS,10,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Prince Arthas Emote Point'),
(@THELZAN*100,9,7,0,0,0,100,0,3500,3500,0,0,45,0,10,0,0,0,0,19,@MURADIN,10,0,0,0,0,0,'Thel''zan Spell Dummy - Script - Set data 0 10 on Muradin');

DELETE FROM `waypoints` WHERE `entry` IN (@ARTHAS,@MURADIN);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ARTHAS,1,4793.066,-571.0735,160.8400, 'Prince Arthas'),
(@ARTHAS,2,4772.816,-566.8235,162.2605, 'Prince Arthas'),
(@ARTHAS,3,4759.816,-568.5735,164.2808, 'Prince Arthas'),
(@ARTHAS,4,4743.573,-564.3865,166.2362, 'Prince Arthas'),
(@MURADIN,1,4797.722,-576.3405,160.1779, 'Muradin'),
(@MURADIN,2,4770.222,-575.5905,162.9453, 'Muradin'),
(@MURADIN,3,4757.972,-575.0905,164.5265, 'Muradin'),
(@MURADIN,4,4753.972,-572.8405,165.1388, 'Muradin'),
(@MURADIN,5,4749.972,-569.5905,165.7607, 'Muradin'),
(@MURADIN,6,4748.024,-566.1866,165.7932, 'Muradin');

DELETE FROM `creature_text` WHERE `entry` IN (@ARTHAS,@MURADIN,@THELZAN);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@ARTHAS,0,0, 'Captain, why are the guards not at their posts?',12,0,100,6,0,12725, 'Prince Arthas'),
(@ARTHAS,1,0, 'Uther had my troops recalled? Damn it! If my warriors abandon me, I''ll never defeat Mal''Ganis. The ships must be burned before the men reach the shore!',12,0,100,5,0,12726, 'Prince Arthas'),
(@ARTHAS,2,0, 'Burned down to their frames! No one goes home until our job here is done!',12,0,100,15,0,12727, 'Prince Arthas'),
(@ARTHAS,3,0, 'Spare me, Muradin. You weren''t there to see what Mal''Ganis did to my homeland.',12,0,100,1,0,12728, 'Prince Arthas'),
(@ARTHAS,4,0, 'Behold, Muradin, our salvation, Frostmourne.',12,0,100,1,0,12729, 'Prince Arthas'),
(@ARTHAS,5,0, 'I would gladly bear any curse to save my homeland.',12,0,100,1,0,12730, 'Prince Arthas'),
(@ARTHAS,6,0, 'Damn the men! Nothing shall prevent me from having my revenge, old friend. Not even you.',12,0,100,5,0,12731, 'Prince Arthas'),
(@ARTHAS,7,0, 'Now, I call out to the spirits of this place. I will give anything or pay any price, if only you will help me save my people.',12,0,100,396,0,12732, 'Prince Arthas'),
(@MURADIN,0,0, 'Isn''t that a bit much, lad?',12,0,100,6,0,12733, 'Muradin'),
(@MURADIN,1,0, 'You lied to your men and betrayed the mercenaries who fought for you. What''s happening to you, Arthas? Is vengeance all that''s important to you?',12,0,100,1,0,12734, 'Muradin'),
(@MURADIN,2,0, 'Hold, lad. There''s an inscription on the dais. It''s a warning. It says, "Whomsoever takes up this blade shall wield power eternal. Just as the blade rends flesh, so must power scar the spirit." Oh, I should''ve known. The blade is cursed! Let''s get the hell out of here!',12,0,100,0,0,12735, 'Muradin'),
(@MURADIN,3,0, 'Leave it be, Arthas. Forget this business and lead your men home.',12,0,100,396,0,12736, 'Muradin'),
(@MURADIN,4,0, 'O'' my head... Wh... Where am I?',12,0,100,0,0,0, 'Muradin'),
(@MURADIN,5,0, 'Who... Who am I?',12,0,100,0,0,0, 'Muradin'),
(@THELZAN,0,0, 'The walls of Frostmourne Cavern shudder and shake.',41,0,100,0,0,0, 'Thel''zan Spell Dummy');
-- remove extra Highperch Soarer spawn
DELETE FROM `creature` WHERE `guid`=21707;
DELETE FROM `creature_addon` WHERE `guid`=21707;

-- Proper Pathing for Entry 6139 Highperch Soarer
SET @NPC := 21708;
SET @PATH := @NPC * 10;
UPDATE `creature` SET `spawndist`=0,`MovementType`=2,`position_x`=-5155.495,`position_y`=-1195.804,`position_z`=73.70869 WHERE `guid`=@NPC;
DELETE FROM `creature_addon` WHERE `guid`=@NPC;
INSERT INTO `creature_addon` (`guid`,`path_id`,`bytes2`,`mount`,`auras`) VALUES (@NPC,@PATH,4097,0, '');
DELETE FROM `waypoint_data` WHERE `id`=@PATH;
INSERT INTO `waypoint_data` (`id`,`point`,`position_x`,`position_y`,`position_z`,`delay`,`move_flag`,`action`,`action_chance`,`wpguid`) VALUES
(@PATH,1,-5155.495,-1195.804,73.70869,0,0,0,100,0),
(@PATH,2,-5155.09,-1194.89,73.70869,0,0,0,100,0),
(@PATH,3,-5155.986,-1199.748,81.49023,0,0,0,100,0),
(@PATH,4,-5166.314,-1220.043,81.76808,0,0,0,100,0),
(@PATH,5,-5170.551,-1226.347,76.71234,0,0,0,100,0),
(@PATH,6,-5178.024,-1237.037,72.43468,0,0,0,100,0),
(@PATH,7,-5190.296,-1239.181,71.90687,0,0,0,100,0),
(@PATH,8,-5215.796,-1225.133,69.76797,0,0,0,100,0),
(@PATH,9,-5221.52,-1209.387,67.79574,0,0,0,100,0),
(@PATH,10,-5219.366,-1194.92,67.15694,0,0,0,100,0),
(@PATH,11,-5209.852,-1187.224,65.96239,0,0,0,100,0),
(@PATH,12,-5194.886,-1188.915,70.71236,0,0,0,100,0),
(@PATH,13,-5181.055,-1199.332,60.29574,0,0,0,100,0),
(@PATH,14,-5158.846,-1213.597,57.6291,0,0,0,100,0),
(@PATH,15,-5122.129,-1222.279,42.46242,0,0,0,100,0),
(@PATH,16,-5110.988,-1230.767,15.32349,0,0,0,100,0),
(@PATH,17,-5084.673,-1227.625,-11.81538,0,0,0,100,0),
(@PATH,18,-5065.282,-1209.691,-34.89864,0,0,0,100,0),
(@PATH,19,-5052.477,-1181.261,-39.42649,0,0,0,100,0),
(@PATH,20,-5025.058,-1165.288,-32.56528,0,0,0,100,0),
(@PATH,21,-5004.282,-1140.431,-38.3154,0,0,0,100,0),
(@PATH,22,-4984.813,-1123.683,-38.17639,0,0,0,100,0),
(@PATH,23,-4971.478,-1109.776,-38.17639,0,0,0,100,0),
(@PATH,24,-4949.74,-1096.296,-32.42633,0,0,0,100,0),
(@PATH,25,-4927.954,-1090.275,-24.84298,0,0,0,100,0),
(@PATH,26,-4909.837,-1080.728,-14.0652,0,0,0,100,0),
(@PATH,27,-4914.713,-1066.641,-7.898551,0,0,0,100,0),
(@PATH,28,-4927.922,-1056.954,-3.352009,0,0,0,100,0),
(@PATH,29,-4942.696,-1055.217,8.220422,0,0,0,100,0),
(@PATH,30,-4951.954,-1049.145,14.62554,0,0,0,100,0),
(@PATH,31,-4960.176,-1028.92,20.03323,0,0,0,100,0),
(@PATH,32,-4970.474,-1008.432,22.08879,0,0,0,100,0),
(@PATH,33,-4980.969,-992.9671,23.42848,0,0,0,100,0),
(@PATH,34,-4993.734,-980.054,23.75917,0,0,0,100,0),
(@PATH,35,-5012.753,-967.9377,24.0925,0,0,0,100,0),
(@PATH,36,-5032.862,-971.138,30.92584,0,0,0,100,0),
(@PATH,37,-5052.127,-982.1085,39.0092,0,0,0,100,0),
(@PATH,38,-5060.675,-991.1913,52.28708,0,0,0,100,0),
(@PATH,39,-5072.277,-1008.99,67.84268,0,0,0,100,0),
(@PATH,40,-5090.256,-1005.558,79.18673,0,0,0,100,0),
(@PATH,41,-5106.005,-1004.311,73.88409,0,0,0,100,0),
(@PATH,42,-5132.349,-1102.871,74.67264,0,0,0,100,0),
(@PATH,43,-5200.281,-1166.383,88.48215,0,0,0,100,0);
SET @SPELL := 31696;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`= 13 AND `SourceEntry`=@SPELL;
SET @GOSSIP             := 8301;
SET @EVENT              := 13888;
SET @BLOOD_MOUNT        := 19085;
SET @BORAK              := 21293;
SET @ICARIUS            := 21409;
SET @ZARATH             := 21410;
SET @GOBJECT            := 184798;

DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=10356;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(@GOSSIP,10356);

DELETE FROM `gossip_menu_option` WHERE `menu_id`=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`,`id`,`option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`) VALUES
(@GOSSIP,0,0,'Borak, I need another bundle of bloodthistle.',1,1,0,0,0,0,'');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES 
(15,@GOSSIP,0,0,0,9,0,10570,0,0,0,0,0,'','Show gossip menu option if player has quest To Catch a Thistlehead'),
(15,@GOSSIP,0,0,0,2,0,30616,1,0,1,0,0,'','Show gossip menu option if player doesn''t have item Bundle of Bloodthistle');

DELETE FROM `creature_text` WHERE entry IN (@ZARATH,@ICARIUS,@BORAK);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@BORAK,0,0,'Hide! Hide before they see you! Back up!',15,0,100,0,0,0,'Borak'),
(@BORAK,1,0,'The time to strike is at hand. Terminate Icarius.',15,0,100,0,0,0,'Borak'),
(@BORAK,2,0,'You have it. Do not lose it again!',12,0,100,5,0,0,'Borak'),
(@ZARATH,0,0,'What is it, my lord?',12,0,100,6,0,0,'Zarath'),
(@ZARATH,1,0,'My lord, surely you do not expect me to leave you unattended. Lord Illidan would have my head if anything were to happen to you.',12,0,100,1,0,0,'Zarath'),
(@ZARATH,2,0,'As you wish, my lord.',12,0,100,66,0,0,'Zarath'),
(@ICARIUS,0,0,'Halt!',12,0,100,1,0,0,'Icarius'),
(@ICARIUS,1,0,'Zarath you must return to the Black Temple at once! I... I seem to have misplaced Lord Illidan''s orders. Quickly!',12,0,100,5,0,0,'Icarius'),
(@ICARIUS,2,0,'Zarath, I am perfectly capable of making it up this road to Eclipse Point. If we do not deliver the missive, Lord Illidan will have both of our heads! You are dismissed!',12,0,100,1,0,0,'Icarius'),
(@ICARIUS,3,0,'Ah, sweet, sweet bloodthistle... Probably left behind by one of those filthy addicts at Eclipse Point.',12,0,100,1,0,0,'Icarius'),
(@ICARIUS,4,0,'Their loss is most definitely my gain...',12,0,100,275,0,0,'Icarius'),
(@ICARIUS,5,0,'Envoy Icarius puts the bundle of bloodthistle in his robe.',16,0,100,0,0,0,'Icarius'),
(@ICARIUS,6,0,'Ah, damn it all! Clever trap. Too bad you''ll never live to tell the tale...',12,0,100,1,0,0,'Icarius');

DELETE FROM `creature_template_addon` WHERE entry = @ZARATH;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes2`) VALUES 
(@ZARATH,@BLOOD_MOUNT,0);

UPDATE `gameobject` SET `position_x`=-4057.190, `position_y`=1527.482, `position_z`=93.0938 WHERE `guid`=99970;

UPDATE `creature_template` SET `gossip_menu_id`=8301 WHERE `entry`=@BORAK;
UPDATE `creature_template` SET `faction_A`=1701, `faction_H`=1701, `speed_walk`=1.14286 WHERE `entry` IN (@ZARATH,@ICARIUS);

UPDATE `creature_template` SET AIName='SmartAI' WHERE entry IN (@ZARATH,@ICARIUS,@BORAK);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry`=@GOBJECT;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid` IN (@ZARATH,@ICARIUS,@BORAK);
DELETE FROM `smart_scripts` WHERE `source_type`=1 AND `entryorguid`=@GOBJECT;
DELETE FROM `smart_scripts` WHERE `source_type`=9 AND `entryorguid` IN (@ICARIUS*100,@ZARATH*100);
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@BORAK,0,0,0,38,0,100,0,1,1,0,0,1,0,0,0,0,0,0,17,50,100,0,0,0,0,0,'Borak - On Data Set - Say 0'),
(@BORAK,0,1,0,38,0,100,0,2,2,0,0,1,1,0,0,0,0,0,17,50,100,0,0,0,0,0,'Borak - On Data Set - Say 1'),
(@BORAK,0,2,3,62,0,100,0,@GOSSIP,0,0,0,56,30616,35,0,0,0,0,7,0,0,0,0,0,0,0,'Borak - On gossip select - Add Item to Player'),
(@BORAK,0,3,4,61,0,100,0,0,0,0,0,72,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'Borak - On gossip select - Close Gossip'),
(@BORAK,0,4,0,61,0,100,0,0,0,0,0,1,2,0,0,0,0,0,17,50,100,0,0,0,0,0,'Borak - On gossip select - Say 2'),

(@ZARATH,0,0,1,54,0,100,0,0,0,0,0,53,0,@ZARATH,0,10570,0,0,1,0,0,0,0,0,0,0,'Zarath - Just Summoned - Start Wp'),
(@ZARATH,0,1,2,61,0,100,1,0,0,0,0,45,1,1,0,0,0,0,11,@BORAK,500,0,0,0,0,0,'Zarath - On Link - Set Data to Borak'),
(@ZARATH,0,2,0,61,0,100,1,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zarath - On Link - Set react state aggressive'),
(@ZARATH,0,3,0,38,0,100,0,0,1,0,0,66,0,0,0,0,0,0,19,@ICARIUS,10,0,0,0,0,0,'Zarath - On Data Set - Turn to'),
(@ZARATH,0,4,5,38,0,100,0,1,1,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.716,'Zarath - On Data Set - Set Orientation'),
(@ZARATH,0,5,0,61,0,100,0,0,0,0,0,80,@ZARATH*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Zarath - On Link - Timed Script'),
(@ZARATH,0,6,0,40,0,100,0,1,@ZARATH,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zarath - WP Reached - Set Home Pos'),

(@ICARIUS,0,0,1,54,0,100,0,0,0,0,0,53,0,@ICARIUS,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Just Summoned - Start Wp'),
(@ICARIUS,0,1,0,61,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Just Summoned - Set react state aggressive'),
(@ICARIUS,0,2,0,40,0,100,0,1,@ICARIUS,0,0,80,@ICARIUS*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - WP reached - Call Action Script'),
(@ICARIUS,0,3,0,4,1,100,1,0,0,0,0,1,6,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - On aggro (phase 1) - Say text 6'),

(@GOBJECT,1,0,0,38,0,100,0,3,3,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Bundle of Bloodthistle - On data 3 3 set - Set phase 2'),

(@ZARATH*100,9,0,0,0,0,100,0,1500,1500,0,0,46,100,0,0,0,0,0,1,0,0,0,0,0,0,0,'Zarath - Move forward'),

(@ICARIUS*100,9,0,0,0,0,100,0,1000,1000,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Say Text 0'),
(@ICARIUS*100,9,1,0,0,0,100,0,2000,2000,0,0,1,0,0,0,0,0,0,19,@ZARATH,10,0,0,0,0,0,'Zarath - Say Text 0 Zarath'),
(@ICARIUS*100,9,2,0,0,0,100,0,6500,6500,0,0,66,0,0,0,0,0,0,19,@ZARATH,10,0,0,0,0,0,'Icarius - Turn to'),
(@ICARIUS*100,9,3,0,0,0,100,0,500,500,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Say Text 1'),
(@ICARIUS*100,9,4,0,0,0,100,0,1000,1000,0,0,45,0,1,0,0,0,0,19,@ZARATH,10,0,0,0,0,0,'Zarath - Set data 0 1'),
(@ICARIUS*100,9,5,0,0,0,100,0,5000,5000,0,0,1,1,0,0,0,0,0,19,@ZARATH,10,0,0,0,0,0,'Zarath - Say Text 1 Zarath'),
(@ICARIUS*100,9,6,0,0,0,100,0,7000,7000,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Say Text 2'),
(@ICARIUS*100,9,7,0,0,0,100,0,6000,6000,0,0,1,2,0,0,0,0,0,19,@ZARATH,10,0,0,0,0,0,'Zarath - Say Text 2 Zarath'),
(@ICARIUS*100,9,8,0,0,0,100,0,3000,3000,0,0,45,1,1,0,0,0,0,19,@ZARATH,10,0,0,0,0,0,'Zarath - Set Data 1 1'),
(@ICARIUS*100,9,9,0,0,0,100,0,1000,1000,0,0,66,0,0,0,0,0,0,20,@GOBJECT,50,0,0,0,0,0,'Icarius - Turn to'),
(@ICARIUS*100,9,10,0,0,0,100,0,4000,4000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Say Text 3'),
(@ICARIUS*100,9,11,0,0,0,100,0,6000,6000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Say Text 4'),
(@ICARIUS*100,9,12,0,0,0,100,0,4000,4000,0,0,69,0,0,0,0,0,0,20,@GOBJECT,50,0,0,0,0,0,'Icarius - Go to GO PoS'),
(@ICARIUS*100,9,13,0,0,0,100,0,5000,5000,0,0,5,16,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Emote Kneel'),
(@ICARIUS*100,9,14,0,0,0,100,0,3000,3000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Say Text 5'),
(@ICARIUS*100,9,15,0,0,0,100,0,0,0,0,0,45,3,3,0,0,0,0,20,@GOBJECT,5,0,0,0,0,0,'Icarius - Set Data Gameobject'),
(@ICARIUS*100,9,16,0,0,0,100,1,3000,3000,0,0,45,2,2,0,0,0,0,11,@BORAK,100,0,0,0,0,0,'Icarius - Set Data 2 2'),
(@ICARIUS*100,9,17,0,0,0,100,0,0,0,0,0,22,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Icarius - Set event phase 1');

DELETE FROM `event_scripts` WHERE `id`=@EVENT;
INSERT INTO `event_scripts` (`id`,`delay`,`command`,`datalong`,`datalong2`,`dataint`,`x`,`y`,`z`,`o`) VALUES
(@EVENT,0,10,@ZARATH,80000,0,-4055.979,1478.097,87.927,1.501698),
(@EVENT,0,10,@ICARIUS,120000,0,-4052.285,1478.886,87.8424,1.604585);

DELETE FROM `waypoints` WHERE `entry` IN (@ZARATH,@ICARIUS);
INSERT INTO `waypoints` (`entry`,`pointid`,`position_x`,`position_y`,`position_z`,`point_comment`) VALUES
(@ZARATH,1,-4058.758,1515.231,91.292,'Zarath'),
(@ICARIUS,1,-4054.427,1515.515,91.511,'Icarius');
-- DB/Misc: Fix: Prevent chat/spell flood, Prevent summon spells from overwriting.

-- Prevent chat/spell flood
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=2358 AND `source_type`=0 AND `id`=9 AND `link`=10;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=2358 AND `source_type`=0 AND `id`=10 AND `link`=0;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=2358 AND `source_type`=0 AND `id`=11 AND `link`=12;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=2358 AND `source_type`=0 AND `id`=12 AND `link`=0;

-- Prevent chat flood / ..run away in fear! / Manually checked one by one! (64 NPC's)
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (429,453,548,1166,1867,1920,2369,4063,5839,7075,11319,11324,15281,15401,15417,15938,15945,15970,15971,16204) AND `source_type` = 0 AND `id` = 12 AND `link` = 13;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (429,453,548,1166,1867,1920,2369,4063,5839,7075,11319,11324,15281,15401,15417,15938,15945,15970,15971,16204) AND `source_type` = 0 AND `id` = 13 AND `link` = 0;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (1065,1173,1397,1914,1915,2120,2371,2376,6008,8550,9449,16249,16318,16337) AND `source_type` = 0 AND `id` = 13 AND `link` = 14;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (1065,1124,1173,1397,1914,1915,2120,2245,2371,2376,6008,8550,9449,16249,16318,16337) AND `source_type` = 0 AND `id` = 14 AND `link` = 0;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (1889,2375,2387,8566,9450,16317,16344,25073) AND `source_type` = 0 AND `id` = 14 AND `link` = 15;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (1124,1889,2375,2387,8566,9450,16317,16344,25073) AND `source_type` = 0 AND `id` = 15 AND `link` = 0;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (1123,1162,2245,2554,9451,16403) AND `source_type` = 0 AND `id` = 15 AND `link` = 16;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (1009,1013,1123,1162,2554,7246,9451,16403) AND `source_type` = 0 AND `id` = 16 AND `link` = 0;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (2276,2428,4064,4463,10824,12322) AND `source_type` = 0 AND `id` = 16 AND `link` = 17;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (2276,2428,4064,4463,10824,12322) AND `source_type` = 0 AND `id` = 17 AND `link` = 0;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (436,4462,17694) AND `source_type` = 0 AND `id` = 17 AND `link` = 18;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` IN (436,4462,17694) AND `source_type` = 0 AND `id` = 18 AND `link` = 0;
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` = 8564 AND `source_type` = 0 AND `id` = 18 AND `link` = 19; -- Ranger - Allow Combat Movement
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` = 8564 AND `source_type` = 0 AND `id` = 19 AND `link` = 0; -- Ranger - Flee For Assist
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` = 24683 AND `source_type` = 0 AND `id` = 19 AND `link` = 20; -- Sunblade Mage Guard - Allow Combat Movement
UPDATE `smart_scripts` SET `event_flags` = 1 WHERE `entryorguid` = 24683 AND `source_type` = 0 AND `id` = 20 AND `link` = 0; -- Sunblade Mage Guard - Flee For Assist

-- Prevent summon spells from overwriting each other's cast time, earlier script had wrong timers..
UPDATE `smart_scripts` SET `link`=15 WHERE  `entryorguid`=1124 AND `source_type`=0 AND `id`=14 AND `link`=01;
UPDATE `smart_scripts` SET `event_type`=61, `event_flags`=1 WHERE  `entryorguid`=1124 AND `source_type`=0 AND `id`=15 AND `link`=0;
UPDATE `smart_scripts` SET `event_param1`=9100, `event_param2`=14900 WHERE  `entryorguid`=2358 AND `source_type`=0 AND `id`=9 AND `link`=10;
UPDATE `smart_scripts` SET `event_param1`=4700, `event_param2`=11100 WHERE  `entryorguid`=2358 AND `source_type`=0 AND `id`=11 AND `link`=12;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid` IN (429,453) AND `source_type`=0 AND `id`=12 AND `link`=13;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid` IN (1009,1065,1397) AND `source_type`=0 AND `id`=13 AND `link`=14;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid` IN (1009,1013,1123,2245,2554) AND `source_type`=0 AND `id`=15 AND `link`=16;
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid` = 1009 AND `source_type`=0 AND `id`=14 AND `link`=15;
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (24021,3094,23905,27376,27378,27379,27381);
DELETE FROM `smart_scripts` WHERE `entryorguid`=26917;
DELETE FROM `skill_fishing_base_level` WHERE `entry`=4813;
INSERT INTO `skill_fishing_base_level`(`entry`,`skill`) VALUE
(4813,450);

DELETE FROM `fishing_loot_template` WHERE `entry`=4813;
INSERT INTO `fishing_loot_template`(`entry`,`item`,`ChanceOrQuestChance`,`groupid`) VALUES
(4813,41808,58,1),
(4813,43572,20.5,1),
(4813,36794,5.4,1),
(4813,4875,5,1),
(4813,3671,4.5,1),
(4813,25447,4.5,1),
(4813,44475,1.1,1),
(4813,37705,1,1);
DELETE FROM `disables` WHERE `sourceType`=4 AND `entry` IN (10082,10083,10084,10085,10086,10087);

DELETE FROM `achievement_criteria_data` WHERE `criteria_id` IN (10082,10083,10084,10085,10086,10087);
INSERT INTO `achievement_criteria_data` (`criteria_id`, `type`, `value1`, `value2`, `ScriptName`) VALUES
(10082, 11, 0, 0, 'achievement_assembly_i_choose_you'),
(10082, 12, 0, 0, ''),
(10083, 11, 0, 0, 'achievement_assembly_i_choose_you'),
(10083, 12, 0, 0, ''),
(10084, 11, 0, 0, 'achievement_assembly_i_choose_you'),
(10084, 12, 0, 0, ''),
(10085, 11, 0, 0, 'achievement_assembly_i_choose_you'),
(10085, 12, 1, 0, ''),
(10086, 11, 0, 0, 'achievement_assembly_i_choose_you'),
(10086, 12, 1, 0, ''),
(10087, 11, 0, 0, 'achievement_assembly_i_choose_you'),
(10087, 12, 1, 0, '');
-- Add option conditions for mage trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (63,64,4484,4485,4486,4517,4518,4519,4520,4537,4538,4539,4552,4651,4654,4660,4661,4685,4686,6648,7264,9990,9580,7366,4535);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,63,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,63,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,63,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,64,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,64,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,64,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4484,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4484,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4484,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4485,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4485,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4485,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4486,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4486,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4486,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4517,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4517,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4517,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4518,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4518,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4518,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4519,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4519,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4519,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4520,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4520,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4520,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4537,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4537,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4537,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4538,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4538,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4538,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4539,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4539,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4539,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4552,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4552,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4552,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4651,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4651,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4651,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4654,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4654,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4654,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4660,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4660,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4660,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4661,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4661,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4661,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4685,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4685,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4685,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4686,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4686,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4686,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,6648,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,6648,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,6648,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,7264,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,7264,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,7264,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,9990,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,9990,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,9990,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,9580,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,9580,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,9580,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,7366,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,7366,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,7366,2,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4535,0,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4535,1,0,15,128,0,0,0,'','Show gossip option if player is a mage'),
(15,4535,2,0,15,128,0,0,0,'','Show gossip option if player is a mage');
-- Add option conditions for Warlock trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (1503,1522,2381,2383,2384,4503,4504,4505,4566,4567,4603,4604,4609,4610,4641,4643,4655,4656,4667,4681,4682,6628,7437,7566,4642);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,1503,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,1503,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,1503,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,1522,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,1522,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,1522,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2381,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2381,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2381,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2383,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2383,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2383,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2384,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2384,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,2384,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4503,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4503,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4503,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4504,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4504,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4504,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4505,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4505,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4505,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4566,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4566,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4566,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4567,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4567,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4567,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4603,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4603,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4603,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4604,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4604,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4604,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4609,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4609,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4609,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4610,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4610,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4610,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4641,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4641,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4641,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4643,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4643,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4643,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4655,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4655,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4655,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4656,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4656,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4656,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4667,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4667,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4667,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4681,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4681,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4681,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4682,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4682,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4682,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,6628,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,6628,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,6628,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,7437,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,7437,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,7437,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,7566,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,7566,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,7566,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4642,0,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4642,1,0,15,256,0,0,0,'','Show gossip option if player is a Warlock'),
(15,4642,2,0,15,256,0,0,0,'','Show gossip option if player is a Warlock');
-- Add option conditions for Paladin trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (2304,4556,4557,4469,4470,4471,4662,4463,4464,4677,4678,7260,8111);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,2304,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,2304,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,2304,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4556,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4556,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4556,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4557,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4557,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4557,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4469,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4469,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4469,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4470,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4470,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4470,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4471,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4471,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4471,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4662,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4662,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4662,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4463,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4463,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4463,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4464,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4464,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4464,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4677,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4677,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4677,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4678,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4678,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4678,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,7260,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,7260,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,7260,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,8111,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,8111,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,8111,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin');
-- Add option conditions for Warrior trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (523,655,656,4091,4475,4481,4482,4509,4511,4525,4526,4527,4546,4547,4548,4568,4569,4570,4578,4579,4581,4645,4649,4650,4653,4683,4684,4696,4697,7263);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,523,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,523,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,523,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,655,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,655,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,655,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,656,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,656,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,656,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4091,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4091,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4091,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4475,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4475,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4475,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4481,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4481,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4481,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4482,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4482,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4482,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4509,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4509,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4509,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4511,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4511,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4511,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4525,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4525,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4525,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4526,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4526,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4526,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4527,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4527,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4527,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4546,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4546,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4546,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4547,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4547,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4547,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4548,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4548,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4548,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4568,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4568,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4568,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4569,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4569,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4569,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4570,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4570,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4570,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4578,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4578,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4578,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4579,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4579,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4579,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4581,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4581,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4581,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4645,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4645,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4645,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4649,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4649,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4649,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4650,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4650,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4650,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4653,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4653,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4653,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4683,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4683,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4683,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4684,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4684,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4684,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4696,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4696,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4696,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4697,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4697,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,4697,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,7263,0,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,7263,1,0,15,1,0,0,0,'','Show gossip option if player is a Warrior'),
(15,7263,2,0,15,1,0,0,0,'','Show gossip option if player is a Warrior');
-- Add option conditions for Druid trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (1403,3921,3924,3925,3926,4507,4508,4571,4605,4606,4607,4687,4688,7567,4646);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,1403,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,1403,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,1403,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,1403,3,0,8,0,3781,0,0,'','Mathrengyl Bearwalker - Show gossip option if player has rewarded quest 3781'),
(15,3921,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3921,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3921,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3924,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3924,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3924,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3925,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3925,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3925,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3926,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3926,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,3926,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4507,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4507,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4507,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4508,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4508,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4508,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4571,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4571,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4571,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4605,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4605,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4605,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4606,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4606,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4606,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4607,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4607,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4607,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4687,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4687,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4687,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4688,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4688,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4688,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,7567,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,7567,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,7567,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4646,0,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4646,1,0,15,1024,0,0,0,'','Show gossip option if player is a Druid'),
(15,4646,2,0,15,1024,0,0,0,'','Show gossip option if player is a Druid');
-- Add option conditions for Druid trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (1403) AND `SourceEntry` IN (3);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,1403,3,0,8,0,3781,0,0,'','Mathrengyl Bearwalker - Show gossip option if player has rewarded quest 3781');
-- Add option conditions for Hunter trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (4008,4009,4010,4011,4012,4017,4023,4101,4472,4473,4474,4506,4524,4549,4550,4551,4647,4648,4657,4675,4693,4695,6652,7262,7368);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,4008,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4008,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4008,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4009,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4009,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4009,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4010,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4010,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4010,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4011,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4011,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4011,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4012,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4012,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4012,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4017,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4017,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4017,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4023,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4023,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4023,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4101,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4101,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4101,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4472,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4472,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4472,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4473,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4473,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4473,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4474,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4474,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4474,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4506,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4506,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4506,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4524,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4524,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4524,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4549,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4549,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4549,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4550,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4550,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4550,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4551,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4551,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4551,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4647,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4647,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4647,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4648,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4648,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4648,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4657,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4657,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4657,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4675,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4675,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4675,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4693,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4693,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4693,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4695,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4695,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,4695,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,6652,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,6652,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,6652,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,7262,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,7262,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,7262,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,7368,0,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,7368,1,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,7368,2,0,15,4,0,0,0,'','Show gossip option if player is a Hunter'),
(15,7368,3,0,9,0,9454,0,0,'','Acteon - Show gossip option if player has quest 9454'),
(15,7368,4,0,9,0,10324,0,0,'','Acteon - Show gossip option if player has quest 10324');
-- Add option conditions for Rogue trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (85,141,381,410,411,436,3984,4502,4512,4513,4540,4541,4542,4561,4562,4575,4576,4577,4658,4659,4676,4690,5061,6650);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,85,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,85,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,85,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,141,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,141,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,141,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,381,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,381,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,381,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,410,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,410,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,410,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,411,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,411,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,411,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,436,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,436,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,436,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,3984,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,3984,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,3984,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4502,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4502,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4502,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4512,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4512,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4512,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4513,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4513,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4513,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4540,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4540,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4540,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4541,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4541,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4541,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4542,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4542,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4542,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4561,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4561,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4561,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4562,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4562,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4562,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4575,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4575,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4575,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4576,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4576,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4576,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4577,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4577,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4577,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4658,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4658,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4658,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4659,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4659,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4659,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4676,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4676,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4676,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4690,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4690,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4690,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,5061,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,5061,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,5061,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,6650,0,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,6650,1,0,15,8,0,0,0,'','Show gossip option if player is a Rogue'),
(15,6650,2,0,15,8,0,0,0,'','Show gossip option if player is a Rogue');
-- Add option conditions for Priest trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (3642,3643,3644,3645,4466,4467,4468,4521,4522,4523,4531,4532,4533,4543,4544,4545,4558,4559,4572,4573,4574,4665,4666,4679,4680,4691,4692,4801,6649,7265,7349,7438);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,3642,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3642,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3642,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3643,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3643,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3643,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3644,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3644,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3644,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3645,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3645,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,3645,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4466,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4466,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4466,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4467,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4467,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4467,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4468,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4468,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4468,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4521,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4521,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4521,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4522,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4522,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4522,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4523,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4523,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4523,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4531,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4531,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4531,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4532,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4532,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4532,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4533,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4533,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4533,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4543,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4543,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4543,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4544,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4544,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4544,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4545,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4545,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4545,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4558,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4558,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4558,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4559,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4559,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4559,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4572,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4572,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4572,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4573,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4573,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4573,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4574,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4574,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4574,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4665,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4665,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4665,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4666,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4666,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4666,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4679,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4679,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4679,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4680,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4680,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4680,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4691,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4691,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4691,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4692,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4692,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4692,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4801,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4801,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,4801,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,6649,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,6649,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,6649,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7265,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7265,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7265,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7349,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7349,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7349,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7438,0,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7438,1,0,15,16,0,0,0,'','Show gossip option if player is a Priest'),
(15,7438,2,0,15,16,0,0,0,'','Show gossip option if player is a Priest');
-- Add option conditions for Shaman trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (4103,4104,4515,4516,4528,4529,4530,4652,5123,7357,7467,7522,8110,7377);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,4103,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4103,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4103,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4104,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4104,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4104,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4515,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4515,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4515,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4516,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4516,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4516,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4528,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4528,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4528,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4529,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4529,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4529,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4530,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4530,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4530,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4652,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4652,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,4652,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,5123,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,5123,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,5123,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7357,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7357,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7357,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7467,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7467,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7467,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,8110,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,8110,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,8110,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7377,0,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7377,1,0,15,64,0,0,0,'','Show gossip option if player is a Shaman'),
(15,7377,2,0,15,64,0,0,0,'','Show gossip option if player is a Shaman');
DELETE FROM `trinity_string` WHERE  `entry`=854 LIMIT 1;
INSERT INTO `trinity_string` (`entry`, `content_default`, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(854, '└ Mails: %d Read/%u Total', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

DELETE FROM `trinity_string` WHERE  `entry`=871 LIMIT 1;
INSERT INTO `trinity_string` (`entry`, `content_default`, content_loc1, content_loc2, content_loc3, content_loc4, content_loc5, content_loc6, content_loc7, content_loc8) VALUES 
(871, '│ Level: %u', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

UPDATE `trinity_string` SET `content_default`='│ Level: %u (%u/%u XP (%u XP left))' WHERE  `entry`=843 LIMIT 1;
-- Gossip Condition for Ultham Ironhorn "Dwarf riding trainer"
SET @GOSSIP  := 4014;
SET @TEXTYES := 4871;
SET @TEXTNO  := 5858;
SET @FACTION := 47;
SET @RACE    := 4;
SET @NOTRACE := 1787;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Dwarf'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Ironforge'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Dwarf'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Ironforge'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Dwarf'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Ironforge');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP WHERE `entry`=4772;

-- Gossip Condition for Velma Warnam "Forsaken riding trainer"
SET @GOSSIP  := 4015;
SET @TEXTYES := 4873;
SET @TEXTNO  := 5859;
SET @FACTION := 68;
SET @RACE    := 16;
SET @NOTRACE := 1775;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Forsaken'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Undercity'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Forsaken'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Undercity'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Forsaken'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Undercity');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');

-- Gossip Condition for Benjy Featherwhistle "Gnomeregan riding trainer"
SET @GOSSIP  := 4016;
SET @TEXTYES := 4878;
SET @TEXTNO  := 5860;
SET @FACTION := 54;
SET @RACE    := 64;
SET @NOTRACE := 1727;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Gnome'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Gnomeregan'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Gnome'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Gnomeregan'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Gnome'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Gnomeregan');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');

-- Gossip Condition for Randel Hunter "Human riding trainer"
SET @GOSSIP  := 4018;
SET @TEXTYES := 4876;
SET @TEXTNO  := 5861;
SET @FACTION := 72;
SET @RACE    := 1;
SET @NOTRACE := 1790;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Human'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Stormwind'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Human'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Stormwind'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Human'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Stormwind');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');

-- Gossip Condition for Jartsam "Night Elf riding trainer"
SET @GOSSIP  := 4019;
SET @TEXTYES := 4877;
SET @TEXTNO  := 5862;
SET @FACTION := 69;
SET @RACE    := 8;
SET @NOTRACE := 1783;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Night Elf'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Darnassus'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Night Elf'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Darnassus'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Night Elf'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Darnassus');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');

-- Gossip Condition for Kildar "Orc riding trainer"
SET @GOSSIP  := 4020;
SET @TEXTYES := 4879;
SET @TEXTNO  := 5863;
SET @FACTION := 76;
SET @RACE    := 2;
SET @NOTRACE := 1789;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is an Orc'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Orgrimmar'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not an Orc'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Orgrimmar'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is an Orc'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Orgrimmar');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');

-- Gossip Condition for Kar Stormsinger "Tauren riding trainer"
SET @GOSSIP  := 4021;
SET @TEXTYES := 4874;
SET @TEXTNO  := 5864;
SET @FACTION := 81;
SET @RACE    := 32;
SET @NOTRACE := 1759;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Tauren'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Thunder Bluff'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Tauren'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Thunder Bluff'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Tauren'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Thunder Bluff');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');

-- Gossip Condition for Xar'Ti  "Troll riding trainer"
SET @GOSSIP  := 4022;
SET @TEXTYES := 4875;
SET @TEXTNO  := 5865;
SET @FACTION := 530;
SET @RACE    := 128;
SET @NOTRACE := 1663;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Troll'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Darkspear Trolls'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Troll'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Darkspear Trolls'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Troll'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Darkspear Trolls');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP WHERE `entry`=7953;

-- Gossip Condition for Perascamin  "Blood Elf riding trainer"
SET @GOSSIP  := 8275;
SET @TEXTYES := 10308;
SET @TEXTNO  := 10310;
SET @FACTION := 911;
SET @RACE    := 512;
SET @NOTRACE := 1279;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Blood Elf'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Silvermoon City'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Blood Elf'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Silvermoon City'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Blood Elf'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Silvermoon City');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP WHERE `entry`=16280;

-- Gossip Condition for Aalun "Draenei riding trainer"
SET @GOSSIP  := 8553;
SET @TEXTYES := 10792;
SET @TEXTNO  := 10705;
SET @FACTION := 930;
SET @RACE    := 1024;
SET @NOTRACE := 767;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,16,@RACE,0,0,0,'','Show gossip text if player is a Draenei'),
(14,@GOSSIP,@TEXTYES,1,5,@FACTION,128,0,0,'','Show gossip text if player is Exalted with Exodar'),
(14,@GOSSIP,@TEXTNO,0,16,@NOTRACE,0,0,0,'','Show gossip text if player is not a Draenei'),
(14,@GOSSIP,@TEXTNO,0,5,@FACTION,127,0,0,'','Show gossip text if player is Not Exalted with Exodar'),
(15,@GOSSIP,0,0,16,@RACE,0,0,0,'','Show gossip option if player is a Draenei'),
(15,@GOSSIP,0,1,5,@FACTION,128,0,0,'','Show gossip option if player is a Exalted with Exodar');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"I seek training to ride a steed.",5,16,0,0,0,0,'');

-- Gossip Condition for Olrokk "Riding trainer"
SET @GOSSIP  := 8628;
SET @TEXT    := 10817;
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXT;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXT);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Train me.",5,16,0,0,0,0,'');
UPDATE `creature_template` SET `gossip_menu_id`=@GOSSIP WHERE `entry`=20500;
-- Add option conditions for Rogue trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceEntry`=4 AND `SourceGroup` IN (85,141,381,410,411,436,3984,4502,4512,4513,4540,4541,4542,4561,4562,4575,4576,4577,4658,4659,4676,4690,5061,6650);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`NegativeCondition`,`ScriptName`,`Comment`) VALUES
(15,85,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,85,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,85,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,85,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,141,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,141,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,141,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,141,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,410,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,410,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,410,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,410,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,411,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,411,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,411,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,411,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,436,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,436,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,436,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,436,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,3984,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,3984,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,3984,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,3984,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4502,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4502,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4502,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4502,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4512,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4512,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4512,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4512,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4513,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4513,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4513,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4513,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4540,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4540,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4540,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4540,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4541,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4541,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4541,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4541,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4542,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4542,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4542,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4542,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4561,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4561,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4561,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4561,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4562,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4562,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4562,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4562,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4575,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4575,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4575,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4575,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4576,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4576,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4576,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4576,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4577,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4577,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4577,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4577,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4658,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4658,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4658,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4658,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4659,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4659,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4659,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4659,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4676,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4676,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4676,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4676,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,4690,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,4690,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,4690,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,4690,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,5061,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,5061,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,5061,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,5061,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681'),
(15,6650,4,0,15,8,0,0,0,0,'','Show gossip option if player is a Rogue'),
(15,6650,4,0,27,24,3,0,0,0,'','Show gossip option if player is level 24 or higher'),
(15,6650,4,0,2,17126,1,0,0,0,'','Show gossip option if player has Elegant Letter'),
(15,6650,4,0,28,6681,0,0,0,1,'','Show gossip option if player has not completed quest 6681');
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (4463,4464,4663,4664);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,4463,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4463,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4463,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4464,0,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4464,1,0,15,2,0,0,0,'','Show gossip option if player is a Paladin'),
(15,4464,2,0,15,2,0,0,0,'','Show gossip option if player is a Paladin');
-- XXXXXXXXXXXXXXXXXXXXX
-- X  Shaman Trainers  X
-- XXXXXXXXXXXXXXXXXXXXX

UPDATE `creature_template` SET `gossip_menu_id`=7357 WHERE `entry`=23127;
UPDATE `creature_template` SET `gossip_menu_id`=7377 WHERE `entry`=17204;
UPDATE `creature_template` SET `gossip_menu_id`=4104 WHERE `entry`=986;

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4103;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4104;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4515;
SET @TEXTYES := 5007;
SET @TEXTNO := 5008;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4516;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4528;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4529;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4530;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 4652;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 5123;
SET @TEXTYES := 5005;
SET @TEXTNO := 5006;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 7357;
SET @TEXTYES := 8786;
SET @TEXTNO := 8785;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 7467;
SET @TEXTYES := 9050;
SET @TEXTNO := 8785;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 7522;
SET @TEXTYES := 9122;
SET @TEXTNO := 8785;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 8110;
SET @TEXTYES := 10043;
SET @TEXTNO := 10040;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,2,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');

-- Gossip Condition for Shaman Trainers
SET @GOSSIP := 7377;
SET @TEXTYES := 8829;
SET @TEXTNO := 8828;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (14,15) AND `SourceGroup`=@GOSSIP;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(14,@GOSSIP,@TEXTYES,0,15,64,0,0,0,'','Show gossip text if player is a Shaman'),
(14,@GOSSIP,@TEXTNO,0,15,1471,0,0,0,'','Show gossip text if player is not a Shaman');
-- Add Any Missing Gossip Menu item
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTYES;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTYES);
DELETE FROM `gossip_menu` WHERE `entry`=@GOSSIP AND `text_id`=@TEXTNO;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES (@GOSSIP,@TEXTNO);
DELETE FROM `gossip_menu` WHERE `entry` BETWEEN 7502 AND 7509;
INSERT INTO `gossip_menu` (`entry`,`text_id`) VALUES
(7502,9098),(7503,9099),(7504,9100),(7505,9101),
(7506,9102),(7507,9103),(7508,9104),(7509,9105);
-- Add Any Missing Gossip Option
DELETE FROM `gossip_menu_option` WHERE menu_id BETWEEN 7502 AND 7508;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(7502,0,0,"Yes, please continue.",1,1,7503,0,0,0,''),
(7503,0,0,"Yes, please, if you do not mind.",1,1,7504,0,0,0,''),
(7504,0,0,"Nobundo, please continue.",1,1,7505,0,0,0,''),
(7505,0,0,"What did it say to you?",1,1,7506,0,0,0,''),
(7506,0,0,"What was that?",1,1,7507,0,0,0,''),
(7507,0,0,"What did you do then?",1,1,7508,0,0,0,''),
(7508,0,0,"Please, go on.",1,1,7509,0,0,0,'');
DELETE FROM `gossip_menu_option` WHERE menu_id=@GOSSIP;
INSERT INTO `gossip_menu_option` (`menu_id`, `id`, `option_icon`,`option_text`,`option_id`,`npc_option_npcflag`,`action_menu_id`,`action_poi_id`,`box_coded`,`box_money`,`box_text`)VALUES
(@GOSSIP,0,3,"Teach me the ways of the spirits.",5,16,0,0,0,0,''),
(@GOSSIP,1,0,"Tell me of your past, Farseer.",1,1,7502,0,0,0,''),
(@GOSSIP,2,0,"I wish to unlearn my talents.",16,16,4461,0,0,0,''),
(@GOSSIP,3,0,"I wish to know about Dual Talent Specialization.",1,1,10371,0,0,0,'');
DELETE FROM `game_event_creature` WHERE `guid`=152120 AND `eventEntry`=24;
INSERT INTO `game_event_creature` (`guid`, `eventEntry`) VALUES (152120,24);
UPDATE `smart_scripts` SET `event_flags`=1 WHERE  `entryorguid`=23580 AND `source_type`=0 AND `id`=0 AND `link`=1;

-- Deep in the bowels of the Underhalls - 13042
SET @OSTERKILGR         := 30409; -- Apprentice Osterkilgr
SET @SPELL_BLAST        := 60290; -- Blast Wave
SET @SPELL_FIREBALL     := 14034; -- Fireball
SET @QUEST              := 13042; -- Deep in the Bowels of the Underhalls
UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry`=@OSTERKILGR;
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=@OSTERKILGR;
DELETE FROM `smart_scripts` WHERE `source_type`=0 AND `entryorguid`=@OSTERKILGR;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) 
VALUES
(@OSTERKILGR,0,0,0,0,0,100,0,5000,7000,5000,7000,11,@SPELL_BLAST,0,0,0,0,0,5,0,0,0,0,0,0,0,'Apprentice Osterkilgr - In Combat - cast Blast Wave'),
(@OSTERKILGR,0,1,0,0,0,100,0,1000,2000,1000,2000,11,@SPELL_FIREBALL,0,0,0,0,0,5,0,0,0,0,0,0,0,'Apprentice Osterkilgr - In Combat - cast Fireball'),
(@OSTERKILGR,0,2,0,2,0,100,1,40,80,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Apprentice Osterkilgr - @80%HP - say text 0'),
(@OSTERKILGR,0,3,4,2,0,100,1,0,40,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Apprentice Osterkilgr - @40%HP - say text 1'),
(@OSTERKILGR,0,4,0,61,0,100,0,0,0,0,0,33,30412,0,0,0,0,0,7,0,0,0,0,0,0,0,'Apprentice Osterkilgr - At 40% HP - give kill credit');
DELETE FROM `creature_ai_texts` WHERE `entry` IN (-10020,-10021);
DELETE FROM `creature_text` WHERE `entry`=@OSTERKILGR;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@OSTERKILGR,0,0,'You''ve come for the doctor''s plans! You''ll only find death!',12,0,0,0,0,0,'Apprentice Osterkilgr - Say 0'),
(@OSTERKILGR,1,0,'The doctor entrusted me with the plans to Nergeld, our flesh giant amalgamation made entirely of vargul! It will be the most powerful creation of its kind and a whole legion of them will be created to destroy your pitiful forces!',12,0,0,0,0,0,'Apprentice Osterkilgr - Say 1');
-- Add option conditions for Hunter trainers
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId` IN (15) AND `SourceGroup` IN (7368) AND `SourceEntry` IN (3,4);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(15,7368,3,0,9,9454,0,0,0,'','Acteon - Show gossip option if player has quest 9454'),
(15,7368,4,0,9,10324,0,0,0,'','Acteon - Show gossip option if player has quest 10324');
UPDATE `conditions` SET `ConditionValue1`=3781,`ConditionValue2`=0 WHERE `SourceTypeOrReferenceId`=15 AND `SourceGroup`=1403 AND `SourceEntry`=3 AND `ConditionTypeOrReference`=8;
-- The Art of Being a Water Terror (13091)
SET @NPC_WATER_TERROR           := 30645; -- Water Terror
SET @AURA_HEALTH                := 57664; -- The Art of Being a Water Terror: Mod Health Regen %
SET @JOT_WARRIOR                := 29880; -- Jotunheim Warrior
SET @SPEAR_SISTER               := 30243; -- Njorndar Spear-Sister
SET @VAL_VARGUL                 := 30250; -- Valhalas Vargul
SET @WATER_MAGUS                := 30632; -- Mjordin Water Magus
SET @SLEEP_WATCHER              := 30725; -- Jotunheim Sleep-Watcher

UPDATE `creature_template` SET `speed_walk`=4,`speed_run`=2.14285707473755,`AIName`='SmartAI',`exp`=2,`spell1`=57643,`spell2`=57652,`spell3`=57665,`spell4`=57668,`VehicleId`=250,`minlevel`=80,`maxlevel`=80,`faction_A`=116,`faction_H`=116,`unit_flags`=0x8008 WHERE `entry`=@NPC_WATER_TERROR;

DELETE FROM `creature_template_addon` WHERE `entry`=@NPC_WATER_TERROR;
INSERT INTO `creature_template_addon` (`entry`,`mount`,`bytes1`,`bytes2`,`auras`) VALUES
(@NPC_WATER_TERROR,0,0x0,0x101,'');

DELETE FROM `smart_scripts` WHERE `entryorguid`=@NPC_WATER_TERROR AND `source_type`=0;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(@NPC_WATER_TERROR,0,0,1,54,0,100,0,0,0,0,0,8,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Just Summoned - Set State Passive - Self'),
(@NPC_WATER_TERROR,0,1,0,61,0,100,0,0,0,0,0,75,@AURA_HEALTH,0,0,0,0,0,1,0,0,0,0,0,0,0,'On Just Summoned - Add Aura - Self');


DELETE FROM `smart_scripts` WHERE `entryorguid`  IN (@JOT_WARRIOR,@WATER_MAGUS,@SPEAR_SISTER);
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry` IN (@JOT_WARRIOR,@WATER_MAGUS,@SPEAR_SISTER);
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES 
(@JOT_WARRIOR,0,0,0,0,0,100,0,0,0,30000,30000,11,23262,2,0,0,0,0,2,0,0,0,0,0,0,0,'Jotunheim Warrior - IC - Cast Demoralize'),
(@JOT_WARRIOR,0,1,0,0,0,100,0,2000,3000,5000,7000,11,43410,2,0,0,0,0,2,0,0,0,0,0,0,0,'Jotunheim Warrior - IC - Cast Chop'),
(@JOT_WARRIOR,0,2,0,6,0,100,0,0,0,0,0,33,30644,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jotunheim Warrior - On Death - Give Kill Credit credit'),
(@SPEAR_SISTER,0,0,0,0,0,100,0,2000,3000,3000,4000,11,38029,2,0,0,0,0,2,0,0,0,0,0,0,0,'Njorndar Spear-Sister - IC - Cast Stab'),
(@SPEAR_SISTER,0,1,0,6,0,100,0,0,0,0,0,33,30644,0,0,0,0,0,7,0,0,0,0,0,0,0,'Njorndar Spear-Sister - On Death - Give Kill Credit credit'),
(@WATER_MAGUS,0,0,0,11,0,100,0,0,0,0,0,11,7855,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mjordin Water Magus - On Spawn - Summon Water Terror (Self)'),
(@WATER_MAGUS,0,1,0,0,0,100,0,0,0,3000,4000,11,9672,0,0,0,0,0,2,0,0,0,0,0,0,0,'Mjordin Water Magus - IC - Cast Frostbolt'),
(@WATER_MAGUS,0,2,0,0,0,100,0,3000,3000,7000,9000,11,15532,0,0,0,0,0,1,0,0,0,0,0,0,0,'Mjordin Water Magus - IC - Cast Frost Nova'),
(@WATER_MAGUS,0,3,0,6,0,100,0,0,0,0,0,33,30644,0,0,0,0,0,7,0,0,0,0,0,0,0,'Mjordin Water Magus - On Death - Give Kill Credit credit');
-- Valhalas Vargul
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@VAL_VARGUL;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@VAL_VARGUL;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@VAL_VARGUL,0,0,0,9,0,100,0,0,5,3000,5000,11,15496,0,0,0,0,0,2,0,0,0,0,0,0,0,'Valhalas Vargul - IC - Cast Cleave'),
(@VAL_VARGUL,0,1,0,6,0,100,0,0,0,0,0,33,30644,0,0,0,0,0,7,0,0,0,0,0,0,0,'Valhalas Vargul - On Death - Give Kill Credit credit');

-- Jotunheim Sleep-Watcher 
UPDATE `creature_template` SET `AIName`= 'SmartAI' WHERE `entry`=@SLEEP_WATCHER;
DELETE FROM `smart_scripts` WHERE `entryorguid` =@SLEEP_WATCHER;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@SLEEP_WATCHER,0,0,0,9,0,100,0,0,5,15000,25000,11,60870,0,0,0,0,0,2,0,0,0,0,0,0,0,'Jotunheim Sleep-Watcher - IC - Cast Bludgeoning Strike'),
(@SLEEP_WATCHER,0,1,0,9,0,100,0,0,5000,30000,45000,11,13730,0,0,0,0,0,1,0,0,0,0,0,0,0,'Jotunheim Sleep-Watcher - IC - Cast Demoralizing Shout'),
(@SLEEP_WATCHER,0,2,0,6,0,100,0,0,0,0,0,33,30644,0,0,0,0,0,7,0,0,0,0,0,0,0,'Jotunheim Sleep-Watcher - On Death - Give Kill Credit credit');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry` IN(@JOT_WARRIOR,@WATER_MAGUS,@SPEAR_SISTER,@VAL_VARGUL,@SLEEP_WATCHER);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`,`SourceGroup`,`SourceEntry`,`SourceId`,`ElseGroup`,`ConditionTypeOrReference`,`ConditionTarget`,`ConditionValue1`,`ConditionValue2`,`ConditionValue3`,`NegativeCondition`,`ErrorTextId`,`ScriptName`,`Comment`) VALUES
(22,3,@JOT_WARRIOR,0,0,1,0,57615,0,0,0,0,'','Only run AI if player is possessing a water terror'),
(22,4,@WATER_MAGUS,0,0,1,0,57615,0,0,0,0,'','Only run AI if player is  possessing  a water terror'),
(22,2,@SPEAR_SISTER,0,0,1,0,57615,0,0,0,0,'','Only run AI if player is  possessing  a water terror'),
(22,2,@VAL_VARGUL,0,0,1,0,57615,0,0,0,0,'','Only run AI if player is possessing  a water terror'),
(22,3,@SLEEP_WATCHER,0,0,1,0,57615,0,0,0,0,'','Only run AI if player is possessing  a water terror');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=16 AND `SourceEntry`=@NPC_WATER_TERROR;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorType`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(16,0,@NPC_WATER_TERROR,0,0,23,0,4526,0,0,0,0,0,'','Water Terror (Vehicle) Allowed in Njorndar Village'),
(16,0,@NPC_WATER_TERROR,0,1,23,0,4524,0,0,0,0,0,'','Water Terror (Vehicle) Allowed in Valhalas'),
(16,0,@NPC_WATER_TERROR,0,2,23,0,4496,0,0,0,0,0,'','Water Terror (Vehicle) Allowed in Jotunheim');
SET @GUID       := 131282;

SET @QUEST      := 11705;
SET @VARIDUS    := 25618;
SET @PRISONER   := 25624;
SET @ABERRATION := 25625;
SET @GETRY      := 25729;
SET @NECROLORD  := 25730;
SET @SAURFANG   := 25751;

UPDATE `creature_template` SET `minlevel`=65, `maxlevel`=70, `exp`=2, `faction_A`=14, `faction_H`=14, `unit_flags`=33554688, `AIName`='SmartAI' WHERE `entry`=@PRISONER;
UPDATE `creature_template` SET `faction_A`=1982, `faction_H`=1982, `unit_flags`=0, `AIName`='SmartAI' WHERE `entry`=@ABERRATION;
UPDATE `creature_template` SET `speed_run`=2.28571, `faction_A`=1982, `faction_H`=1982, `unit_flags`=33536, `AIName`='SmartAI' WHERE `entry`=@NECROLORD;
UPDATE `creature_template` SET `faction_A`=1982, `faction_H`=1982, `unit_flags`=768, `AIName`= 'SmartAI', `ScriptName`='' WHERE `entry`=@VARIDUS;
UPDATE `creature_template` SET `faction_A`=1980, `faction_H`=1980, `minlevel`=70, `maxlevel`=70, `exp`=2, `unit_flags`=33024, `mindmg`=474, `maxdmg`=574, `AIName`= 'SmartAI' WHERE `entry`=@SAURFANG;
UPDATE `creature_template` SET `unit_flags`=32768, `AIName`= 'SmartAI' WHERE `entry`=@GETRY;

UPDATE `creature_model_info` SET `bounding_radius`=0.4092, `combat_reach`=1.65 WHERE `modelid`=23360;

DELETE FROM `creature_template_addon` WHERE `entry` IN(@GETRY,@PRISONER,@VARIDUS);
INSERT INTO `creature_template_addon` (`entry`,`bytes2`,`auras`) VALUES
(@VARIDUS,0x1,'45908'),
(@PRISONER,0x1,''),
(@GETRY,0x101,'');

DELETE FROM `creature` WHERE `id` IN (@PRISONER,@VARIDUS);
INSERT INTO `creature` (`guid`,`id`,`map`,`spawnMask`,`phaseMask`,`modelid`,`equipment_id`,`position_x`,`position_y`,`position_z`,`orientation`,`spawntimesecs`,`spawndist`,`currentwaypoint`,`curhealth`,`curmana`,`MovementType`, `npcflag`, `unit_flags`, `dynamicflags`) VALUES 
(@GUID+0, @PRISONER, 571, 1, 1, 0, 0, 3092.136, 6516.039, 82.06012, 5.183628, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+1, @PRISONER, 571, 1, 1, 0, 0, 3089.2, 6526.226, 81.77282, 1.902409, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+2, @PRISONER, 571, 1, 1, 0, 0, 3096.962, 6510.87, 82.08541, 0.5585054, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+3, @PRISONER, 571, 1, 1, 0, 0, 3093.876, 6522.219, 81.79565, 0.01745329, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+4, @PRISONER, 571, 1, 1, 0, 0, 3098.928, 6517.495, 81.77497, 3.001966, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+5, @PRISONER, 571, 1, 1, 0, 0, 3103.036, 6504.89, 82.04672, 3.944444, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+6, @PRISONER, 571, 1, 1, 0, 0, 3104.042, 6511.731, 81.80676, 3.455752, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+7, @PRISONER, 571, 1, 1, 0, 0, 3093.038, 6547.074, 80.75952, 5.899213, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+8, @PRISONER, 571, 1, 1, 0, 0, 3096.117, 6544.481, 80.7102, 1.605703, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+9, @PRISONER, 571, 1, 1, 0, 0, 3099.3, 6541.367, 80.77256, 4.799655, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+10, @PRISONER, 571, 1, 1, 0, 0, 3090.39, 6541.875, 81.06445, 3.054326, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+11, @PRISONER, 571, 1, 1, 0, 0, 3102.454, 6538.238, 80.83416, 1.58825, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+12, @PRISONER, 571, 1, 1, 0, 0, 3093.245, 6538.743, 81.06524, 3.455752, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+13, @PRISONER, 571, 1, 1, 0, 0, 3105.601, 6534.979, 80.85965, 0.1570796, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+14, @PRISONER, 571, 1, 1, 0, 0, 3096.462, 6535.528, 81.13345, 4.921828, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+15, @PRISONER, 571, 1, 1, 0, 0, 3087.603, 6536.683, 81.36699, 4.18879, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+16, @PRISONER, 571, 1, 1, 0, 0, 3108.599, 6531.898, 80.8754, 5.462881, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+17, @PRISONER, 571, 1, 1, 0, 0, 3100.571, 6532.094, 81.16553, 6.230825, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+18, @PRISONER, 571, 1, 1, 0, 0, 3122.098, 6518.814, 80.70912, 1.815142, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+19, @PRISONER, 571, 1, 1, 0, 0, 3116.981, 6515.013, 81.07998, 5.899213, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+20, @PRISONER, 571, 1, 1, 0, 0, 3126.142, 6514.962, 80.68482, 1.954769, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+21, @PRISONER, 571, 1, 1, 0, 0, 3112.065, 6511.906, 81.3951, 5.148721, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+22, @PRISONER, 571, 1, 1, 0, 0, 3129.413, 6511.592, 80.7066, 2.722714, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+23, @PRISONER, 571, 1, 1, 0, 0, 3122.214, 6510.255, 81.00794, 2.86234, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+24, @PRISONER, 571, 1, 1, 0, 0, 3116.414, 6507.338, 81.34387, 5.811946, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+25, @PRISONER, 571, 1, 1, 0, 0, 3109.384, 6506.753, 81.68826, 6.038839, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+26, @PRISONER, 571, 1, 1, 0, 0, 3126.804, 6505.612, 81.01304, 3.909538, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+27, @PRISONER, 571, 1, 1, 0, 0, 3120.997, 6502.847, 81.33372, 3.228859, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+28, @PRISONER, 571, 1, 1, 0, 0, 3114.636, 6501.495, 81.61775, 0.3490658, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+29, @PRISONER, 571, 1, 1, 0, 0, 3109.11, 6498.783, 81.92492, 2.635447, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+30, @PRISONER, 571, 1, 1, 0, 0, 3126.413, 6498.179, 81.30205, 6.248279, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+31, @PRISONER, 571, 1, 1, 0, 0, 3120.758, 6495.855, 81.59259, 2.495821, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+32, @PRISONER, 571, 1, 1, 0, 0, 3115.22, 6492.261, 81.93079, 5.5676, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+33, @PRISONER, 571, 1, 1, 0, 0, 3126.15, 6489.568, 81.65459, 2.146755, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+34, @PRISONER, 571, 1, 1, 0, 0, 3120.454, 6486.966, 81.9426, 1.902409, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+35, @PRISONER, 571, 1, 1, 0, 0, 3095.756, 6528.297, 81.4939, 4.433136, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+36, @PRISONER, 571, 1, 1, 0, 0, 3091.309, 6532.723, 81.41476, 4.502949, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+37, @PRISONER, 571, 1, 1, 0, 0, 3104.285, 6519.577, 81.50758, 6.178465, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+38, @PRISONER, 571, 1, 1, 0, 0, 3112.36, 6527.987, 80.87508, 3.630285, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+39, @PRISONER, 571, 1, 1, 0, 0, 3104.28, 6528.084, 81.18883, 3.420845, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+40, @PRISONER, 571, 1, 1, 0, 0, 3116.763, 6524.073, 80.84852, 6.021386, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+41, @PRISONER, 571, 1, 1, 0, 0, 3099.789, 6524.306, 81.51059, 3.368485, 15, 0, 0, 1848, 0, 0, 0, 0, 0),
(@GUID+42, @VARIDUS, 571, 1, 1, 0, 0, 3126.529, 6532.781, 80.06363, 5.576992, 60, 0, 0, 0, 0, 0, 0, 0, 0);

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (@GETRY,@VARIDUS,@NECROLORD,@PRISONER,@ABERRATION) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid`=@VARIDUS*100 AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`, `source_type`, `id`, `link`, `event_type`, `event_phase_mask`, `event_chance`, `event_flags`, `event_param1`, `event_param2`, `event_param3`, `event_param4`, `action_type`, `action_param1`, `action_param2`, `action_param3`, `action_param4`, `action_param5`, `action_param6`, `target_type`, `target_param1`, `target_param2`, `target_param3`, `target_x`, `target_y`, `target_z`, `target_o`, `comment`) VALUES
(@VARIDUS,0,0,0,38,0,100,0,0,1,0,0,69,1,0,0,0,0,0,8,0,0,0,3119.973,6539.042,80.1591, 0, 'Varidus the Flenser - On data 0 1 set - Move to position'),
(@VARIDUS,0,1,2,34,0,100,0,0,1,0,0,66,0,0,0,0,0,0,8,0,0,0,0,0,0,4.031711, 'Varidus the Flenser - On movement inform - Set orientation'),
(@VARIDUS,0,2,3,61,0,100,0,0,0,0,0,1,11,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On movement inform - Say line'),
(@VARIDUS,0,3,0,61,0,100,0,0,0,0,0,89,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On movement inform - Stop Random movement'),
(@VARIDUS,0,4,0,38,0,100,0,0,2,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On data 0 2 set - Say line'),
(@VARIDUS,0,5,0,52,0,100,0,0,@VARIDUS,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Varidus the Flenser - On text 0 over - Turn to'),
(@VARIDUS,0,6,7,38,0,100,0,0,3,0,0,1,1,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Varidus the Flenser - On data 0 3 set - Say line'),
(@VARIDUS,0,7,8,61,0,100,0,0,0,0,0,12,@NECROLORD,1,300000,0,0,0,8,0,0,0,3137.506,6532.551,80.40143,2.280419, 'Varidus the Flenser - On data 0 3 set - Summon En''kilah Necrolord'),
(@VARIDUS,0,8,0,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@NECROLORD,50,0,0,0,0,0, 'Varidus the Flenser - On data 0 3 set - Send targetlist'),
(@VARIDUS,0,9,0,38,0,100,0,0,4,0,0,80,@VARIDUS*100,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On data 0 4 set - Run script'),
(@VARIDUS,0,10,11,52,0,100,0,10,@VARIDUS,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On text 10 over - Remove unit_flags IMMUNE_TO_PC, IMMUNE_TO_NPC'),
(@VARIDUS,0,11,0,61,0,100,0,0,0,0,0,28,45908,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On text 10 over - Remove aura Shield of Suffering'),
(@VARIDUS,0,12,0,9,0,100,0,0,10,5000,8000,11,32711,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On target within 10y - Spellcast Shadow Nova'),
(@VARIDUS,0,13,0,0,0,100,0,10000,12000,10000,15000,11,50329,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On update IC - Spellcast Shied of Suffering'),
(@VARIDUS,0,14,15,6,0,100,0,0,0,0,0,45,1,3,0,0,0,0,19,@GETRY,100,0,0,0,0,0, 'Varidus the Flenser - On death - Set data 1 3 Shadowstalker Getry'),
(@VARIDUS,0,15,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On death - Despawn'),
(@VARIDUS,0,16,0,11,0,100,0,0,0,0,0,89,10,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On spawn - Random movement'),

(@PRISONER,0,0,1,6,0,100,0,0,0,0,0,11,45802,2,0,0,0,0,1,0,0,0,0,0,0,0, 'Infested Prisoner - On death - Spellcast Summoned Aberration'),
(@PRISONER,0,1,0,61,0,100,0,0,0,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Infested Prisoner - On death - Despawn'),

(@ABERRATION,0,0,1,11,0,100,0,0,0,0,0,53,0,@ABERRATION,0,0,0,0,1,0,0,0,0,0,0,0, 'Warsong Aberration - On spawn - Start WP movement'),
(@ABERRATION,0,1,0,61,0,100,0,0,0,0,0,8,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Warsong Aberration - On spawn - Set reaction aggressive'),
(@ABERRATION,0,2,0,9,0,100,0,0,5,990,3000,11,50306,2,0,0,0,0,7,0,0,0,0,0,0,0, 'Warsong Aberration - On target within 5y - Spellcast Thrash Kick'),

(@GETRY,0,0,1,19,0,100,0,@QUEST,0,0,0,64,1,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Shadowstalker Getry - On quest accept - Store targetlist'),
(@GETRY,0,1,2,61,0,100,0,0,0,0,0,83,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On quest accept - Remove npcflag questgiver'),
(@GETRY,0,2,3,61,0,100,0,0,0,0,0,1,0,3000,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On quest accept - Say line'),
(@GETRY,0,3,4,61,0,100,0,0,0,0,0,11,45924,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On quest accept - Spellcast On Getry''s Quest'),
(@GETRY,0,4,5,61,0,100,0,0,0,0,0,11,45924,0,0,0,0,0,7,0,0,0,0,0,0,0, 'Shadowstalker Getry - On quest accept - Spellcast On Getry''s Quest'),
(@GETRY,0,5,0,61,0,100,0,0,0,0,0,45,0,1,0,0,0,0,19,@VARIDUS,50,0,0,0,0,0, 'Shadowstalker Getry - On quest accept - Set data 0 1 Varidus the Flenser'),
(@GETRY,0,6,7,52,0,100,0,0,@GETRY,0,0,1,1,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On text 0 over - Say line'),
(@GETRY,0,7,0,61,0,100,0,0,0,0,0,53,0,@GETRY,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On text 0 over - Start WP'),
(@GETRY,0,8,0,11,0,100,0,0,0,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On spawn - Set npcflag questgiver'),
(@GETRY,0,9,0,40,0,100,0,8,@GETRY,0,0,11,34189,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On WP8 reached - Spellcast Stealth'),
(@GETRY,0,10,11,40,0,100,0,9,@GETRY,0,0,45,0,2,0,0,0,0,19,@VARIDUS,30,0,0,0,0,0, 'Shadowstalker Getry - On WP 9 reached - Set data 0 2 Varidus the Flenser'),
(@GETRY,0,11,0,61,0,100,0,0,0,0,0,100,1,0,0,0,0,0,19,@VARIDUS,30,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached - Send targetlist to Varidus the Flenser'),
(@GETRY,0,12,13,40,0,100,0,10,@GETRY,0,0,66,0,0,0,0,0,0,19,@VARIDUS,20,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached - Turn to'),
(@GETRY,0,13,14,61,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached - Set home position'),
(@GETRY,0,14,15,61,0,100,0,0,0,0,0,28,34189,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached - Remove aura Stealth'),
(@GETRY,0,15,16,61,0,100,0,0,0,0,0,11,45922,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached - Spellcast Shadow Prison'),
(@GETRY,0,16,17,61,0,100,0,0,0,0,0,86,45922,0,12,1,0,0,12,1,0,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached - Crosscast Shadow Prison'),
(@GETRY,0,17,0,61,0,100,0,0,0,0,0,45,0,3,0,0,0,0,19,@VARIDUS,20,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached - Set Data 0 3 Varidus the Flenser'),
(@GETRY,0,18,19,38,0,100,0,1,1,0,0,19,768,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On data 1 1 set - Remove unit_flags IMMUNE_TO_PC, IMMUNE_TO_NPC'),
(@GETRY,0,19,0,61,0,100,0,0,0,0,0,49,0,0,0,0,0,0,19,@VARIDUS,20,0,0,0,0,0, 'Shadowstalker Getry - On data 1 1 set - Start attack'),
(@GETRY,0,20,21,38,0,100,0,1,3,0,0,15,@QUEST,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Shadowstalker Getry - On data 1 3 set - Quest credit'),
(@GETRY,0,21,0,61,0,100,0,0,0,0,0,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On data 1 3 set - Say line'),
(@GETRY,0,22,0,52,0,100,0,2,@GETRY,0,0,1,3,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On text 2 over - Say line'),
(@GETRY,0,23,0,52,0,100,0,3,@GETRY,0,0,45,1,2,0,0,0,0,19,@SAURFANG,20,0,0,0,0,0, 'Shadowstalker Getry - On text 3 over - Set data 1 2 High Overlord Saurfang'),
(@GETRY,0,24,0,38,0,100,0,1,4,0,0,53,0,@GETRY*100,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On data 1 4 set - Start WP movement'),
(@GETRY,0,26,27,40,0,100,0,10,@GETRY*100,0,0,81,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached (Return) - Set npcflag questgiver'),
(@GETRY,0,27,28,61,0,100,0,0,0,0,0,18,756,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached (Return) - Set unit_flags IMMUNE_TO_PC, IMMUNE_TO_NPC'),
(@GETRY,0,28,0,61,0,100,0,0,0,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On WP10 reached (Return) - Set homeposition'),
(@GETRY,0,29,30,8,0,100,0,45950,0,0,0,28,45922,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Shadowstalker Getry - On spellhit Saurfangs Rage - Remove aura Shadow Prison'),
(@GETRY,0,30,0,61,0,100,0,0,0,0,0,28,45922,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Shadowstalker Getry - On spellhit Saurfangs Rage - Remove aura Shadow Prison'),

(@NECROLORD,0,0,0,11,0,100,0,0,0,0,0,53,0,@NECROLORD,0,0,0,0,1,0,0,0,0,0,0,0, 'En''kilah Necrolord - On spawn - Start WP movement'),
(@NECROLORD,0,1,2,40,0,100,0,2,@NECROLORD,0,0,101,0,0,0,0,0,0,1,0,0,0,0,0,0,0, 'En''kilah Necrolord - On reached WP1 - Set home position'),
(@NECROLORD,0,2,0,61,0,100,0,0,0,0,0,45,0,4,0,0,0,0,19,@VARIDUS,10,0,0,0,0,0, 'En''kilah Necrolord - On reached WP1 - Set data 0 4 Varidus the Flenser'),
(@NECROLORD,0,3,4,38,0,100,0,0,1,0,0,66,0,0,0,0,0,0,19,@VARIDUS,10,0,0,0,0,0, 'En''kilah Necrolord - On data 0 1 set - Turn to'),
(@NECROLORD,0,4,0,61,0,100,0,0,0,0,0,36,@SAURFANG,0,0,0,0,0,1,0,0,0,0,0,0,0, 'En''kilah Necrolord - On data 0 1 set - Change entry to High Overlord Saurfang'),
(@NECROLORD,0,5,0,38,0,100,0,0,2,0,0,1,0,2500,0,0,0,0,12,1,0,0,0,0,0,0, 'High Overlord Saurfang - On data 0 2 set - Say line'),
(@NECROLORD,0,6,0,52,0,100,0,0,@SAURFANG,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'High Overlord Saurfang - On text 0 over - Turn to'),
(@NECROLORD,0,7,0,38,0,100,0,0,3,0,0,1,1,4000,0,0,0,0,12,1,0,0,0,0,0,0, 'High Overlord Saurfang - On data 0 3 set - Say line'),
(@NECROLORD,0,8,0,52,0,100,0,1,@SAURFANG,0,0,66,0,0,0,0,0,0,19,@VARIDUS,10,0,0,0,0,0, 'High Overlord Saurfang - On text 1 over - Turn to'),
(@NECROLORD,0,9,0,38,0,100,0,0,4,0,0,1,2,5000,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On data 0 4 set - Say line'),
(@NECROLORD,0,10,0,52,0,100,0,2,@SAURFANG,0,0,1,3,12000,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On text 2 over - Say line'),
(@NECROLORD,0,11,0,52,0,100,0,3,@SAURFANG,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On text 3 over - Say line'),
(@NECROLORD,0,13,14,38,0,100,0,1,1,0,0,19,256,0,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On data 1 1 set - Remove unit_flags IMMUNE_TO_NPC'),
(@NECROLORD,0,14,15,61,0,100,0,0,0,0,0,11,45950,0,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On data 1 1 set - Spellcast Saurfang''s Rage'),
(@NECROLORD,0,15,0,61,0,100,0,0,0,0,0,1,5,1000,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On data 1 1 set - Say line'),
(@NECROLORD,0,16,0,52,0,100,0,5,@SAURFANG,0,0,1,6,1000,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On text 5 over - Say line'),
(@NECROLORD,0,17,0,61,0,100,0,0,0,0,0,41,3000,0,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On text 7 over - Despawn after 3 seconds'),
(@NECROLORD,0,18,0,9,0,100,0,0,5,20000,25000,11,41097,0,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On target within 5y - Spellcast Whirlwind'),
(@NECROLORD,0,19,0,0,0,100,0,3000,7000,3000,8000,11,16044,0,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On update IC - Spellcast Cleave'),
(@NECROLORD,0,20,0,0,0,100,0,2000,7000,5000,7000,11,24573,0,0,0,0,0,2,0,0,0,0,0,0,0, 'High Overlord Saurfang - On update IC - Spellcast Mortal Strike'),
(@NECROLORD,0,21,0,9,0,100,0,8,25,5000,5000,11,15749,0,0,0,0,0,2,0,0,0,0,0,0,0, 'High Overlord Saurfang - On target within 8-25y - Spellcast Shield Charge'),
(@NECROLORD,0,22,0,38,0,100,0,0,5,0,0,66,0,0,0,0,0,0,12,1,0,0,0,0,0,0, 'High Overlord Saurfang - On data 0 5 set - Turn to'),
(@NECROLORD,0,23,0,38,0,100,0,1,2,0,0,1,7,3000,0,0,0,0,1,0,0,0,0,0,0,0, 'High Overlord Saurfang - On data 1 2 set - Say line'),
(@NECROLORD,0,24,17,52,0,100,0,7,@SAURFANG,0,0,45,1,4,0,0,0,0,19,@GETRY,20,0,0,0,0,0, 'High Overlord Saurfang - On text 7 over - Set data 1 4 Shadowstalker Getry'),

(@VARIDUS*100,9,0,0,0,0,100,0,0,0,0,0,45,0,5,0,0,0,0,19,@NECROLORD,10,0,0,0,0,0, 'Varidus the Flenser script - Set data 0 5 En''kilah Necrolord'),
(@VARIDUS*100,9,1,0,0,0,100,0,0,0,0,0,1,2,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,2,0,0,0,100,0,5000,5000,0,0,1,3,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,3,0,0,0,100,0,3000,3000,0,0,1,4,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,4,0,0,0,100,0,4000,4000,0,0,1,5,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,5,0,0,0,100,0,6000,6000,0,0,66,0,0,0,0,0,0,19,@NECROLORD,10,0,0,0,0,0, 'Varidus the Flenser script - Turn to'),
(@VARIDUS*100,9,6,0,0,0,100,0,1000,1000,0,0,1,6,0,0,0,0,0,12,1,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,7,0,0,0,100,0,6000,6000,0,0,45,0,1,0,0,0,0,19,@NECROLORD,10,0,0,0,0,0, 'Varidus the Flenser script - Set data 0 1 En''kilah Necrolord'),
(@VARIDUS*100,9,8,0,0,0,100,0,1000,1000,0,0,45,0,2,0,0,0,0,19,@SAURFANG,10,0,0,0,0,0, 'Varidus the Flenser script - Set data 0 2 High Overlord Saurfang'),
(@VARIDUS*100,9,9,0,0,0,100,0,1500,1500,0,0,1,7,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,10,0,0,0,100,0,2000,2000,0,0,45,0,3,0,0,0,0,19,@SAURFANG,10,0,0,0,0,0, 'Varidus the Flenser script - Set data 0 3 High Overlord Saurfang'),
(@VARIDUS*100,9,11,0,0,0,100,0,5000,5000,0,0,45,0,4,0,0,0,0,19,@SAURFANG,10,0,0,0,0,0, 'Varidus the Flenser script - Set data 0 4 High Overlord Saurfang'),
(@VARIDUS*100,9,12,0,0,0,100,0,13000,13000,0,0,1,8,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,13,0,0,0,100,0,10000,10000,0,0,1,9,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Say line'),
(@VARIDUS*100,9,14,0,0,0,100,0,2000,2000,0,0,1,10,2000,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser - On text 9 over - Say line'),
(@VARIDUS*100,9,15,0,0,0,100,0,0,0,0,0,11,45949,0,0,0,0,0,1,0,0,0,0,0,0,0, 'Varidus the Flenser script - Spellcast Release Aberration'),
(@VARIDUS*100,9,16,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,@GETRY,20,0,0,0,0,0, 'Varidus the Flenser script - Set data 1 1 Shadowstalker Getry'),
(@VARIDUS*100,9,17,0,0,0,100,0,0,0,0,0,45,1,1,0,0,0,0,19,@SAURFANG,20,0,0,0,0,0, 'Varidus the Flenser script - Set data 1 1 Saurfang');

DELETE FROM `creature_text` WHERE `entry` IN (@GETRY,@VARIDUS,@SAURFANG);
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(@GETRY,0,0,'This is it, $N. The start of the end of the world. And you''re here to see it off...',12,1,100,1,0,0,'Shadowstalker Getry'),
(@GETRY,1,0,'Let''s go...',12,1,100,0,0,0,'Shadowstalker Getry'),
(@GETRY,2,0,'I... I can''t believe it... Saurfang... I... I am honored... honored to have fought along side you, sir.',12,1,100,0,0,0,'Shadowstalker Getry'),
(@GETRY,3,0,'You should return to Warsong Hold now, friend. Hellscream will surely want to hear of what just happened here... of Saurfang...',12,1,100,0,0,0,'Shadowstalker Getry'),
(@VARIDUS,0,0,'Is this it? Is this all the mighty Horde could muster?',12,0,100,6,0,0,'Varidus the Flenser'),
(@VARIDUS,1,0,'Pathetic.',12,0,100,11,0,0,'Varidus the Flenser'),
(@VARIDUS,2,0,'I''ve never understood your type. The hero...',12,0,100,1,0,0,'Varidus the Flenser'),
(@VARIDUS,3,0,'Why won''t you just let go? Why do you fight the inevitable?',12,0,100,6,0,0,'Varidus the Flenser'),
(@VARIDUS,4,0,'The Lich King cannot be stopped. Accept it.',12,0,100,274,0,0,'Varidus the Flenser'),
(@VARIDUS,5,0,'This world is coming to an end. Let. It. Burn.',12,0,100,397,0,0,'Varidus the Flenser'),
(@VARIDUS,6,0,'Take $g him:her; away and prepare $g him:her; for reanimation.',12,0,100,1,0,0,'Varidus the Flenser'),
(@VARIDUS,7,0,'What''s this now?',12,0,100,1,0,0,'Varidus the Flenser'),
(@VARIDUS,8,0,'Then you are a fool.',12,0,100,25,0,0,'Varidus the Flenser'),
(@VARIDUS,9,0,'You? A lone orc? Against me and...',12,0,100,397,0,0,'Varidus the Flenser'),
(@VARIDUS,10,0,'RISE!',14,0,100,0,0,0,'Varidus the Flenser'),
(@VARIDUS,11,0,'I will reanimate them all as servants of the Lich King! Bring them here...',14,0,100,0,0,0,'Varidus the Flenser'),
(@SAURFANG,0,0,'I''ll rip your shriveled heart out with my bare hands before any harm comes to $N, necromancer.',12,1,100,5,0,0,'High Overlord Saurfang'),
(@SAURFANG,1,0,'You were never alone, $N.',12,1,100,1,0,0,'High Overlord Saurfang'),
(@SAURFANG,2,0,'This world that you seek to destroy is our home.',12,1,100,1,0,0,'High Overlord Saurfang'),
(@SAURFANG,3,0,'We will fight you with every fiber of our being - until we are nothing more than dust and debris. We will fight until the end.',12,1,100,1,0,0,'High Overlord Saurfang'),
(@SAURFANG,4,0,'A fool who is about to end you, necrolord. There will be nothing left of you for the Lich King to reanimate!',12,1,100,397,0,0,'High Overlord Saurfang'),
(@SAURFANG,5,0,'%s''s eyes glow red for a brief moment.',16,0,100,0,0,0,'High Overlord Saurfang'),
(@SAURFANG,6,0,'Is that the best you can do?',12,1,100,0,0,0,'High Overlord Saurfang'),
(@SAURFANG,7,0,'You''ll make no mention of me. Either of you!',12,1,100,0,0,0,'High Overlord Saurfang');

DELETE FROM `waypoints` WHERE `entry` IN (@GETRY,@NECROLORD,@GETRY*100,@ABERRATION);
INSERT INTO `waypoints` (`entry`, `pointid`, `position_x`, `position_y`, `position_z`, `point_comment`) VALUES 
(@GETRY, 1, 3109.214111,6587.148438,91.369102, 'Shadowstalker Getry'),
(@GETRY, 2, 3115.414062,6595.680176,91.362068, 'Shadowstalker Getry'),
(@GETRY, 3, 3125.109863,6590.983887,91.378548, 'Shadowstalker Getry'),
(@GETRY, 4, 3123.863281,6582.144043,88.786133, 'Shadowstalker Getry'),
(@GETRY, 5, 3117.805664,6583.018555,86.219604, 'Shadowstalker Getry'),
(@GETRY, 6, 3118.874512,6590.157715,83.402168, 'Shadowstalker Getry'),
(@GETRY, 7, 3127.298340,6589.030273,79.707741, 'Shadowstalker Getry'),
(@GETRY, 8, 3122.869,6578.715,78.051, 'Shadowstalker Getry'),
(@GETRY, 9, 3123.309,6560.647,78.61833, 'Shadowstalker Getry'),
(@GETRY, 10,  3122.208,6549.245,79.64079, 'Shadowstalker Getry'),
(@ABERRATION, 1, 3119.973,6539.042,80.1591, 'Warsong Aberration'),
(@NECROLORD, 1, 3125.963,6536.96,79.93521, 'En''kilah Necrolord'),
(@NECROLORD, 2, 3120.883,6542.995,79.95628, 'En''kilah Necrolord'),
(@GETRY*100, 1, 3123.355957,6575.417969,78.330284, 'Shadowstalker Getry'), 
(@GETRY*100, 2, 3126.639404,6584.798828,77.656845, 'Shadowstalker Getry'), 
(@GETRY*100, 3, 3127.298340,6589.030273,79.707741, 'Shadowstalker Getry'),
(@GETRY*100, 4, 3118.874512,6590.157715,83.402168, 'Shadowstalker Getry'),
(@GETRY*100, 5, 3117.805664,6583.018555,86.219604, 'Shadowstalker Getry'),
(@GETRY*100, 6, 3123.863281,6582.144043,88.786133, 'Shadowstalker Getry'),
(@GETRY*100, 7, 3125.109863,6590.983887,91.378548, 'Shadowstalker Getry'),
(@GETRY*100, 8, 3115.414062,6595.680176,91.362068, 'Shadowstalker Getry'),
(@GETRY*100, 9, 3109.214111,6587.148438,91.369102, 'Shadowstalker Getry'),
(@GETRY*100, 10, 3113.419922,6576.810059,97.090698, 'Shadowstalker Getry');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry`=45949;
DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=22 AND `SourceEntry`=@GETRY;
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,45949,0,0,31,0,3,@PRISONER,0,0,0,'','Spell Release Aberration targets Infested Prisoner'),
(22,37,@GETRY,0,0,36,1,0,0,0,0,0,'','Only execute SAI if Shadowstalker Getry alive');

DELETE FROM `creature_equip_template` WHERE `entry`=@SAURFANG;
INSERT INTO `creature_equip_template` (`entry`, `id`, `itemEntry1`, `itemEntry2`, `itemEntry3`) VALUES 
(@SAURFANG,1,21580,0,0);

DELETE FROM `disables` WHERE `sourceType`=0 AND `entry`=45949;
INSERT INTO `disables` (`sourceType`, `entry`, `flags`, `params_0`, `params_1`, `comment`) VALUES 
(0,45949,64,'','','Ignore LOS on Release Aberration');
DELETE FROM `creature_ai_scripts` WHERE `creature_id`=25730;
-- Fix quest: Danger! Explosives! (11218)

UPDATE `creature_template` SET `AIName`='SmartAI' WHERE `entry` IN (23974,29881);
UPDATE `gameobject_template` SET `flags`=`flags`|4 WHERE `entry` IN (186403,186404,186466,186467,186468);
UPDATE `gameobject_template` SET `AIName`='SmartGameObjectAI' WHERE `entry` IN (186403,186470);

DELETE FROM `spell_area` WHERE `spell`=27769;
INSERT INTO `spell_area` (`spell`,`area`,`autocast`) VALUES
(27769,4071,1);

DELETE FROM `creature_text` WHERE `entry`=29881;
INSERT INTO `creature_text` (`entry`,`groupid`,`id`,`text`,`type`,`language`,`probability`,`emote`,`duration`,`sound`,`comment`) VALUES
(29881,0,0,'They are coming for you.',15,0,100,0,0,14376,'An Unknown Voice'),
(29881,0,1,'Give into your fear.',15,0,100,0,0,14377,'An Unknown Voice'),
(29881,0,2,'Kill them all... before they kill you.',15,0,100,0,0,14378,'An Unknown Voice'),
(29881,0,3,'They have turned against you. Now... take your revenge.',15,0,100,0,0,14379,'An Unknown Voice'),
(29881,0,4,'Tell yourself again that these are not truly your friends.',15,0,100,0,0,14380,'An Unknown Voice'),
(29881,0,5,'There is no escape, Not in this life. Not in the next.',15,0,100,0,0,14381,'An Unknown Voice'),
(29881,0,6,'You are a pawn of forces unseen.',15,0,100,0,0,14382,'An Unknown Voice'),
(29881,0,7,'It WAS your fault.',15,0,100,0,0,14383,'An Unknown Voice');

DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23974,29881) AND `source_type`=0;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (186403,186470) AND `source_type`=1;
DELETE FROM `smart_scripts` WHERE `entryorguid` IN (23974*100+0,23974*100+1,23974*100+2,23974*100+3,186403*100) AND `source_type`=9;
INSERT INTO `smart_scripts` (`entryorguid`,`source_type`,`id`,`link`,`event_type`,`event_phase_mask`,`event_chance`,`event_flags`,`event_param1`,`event_param2`,`event_param3`,`event_param4`,`action_type`,`action_param1`,`action_param2`,`action_param3`,`action_param4`,`action_param5`,`action_param6`,`target_type`,`target_param1`,`target_param2`,`target_param3`,`target_x`,`target_y`,`target_z`,`target_o`,`comment`) VALUES
(23974,0,0,0,8,0,100,0,42697,0,0,0,87,23974*100+0,23974*100+1,23974*100+2,23974*100+3,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny - On spellhit Spell Danger! Explosive!: Ore Trap - Run random script'),

(29881,0,0,0,8,0,100,0,29072,0,0,0,1,0,0,0,0,0,0,7,0,0,0,0,0,0,0,'An Unknown Voice - On spellhit Whisper Gulch: Yogg-Saron Whisper Dummy - Say line'),

(186403,1,0,1,38,0,100,0,0,1,0,0,44,2,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore - On data 0 1 set - Set phasemask 2'),
(186403,1,1,0,61,0,100,0,0,0,0,0,80,186403*100,2,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore - On data 0 1 set - Run script'),

(186470,1,0,0,70,0,100,0,1,0,0,0,45,0,1,0,0,0,0,20,186403,5,0,0,0,0,0,'Whisper Gulch Ore Trap - On state changed - Set data 0 1 Whisper Gulch Ore'),

(23974*100+0,9,0,0,0,0,100,0,0,0,0,0,50,186404,120000,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Summon Whisper Gulch Gem'),
(23974*100+0,9,1,0,0,0,100,0,4000,4000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Despawn'),
(23974*100+1,9,0,0,0,0,100,0,0,0,0,0,50,186466,120000,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Summon Whisper Gulch Gem'),
(23974*100+1,9,1,0,0,0,100,0,4000,4000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Despawn'),
(23974*100+2,9,0,0,0,0,100,0,0,0,0,0,50,186467,120000,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Summon Whisper Gulch Gem'),
(23974*100+2,9,1,0,0,0,100,0,4000,4000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Despawn'),
(23974*100+3,9,0,0,0,0,100,0,0,0,0,0,50,186468,120000,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Summon Whisper Gulch Ore Fragment'),
(23974*100+3,9,1,0,0,0,100,0,4000,4000,0,0,41,0,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore Bunny script 0 - Despawn'),

(186403*100,9,0,0,0,0,100,0,300000,300000,0,0,44,1,0,0,0,0,0,1,0,0,0,0,0,0,0,'Whisper Gulch Ore script - Set phasemask 1');

DELETE FROM `conditions` WHERE `SourceTypeOrReferenceId`=13 AND `SourceEntry` IN (29072,42697,42703);
INSERT INTO `conditions` (`SourceTypeOrReferenceId`, `SourceGroup`, `SourceEntry`, `SourceId`, `ElseGroup`, `ConditionTypeOrReference`, `ConditionTarget`, `ConditionValue1`, `ConditionValue2`, `ConditionValue3`, `NegativeCondition`, `ErrorTextId`, `ScriptName`, `Comment`) VALUES
(13,1,29072,0,0,31,0,3,29881,0,0,0,'','Spell Whisper Gulch: Yogg-Saron Whisper Dummy targets An Unknown Voice'),
(13,1,42697,0,0,31,0,3,23974,0,0,0,'','Spell Danger! Explosive!: Ore Trap targets Whisper Gulch Ore Bunny'),
(13,1,42703,0,0,31,0,5,186470,0,0,0,'','Spell Steelring''s Foolproof Dynamite effect0 targets Whisper Gulch Ore Trap');

DELETE FROM `spell_script_names` WHERE `spell_id`=27769;
INSERT INTO `spell_script_names` (`spell_id`,`ScriptName`) VALUES
(27769,'spell_gen_whisper_gulch_yogg_saron_whisper');
