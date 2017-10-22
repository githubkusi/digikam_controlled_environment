-- MySQL dump 10.15  Distrib 10.0.31-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: digikam_devel_core
-- ------------------------------------------------------
-- Server version	10.0.31-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `AlbumRoots`
--

DROP TABLE IF EXISTS `AlbumRoots`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AlbumRoots` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `status` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `identifier` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `specificPath` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`(127),`specificPath`(128))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AlbumRoots`
--

LOCK TABLES `AlbumRoots` WRITE;
/*!40000 ALTER TABLE `AlbumRoots` DISABLE KEYS */;
INSERT INTO `AlbumRoots` VALUES (1,'pics',0,1,'volumeid:?uuid=a2eb43b6-9a15-4906-b2e7-884579e441bf','/kusi/develop/digikam/digikam_fresh_db/pics');
/*!40000 ALTER TABLE `AlbumRoots` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Albums`
--

DROP TABLE IF EXISTS `Albums`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Albums` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `albumRoot` int(11) NOT NULL,
  `relativePath` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `date` date DEFAULT NULL,
  `caption` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `collection` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `icon` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `albumRoot` (`albumRoot`,`relativePath`(255)),
  KEY `Albums_Images` (`icon`),
  CONSTRAINT `Albums_AlbumRoots` FOREIGN KEY (`albumRoot`) REFERENCES `AlbumRoots` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Albums_Images` FOREIGN KEY (`icon`) REFERENCES `Images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Albums`
--

LOCK TABLES `Albums` WRITE;
/*!40000 ALTER TABLE `Albums` DISABLE KEYS */;
INSERT INTO `Albums` VALUES (1,1,'/','2017-10-23',NULL,NULL,NULL);
/*!40000 ALTER TABLE `Albums` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DownloadHistory`
--

DROP TABLE IF EXISTS `DownloadHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DownloadHistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `filename` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `filesize` bigint(20) DEFAULT NULL,
  `filedate` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `identifier` (`identifier`(164),`filename`(165),`filesize`,`filedate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DownloadHistory`
--

LOCK TABLES `DownloadHistory` WRITE;
/*!40000 ALTER TABLE `DownloadHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `DownloadHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageComments`
--

DROP TABLE IF EXISTS `ImageComments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageComments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageid` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `language` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin DEFAULT NULL,
  `author` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `date` datetime DEFAULT NULL,
  `comment` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imageid` (`imageid`,`type`,`language`,`author`(202)),
  KEY `comments_imageid_index` (`imageid`),
  CONSTRAINT `ImageComments_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageComments`
--

LOCK TABLES `ImageComments` WRITE;
/*!40000 ALTER TABLE `ImageComments` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageComments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageCopyright`
--

DROP TABLE IF EXISTS `ImageCopyright`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageCopyright` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `imageid` int(11) DEFAULT NULL,
  `property` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `extraValue` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`id`),
  UNIQUE KEY `imageid` (`imageid`,`property`(110),`value`(111),`extraValue`(111)),
  KEY `copyright_imageid_index` (`imageid`),
  CONSTRAINT `ImageCopyright_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageCopyright`
--

LOCK TABLES `ImageCopyright` WRITE;
/*!40000 ALTER TABLE `ImageCopyright` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageCopyright` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageHaarMatrix`
--

DROP TABLE IF EXISTS `ImageHaarMatrix`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageHaarMatrix` (
  `imageid` int(11) NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `uniqueHash` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `matrix` longblob,
  PRIMARY KEY (`imageid`),
  CONSTRAINT `ImageHaarMatrix_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageHaarMatrix`
--

LOCK TABLES `ImageHaarMatrix` WRITE;
/*!40000 ALTER TABLE `ImageHaarMatrix` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageHaarMatrix` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageHistory`
--

DROP TABLE IF EXISTS `ImageHistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageHistory` (
  `imageid` int(11) NOT NULL,
  `uuid` varchar(128) DEFAULT NULL,
  `history` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`imageid`),
  KEY `uuid_index` (`uuid`),
  CONSTRAINT `ImageHistory_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageHistory`
--

LOCK TABLES `ImageHistory` WRITE;
/*!40000 ALTER TABLE `ImageHistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageHistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageInformation`
--

DROP TABLE IF EXISTS `ImageInformation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageInformation` (
  `imageid` int(11) NOT NULL,
  `rating` int(11) DEFAULT NULL,
  `creationDate` datetime DEFAULT NULL,
  `digitizationDate` datetime DEFAULT NULL,
  `orientation` int(11) DEFAULT NULL,
  `width` int(11) DEFAULT NULL,
  `height` int(11) DEFAULT NULL,
  `format` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `colorDepth` int(11) DEFAULT NULL,
  `colorModel` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageid`),
  KEY `creationdate_index` (`creationDate`),
  CONSTRAINT `ImageInformation_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageInformation`
--

LOCK TABLES `ImageInformation` WRITE;
/*!40000 ALTER TABLE `ImageInformation` DISABLE KEYS */;
INSERT INTO `ImageInformation` VALUES (1,-1,'2017-10-23 01:54:14',NULL,0,100,100,'PNG',8,1),(2,-1,'2017-10-23 01:55:17',NULL,0,170,170,'JPG',8,5),(3,-1,'2017-10-23 01:57:08',NULL,0,484,500,'JPG',8,5);
/*!40000 ALTER TABLE `ImageInformation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageMetadata`
--

DROP TABLE IF EXISTS `ImageMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageMetadata` (
  `imageid` int(11) NOT NULL,
  `make` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `model` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `lens` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `aperture` double DEFAULT NULL,
  `focalLength` double DEFAULT NULL,
  `focalLength35` double DEFAULT NULL,
  `exposureTime` double DEFAULT NULL,
  `exposureProgram` int(11) DEFAULT NULL,
  `exposureMode` int(11) DEFAULT NULL,
  `sensitivity` int(11) DEFAULT NULL,
  `flash` int(11) DEFAULT NULL,
  `whiteBalance` int(11) DEFAULT NULL,
  `whiteBalanceColorTemperature` int(11) DEFAULT NULL,
  `meteringMode` int(11) DEFAULT NULL,
  `subjectDistance` double DEFAULT NULL,
  `subjectDistanceCategory` int(11) DEFAULT NULL,
  PRIMARY KEY (`imageid`),
  CONSTRAINT `ImageMetadata_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageMetadata`
--

LOCK TABLES `ImageMetadata` WRITE;
/*!40000 ALTER TABLE `ImageMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImagePositions`
--

DROP TABLE IF EXISTS `ImagePositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImagePositions` (
  `imageid` int(11) NOT NULL,
  `latitude` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `latitudeNumber` double DEFAULT NULL,
  `longitude` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `longitudeNumber` double DEFAULT NULL,
  `altitude` double DEFAULT NULL,
  `orientation` double DEFAULT NULL,
  `tilt` double DEFAULT NULL,
  `roll` double DEFAULT NULL,
  `accuracy` double DEFAULT NULL,
  `description` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  PRIMARY KEY (`imageid`),
  CONSTRAINT `ImagePositions_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImagePositions`
--

LOCK TABLES `ImagePositions` WRITE;
/*!40000 ALTER TABLE `ImagePositions` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImagePositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageProperties`
--

DROP TABLE IF EXISTS `ImageProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageProperties` (
  `imageid` int(11) NOT NULL,
  `property` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  UNIQUE KEY `imageid` (`imageid`,`property`(255)),
  CONSTRAINT `ImageProperties_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageProperties`
--

LOCK TABLES `ImageProperties` WRITE;
/*!40000 ALTER TABLE `ImageProperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageRelations`
--

DROP TABLE IF EXISTS `ImageRelations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageRelations` (
  `subject` int(11) DEFAULT NULL,
  `object` int(11) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  UNIQUE KEY `subject` (`subject`,`object`,`type`),
  KEY `subject_relations_index` (`subject`),
  KEY `object_relations_index` (`object`),
  CONSTRAINT `ImageRelations_ImagesO` FOREIGN KEY (`object`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ImageRelations_ImagesS` FOREIGN KEY (`subject`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageRelations`
--

LOCK TABLES `ImageRelations` WRITE;
/*!40000 ALTER TABLE `ImageRelations` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageRelations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageTagProperties`
--

DROP TABLE IF EXISTS `ImageTagProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageTagProperties` (
  `imageid` int(11) DEFAULT NULL,
  `tagid` int(11) DEFAULT NULL,
  `property` text CHARACTER SET utf8 COLLATE utf8_bin,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  KEY `imagetagproperties_index` (`imageid`,`tagid`),
  KEY `imagetagproperties_imageid_index` (`imageid`),
  KEY `imagetagproperties_tagid_index` (`tagid`),
  CONSTRAINT `ImageTagProperties_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ImageTagProperties_Tags` FOREIGN KEY (`tagid`) REFERENCES `Tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageTagProperties`
--

LOCK TABLES `ImageTagProperties` WRITE;
/*!40000 ALTER TABLE `ImageTagProperties` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageTagProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ImageTags`
--

DROP TABLE IF EXISTS `ImageTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ImageTags` (
  `imageid` int(11) NOT NULL,
  `tagid` int(11) NOT NULL,
  UNIQUE KEY `imageid` (`imageid`,`tagid`),
  KEY `tag_index` (`tagid`),
  KEY `tag_id_index` (`imageid`),
  CONSTRAINT `ImageTags_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `ImageTags_Tags` FOREIGN KEY (`tagid`) REFERENCES `Tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ImageTags`
--

LOCK TABLES `ImageTags` WRITE;
/*!40000 ALTER TABLE `ImageTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `ImageTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Images`
--

DROP TABLE IF EXISTS `Images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `album` int(11) DEFAULT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `status` int(11) NOT NULL,
  `category` int(11) NOT NULL,
  `modificationDate` datetime DEFAULT NULL,
  `fileSize` bigint(20) DEFAULT NULL,
  `uniqueHash` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `album` (`album`,`name`(255)),
  KEY `dir_index` (`album`),
  KEY `hash_index` (`uniqueHash`),
  KEY `image_name_index` (`name`(255)),
  CONSTRAINT `Images_Albums` FOREIGN KEY (`album`) REFERENCES `Albums` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Images`
--

LOCK TABLES `Images` WRITE;
/*!40000 ALTER TABLE `Images` DISABLE KEYS */;
INSERT INTO `Images` VALUES (1,1,'lifeboat-clipart-lifesaver-redwhiteblue-th.png',1,1,'2017-10-23 01:54:14',7041,'39cebcf4a2bfb1c0663dbec7f4a01a93'),(2,1,'lifesaver-clipart-gg65486572.jpg',1,1,'2017-10-23 01:55:17',7235,'03630a65c3afbb2bd370ec159dc088b3'),(3,1,'monkey-cartoon-142.jpg',1,1,'2017-10-23 01:57:08',37738,'be0abc9d34c0e83bee1fd61c118fc148');
/*!40000 ALTER TABLE `Images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Searches`
--

DROP TABLE IF EXISTS `Searches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Searches` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `query` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Searches`
--

LOCK TABLES `Searches` WRITE;
/*!40000 ALTER TABLE `Searches` DISABLE KEYS */;
/*!40000 ALTER TABLE `Searches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Settings`
--

DROP TABLE IF EXISTS `Settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Settings` (
  `keyword` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  UNIQUE KEY `keyword` (`keyword`(255))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Settings`
--

LOCK TABLES `Settings` WRITE;
/*!40000 ALTER TABLE `Settings` DISABLE KEYS */;
INSERT INTO `Settings` VALUES ('preAlpha010Update1','true'),('preAlpha010Update2','true'),('preAlpha010Update3','true'),('beta010Update1','true'),('beta010Update2','true'),('uniqueHashVersion','2'),('databaseImageFormats','jpg;jpeg;jpe;jp2;j2k;jpx;jpc;pgx;tif;tiff;png;gif;xpm;ppm;pnm;pgf;bmp;xcf;pcx;webp;bay;bmq;cr2;crw;cs1;dc2;dcr;dng;erf;fff;hdr;k25;kdc;mdc;mos;mrw;nef;orf;pef;pxn;raf;raw;rdc;sr2;srf;x3f;arw;3fr;cine;ia;kc2;mef;nrw;qtk;rw2;sti;rwl;srw;'),('databaseVideoFormats','mpeg;mpg;mpo;mpe;mts;vob;avi;divx;wmv;wmf;asf;mp4;3gp;mov;3g2;m4v;m2v;mkv;webm;mng'),('databaseAudioFormats','ogg;mp3;wma;wav'),('databaseIgnoreDirectoryFormats','@eaDir'),('FilterSettingsVersion','6'),('DcrawFilterSettingsVersion','4'),('DBVersion','8'),('DBVersionRequired','8'),('databaseUUID','{41dca3f8-c5a6-4f94-9bc0-5168373f1f61}'),('Locale','UTF-8'),('DeleteRemovedCompleteScanCount','2'),('Scanned','2017-10-23T02:04:37');
/*!40000 ALTER TABLE `Settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TagProperties`
--

DROP TABLE IF EXISTS `TagProperties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TagProperties` (
  `tagid` int(11) DEFAULT NULL,
  `property` text CHARACTER SET utf8 COLLATE utf8_bin,
  `value` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  KEY `tagproperties_index` (`tagid`),
  CONSTRAINT `TagProperties_Tags` FOREIGN KEY (`tagid`) REFERENCES `Tags` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TagProperties`
--

LOCK TABLES `TagProperties` WRITE;
/*!40000 ALTER TABLE `TagProperties` DISABLE KEYS */;
INSERT INTO `TagProperties` VALUES (1,'internalTag',NULL),(2,'internalTag',NULL),(3,'internalTag',NULL),(4,'internalTag',NULL),(5,'internalTag',NULL),(6,'internalTag',NULL);
/*!40000 ALTER TABLE `TagProperties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Tags`
--

DROP TABLE IF EXISTS `Tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT NULL,
  `name` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `icon` int(11) DEFAULT NULL,
  `iconkde` longtext CHARACTER SET utf8 COLLATE utf8_bin,
  `lft` int(11) NOT NULL,
  `rgt` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pid` (`pid`,`name`(100)),
  KEY `Tags_Images` (`icon`),
  CONSTRAINT `Tags_Images` FOREIGN KEY (`icon`) REFERENCES `Images` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Tags`
--

LOCK TABLES `Tags` WRITE;
/*!40000 ALTER TABLE `Tags` DISABLE KEYS */;
INSERT INTO `Tags` VALUES (0,-1,'_Digikam_root_tag_',NULL,NULL,1,14),(1,0,'_Digikam_Internal_Tags_',NULL,NULL,2,13),(2,1,'Intermediate Version',NULL,NULL,11,12),(3,1,'Current Version',NULL,NULL,9,10),(4,1,'Version Always Visible',NULL,NULL,7,8),(5,1,'Need Resolving History',NULL,NULL,5,6),(6,1,'Need Tagging History Graph',NULL,NULL,3,4);
/*!40000 ALTER TABLE `Tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `TagsTree`
--

DROP TABLE IF EXISTS `TagsTree`;
/*!50001 DROP VIEW IF EXISTS `TagsTree`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `TagsTree` (
  `id` tinyint NOT NULL,
  `pid` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `VideoMetadata`
--

DROP TABLE IF EXISTS `VideoMetadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `VideoMetadata` (
  `imageid` int(11) NOT NULL,
  `aspectRatio` text,
  `audioBitRate` text,
  `audioChannelType` text,
  `audioCompressor` text,
  `duration` text,
  `frameRate` text,
  `exposureProgram` int(11) DEFAULT NULL,
  `videoCodec` text,
  PRIMARY KEY (`imageid`),
  CONSTRAINT `VideoMetadata_Images` FOREIGN KEY (`imageid`) REFERENCES `Images` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `VideoMetadata`
--

LOCK TABLES `VideoMetadata` WRITE;
/*!40000 ALTER TABLE `VideoMetadata` DISABLE KEYS */;
/*!40000 ALTER TABLE `VideoMetadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `TagsTree`
--

/*!50001 DROP TABLE IF EXISTS `TagsTree`*/;
/*!50001 DROP VIEW IF EXISTS `TagsTree`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`dkuser`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `TagsTree` AS select `Tags`.`id` AS `id`,`Tags`.`pid` AS `pid` from `Tags` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-10-23  2:06:40
