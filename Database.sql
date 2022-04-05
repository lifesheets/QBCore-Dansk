-- --------------------------------------------------------
-- Vært:                         127.0.0.1
-- Server-version:               10.4.22-MariaDB - mariadb.org binary distribution
-- ServerOS:                     Win64
-- HeidiSQL Version:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for darkrp
CREATE DATABASE IF NOT EXISTS `fivemserver` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `fivemserver`;

-- Dumping structure for tabel darkrp.addon_account
CREATE TABLE IF NOT EXISTS `addon_account` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.addon_account: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `addon_account` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_account` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.addon_account_data
CREATE TABLE IF NOT EXISTS `addon_account_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account_name` varchar(100) DEFAULT NULL,
  `money` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_addon_account_data_account_name_owner` (`account_name`,`owner`),
  KEY `index_addon_account_data_account_name` (`account_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.addon_account_data: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `addon_account_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_account_data` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.addon_inventory
CREATE TABLE IF NOT EXISTS `addon_inventory` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.addon_inventory: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `addon_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.addon_inventory_items
CREATE TABLE IF NOT EXISTS `addon_inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_name` varchar(100) NOT NULL,
  `name` varchar(100) NOT NULL,
  `count` int(11) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_addon_inventory_items_inventory_name_name` (`inventory_name`,`name`),
  KEY `index_addon_inventory_items_inventory_name_name_owner` (`inventory_name`,`name`,`owner`),
  KEY `index_addon_inventory_inventory_name` (`inventory_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.addon_inventory_items: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `addon_inventory_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `addon_inventory_items` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.apartments
CREATE TABLE IF NOT EXISTS `apartments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `citizenid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.apartments: ~1 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `apartments` DISABLE KEYS */;
INSERT INTO `apartments` (`id`, `name`, `type`, `label`, `citizenid`) VALUES
	(1, 'apartment36014', 'apartment3', 'Integrity Way 6014', 'MQG45597');
/*!40000 ALTER TABLE `apartments` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.bank_accounts
CREATE TABLE IF NOT EXISTS `bank_accounts` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(250) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `amount` bigint(255) NOT NULL DEFAULT 0,
  `account_type` enum('Current','Savings','business','Gang') NOT NULL DEFAULT 'Current',
  PRIMARY KEY (`record_id`),
  UNIQUE KEY `citizenid` (`citizenid`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.bank_accounts: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `bank_accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_accounts` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.bank_statements
CREATE TABLE IF NOT EXISTS `bank_statements` (
  `record_id` bigint(255) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `account` varchar(50) DEFAULT NULL,
  `business` varchar(50) DEFAULT NULL,
  `businessid` int(11) DEFAULT NULL,
  `gangid` varchar(50) DEFAULT NULL,
  `deposited` int(11) DEFAULT NULL,
  `withdraw` int(11) DEFAULT NULL,
  `balance` int(11) DEFAULT NULL,
  `date` varchar(50) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`record_id`),
  KEY `business` (`business`),
  KEY `businessid` (`businessid`),
  KEY `gangid` (`gangid`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.bank_statements: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `bank_statements` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank_statements` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.bans
CREATE TABLE IF NOT EXISTS `bans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `license` varchar(50) DEFAULT NULL,
  `discord` varchar(50) DEFAULT NULL,
  `ip` varchar(50) DEFAULT NULL,
  `reason` text DEFAULT NULL,
  `expire` int(11) DEFAULT NULL,
  `bannedby` varchar(255) NOT NULL DEFAULT 'LeBanhammer',
  PRIMARY KEY (`id`),
  KEY `license` (`license`),
  KEY `discord` (`discord`),
  KEY `ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.bans: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `bans` DISABLE KEYS */;
/*!40000 ALTER TABLE `bans` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.billing
CREATE TABLE IF NOT EXISTS `billing` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(40) NOT NULL,
  `sender` varchar(40) NOT NULL,
  `target_type` varchar(50) NOT NULL,
  `target` varchar(40) NOT NULL,
  `label` varchar(255) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.billing: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `billing` DISABLE KEYS */;
/*!40000 ALTER TABLE `billing` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.cardealer_vehicles
CREATE TABLE IF NOT EXISTS `cardealer_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicle` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.cardealer_vehicles: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `cardealer_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `cardealer_vehicles` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.crypto
CREATE TABLE IF NOT EXISTS `crypto` (
  `crypto` varchar(50) NOT NULL DEFAULT 'bit',
  `worth` int(11) NOT NULL DEFAULT 0,
  `history` text DEFAULT NULL,
  PRIMARY KEY (`crypto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.crypto: ~1 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `crypto` DISABLE KEYS */;
INSERT INTO `crypto` (`crypto`, `worth`, `history`) VALUES
	('bit', 8, '[{"NewWorth":8,"PreviousWorth":6},{"NewWorth":9,"PreviousWorth":1},{"NewWorth":7,"PreviousWorth":9},{"NewWorth":5,"PreviousWorth":7}]');
/*!40000 ALTER TABLE `crypto` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.crypto_transactions
CREATE TABLE IF NOT EXISTS `crypto_transactions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `message` varchar(50) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.crypto_transactions: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `crypto_transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `crypto_transactions` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.datastore
CREATE TABLE IF NOT EXISTS `datastore` (
  `name` varchar(60) NOT NULL,
  `label` varchar(100) NOT NULL,
  `shared` int(11) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.datastore: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `datastore` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.datastore_data
CREATE TABLE IF NOT EXISTS `datastore_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(60) NOT NULL,
  `owner` varchar(40) DEFAULT NULL,
  `data` longtext DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_datastore_data_name_owner` (`name`,`owner`),
  KEY `index_datastore_data_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.datastore_data: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `datastore_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `datastore_data` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.dealers
CREATE TABLE IF NOT EXISTS `dealers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '0',
  `coords` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `time` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `createdby` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.dealers: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `dealers` DISABLE KEYS */;
/*!40000 ALTER TABLE `dealers` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.dpkeybinds
CREATE TABLE IF NOT EXISTS `dpkeybinds` (
  `id` varchar(50) DEFAULT NULL,
  `keybind1` varchar(50) DEFAULT 'num4',
  `emote1` varchar(255) DEFAULT '',
  `keybind2` varchar(50) DEFAULT 'num5',
  `emote2` varchar(255) DEFAULT '',
  `keybind3` varchar(50) DEFAULT 'num6',
  `emote3` varchar(255) DEFAULT '',
  `keybind4` varchar(50) DEFAULT 'num7',
  `emote4` varchar(255) DEFAULT '',
  `keybind5` varchar(50) DEFAULT 'num8',
  `emote5` varchar(255) DEFAULT '',
  `keybind6` varchar(50) DEFAULT 'num9',
  `emote6` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.dpkeybinds: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `dpkeybinds` DISABLE KEYS */;
/*!40000 ALTER TABLE `dpkeybinds` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.gloveboxitems
CREATE TABLE IF NOT EXISTS `gloveboxitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.gloveboxitems: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `gloveboxitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `gloveboxitems` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.houselocations
CREATE TABLE IF NOT EXISTS `houselocations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `coords` text DEFAULT NULL,
  `owned` tinyint(2) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `tier` tinyint(4) DEFAULT NULL,
  `garage` text NOT NULL DEFAULT '{"y":0,"x":0,"h":0,"z":0}',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.houselocations: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `houselocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `houselocations` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.house_plants
CREATE TABLE IF NOT EXISTS `house_plants` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `building` varchar(50) DEFAULT NULL,
  `stage` varchar(50) DEFAULT 'stage-a',
  `sort` varchar(50) DEFAULT NULL,
  `gender` varchar(50) DEFAULT NULL,
  `food` int(11) DEFAULT 100,
  `health` int(11) DEFAULT 100,
  `progress` int(11) DEFAULT 0,
  `coords` text DEFAULT NULL,
  `plantid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `building` (`building`),
  KEY `plantid` (`plantid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.house_plants: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `house_plants` DISABLE KEYS */;
/*!40000 ALTER TABLE `house_plants` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.items
CREATE TABLE IF NOT EXISTS `items` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL DEFAULT 1,
  `rare` tinyint(4) NOT NULL DEFAULT 0,
  `can_remove` tinyint(4) NOT NULL DEFAULT 1,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.items: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.jobs
CREATE TABLE IF NOT EXISTS `jobs` (
  `name` varchar(50) NOT NULL,
  `label` varchar(50) DEFAULT NULL,
  `whitelisted` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.jobs: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.job_grades
CREATE TABLE IF NOT EXISTS `job_grades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) DEFAULT NULL,
  `grade` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `label` varchar(50) NOT NULL,
  `salary` int(11) NOT NULL,
  `skin_male` longtext NOT NULL,
  `skin_female` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.job_grades: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `job_grades` DISABLE KEYS */;
/*!40000 ALTER TABLE `job_grades` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.lapraces
CREATE TABLE IF NOT EXISTS `lapraces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `checkpoints` text DEFAULT NULL,
  `records` text DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `distance` int(11) DEFAULT NULL,
  `raceid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.lapraces: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `lapraces` DISABLE KEYS */;
/*!40000 ALTER TABLE `lapraces` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.licenses
CREATE TABLE IF NOT EXISTS `licenses` (
  `type` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.licenses: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `licenses` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.management_funds
CREATE TABLE IF NOT EXISTS `management_funds` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `job_name` varchar(50) NOT NULL,
  `amount` int(100) NOT NULL,
  `type` enum('boss','gang') NOT NULL DEFAULT 'boss',
  PRIMARY KEY (`id`),
  UNIQUE KEY `job_name` (`job_name`),
  KEY `type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.management_funds: ~12 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `management_funds` DISABLE KEYS */;
INSERT INTO `management_funds` (`id`, `job_name`, `amount`, `type`) VALUES
	(1, 'police', 0, 'boss'),
	(2, 'ambulance', 0, 'boss'),
	(3, 'realestate', 0, 'boss'),
	(4, 'taxi', 0, 'boss'),
	(5, 'cardealer', 0, 'boss'),
	(6, 'mechanic', 0, 'boss'),
	(7, 'lostmc', 0, 'gang'),
	(8, 'ballas', 0, 'gang'),
	(9, 'vagos', 0, 'gang'),
	(10, 'cartel', 0, 'gang'),
	(11, 'families', 0, 'gang'),
	(12, 'triads', 0, 'gang');
/*!40000 ALTER TABLE `management_funds` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_bolos
CREATE TABLE IF NOT EXISTS `mdt_bolos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `owner` varchar(50) DEFAULT NULL,
  `individual` varchar(50) DEFAULT NULL,
  `detail` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_bolos: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_bolos` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_bolos` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_bulletin
CREATE TABLE IF NOT EXISTS `mdt_bulletin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` text NOT NULL,
  `desc` text NOT NULL,
  `author` varchar(50) NOT NULL,
  `time` varchar(20) NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_bulletin: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_bulletin` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_bulletin` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_convictions
CREATE TABLE IF NOT EXISTS `mdt_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(50) DEFAULT NULL,
  `linkedincident` int(11) NOT NULL DEFAULT 0,
  `warrant` varchar(50) DEFAULT NULL,
  `guilty` varchar(50) DEFAULT NULL,
  `processed` varchar(50) DEFAULT NULL,
  `associated` varchar(50) DEFAULT '0',
  `charges` text DEFAULT NULL,
  `fine` int(11) DEFAULT 0,
  `sentence` int(11) DEFAULT 0,
  `recfine` int(11) DEFAULT 0,
  `recsentence` int(11) DEFAULT 0,
  `time` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_convictions: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_convictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_convictions` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_data
CREATE TABLE IF NOT EXISTS `mdt_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `cid` varchar(20) NOT NULL,
  `information` mediumtext DEFAULT NULL,
  `tags` text NOT NULL,
  `gallery` text NOT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  `pfp` text DEFAULT NULL,
  `fingerprint` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_data: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_data` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_impound
CREATE TABLE IF NOT EXISTS `mdt_impound` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `vehicleid` int(11) NOT NULL,
  `linkedreport` int(11) NOT NULL,
  `fee` int(11) DEFAULT NULL,
  `time` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_impound: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_impound` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_impound` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_incidents
CREATE TABLE IF NOT EXISTS `mdt_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) NOT NULL DEFAULT '',
  `title` varchar(50) NOT NULL DEFAULT '0',
  `details` text NOT NULL,
  `tags` text NOT NULL,
  `officersinvolved` text NOT NULL,
  `civsinvolved` text NOT NULL,
  `evidence` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) NOT NULL DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_incidents: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_incidents` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_incidents` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_logs
CREATE TABLE IF NOT EXISTS `mdt_logs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `text` text NOT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_logs: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_logs` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_reports
CREATE TABLE IF NOT EXISTS `mdt_reports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author` varchar(50) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `details` text DEFAULT NULL,
  `tags` text DEFAULT NULL,
  `officersinvolved` text DEFAULT NULL,
  `civsinvolved` text DEFAULT NULL,
  `gallery` text DEFAULT NULL,
  `time` varchar(20) DEFAULT NULL,
  `jobtype` varchar(25) DEFAULT 'police',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_reports: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_reports` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_reports` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.mdt_vehicleinfo
CREATE TABLE IF NOT EXISTS `mdt_vehicleinfo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(50) DEFAULT NULL,
  `information` text NOT NULL DEFAULT '',
  `stolen` tinyint(1) NOT NULL DEFAULT 0,
  `code5` tinyint(1) NOT NULL DEFAULT 0,
  `image` text NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.mdt_vehicleinfo: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `mdt_vehicleinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `mdt_vehicleinfo` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.occasion_vehicles
CREATE TABLE IF NOT EXISTS `occasion_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `seller` varchar(50) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `description` longtext DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `mods` text DEFAULT NULL,
  `occasionid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `occasionId` (`occasionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.occasion_vehicles: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `occasion_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `occasion_vehicles` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.owned_vehicles
CREATE TABLE IF NOT EXISTS `owned_vehicles` (
  `owner` varchar(40) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  `type` varchar(20) NOT NULL DEFAULT 'car',
  `job` varchar(20) DEFAULT NULL,
  `stored` tinyint(4) NOT NULL DEFAULT 0,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.owned_vehicles: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `owned_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `owned_vehicles` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.permissions
CREATE TABLE IF NOT EXISTS `permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `license` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.permissions: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `permissions` DISABLE KEYS */;
INSERT INTO `permissions` (`id`, `name`, `license`, `permission`) VALUES
	(1, 'Magnus', 'license:e09a6844b413de953550f798df3bf6e77cb08f6b', 'god');
/*!40000 ALTER TABLE `permissions` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.phone_gallery
CREATE TABLE IF NOT EXISTS `phone_gallery` (
  `citizenid` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `date` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.phone_gallery: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `phone_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_gallery` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.phone_invoices
CREATE TABLE IF NOT EXISTS `phone_invoices` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `amount` int(11) NOT NULL DEFAULT 0,
  `society` tinytext DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `sendercitizenid` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.phone_invoices: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `phone_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_invoices` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.phone_messages
CREATE TABLE IF NOT EXISTS `phone_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `messages` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `number` (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.phone_messages: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `phone_messages` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_messages` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.phone_tweets
CREATE TABLE IF NOT EXISTS `phone_tweets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `firstName` varchar(25) DEFAULT NULL,
  `lastName` varchar(25) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `date` datetime DEFAULT current_timestamp(),
  `url` text DEFAULT NULL,
  `picture` text DEFAULT './img/default.png',
  `tweetId` varchar(25) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.phone_tweets: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `phone_tweets` DISABLE KEYS */;
/*!40000 ALTER TABLE `phone_tweets` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.players
CREATE TABLE IF NOT EXISTS `players` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) NOT NULL,
  `cid` int(11) DEFAULT NULL,
  `license` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `money` text NOT NULL,
  `charinfo` text DEFAULT NULL,
  `job` text NOT NULL,
  `gang` text DEFAULT NULL,
  `position` text NOT NULL,
  `metadata` text NOT NULL,
  `inventory` longtext DEFAULT NULL,
  `last_updated` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`citizenid`),
  KEY `id` (`id`),
  KEY `last_updated` (`last_updated`),
  KEY `license` (`license`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.players: ~1 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` (`id`, `citizenid`, `cid`, `license`, `name`, `money`, `charinfo`, `job`, `gang`, `position`, `metadata`, `inventory`, `last_updated`, `phone_number`) VALUES
	(1, 'MQG45597', 1, 'license:e09a6844b413de953550f798df3bf6e77cb08f6b', 'Magnus', '{"cash":1000,"bank":125000,"crypto":0}', '{"gender":0,"backstory":"Karakter Baggrund","nationality":"asodasdkpioasd","cid":"1","firstname":"Karsten","account":"DK16DarkRP81079098","phone":33712343,"birthdate":"0040-10-11","lastname":"Kantstne"}', '{"label":"Arbejdsløs","onduty":true,"name":"unemployed","isboss":false,"payment":10,"grade":{"name":"Freelancer","level":0}}', '{"name":"none","label":"Ingen Bande","isboss":false,"grade":{"name":"none","level":0}}', '{"x":275.0637512207031,"y":-631.3846435546875,"z":13.0703125}', '{"injail":0,"armor":0,"dealerrep":0,"jobrep":{"trucker":0,"tow":0,"hotdog":0,"taxi":0},"jailitems":[],"commandbinds":{"F9":{"command":"admin","argument":""},"F2":{"command":"","argument":""},"F7":{"command":"","argument":""},"F5":{"command":"tpm","argument":""},"F6":{"command":"","argument":""},"F10":{"command":"","argument":""},"F3":{"command":"noclip","argument":""}},"craftingrep":0,"stress":0,"phone":[],"attachmentcraftingrep":0,"criminalrecord":{"hasRecord":false},"currentapartment":"apartment36014","licences":{"business":false,"weapon":false,"driver":true},"inside":{"apartment":{"apartmentId":"apartment36014","apartmentType":"apartment3"}},"phonedata":{"InstalledApps":[],"SerialNumber":81840450},"tracker":false,"inlaststand":false,"fitbit":[],"bloodtype":"O+","walletid":"DRP-572562","callsign":"INTET KALDESIGNAL","hunger":95.8,"isdead":false,"status":[],"thirst":96.2,"ishandcuffed":false,"fingerprint":"oB154d76iSR7247"}', '[{"info":{"gender":0,"lastname":"Kantstne","nationality":"asodasdkpioasd","citizenid":"MQG45597","birthdate":"0040-10-11","firstname":"Karsten"},"name":"id_card","slot":1,"amount":1,"type":"item"},{"info":{"lastname":"Kantstne","type":"Bil","birthdate":"0040-10-11","firstname":"Karsten"},"name":"driver_license","slot":2,"amount":1,"type":"item"},{"info":[],"name":"phone","slot":3,"amount":1,"type":"item"}]', '2022-03-25 15:53:00', NULL);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.playerskins
CREATE TABLE IF NOT EXISTS `playerskins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `skin` text NOT NULL,
  `active` tinyint(2) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `active` (`active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.playerskins: ~1 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `playerskins` DISABLE KEYS */;
INSERT INTO `playerskins` (`id`, `citizenid`, `model`, `skin`, `active`) VALUES
	(1, 'MQG45597', '1885233650', '{"ageing":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"vest":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"facemix":{"shapeMix":0,"defaultSkinMix":0.0,"skinMix":0,"defaultShapeMix":0.0},"bag":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hair":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"pants":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_4":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"arms":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"torso2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"ear":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"eyebrown_high":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"makeup":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"cheek_3":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"beard":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"watch":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"nose_5":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrows":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"cheek_2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eyebrown_forward":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lips_thickness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"shoes":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0},"bracelet":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"jaw_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"neck_thikness":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_hole":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"mask":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"lipstick":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"face2":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"eye_opening":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"chimp_bone_lowering":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"jaw_bone_back_lenght":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"cheek_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"glass":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_1":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"nose_0":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"moles":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"chimp_bone_width":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"decals":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"accessory":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"face":{"defaultTexture":0,"defaultItem":0,"item":0,"texture":0},"hat":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"blush":{"defaultTexture":1,"defaultItem":-1,"item":-1,"texture":1},"eye_color":{"defaultTexture":0,"defaultItem":-1,"item":-1,"texture":0},"t-shirt":{"defaultTexture":0,"defaultItem":1,"item":1,"texture":0}}', 1);
/*!40000 ALTER TABLE `playerskins` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_boats
CREATE TABLE IF NOT EXISTS `player_boats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `model` varchar(50) DEFAULT NULL,
  `plate` varchar(50) DEFAULT NULL,
  `boathouse` varchar(50) DEFAULT NULL,
  `fuel` int(11) NOT NULL DEFAULT 100,
  `state` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_boats: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_boats` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_boats` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_contacts
CREATE TABLE IF NOT EXISTS `player_contacts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `number` varchar(50) DEFAULT NULL,
  `iban` varchar(50) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_contacts: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_contacts` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_crops
CREATE TABLE IF NOT EXISTS `player_crops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coords` longtext DEFAULT NULL,
  `seed` varchar(100) NOT NULL,
  `water` double NOT NULL,
  `food` double NOT NULL,
  `stage` double NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_crops: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_crops` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_crops` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_houses
CREATE TABLE IF NOT EXISTS `player_houses` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `house` varchar(50) NOT NULL,
  `identifier` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `keyholders` text DEFAULT NULL,
  `decorations` text DEFAULT NULL,
  `stash` text DEFAULT NULL,
  `outfit` text DEFAULT NULL,
  `logout` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `house` (`house`),
  KEY `citizenid` (`citizenid`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_houses: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_houses` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_houses` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_mails
CREATE TABLE IF NOT EXISTS `player_mails` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `sender` varchar(50) DEFAULT NULL,
  `subject` varchar(50) DEFAULT NULL,
  `message` text DEFAULT NULL,
  `read` tinyint(4) DEFAULT 0,
  `mailid` int(11) DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp(),
  `button` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_mails: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_mails` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_mails` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_miningrigs
CREATE TABLE IF NOT EXISTS `player_miningrigs` (
  `id` varchar(50) NOT NULL,
  `citizenid` varchar(50) NOT NULL,
  `rig` text DEFAULT NULL,
  KEY `citizenid` (`citizenid`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_miningrigs: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_miningrigs` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_miningrigs` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_outfits
CREATE TABLE IF NOT EXISTS `player_outfits` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `citizenid` varchar(50) DEFAULT NULL,
  `outfitname` varchar(50) NOT NULL,
  `model` varchar(50) DEFAULT NULL,
  `skin` text DEFAULT NULL,
  `outfitId` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `citizenid` (`citizenid`),
  KEY `outfitId` (`outfitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_outfits: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_outfits` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_outfits` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.player_vehicles
CREATE TABLE IF NOT EXISTS `player_vehicles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `license` varchar(50) DEFAULT NULL,
  `citizenid` varchar(50) DEFAULT NULL,
  `vehicle` varchar(50) DEFAULT NULL,
  `hash` varchar(50) DEFAULT NULL,
  `mods` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `plate` varchar(15) NOT NULL,
  `fakeplate` varchar(50) DEFAULT NULL,
  `garage` varchar(50) DEFAULT 'pillboxgarage',
  `fuel` int(11) DEFAULT 100,
  `engine` float DEFAULT 1000,
  `body` float DEFAULT 1000,
  `state` int(11) DEFAULT 1,
  `depotprice` int(11) NOT NULL DEFAULT 0,
  `drivingdistance` int(50) DEFAULT NULL,
  `status` text DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_playervehicles_plate` (`plate`),
  KEY `plate` (`plate`),
  KEY `citizenid` (`citizenid`),
  KEY `license` (`license`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.player_vehicles: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `player_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `player_vehicles` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.rented_vehicles
CREATE TABLE IF NOT EXISTS `rented_vehicles` (
  `vehicle` varchar(60) NOT NULL,
  `plate` varchar(12) NOT NULL,
  `player_name` varchar(255) NOT NULL,
  `base_price` int(11) NOT NULL,
  `rent_price` int(11) NOT NULL,
  `owner` varchar(22) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.rented_vehicles: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `rented_vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `rented_vehicles` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.shops
CREATE TABLE IF NOT EXISTS `shops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `store` varchar(100) NOT NULL,
  `item` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.shops: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `shops` DISABLE KEYS */;
/*!40000 ALTER TABLE `shops` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.society_moneywash
CREATE TABLE IF NOT EXISTS `society_moneywash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) NOT NULL,
  `society` varchar(60) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.society_moneywash: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `society_moneywash` DISABLE KEYS */;
/*!40000 ALTER TABLE `society_moneywash` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.stashitems
CREATE TABLE IF NOT EXISTS `stashitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stash` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`stash`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.stashitems: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `stashitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `stashitems` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.trunkitems
CREATE TABLE IF NOT EXISTS `trunkitems` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) NOT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  PRIMARY KEY (`plate`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table darkrp.trunkitems: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `trunkitems` DISABLE KEYS */;
/*!40000 ALTER TABLE `trunkitems` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.users
CREATE TABLE IF NOT EXISTS `users` (
  `identifier` varchar(40) NOT NULL,
  `accounts` longtext DEFAULT NULL,
  `group` varchar(50) DEFAULT 'user',
  `inventory` longtext DEFAULT NULL,
  `job` varchar(20) DEFAULT 'unemployed',
  `job_grade` int(11) DEFAULT 0,
  `loadout` longtext DEFAULT NULL,
  `position` varchar(255) DEFAULT '{"x":-269.4,"y":-955.3,"z":31.2,"heading":205.8}',
  `firstname` varchar(16) DEFAULT NULL,
  `lastname` varchar(16) DEFAULT NULL,
  `dateofbirth` varchar(10) DEFAULT NULL,
  `sex` varchar(1) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `skin` longtext DEFAULT NULL,
  `status` longtext DEFAULT NULL,
  `is_dead` tinyint(1) DEFAULT 0,
  `phone_number` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.users: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.user_convictions
CREATE TABLE IF NOT EXISTS `user_convictions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `offense` varchar(255) DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.user_convictions: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `user_convictions` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_convictions` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.user_licenses
CREATE TABLE IF NOT EXISTS `user_licenses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(60) NOT NULL,
  `owner` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.user_licenses: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `user_licenses` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_licenses` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.user_mdt
CREATE TABLE IF NOT EXISTS `user_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `char_id` int(11) DEFAULT NULL,
  `notes` varchar(255) DEFAULT NULL,
  `mugshot_url` varchar(255) DEFAULT NULL,
  `bail` bit(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.user_mdt: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `user_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_mdt` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.user_parkings
CREATE TABLE IF NOT EXISTS `user_parkings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(60) DEFAULT NULL,
  `garage` varchar(60) DEFAULT NULL,
  `zone` int(11) NOT NULL,
  `vehicle` longtext DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.user_parkings: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `user_parkings` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_parkings` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.vehicles
CREATE TABLE IF NOT EXISTS `vehicles` (
  `name` varchar(60) NOT NULL,
  `model` varchar(60) NOT NULL,
  `price` int(11) NOT NULL,
  `category` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`model`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.vehicles: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `vehicles` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicles` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.vehicle_categories
CREATE TABLE IF NOT EXISTS `vehicle_categories` (
  `name` varchar(60) NOT NULL,
  `label` varchar(60) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.vehicle_categories: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `vehicle_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_categories` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.vehicle_mdt
CREATE TABLE IF NOT EXISTS `vehicle_mdt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `plate` varchar(255) DEFAULT NULL,
  `stolen` bit(1) DEFAULT b'0',
  `notes` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.vehicle_mdt: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `vehicle_mdt` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_mdt` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.vehicle_sold
CREATE TABLE IF NOT EXISTS `vehicle_sold` (
  `client` varchar(50) NOT NULL,
  `model` varchar(50) NOT NULL,
  `plate` varchar(50) NOT NULL,
  `soldby` varchar(50) NOT NULL,
  `date` varchar(50) NOT NULL,
  PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.vehicle_sold: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `vehicle_sold` DISABLE KEYS */;
/*!40000 ALTER TABLE `vehicle_sold` ENABLE KEYS */;

-- Dumping structure for tabel darkrp.weashops
CREATE TABLE IF NOT EXISTS `weashops` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `zone` varchar(255) NOT NULL,
  `item` varchar(255) NOT NULL,
  `price` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table darkrp.weashops: ~0 rows (tilnærmelsesvis)
/*!40000 ALTER TABLE `weashops` DISABLE KEYS */;
/*!40000 ALTER TABLE `weashops` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
