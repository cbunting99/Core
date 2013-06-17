-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.5.31-MariaDB-log - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             8.0.0.4396
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping database structure for auth
CREATE DATABASE IF NOT EXISTS `auth` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `auth`;


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
  `lock_country` varchar(2) NOT NULL DEFAULT '00',
  `last_login` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `online` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `expansion` tinyint(3) unsigned NOT NULL DEFAULT '2',
  `mutetime` bigint(20) NOT NULL DEFAULT '0',
  `mutereason` varchar(255) NOT NULL DEFAULT '',
  `muteby` varchar(50) NOT NULL DEFAULT '',
  `locale` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `os` varchar(3) NOT NULL DEFAULT '',
  `recruiter` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Account System';

-- Dumping data for table auth.account: ~0 rows (approximately)
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
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


-- Dumping structure for table auth.autobroadcast
CREATE TABLE IF NOT EXISTS `autobroadcast` (
  `realmid` int(11) NOT NULL DEFAULT '-1',
  `id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `weight` tinyint(3) unsigned DEFAULT '1',
  `text` longtext NOT NULL,
  PRIMARY KEY (`id`,`realmid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.autobroadcast: ~0 rows (approximately)
/*!40000 ALTER TABLE `autobroadcast` DISABLE KEYS */;
/*!40000 ALTER TABLE `autobroadcast` ENABLE KEYS */;


-- Dumping structure for table auth.ip2nation
CREATE TABLE IF NOT EXISTS `ip2nation` (
  `ip` int(11) unsigned NOT NULL DEFAULT '0',
  `country` char(2) NOT NULL DEFAULT '',
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.ip2nation: ~0 rows (approximately)
/*!40000 ALTER TABLE `ip2nation` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nation` ENABLE KEYS */;


-- Dumping structure for table auth.ip2nationcountries
CREATE TABLE IF NOT EXISTS `ip2nationcountries` (
  `code` varchar(4) NOT NULL DEFAULT '',
  `iso_code_2` varchar(2) NOT NULL DEFAULT '',
  `iso_code_3` varchar(3) DEFAULT '',
  `iso_country` varchar(255) NOT NULL DEFAULT '',
  `country` varchar(255) NOT NULL DEFAULT '',
  `lat` float NOT NULL DEFAULT '0',
  `lon` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`code`),
  KEY `code` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table auth.ip2nationcountries: ~0 rows (approximately)
/*!40000 ALTER TABLE `ip2nationcountries` DISABLE KEYS */;
/*!40000 ALTER TABLE `ip2nationcountries` ENABLE KEYS */;


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

-- Dumping data for table auth.rbac_account_groups: ~0 rows (approximately)
/*!40000 ALTER TABLE `rbac_account_groups` DISABLE KEYS */;
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

-- Dumping data for table auth.rbac_account_permissions: ~0 rows (approximately)
/*!40000 ALTER TABLE `rbac_account_permissions` DISABLE KEYS */;
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

-- Dumping data for table auth.rbac_account_roles: ~0 rows (approximately)
/*!40000 ALTER TABLE `rbac_account_roles` DISABLE KEYS */;
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
  CONSTRAINT `fk__rbac_group_roles__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__rbac_group_roles__rbac_groups` FOREIGN KEY (`groupId`) REFERENCES `rbac_groups` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Group Role relation';

-- Dumping data for table auth.rbac_group_roles: ~93 rows (approximately)
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
	(3, 39),
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
	(4, 38),
	(4, 39);
/*!40000 ALTER TABLE `rbac_group_roles` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_permissions
CREATE TABLE IF NOT EXISTS `rbac_permissions` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Permission id',
  `name` varchar(100) NOT NULL COMMENT 'Permission name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Permission List';

-- Dumping data for table auth.rbac_permissions: ~47 rows (approximately)
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
	(47, 'Enables lower security than target check'),
	(48, 'Enable IP, Last Login and EMail output in pinfo');
/*!40000 ALTER TABLE `rbac_permissions` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_roles
CREATE TABLE IF NOT EXISTS `rbac_roles` (
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Role id',
  `name` varchar(100) NOT NULL COMMENT 'Role name',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Roles List';

-- Dumping data for table auth.rbac_roles: ~39 rows (approximately)
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
	(38, 'Allows to add a gm to friend list'),
	(39, 'Enable IP, Last Login and EMail output in pinfo');
/*!40000 ALTER TABLE `rbac_roles` ENABLE KEYS */;


-- Dumping structure for table auth.rbac_role_permissions
CREATE TABLE IF NOT EXISTS `rbac_role_permissions` (
  `roleId` int(10) unsigned NOT NULL COMMENT 'Role id',
  `permissionId` int(10) unsigned NOT NULL COMMENT 'Permission id',
  PRIMARY KEY (`roleId`,`permissionId`),
  KEY `fk__role_permissions__rbac_permissions` (`permissionId`),
  CONSTRAINT `fk__role_permissions__rbac_roles` FOREIGN KEY (`roleId`) REFERENCES `rbac_roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk__role_permissions__rbac_permissions` FOREIGN KEY (`permissionId`) REFERENCES `rbac_permissions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Role Permission relation';

-- Dumping data for table auth.rbac_role_permissions: ~47 rows (approximately)
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
	(38, 40),
	(39, 48);
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

-- Dumping data for table auth.realmcharacters: ~0 rows (approximately)
/*!40000 ALTER TABLE `realmcharacters` DISABLE KEYS */;
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
  `gamebuild` int(10) unsigned NOT NULL DEFAULT '12340',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Realm System';

-- Dumping data for table auth.realmlist: ~1 rows (approximately)
/*!40000 ALTER TABLE `realmlist` DISABLE KEYS */;
INSERT INTO `realmlist` (`id`, `name`, `address`, `localAddress`, `localSubnetMask`, `port`, `icon`, `flag`, `timezone`, `allowedSecurityLevel`, `population`, `gamebuild`) VALUES
	(1, 'Trinity', '127.0.0.1', '127.0.0.1', '255.255.255.0', 8085, 1, 0, 1, 0, 0, 12340);
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

-- Dumping data for table auth.uptime: ~0 rows (approximately)
/*!40000 ALTER TABLE `uptime` DISABLE KEYS */;
/*!40000 ALTER TABLE `uptime` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
