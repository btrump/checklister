-- MySQL dump 10.13  Distrib 5.5.32, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: checklister
-- ------------------------------------------------------
-- Server version	5.5.32-0ubuntu0.13.04.1

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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add permission',1,'add_permission'),(2,'Can change permission',1,'change_permission'),(3,'Can delete permission',1,'delete_permission'),(4,'Can add group',2,'add_group'),(5,'Can change group',2,'change_group'),(6,'Can delete group',2,'delete_group'),(7,'Can add user',3,'add_user'),(8,'Can change user',3,'change_user'),(9,'Can delete user',3,'delete_user'),(10,'Can add content type',4,'add_contenttype'),(11,'Can change content type',4,'change_contenttype'),(12,'Can delete content type',4,'delete_contenttype'),(13,'Can add session',5,'add_session'),(14,'Can change session',5,'change_session'),(15,'Can delete session',5,'delete_session'),(16,'Can add site',6,'add_site'),(17,'Can change site',6,'change_site'),(18,'Can delete site',6,'delete_site'),(19,'Can add log entry',7,'add_logentry'),(20,'Can change log entry',7,'change_logentry'),(21,'Can delete log entry',7,'delete_logentry'),(22,'Can add event',8,'add_event'),(23,'Can change event',8,'change_event'),(24,'Can delete event',8,'delete_event'),(25,'Can add checklist',9,'add_checklist'),(26,'Can change checklist',9,'change_checklist'),(27,'Can delete checklist',9,'delete_checklist'),(28,'Can add checklist item',10,'add_checklistitem'),(29,'Can change checklist item',10,'change_checklistitem'),(30,'Can delete checklist item',10,'delete_checklistitem'),(31,'Can add item',11,'add_item'),(32,'Can change item',11,'change_item'),(33,'Can delete item',11,'delete_item'),(34,'Can add inventory',12,'add_inventory'),(35,'Can change inventory',12,'change_inventory'),(36,'Can delete inventory',12,'delete_inventory'),(37,'Can add item entry',13,'add_itementry'),(38,'Can change item entry',13,'change_itementry'),(39,'Can delete item entry',13,'delete_itementry'),(40,'Can add migration history',14,'add_migrationhistory'),(41,'Can change migration history',14,'change_migrationhistory'),(42,'Can delete migration history',14,'delete_migrationhistory');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$10000$0urD6av11d0H$89qVRbDRYHOCXMnl1qb4D05bMc4Dq7CWWCW1OEYLirI=','2013-08-26 18:23:52',1,'blair','','','',1,1,'2013-08-26 18:23:30');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`),
  CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2013-08-26 18:24:06',1,8,'1','The Hardest We\'ve Gone\'s Nerdy Little Sister with Glasses',1,''),(2,'2013-08-26 18:24:32',1,12,'1','Manifest Destiny',1,''),(3,'2013-08-26 18:24:49',1,11,'1','Molly',1,''),(4,'2013-08-26 18:24:54',1,13,'1','Molly',1,''),(5,'2013-08-26 18:25:39',1,11,'2','Liquor',1,''),(6,'2013-08-26 18:25:43',1,13,'2','Liquor',1,''),(7,'2013-08-26 18:26:04',1,11,'3','Bud',1,''),(8,'2013-08-26 18:26:08',1,13,'3','Bud',1,''),(9,'2013-08-26 18:26:35',1,11,'4','Gatorade',1,''),(10,'2013-08-26 18:26:39',1,13,'4','Gatorade',1,''),(11,'2013-08-26 18:41:57',1,9,'1','The Hardest We\'ve Gone\'s Nerdy Little Sister with Glasses',1,''),(12,'2013-08-26 18:48:07',1,10,'6','toilet paper',2,'Changed complete.'),(13,'2013-08-26 19:04:37',1,10,'1','Clean the venue spotless',2,'Changed name and description.'),(14,'2013-08-26 19:04:51',1,10,'8','Tums, Advil, and Excederin',2,'Changed name.'),(15,'2013-08-26 19:04:56',1,10,'8','Tums, Advil, and Excedrin',2,'Changed name.'),(16,'2013-08-26 19:05:01',1,10,'7','Lots of clean towels',2,'Changed name.'),(17,'2013-08-26 19:05:05',1,10,'6','Toilet paper',2,'Changed name.'),(18,'2013-08-26 19:05:15',1,10,'5','Pet food stocked and pets fed',2,'Changed name.'),(19,'2013-08-26 19:06:12',1,10,'4','All blunts and joints fully rolled',2,'Changed name and description.'),(20,'2013-08-26 19:06:18',1,10,'3','Doors completely locked',2,'Changed name.'),(21,'2013-08-26 19:06:29',1,10,'2','Phones set to airplane mode',2,'Changed name and description.'),(22,'2013-08-26 19:08:13',1,9,'1','Beforehand',2,'Changed name.'),(23,'2013-08-26 19:15:25',1,8,'1','The Hardest We\'ve Gone\'s Nerdy Little Sister with Glasses',2,'Changed date.'),(24,'2013-08-26 19:15:58',1,8,'1','The Hardest We\'ve Gone\'s Nerdy Little Sister with Glasses',2,'Changed date.'),(25,'2013-08-26 19:16:05',1,8,'1','The Hardest We\'ve Gone\'s Nerdy Little Sister with Glasses',2,'Changed date.'),(26,'2013-08-26 19:16:13',1,8,'1','The Hardest We\'ve Gone\'s Nerdy Little Sister with Glasses',2,'Changed date.'),(27,'2013-08-26 19:28:11',1,11,'4','Gatorade',2,'Changed image.'),(28,'2013-08-26 19:30:14',1,11,'1','Molly',2,'Changed image.'),(29,'2013-08-26 19:30:42',1,11,'2','Liquor',2,'Changed image.'),(30,'2013-08-26 19:31:12',1,11,'3','Bud',2,'Changed image.'),(31,'2013-08-26 19:32:15',1,11,'2','Liquor',2,'Changed image.'),(32,'2013-08-26 19:34:14',1,11,'3','Bud',2,'Changed image.');
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'permission','auth','permission'),(2,'group','auth','group'),(3,'user','auth','user'),(4,'content type','contenttypes','contenttype'),(5,'session','sessions','session'),(6,'site','sites','site'),(7,'log entry','admin','logentry'),(8,'event','event','event'),(9,'checklist','event','checklist'),(10,'checklist item','event','checklistitem'),(11,'item','event','item'),(12,'inventory','event','inventory'),(13,'item entry','event','itementry'),(14,'migration history','south','migrationhistory');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('q3dv8i9dfea5guqy81v66mo55lnzqvxu','ZWU5NDI4ODE3MmJlZGUxYzY0YzYxMzc4MjlkMDg4NTQ4ODgwYjVhYjqAAn1xAShVEl9hdXRoX3VzZXJfYmFja2VuZHECVSlkamFuZ28uY29udHJpYi5hdXRoLmJhY2tlbmRzLk1vZGVsQmFja2VuZHEDVQ1fYXV0aF91c2VyX2lkcQSKAQF1Lg==','2013-09-09 18:23:52');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_site` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
INSERT INTO `django_site` VALUES (1,'example.com','example.com');
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_checklist`
--

DROP TABLE IF EXISTS `event_checklist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_checklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `event_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_checklist_a41e20fe` (`event_id`),
  CONSTRAINT `event_id_refs_id_aa11b75c` FOREIGN KEY (`event_id`) REFERENCES `event_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_checklist`
--

LOCK TABLES `event_checklist` WRITE;
/*!40000 ALTER TABLE `event_checklist` DISABLE KEYS */;
INSERT INTO `event_checklist` VALUES (1,'Beforehand',1);
/*!40000 ALTER TABLE `event_checklist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_checklistitem`
--

DROP TABLE IF EXISTS `event_checklistitem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_checklistitem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `description` longtext NOT NULL,
  `checklist_id` int(11) NOT NULL,
  `complete` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_checklistitem_8288b12f` (`checklist_id`),
  CONSTRAINT `checklist_id_refs_id_8f9698fc` FOREIGN KEY (`checklist_id`) REFERENCES `event_checklist` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_checklistitem`
--

LOCK TABLES `event_checklistitem` WRITE;
/*!40000 ALTER TABLE `event_checklistitem` DISABLE KEYS */;
INSERT INTO `event_checklistitem` VALUES (1,'Clean the venue spotless','',1,0),(2,'Phones set to airplane mode','',1,0),(3,'Doors completely locked','',1,0),(4,'All blunts and joints fully rolled','There should be no weed unrolled, and all downers (Klonopin, etc.) are identified and set aside in the medicine cabinet.',1,0),(5,'Pet food stocked and pets fed','',1,0),(6,'Toilet paper','',1,1),(7,'Lots of clean towels','',1,0),(8,'Tums, Advil, and Excedrin','',1,0);
/*!40000 ALTER TABLE `event_checklistitem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_event`
--

DROP TABLE IF EXISTS `event_event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_event`
--

LOCK TABLES `event_event` WRITE;
/*!40000 ALTER TABLE `event_event` DISABLE KEYS */;
INSERT INTO `event_event` VALUES (1,'The Hardest We\'ve Gone\'s Nerdy Little Sister with Glasses','2013-08-31 18:00:00');
/*!40000 ALTER TABLE `event_event` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_inventory`
--

DROP TABLE IF EXISTS `event_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_inventory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `event_id` int(11) NOT NULL,
  `multiplier` int(11) NOT NULL,
  `multiplier_unit` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_inventory_a41e20fe` (`event_id`),
  CONSTRAINT `event_id_refs_id_78595201` FOREIGN KEY (`event_id`) REFERENCES `event_event` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_inventory`
--

LOCK TABLES `event_inventory` WRITE;
/*!40000 ALTER TABLE `event_inventory` DISABLE KEYS */;
INSERT INTO `event_inventory` VALUES (1,'Manifest Destiny',1,2,'person');
/*!40000 ALTER TABLE `event_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_item`
--

DROP TABLE IF EXISTS `event_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `unit` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_item`
--

LOCK TABLES `event_item` WRITE;
/*!40000 ALTER TABLE `event_item` DISABLE KEYS */;
INSERT INTO `event_item` VALUES (1,'Molly','hit',20.00,'items/eAWmUEM.jpg'),(2,'Liquor','750ml bottle',30.00,'items/Jameson-Oct12-lg.png'),(3,'Bud','gram',4.29,'items/kalihaze.png'),(4,'Gatorade','32oz bottle',2.00,'items/dcs-952b_Small2a.jpg');
/*!40000 ALTER TABLE `event_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `event_itementry`
--

DROP TABLE IF EXISTS `event_itementry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event_itementry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `inventory_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `quantity` decimal(10,2) NOT NULL,
  `acquired` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `event_itementry_3d10c1ee` (`inventory_id`),
  KEY `event_itementry_0a47aae8` (`item_id`),
  CONSTRAINT `item_id_refs_id_b75a9a23` FOREIGN KEY (`item_id`) REFERENCES `event_item` (`id`),
  CONSTRAINT `inventory_id_refs_id_64f046cd` FOREIGN KEY (`inventory_id`) REFERENCES `event_inventory` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event_itementry`
--

LOCK TABLES `event_itementry` WRITE;
/*!40000 ALTER TABLE `event_itementry` DISABLE KEYS */;
INSERT INTO `event_itementry` VALUES (1,1,1,6.00,0),(2,1,2,0.50,0),(3,1,3,1.50,0),(4,1,4,5.00,0);
/*!40000 ALTER TABLE `event_itementry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `south_migrationhistory`
--

DROP TABLE IF EXISTS `south_migrationhistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `south_migrationhistory` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_name` varchar(255) NOT NULL,
  `migration` varchar(255) NOT NULL,
  `applied` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `south_migrationhistory`
--

LOCK TABLES `south_migrationhistory` WRITE;
/*!40000 ALTER TABLE `south_migrationhistory` DISABLE KEYS */;
INSERT INTO `south_migrationhistory` VALUES (1,'event','0001_initial','2013-08-26 19:24:50'),(2,'event','0002_auto__add_field_item_image','2013-08-26 19:27:35');
/*!40000 ALTER TABLE `south_migrationhistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-08-26 15:57:01
