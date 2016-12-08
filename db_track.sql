-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.1.19-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table db_track.app_meta_data
DROP TABLE IF EXISTS `app_meta_data`;
CREATE TABLE IF NOT EXISTS `app_meta_data` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Tag` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Value` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Title` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TitleNp` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Serial` int(11) DEFAULT '1',
  `IsActive` tinyint(1) DEFAULT '1',
  `UpdateDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.app_meta_data: ~15 rows (approximately)
/*!40000 ALTER TABLE `app_meta_data` DISABLE KEYS */;
INSERT INTO `app_meta_data` (`ID`, `Tag`, `Value`, `Title`, `TitleNp`, `Serial`, `IsActive`, `UpdateDate`) VALUES
	(1, 'PatrolType', 'regular', 'Regular', 'दैनिक पट्रोल', 1, 1, '2016-03-15 12:48:12'),
	(2, 'PatrolType', 'special', 'Special', 'बिशेष अपरेशन', 1, 1, '2016-03-15 12:48:14'),
	(3, 'PatrolType', 'night', 'Night Patrol', 'रात्रि पट्रोल', 1, 1, '2016-03-15 12:48:16'),
	(4, 'PatrolOn', 'foot', 'Foot', 'पैदल', 1, 1, '2016-03-15 12:48:23'),
	(5, 'PatrolOn', 'cycle', 'Cycle', 'साईकल', 1, 1, '2016-03-15 12:48:25'),
	(6, 'PatrolOn', 'motercycle', 'Moter Cycle', 'मोटर साईकल ', 1, 1, '2016-03-15 12:48:26'),
	(7, 'PatrolOn', 'vehicle', 'Vehicle', 'सवारि साधन', 1, 1, '2016-03-15 12:48:28'),
	(8, 'EventType', 'fire', 'Fire', 'आगलागि', 1, 1, '2016-03-15 15:57:32'),
	(9, 'EventType', 'strike', 'Strike', 'धर्ना', 1, 1, '2016-03-15 15:57:54'),
	(10, 'EventType', 'damage', 'Damage', 'तोडफोड', 1, 1, '2016-03-15 15:58:24'),
	(11, 'EventType', 'theft', 'Theft', 'चोरि', 1, 1, '2016-03-15 16:00:12'),
	(12, 'EventType', 'landslide', 'Landslide', 'पहिरो', 1, 1, '2016-03-15 16:01:32'),
	(13, 'EventType', 'road_block ', 'Road Block', 'सडक बन्द', 1, 1, '2016-03-15 16:02:56'),
	(14, 'EventType', 'agm', 'Aam-Sabha', 'आमसभा', 1, 1, '2016-03-15 16:04:39'),
	(15, 'EventType', 'explosion', 'Explosion', 'बिस्फोट', 1, 1, '2016-03-15 16:05:25'),
	(16, 'EventType', 'firing', 'Firing', 'गोलि प्रहार', 1, 1, '2016-03-15 16:06:00');
/*!40000 ALTER TABLE `app_meta_data` ENABLE KEYS */;


-- Dumping structure for table db_track.event
DROP TABLE IF EXISTS `event`;
CREATE TABLE IF NOT EXISTS `event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RID` int(11) NOT NULL DEFAULT '0',
  `MobileID` int(11) NOT NULL DEFAULT '0',
  `Event` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EventDetail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EventImage` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Accuracy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreatedDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.event: ~0 rows (approximately)
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


-- Dumping structure for table db_track.event_image
DROP TABLE IF EXISTS `event_image`;
CREATE TABLE IF NOT EXISTS `event_image` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RID` int(11) NOT NULL DEFAULT '0',
  `MobileID` int(11) NOT NULL DEFAULT '0',
  `EventID` int(11) NOT NULL DEFAULT '0',
  `Title` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `FileName` varchar(50) COLLATE utf8_unicode_ci DEFAULT '',
  `UploadDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.event_image: ~0 rows (approximately)
/*!40000 ALTER TABLE `event_image` DISABLE KEYS */;
/*!40000 ALTER TABLE `event_image` ENABLE KEYS */;


-- Dumping structure for table db_track.mobile
DROP TABLE IF EXISTS `mobile`;
CREATE TABLE IF NOT EXISTS `mobile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StaffID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `Email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PassCode` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `Detail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '0',
  `VerifiedBy` int(11) DEFAULT '0',
  `VerifiedDate` timestamp NULL DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.mobile: ~2 rows (approximately)
/*!40000 ALTER TABLE `mobile` DISABLE KEYS */;
INSERT INTO `mobile` (`ID`, `StaffID`, `PhoneNo`, `Email`, `PassCode`, `Detail`, `IsActive`, `VerifiedBy`, `VerifiedDate`, `UploadDate`) VALUES
	(1, '2513', 2147483647, 'rabishrestha@hotmail.com', '', NULL, 1, 0, NULL, '2016-04-03 13:14:39'),
	(2, '1422', 2147483647, 'jeewan1422@hq.apf', '', NULL, 1, 0, NULL, '2016-04-08 17:14:08'),
	(3, '3588', 2147483647, 'he@me.com', 'test123', NULL, 1, 0, NULL, '2016-04-14 15:05:33');
/*!40000 ALTER TABLE `mobile` ENABLE KEYS */;


-- Dumping structure for table db_track.patrol
DROP TABLE IF EXISTS `patrol`;
CREATE TABLE IF NOT EXISTS `patrol` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RID` int(11) NOT NULL,
  `MobileID` int(11) DEFAULT NULL,
  `CaseTitle` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PatrolType` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `PatrolOn` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `TotalNafri` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `StartDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `EndDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UploadDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.patrol: ~2 rows (approximately)
/*!40000 ALTER TABLE `patrol` DISABLE KEYS */;
INSERT INTO `patrol` (`ID`, `RID`, `MobileID`, `CaseTitle`, `PatrolType`, `PatrolOn`, `TotalNafri`, `StartDate`, `EndDate`, `UploadDate`) VALUES
	(1, 1, 3, 'test track', 'regular', 'vehicle', '10', '2016-04-14 09:21:02', '', '2016-04-14 15:06:05');
/*!40000 ALTER TABLE `patrol` ENABLE KEYS */;


-- Dumping structure for table db_track.patrol_track
DROP TABLE IF EXISTS `patrol_track`;
CREATE TABLE IF NOT EXISTS `patrol_track` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RID` int(11) NOT NULL DEFAULT '0',
  `MobileID` int(11) NOT NULL,
  `PatrolID` int(11) DEFAULT NULL,
  `Lat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GpsDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Accuracy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=96 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.patrol_track: ~14 rows (approximately)
/*!40000 ALTER TABLE `patrol_track` DISABLE KEYS */;
INSERT INTO `patrol_track` (`ID`, `RID`, `MobileID`, `PatrolID`, `Lat`, `Lon`, `GpsDate`, `Accuracy`, `UploadDate`) VALUES
	(80, 1, 3, 1, '27.733983333333338', '85.31192666666666', '2016-04-14 09:21:38', '1', '2016-04-14 15:06:40'),
	(81, 2, 3, 1, '27.733983333333338', '85.29991', '2016-04-14 09:21:43', '1', '2016-04-14 15:06:45'),
	(82, 3, 3, 1, '27.73210333333333', '85.29991', '2016-04-14 09:22:32', '1', '2016-04-14 15:07:35'),
	(83, 4, 3, 1, '27.73210333333333', '85.29823666666668', '2016-04-14 09:22:38', '1', '2016-04-14 15:07:40'),
	(84, 5, 3, 1, '27.731076666666663', '85.29823666666668', '2016-04-14 09:23:02', '1', '2016-04-14 15:08:05'),
	(85, 6, 3, 1, '27.731076666666663', '85.29349500000002', '2016-04-14 09:23:07', '1', '2016-04-14 15:08:10'),
	(86, 7, 3, 1, '27.729995', '85.29349500000002', '2016-04-14 09:23:38', '1', '2016-04-14 15:08:40'),
	(87, 8, 3, 1, '27.729995', '85.29373166666667', '2016-04-14 09:29:45', '1', '2016-04-14 15:14:49'),
	(88, 9, 3, 1, '27.72585333333333', '85.29373166666667', '2016-04-14 09:30:23', '1', '2016-04-14 15:15:24'),
	(89, 10, 3, 1, '27.72585333333333', '85.29617666666667', '2016-04-14 09:30:29', '1', '2016-04-14 15:15:29'),
	(90, 11, 3, 1, '27.72585333333333', '85.29617666666667', '2016-04-14 09:32:27', '1', '2016-04-14 15:17:30'),
	(91, 12, 3, 1, '27.72585333333333', '85.29617666666667', '2016-04-14 09:37:33', '1', '2016-04-14 15:22:38'),
	(93, 14, 3, 1, '27.706231666666667', '85.288495', '2016-05-24 06:31:48', '1', '2016-05-24 12:16:53'),
	(94, 15, 3, 1, '27.706535', '85.28707833333334', '2016-05-24 06:31:56', '1', '2016-05-24 12:16:58'),
	(95, 16, 3, 1, '27.706896666666662', '85.28549166666666', '2016-05-24 06:32:04', '1', '2016-05-24 12:17:08');
/*!40000 ALTER TABLE `patrol_track` ENABLE KEYS */;


-- Dumping structure for procedure db_track.sp_clear
DROP PROCEDURE IF EXISTS `sp_clear`;
DELIMITER //
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_clear`()
BEGIN
	delete from event;
	delete from patrol;
	delete from patrol_track;
	delete from v_error_log;

	delete from mobile where id>2;
	ALTER TABLE `mobile`	AUTO_INCREMENT=3;

END//
DELIMITER ;


-- Dumping structure for table db_track.v_error_log
DROP TABLE IF EXISTS `v_error_log`;
CREATE TABLE IF NOT EXISTS `v_error_log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ErrorSql` mediumtext COLLATE utf8_unicode_ci,
  `IsProcessed` tinyint(1) DEFAULT '0' COMMENT '0=>not processed , 1=>processed , 2 ==>error in processing ',
  `ReceiveTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.v_error_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `v_error_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `v_error_log` ENABLE KEYS */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
