-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.33a-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             8.1.0.4545
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table auth.account
CREATE TABLE IF NOT EXISTS `account` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Identifier',
  `username` varchar(32) NOT NULL DEFAULT '',
  `sha_pass_hash` varchar(40) NOT NULL DEFAULT '',
  `sessionkey` varchar(80) NOT NULL DEFAULT '',
  `v` varchar(64) NOT NULL DEFAULT '',
  `s` varchar(64) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `joindate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `failed_logins` int(10) unsigned NOT NULL DEFAULT '0',
  `locked` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '3',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Account System';

-- Dumping data for table auth.account: ~2 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` (`id`, `username`, `sha_pass_hash`, `sessionkey`, `v`, `s`, `email`, `joindate`, `last_ip`, `failed_logins`, `locked`, `last_login`, `online`, `expansion`, `mutetime`, `mutereason`, `muteby`, `locale`, `os`, `recruiter`) VALUES
	(1, 'J0SK3M', '1352DB2A8EF7CB1F29771041A4B1CD7AD15B09C0', 'A7AAD7DBBFF2EA510706298FB5ED5AB297493BEF20F1A5F4C0B2B69E140E83B1EEA40A2EE308C1D4', '5397E5F02618DE5E75FD7C72172882ADFBCA84DEA903BE58508A7C2F53E5201D', 'DDCC0F5B7E636B21AA7D1D1FAD14FFA39FC18E42B8E06266B688A011726CDC2D', '', '2013-10-19 19:39:41', '80.220.223.232', 0, 0, '2013-10-22 23:41:20', 1, 3, 0, '', '', 0, 'Win', 0),
	(2, 'RAFIKI', 'E2EC9AF3BC4AD9459885F76E7B7F264BF08EFB46', 'AD775B65DC03214682E8A11EF2268974F445582F33DD06EBF3D8152967284F91C4D7BA2BDA899625', '1D2EE8FDE9A50F8626F1C58D1E36076E8D6F0E32DAE57EF522ABB324EF810585', 'B61E351D96C2699E0D5759099AE9F9C226A844A36A6AB58BBB9D1ACD3A72A529', '', '2013-10-20 00:37:58', '80.220.223.232', 0, 0, '2013-10-22 23:41:24', 1, 3, 0, '', '', 0, 'Win', 0);
/*!40000 ALTER TABLE `account` ENABLE KEYS */;


-- Dumping structure for table auth.account_access
CREATE TABLE IF NOT EXISTS `account_access` (
  `id` int(10) unsigned NOT NULL,
  `gmlevel` tinyint(3) unsigned NOT NULL,
  `RealmID` int(11) NOT NULL DEFAULT '-1',
  PRIMARY KEY (`id`,`RealmID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.account_access: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_access` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_access` ENABLE KEYS */;


-- Dumping structure for table auth.account_banned
CREATE TABLE IF NOT EXISTS `account_banned` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Account id',
  `bandate` int(10) unsigned NOT NULL DEFAULT '0',
  `unbandate` int(10) unsigned NOT NULL DEFAULT '0',
  `bannedby` varchar(50) NOT NULL,
  `banreason` varchar(255) NOT NULL,
  `active` tinyint(3) unsigned NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Ban List';

-- Dumping data for table auth.account_banned: ~0 rows (approximately)
/*!40000 ALTER TABLE `account_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `account_banned` ENABLE KEYS */;


-- Dumping structure for table auth.ip_banned
CREATE TABLE IF NOT EXISTS `ip_banned` (
  `ip` varchar(15) NOT NULL DEFAULT '127.0.0.1',
  `bandate` int(10) unsigned NOT NULL,
  `unbandate` int(10) unsigned NOT NULL,
  `bannedby` varchar(50) NOT NULL DEFAULT '[Console]',
  `banreason` varchar(255) NOT NULL DEFAULT 'no reason',
  PRIMARY KEY (`ip`,`bandate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Banned IPs';

-- Dumping data for table auth.ip_banned: ~0 rows (approximately)
/*!40000 ALTER TABLE `ip_banned` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip_banned` ENABLE KEYS */;


-- Dumping structure for table auth.logs
CREATE TABLE IF NOT EXISTS `logs` (
  `time` int(10) unsigned NOT NULL,
  `realm` int(10) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `string` text CHARACTER SET latin1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.logs: ~0 rows (approximately)
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_account_groups
CREATE TABLE IF NOT EXISTS `rbac_account_groups` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `groupId` int(10) unsigned NOT NULL COMMENT 'Group id',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`groupId`,`realmId`),
  KEY `fk__rbac_account_groups__rbac_groups` (`groupId`),
  CONSTRAINT `fk__rbac_account_groups__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_groups__rbac_groups` FOREIGN KEY (`groupId`) REFERENCES `rbac_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Group relation';

-- Dumping data for table auth.rbac_account_groups: ~8 rows (approximately)
/*!40000 ALTER TABLE `rbac_account_groups` DISABLE KEYS */;
INSERT INTO `rbac_account_groups` (`accountId`, `groupId`, `realmId`) VALUES
	(1, 1, -1),
	(1, 2, -1),
	(1, 3, -1),
	(1, 4, -1),
	(2, 1, -1),
	(2, 2, -1),
	(2, 3, -1),
	(2, 4, -1);
/*!40000 ALTER TABLE `rbac_account_groups` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_account_permissions
CREATE TABLE IF NOT EXISTS `rbac_account_permissions` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`permissionId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__rbac_account_permissions__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Permission relation';

-- Dumping data for table auth.rbac_account_permissions: ~1 rows (approximately)
/*!40000 ALTER TABLE `rbac_account_permissions` DISABLE KEYS */;
INSERT INTO `rbac_account_permissions` (`accountId`, `permissionId`, `granted`, `realmId`) VALUES
	(1, 10, 1, -1);
/*!40000 ALTER TABLE `rbac_account_permissions` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_account_roles
CREATE TABLE IF NOT EXISTS `rbac_account_roles` (
  `accountId` int(10) unsigned NOT NULL COMMENT 'Account id',
  `roleId` int(10) unsigned NOT NULL COMMENT 'Role id',
  `granted` tinyint(1) NOT NULL DEFAULT '1' COMMENT 'Granted = 1, Denied = 0',
  `realmId` int(11) NOT NULL DEFAULT '-1' COMMENT 'Realm Id, -1 means all',
  PRIMARY KEY (`accountId`,`roleId`,`realmId`),
  KEY `fk__rbac_account_roles__rbac_roles` (`roleId`),
  CONSTRAINT `fk__rbac_account_roles__account` FOREIGN KEY (`accountId`) REFERENCES `account` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_account_roles__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account-Role relation';

-- Dumping data for table auth.rbac_account_roles: ~1 rows (approximately)
/*!40000 ALTER TABLE `rbac_account_roles` DISABLE KEYS */;
INSERT INTO `rbac_account_roles` (`accountId`, `roleId`, `granted`, `realmId`) VALUES
	(1, 4, 1, -1);
/*!40000 ALTER TABLE `rbac_account_roles` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_groups
CREATE TABLE IF NOT EXISTS `rbac_groups` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Group id',
  `name` varchar(100) NOT NULL COMMENT 'Group name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Group List';

-- Dumping data for table auth.rbac_groups: ~4 rows (approximately)
/*!40000 ALTER TABLE `rbac_groups` DISABLE KEYS */;
INSERT INTO `rbac_groups` (`id`, `name`) VALUES
	(1, 'Player'),
	(2, 'Moderator'),
	(3, 'GameMaster'),
	(4, 'Administrator');
/*!40000 ALTER TABLE `rbac_groups` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_group_roles
CREATE TABLE IF NOT EXISTS `rbac_group_roles` (
  `groupId` int(10) unsigned NOT NULL COMMENT 'group id',
  `roleId` int(10) unsigned NOT NULL COMMENT 'Role id',
  PRIMARY KEY (`groupId`,`roleId`),
  KEY `fk__rbac_group_roles__rbac_roles` (`roleId`),
  CONSTRAINT `fk__rbac_group_roles__rbac_groups` FOREIGN KEY (`groupId`) REFERENCES `rbac_groups` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_group_roles__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Group Role relation';

-- Dumping data for table auth.rbac_group_roles: ~91 rows (approximately)
/*!40000 ALTER TABLE `rbac_group_roles` DISABLE KEYS */;
INSERT INTO `rbac_group_roles` (`groupId`, `roleId`) VALUES
	(1, 1),
	(1, 6),
	(1, 7),
	(1, 34),
	(2, 2),
	(2, 5),
	(2, 8),
	(2, 9),
	(2, 10),
	(2, 11),
	(2, 12),
	(2, 13),
	(2, 14),
	(2, 15),
	(2, 16),
	(2, 17),
	(2, 19),
	(2, 20),
	(2, 21),
	(2, 22),
	(2, 24),
	(2, 25),
	(2, 26),
	(2, 27),
	(2, 28),
	(2, 29),
	(2, 30),
	(2, 32),
	(2, 33),
	(2, 35),
	(2, 36),
	(2, 37),
	(2, 38),
	(3, 3),
	(3, 8),
	(3, 9),
	(3, 10),
	(3, 11),
	(3, 12),
	(3, 13),
	(3, 14),
	(3, 15),
	(3, 16),
	(3, 17),
	(3, 19),
	(3, 20),
	(3, 21),
	(3, 22),
	(3, 24),
	(3, 25),
	(3, 26),
	(3, 27),
	(3, 28),
	(3, 29),
	(3, 30),
	(3, 32),
	(3, 33),
	(3, 35),
	(3, 36),
	(3, 37),
	(3, 38),
	(4, 4),
	(4, 8),
	(4, 9),
	(4, 10),
	(4, 11),
	(4, 12),
	(4, 13),
	(4, 14),
	(4, 15),
	(4, 16),
	(4, 17),
	(4, 18),
	(4, 19),
	(4, 20),
	(4, 21),
	(4, 22),
	(4, 23),
	(4, 24),
	(4, 25),
	(4, 26),
	(4, 27),
	(4, 28),
	(4, 29),
	(4, 30),
	(4, 32),
	(4, 33),
	(4, 35),
	(4, 36),
	(4, 37),
	(4, 38);
/*!40000 ALTER TABLE `rbac_group_roles` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_permissions
CREATE TABLE IF NOT EXISTS `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';

-- Dumping data for table auth.rbac_permissions: ~46 rows (approximately)
/*!40000 ALTER TABLE `rbac_permissions` DISABLE KEYS */;
INSERT INTO `rbac_permissions` (`id`, `name`) VALUES
	(1, 'Instant logout'),
	(2, 'Skip Queue'),
	(3, 'Join Normal Battleground'),
	(4, 'Join Random Battleground'),
	(5, 'Join Arenas'),
	(6, 'Join Dungeon Finder'),
	(7, 'Player Commands (Temporal till commands moved to rbac)'),
	(8, 'Moderator Commands (Temporal till commands moved to rbac)'),
	(9, 'GameMaster Commands (Temporal till commands moved to rbac)'),
	(10, 'Administrator Commands (Temporal till commands moved to rbac)'),
	(11, 'Log GM trades'),
	(13, 'Skip Instance required bosses check'),
	(14, 'Skip character creation team mask check'),
	(15, 'Skip character creation class mask check'),
	(16, 'Skip character creation race mask check'),
	(17, 'Skip character creation reserved name check'),
	(18, 'Skip character creation heroic min level check'),
	(19, 'Skip needed requirements to use channel check'),
	(20, 'Skip disable map check'),
	(21, 'Skip reset talents when used more than allowed check'),
	(22, 'Skip spam chat check'),
	(23, 'Skip over-speed ping check'),
	(24, 'Two side faction characters on the same account'),
	(25, 'Allow say chat between factions'),
	(26, 'Allow channel chat between factions'),
	(27, 'Two side mail interaction'),
	(28, 'See two side who list'),
	(29, 'Add friends of other faction'),
	(30, 'Save character without delay with .save command'),
	(31, 'Use params with .unstuck command'),
	(32, 'Can be assigned tickets with .assign ticket command'),
	(33, 'Notify if a command was not found'),
	(34, 'Check if should appear in list using .gm ingame command'),
	(35, 'See all security levels with who command'),
	(36, 'Filter whispers'),
	(37, 'Use staff badge in chat'),
	(38, 'Resurrect with full Health Points'),
	(39, 'Restore saved gm setting states'),
	(40, 'Allows to add a gm to friend list'),
	(41, 'Use Config option START_GM_LEVEL to assign new character level'),
	(42, 'Allows to use CMSG_WORLD_TELEPORT opcode'),
	(43, 'Allows to use CMSG_WHOIS opcode'),
	(44, 'Receive global GM messages/texts'),
	(45, 'Join channels without announce'),
	(46, 'Change channel settings without being channel moderator'),
	(47, 'Enables lower security than target check');
/*!40000 ALTER TABLE `rbac_permissions` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_roles
CREATE TABLE IF NOT EXISTS `rbac_roles` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role id',
  `name` varchar(100) NOT NULL COMMENT 'Role name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Roles List';

-- Dumping data for table auth.rbac_roles: ~38 rows (approximately)
/*!40000 ALTER TABLE `rbac_roles` DISABLE KEYS */;
INSERT INTO `rbac_roles` (`id`, `name`) VALUES
	(1, 'Player Commands'),
	(2, 'Moderator Commands'),
	(3, 'GameMaster Commands'),
	(4, 'Administrator Commands'),
	(5, 'Quick Login/Logout'),
	(6, 'Use Battleground/Arenas'),
	(7, 'Use Dungeon Finder'),
	(8, 'Log GM trades'),
	(9, 'Skip Instance required bosses check'),
	(10, 'Ticket management'),
	(11, 'Instant .save'),
	(12, 'Allow params with .unstuck'),
	(13, 'Full HP after resurrect'),
	(14, 'Appear in GM ingame list'),
	(15, 'Use staff badge in chat'),
	(16, 'Receive global GM messages/texts'),
	(17, 'Skip over-speed ping check'),
	(18, 'Allows Admin Opcodes'),
	(19, 'Two side mail interaction'),
	(20, 'Notify if a command was not found'),
	(21, 'Enables lower security than target check'),
	(22, 'Skip disable map check'),
	(23, 'Skip reset talents when used more than allowed check'),
	(24, 'Skip spam chat check'),
	(25, 'Restore saved gm setting states'),
	(26, 'Use Config option START_GM_LEVEL to assign new character level'),
	(27, 'Skip needed requirements to use channel check'),
	(28, 'Allow say chat between factions'),
	(29, 'Filter whispers'),
	(30, 'Allow channel chat between factions'),
	(31, 'Join channels without announce'),
	(32, 'Change channel settings without being channel moderator'),
	(33, 'Skip character creation checks'),
	(34, 'Two side faction characters on the same account'),
	(35, 'See two side who list'),
	(36, 'Add friends of other faction'),
	(37, 'See all security levels with who command'),
	(38, 'Allows to add a gm to friend list');
/*!40000 ALTER TABLE `rbac_roles` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_role_permissions
CREATE TABLE IF NOT EXISTS `rbac_role_permissions` (
  `roleId` int(10) unsigned NOT NULL COMMENT 'Role id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `fk__role_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__role_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__role_permissions__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Role Permission relation';

-- Dumping data for table auth.rbac_role_permissions: ~46 rows (approximately)
/*!40000 ALTER TABLE `rbac_role_permissions` DISABLE KEYS */;
INSERT INTO `rbac_role_permissions` (`roleId`, `permissionId`) VALUES
	(1, 7),
	(2, 8),
	(3, 9),
	(4, 10),
	(5, 1),
	(5, 2),
	(6, 3),
	(6, 4),
	(6, 5),
	(7, 6),
	(8, 11),
	(9, 13),
	(10, 32),
	(11, 30),
	(12, 31),
	(13, 38),
	(14, 34),
	(15, 37),
	(16, 44),
	(17, 23),
	(18, 42),
	(18, 43),
	(19, 27),
	(20, 33),
	(21, 47),
	(22, 20),
	(23, 21),
	(24, 22),
	(25, 39),
	(26, 41),
	(27, 19),
	(28, 25),
	(29, 36),
	(30, 26),
	(31, 45),
	(32, 46),
	(33, 14),
	(33, 15),
	(33, 16),
	(33, 17),
	(33, 18),
	(34, 24),
	(35, 28),
	(36, 29),
	(37, 35),
	(38, 40);
/*!40000 ALTER TABLE `rbac_role_permissions` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_security_level_groups
CREATE TABLE IF NOT EXISTS `rbac_security_level_groups` (
  `secId` int(10) unsigned NOT NULL COMMENT 'Security Level id',
  `groupId` int(10) unsigned NOT NULL COMMENT 'group id',
  PRIMARY KEY (`secId`,`groupId`),
  KEY `fk__rbac_security_level_groups__rbac_groups` (`groupId`),
  CONSTRAINT `fk__rbac_security_level_groups__rbac_groups` FOREIGN KEY (`groupId`) REFERENCES `rbac_groups` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Default groups to assign when an account is set gm level';

-- Dumping data for table auth.rbac_security_level_groups: ~10 rows (approximately)
/*!40000 ALTER TABLE `rbac_security_level_groups` DISABLE KEYS */;
INSERT INTO `rbac_security_level_groups` (`secId`, `groupId`) VALUES
	(0, 1),
	(1, 1),
	(1, 2),
	(2, 1),
	(2, 2),
	(2, 3),
	(3, 1),
	(3, 2),
	(3, 3),
	(3, 4);
/*!40000 ALTER TABLE `rbac_security_level_groups` ENABLE KEYS */;


-- Dumping structure for table auth.realmcharacters
CREATE TABLE IF NOT EXISTS `realmcharacters` (
  `realmid` int(10) unsigned NOT NULL DEFAULT '0',
  `acctid` int(10) unsigned NOT NULL,
  `numchars` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`realmid`,`acctid`),
  KEY `acctid` (`acctid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Realm Character Tracker';

-- Dumping data for table auth.realmcharacters: ~2 rows (approximately)
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
INSERT INTO `realmcharacters` (`realmid`, `acctid`, `numchars`) VALUES
	(1, 1, 8),
	(1, 2, 1);
/*!40000 ALTER TABLE `realmcharacters` ENABLE KEYS */;


-- Dumping structure for table auth.realmlist
CREATE TABLE IF NOT EXISTS `realmlist` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '',
  `address` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localAddress` varchar(255) NOT NULL DEFAULT '127.0.0.1',
  `localSubnetMask` varchar(255) NOT NULL DEFAULT '255.255.255.0',
  `port` smallint(5) unsigned NOT NULL DEFAULT '8085',
  `icon` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `flag` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `timezone` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `allowedSecurityLevel` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `population` float unsigned NOT NULL DEFAULT '0',
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '15595',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- Dumping data for table auth.realmlist: ~1 rows (approximately)
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` (`id`, `name`, `address`, `localAddress`, `localSubnetMask`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`) VALUES
	(1, 'Trinity', 'orion2666.server4you.net', '127.0.0.1', '255.255.255.0', 8085, 1, 0, 8, 0, 0, 15595);
/*!40000 ALTER TABLE `realmlist` ENABLE KEYS */;


-- Dumping structure for table auth.uptime
CREATE TABLE IF NOT EXISTS `uptime` (
  `realmid` int(10) unsigned NOT NULL,
  `starttime` int(10) unsigned NOT NULL DEFAULT '0',
  `uptime` int(10) unsigned NOT NULL DEFAULT '0',
  `maxplayers` smallint(5) unsigned NOT NULL DEFAULT '0',
  `revision` varchar(255) NOT NULL DEFAULT 'Trinitycore',
  PRIMARY KEY (`realmid`,`starttime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Uptime system';

-- Dumping data for table auth.uptime: ~58 rows (approximately)
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
INSERT INTO `uptime` (`realmid`, `starttime`, `uptime`, `maxplayers`, `revision`) VALUES
	(1, 1382200255, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382200733, 1801, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382202739, 11401, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382214604, 1800, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382216765, 1801, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382218963, 45001, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382264397, 1801, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382266779, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382267291, 21000, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382289846, 2401, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382292813, 1800, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382294645, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382294976, 600, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382295888, 601, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382296704, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382296897, 601, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382297914, 6600, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382304636, 44400, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382349330, 1200, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382350824, 1801, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382353093, 1201, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382354916, 6000, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382361290, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382361501, 11400, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382373294, 2401, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382375797, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382376329, 600, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382377252, 600, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382378059, 600, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382378860, 1801, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382381022, 601, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382381938, 600, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382441661, 1801, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382444087, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382444574, 601, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382445738, 3001, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382449065, 4800, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382454146, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382454673, 1200, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382456327, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382456465, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382457279, 1200, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382458528, 3000, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382461553, 600, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382462362, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382462558, 2400, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382465211, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382465776, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382466244, 1200, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382467641, 1800, 1, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382469692, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382470061, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382470511, 600, 2, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382471281, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382471804, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382472412, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382472844, 1200, 2, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)'),
	(1, 1382474492, 0, 0, 'TrinityCore rev. Hezekiah Custom Core Branch 4.3.4 (Win32, Release)');
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
