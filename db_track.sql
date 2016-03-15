-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.21 - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL Version:             9.1.0.4867
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- Dumping structure for table db_track.app_meta_data
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

-- Dumping data for table db_track.app_meta_data: ~16 rows (approximately)
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
CREATE TABLE IF NOT EXISTS `event` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
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


-- Dumping structure for table db_track.mobile
CREATE TABLE IF NOT EXISTS `mobile` (
  `ID` int(11) NOT NULL,
  `StaffID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `Detail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.mobile: ~0 rows (approximately)
/*!40000 ALTER TABLE `mobile` DISABLE KEYS */;
/*!40000 ALTER TABLE `mobile` ENABLE KEYS */;


-- Dumping structure for table db_track.patrol
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.patrol: ~0 rows (approximately)
/*!40000 ALTER TABLE `patrol` DISABLE KEYS */;
INSERT INTO `patrol` (`ID`, `RID`, `MobileID`, `CaseTitle`, `PatrolType`, `PatrolOn`, `TotalNafri`, `StartDate`, `EndDate`, `UploadDate`) VALUES
	(1, 1, 1001, 'case-swayambhu', 'LRP', 'Motercycle', '10', '2016-03-13 11:04:05', '', '2016-03-13 16:49:28'),
	(2, 1, 9999, 'test', 'रात्रि पट्रोल', 'साईकल', '34', '2016-03-15 10:45:16', '', '2016-03-15 16:43:02');
/*!40000 ALTER TABLE `patrol` ENABLE KEYS */;


-- Dumping structure for table db_track.patrol_track
CREATE TABLE IF NOT EXISTS `patrol_track` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RID` int(11) NOT NULL,
  `PatrolID` int(11) DEFAULT NULL,
  `Lat` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Lon` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `GpsDate` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Accuracy` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.patrol_track: ~26 rows (approximately)
/*!40000 ALTER TABLE `patrol_track` DISABLE KEYS */;
INSERT INTO `patrol_track` (`ID`, `RID`, `PatrolID`, `Lat`, `Lon`, `GpsDate`, `Accuracy`, `UploadDate`) VALUES
	(1, 1, 1, '27.71818', '85.283055', '2016-03-13 11:04:31', '1', '2016-03-13 16:49:53'),
	(2, 2, 1, '27.717876666666665', '85.28383833333334', '2016-03-13 11:04:59', '1', '2016-03-13 16:50:23'),
	(3, 3, 1, '27.717039999999997', '85.28373166666667', '2016-03-13 11:05:11', '1', '2016-03-13 16:50:33'),
	(4, 4, 1, '27.716451666666664', '85.28360333333333', '2016-03-13 11:05:25', '1', '2016-03-13 16:50:48'),
	(5, 5, 1, '27.716888333333333', '85.28467500000001', '2016-03-13 11:05:31', '1', '2016-03-13 16:50:58'),
	(6, 6, 1, '27.717306666666666', '85.28626333333335', '2016-03-13 11:05:34', '1', '2016-03-13 16:50:58'),
	(7, 7, 1, '27.718218333333333', '85.28930999999999', '2016-03-13 11:05:37', '1', '2016-03-13 16:51:03'),
	(8, 8, 1, '27.717800000000004', '85.29006166666667', '2016-03-13 11:05:40', '1', '2016-03-13 16:51:03'),
	(9, 9, 1, '27.717135', '85.29117666666667', '2016-03-13 11:05:43', '1', '2016-03-13 16:51:08'),
	(10, 10, 1, '27.71692666666667', '85.29233666666666', '2016-03-13 11:05:46', '1', '2016-03-13 16:51:08'),
	(11, 11, 1, '27.714589999999998', '85.29319500000001', '2016-03-13 11:05:49', '1', '2016-03-13 16:51:13'),
	(12, 12, 1, '27.71396333333333', '85.29356000000001', '2016-03-13 11:05:52', '1', '2016-03-13 16:51:18'),
	(13, 13, 1, '27.713431666666665', '85.29366666666668', '2016-03-13 11:06:10', '1', '2016-03-13 16:51:33'),
	(14, 14, 1, '27.713773333333332', '85.29293666666666', '2016-03-13 11:06:16', '1', '2016-03-13 16:51:43'),
	(15, 15, 1, '27.713431666666665', '85.29139166666667', '2016-03-13 11:06:27', '1', '2016-03-13 16:51:53'),
	(16, 16, 1, '27.71291833333333', '85.289825', '2016-03-13 11:06:31', '1', '2016-03-13 16:51:58'),
	(17, 17, 1, '27.713755', '85.28866666666666', '2016-03-13 11:06:34', '1', '2016-03-13 16:51:58'),
	(18, 18, 1, '27.714589999999998', '85.28660666666669', '2016-03-13 11:06:39', '1', '2016-03-13 16:52:03'),
	(19, 19, 1, '27.715083333333336', '85.28553333333333', '2016-03-13 11:06:45', '1', '2016-03-13 16:52:08'),
	(20, 20, 1, '27.714875', '85.28469666666666', '2016-03-13 11:06:51', '1', '2016-03-13 16:52:18'),
	(21, 21, 1, '27.714780000000005', '85.28343166666667', '2016-03-13 11:06:55', '1', '2016-03-13 16:52:18'),
	(22, 22, 1, '27.71419166666667', '85.28115666666666', '2016-03-13 11:06:59', '1', '2016-03-13 16:52:23'),
	(23, 23, 1, '27.714988333333334', '85.28115666666666', '2016-03-13 11:07:05', '1', '2016-03-13 16:52:28'),
	(24, 24, 1, '27.71552166666667', '85.28197166666665', '2016-03-13 11:07:09', '1', '2016-03-13 16:52:33'),
	(25, 25, 1, '27.715558333333334', '85.28008333333334', '2016-03-13 11:07:13', '1', '2016-03-13 16:52:38'),
	(26, 26, 1, '27.716528333333333', '85.280985', '2016-03-13 11:07:19', '1', '2016-03-13 16:52:43'),
	(27, 27, 1, '27.71726833333333', '85.28070666666666', '2016-03-13 11:07:25', '1', '2016-03-13 16:52:48'),
	(28, 28, 1, '27.71799', '85.27914000000001', '2016-03-13 11:07:31', '1', '2016-03-13 16:52:58'),
	(29, 29, 1, '27.71895833333333', '85.27967666666667', '2016-03-13 11:07:45', '1', '2016-03-13 16:53:08'),
	(30, 30, 1, '27.717609999999997', '85.28242333333334', '2016-03-13 11:07:56', '1', '2016-03-13 16:53:23'),
	(32, 2, 1, '65.9667', '-18.5333', '2016-03-15 11:03:32', '1', '2016-03-15 17:01:52');
/*!40000 ALTER TABLE `patrol_track` ENABLE KEYS */;


-- Dumping structure for table db_track.v_error_log
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
