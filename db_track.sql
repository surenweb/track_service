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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.event: ~0 rows (approximately)
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` (`ID`, `RID`, `MobileID`, `Event`, `EventDetail`, `EventImage`, `Lat`, `Lon`, `Accuracy`, `CreatedDate`, `UploadDate`) VALUES
	(1, 1, 1001, 'damage', 'tod fod bhayo ', '', '27.719598333333337', '12.359998333333332', '1.0', '2016-03-16 10:49:21', '2016-03-16 16:34:20'),
	(2, 2, 1001, 'landslide', '', '', '27.719598333333337', '12.359998333333332', '1.0', '2016-03-16 10:51:26', '2016-03-16 16:36:25');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;


-- Dumping structure for table db_track.event_image
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
CREATE TABLE IF NOT EXISTS `mobile` (
  `ID` int(11) NOT NULL,
  `StaffID` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `PhoneNo` int(11) DEFAULT NULL,
  `Detail` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `IsActive` tinyint(1) DEFAULT '1',
  `VerifiedBy` int(11) DEFAULT '1',
  `VerifiedDate` timestamp NULL DEFAULT NULL,
  `UploadDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.patrol: ~0 rows (approximately)
/*!40000 ALTER TABLE `patrol` DISABLE KEYS */;
INSERT INTO `patrol` (`ID`, `RID`, `MobileID`, `CaseTitle`, `PatrolType`, `PatrolOn`, `TotalNafri`, `StartDate`, `EndDate`, `UploadDate`) VALUES
	(1, 1, 1001, 'hello', 'special', 'cycle', '5', '2016-03-16 10:46:05', '', '2016-03-16 16:31:05');
/*!40000 ALTER TABLE `patrol` ENABLE KEYS */;


-- Dumping structure for table db_track.patrol_track
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- Dumping data for table db_track.patrol_track: ~0 rows (approximately)
/*!40000 ALTER TABLE `patrol_track` DISABLE KEYS */;
INSERT INTO `patrol_track` (`ID`, `RID`, `MobileID`, `PatrolID`, `Lat`, `Lon`, `GpsDate`, `Accuracy`, `UploadDate`) VALUES
	(1, 1, 1001, 1, '27.719598333333337', '12.359998333333332', '2016-03-16 10:48:13', '1', '2016-03-16 16:33:15');
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
