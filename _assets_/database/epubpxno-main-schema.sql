-- MySQL dump 10.13  Distrib 5.5.32, for Linux (x86_64)
--
-- Host: localhost    Database: epubpxno_main
-- ------------------------------------------------------
-- Server version	5.5.32-cll-lve

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
-- Table structure for table `actions`
--

DROP TABLE IF EXISTS `actions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actions` (
  `aid` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique actions ID.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The object that that action acts on (node, user, comment, system or custom types.)',
  `callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback function that executes when the action runs.',
  `parameters` longblob NOT NULL COMMENT 'Parameters to be passed to the callback function.',
  `label` varchar(255) NOT NULL DEFAULT '0' COMMENT 'Label of the action.',
  PRIMARY KEY (`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores action information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `authmap`
--

DROP TABLE IF EXISTS `authmap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authmap` (
  `aid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique authmap ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'User’s users.uid.',
  `authname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Unique authentication name.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'Module which is controlling the authentication.',
  PRIMARY KEY (`aid`),
  UNIQUE KEY `authname` (`authname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores distributed authentication mapping.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_migrate_destinations`
--

DROP TABLE IF EXISTS `backup_migrate_destinations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_migrate_destinations` (
  `destination_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `machine_name` varchar(255) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a destination.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the destination.',
  `subtype` varchar(32) NOT NULL COMMENT 'The type of the destination.',
  `location` text NOT NULL COMMENT 'The the location string of the destination.',
  `settings` text NOT NULL COMMENT 'Other settings for the destination.',
  PRIMARY KEY (`destination_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_migrate_profiles`
--

DROP TABLE IF EXISTS `backup_migrate_profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_migrate_profiles` (
  `profile_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `machine_name` varchar(255) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `filename` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `append_timestamp` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Append a timestamp to the filename.',
  `timestamp_format` varchar(14) NOT NULL COMMENT 'The format of the timestamp.',
  `filters` text NOT NULL COMMENT 'The filter settings for the profile.',
  PRIMARY KEY (`profile_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_migrate_schedules`
--

DROP TABLE IF EXISTS `backup_migrate_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_migrate_schedules` (
  `schedule_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `machine_name` varchar(255) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the profile.',
  `source_id` varchar(255) NOT NULL DEFAULT 'db' COMMENT 'The backup_migrate_destination.destination_id of the source to backup from.',
  `destination_id` varchar(255) NOT NULL DEFAULT '0' COMMENT 'The backup_migrate_destination.destination_id of the destination to back up to.',
  `copy_destination_id` varchar(32) NOT NULL DEFAULT '0' COMMENT 'A second backup_migrate_destination.destination_id of the destination to copy the backup to.',
  `profile_id` varchar(255) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a profile.',
  `keep` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of backups to keep.',
  `period` int(11) NOT NULL DEFAULT '0' COMMENT 'The number of seconds between backups.',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether the schedule is enabled.',
  `cron` varchar(32) NOT NULL DEFAULT 'builtin' COMMENT 'Whether the schedule should be run during cron.',
  `cron_schedule` varchar(255) NOT NULL DEFAULT '0 4 * * *' COMMENT 'The cron schedule to run on.',
  PRIMARY KEY (`schedule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backup_migrate_sources`
--

DROP TABLE IF EXISTS `backup_migrate_sources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backup_migrate_sources` (
  `source_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `machine_name` varchar(32) NOT NULL DEFAULT '0' COMMENT 'The primary identifier for a source.',
  `name` varchar(255) NOT NULL COMMENT 'The name of the source.',
  `subtype` varchar(32) NOT NULL COMMENT 'The type of the source.',
  `location` text NOT NULL COMMENT 'The the location string of the source.',
  `settings` text NOT NULL COMMENT 'Other settings for the source.',
  PRIMARY KEY (`source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batch` (
  `bid` int(10) unsigned NOT NULL COMMENT 'Primary Key: Unique batch ID.',
  `token` varchar(64) NOT NULL COMMENT 'A string token generated against the current user’s session id and the batch id, used to ensure that only the user who submitted the batch can effectively access it.',
  `timestamp` int(11) NOT NULL COMMENT 'A Unix timestamp indicating when this batch was submitted for processing. Stale batches are purged at cron time.',
  `batch` longblob COMMENT 'A serialized array containing the processing data for the batch.',
  PRIMARY KEY (`bid`),
  KEY `token` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores details about batches (processes that run in...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block`
--

DROP TABLE IF EXISTS `block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block` (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique block ID.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The module from which the block originates; for example, ’user’ for the Who’s Online block, and ’block’ for any custom blocks.',
  `delta` varchar(32) NOT NULL DEFAULT '0' COMMENT 'Unique ID for block within a module.',
  `theme` varchar(64) NOT NULL DEFAULT '' COMMENT 'The theme under which the block settings apply.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Block enabled status. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Block weight within region.',
  `region` varchar(64) NOT NULL DEFAULT '' COMMENT 'Theme region within which the block is set.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how users may control visibility of the block. (0 = Users cannot control, 1 = On by default, but can be hidden, 2 = Hidden by default, but can be shown)',
  `visibility` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate how to show blocks on pages. (0 = Show on all pages except listed pages, 1 = Show only on listed pages, 2 = Use custom PHP code to determine visibility)',
  `pages` text NOT NULL COMMENT 'Contents of the `Pages` block; contains either a list of paths on which to include/exclude the block or PHP code, depending on `visibility` setting.',
  `title` varchar(64) NOT NULL DEFAULT '' COMMENT 'Custom title for the block. (Empty string will use block default title, <none> will remove the title, text will cause block to use specified title.)',
  `cache` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Binary flag to indicate block cache mode. (-2: Custom cache, -1: Do not cache, 1: Cache per role, 2: Cache per user, 4: Cache per page, 8: Block cache global) See DRUPAL_CACHE_* constants in ../includes/common.inc for more detailed information.',
  `css_class` varchar(255) NOT NULL DEFAULT '' COMMENT 'String containing the classes for the block.',
  `icon` blob COMMENT 'A serialized array of settings for Icon API.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `tmd` (`theme`,`module`,`delta`),
  KEY `list` (`theme`,`status`,`region`,`weight`,`module`)
) ENGINE=InnoDB AUTO_INCREMENT=215 DEFAULT CHARSET=utf8 COMMENT='Stores block settings, such as region and visibility...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_custom`
--

DROP TABLE IF EXISTS `block_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_custom` (
  `bid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The block’s block.bid.',
  `body` longtext COMMENT 'Block contents.',
  `info` varchar(128) NOT NULL DEFAULT '' COMMENT 'Block description.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the block body.',
  PRIMARY KEY (`bid`),
  UNIQUE KEY `info` (`info`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='Stores contents of custom-made blocks.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_node_type`
--

DROP TABLE IF EXISTS `block_node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_node_type` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type from node_type.type.',
  PRIMARY KEY (`module`,`delta`,`type`),
  KEY `type` (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up display criteria for blocks based on content types';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `block_role`
--

DROP TABLE IF EXISTS `block_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `block_role` (
  `module` varchar(64) NOT NULL COMMENT 'The block’s origin module, from block.module.',
  `delta` varchar(32) NOT NULL COMMENT 'The block’s unique delta within module, from block.delta.',
  `rid` int(10) unsigned NOT NULL COMMENT 'The user’s role ID from users_roles.rid.',
  PRIMARY KEY (`module`,`delta`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Sets up access permissions for blocks based on user roles';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `blocked_ips`
--

DROP TABLE IF EXISTS `blocked_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `blocked_ips` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: unique ID for IP addresses.',
  `ip` varchar(40) NOT NULL DEFAULT '' COMMENT 'IP address',
  PRIMARY KEY (`iid`),
  KEY `blocked_ip` (`ip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores blocked IP addresses.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache`
--

DROP TABLE IF EXISTS `cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_block`
--

DROP TABLE IF EXISTS `cache_block`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_block` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Block module to store already built...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_bootstrap`
--

DROP TABLE IF EXISTS `cache_bootstrap`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_bootstrap` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for data required to bootstrap Drupal, may be...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_field`
--

DROP TABLE IF EXISTS `cache_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_field` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_filter`
--

DROP TABLE IF EXISTS `cache_filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_filter` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Filter module to store already...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_form`
--

DROP TABLE IF EXISTS `cache_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_form` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the form system to store recently built...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_image`
--

DROP TABLE IF EXISTS `cache_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_image` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store information about image...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_libraries`
--

DROP TABLE IF EXISTS `cache_libraries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_libraries` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table to store library information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_media_xml`
--

DROP TABLE IF EXISTS `cache_media_xml`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_media_xml` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the the results of retreived XML...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_menu`
--

DROP TABLE IF EXISTS `cache_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_menu` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the menu system to store router...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_page`
--

DROP TABLE IF EXISTS `cache_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_page` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table used to store compressed pages for anonymous...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_panels`
--

DROP TABLE IF EXISTS `cache_panels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_panels` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_path`
--

DROP TABLE IF EXISTS `cache_path`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_path` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for path alias lookup.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_rules`
--

DROP TABLE IF EXISTS `cache_rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_rules` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the rules engine to store configured items.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_token`
--

DROP TABLE IF EXISTS `cache_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_token` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for token information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_update`
--

DROP TABLE IF EXISTS `cache_update`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_update` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for the Update module to store information...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_variable`
--

DROP TABLE IF EXISTS `cache_variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_variable` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for variables.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_views`
--

DROP TABLE IF EXISTS `cache_views`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_views` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Generic cache table for caching things not separated out...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `cache_views_data`
--

DROP TABLE IF EXISTS `cache_views_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cache_views_data` (
  `cid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique cache ID.',
  `data` longblob COMMENT 'A collection of data to cache.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry should expire, or 0 for never.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when the cache entry was created.',
  `serialized` smallint(6) NOT NULL DEFAULT '1' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`cid`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Cache table for views to store pre-rendered queries,...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ckeditor_input_format`
--

DROP TABLE IF EXISTS `ckeditor_input_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_input_format` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor role',
  `format` varchar(128) NOT NULL DEFAULT '' COMMENT 'Drupal filter format ID',
  PRIMARY KEY (`name`,`format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores CKEditor input format assignments';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ckeditor_settings`
--

DROP TABLE IF EXISTS `ckeditor_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ckeditor_settings` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Name of the CKEditor profile',
  `settings` text COMMENT 'Profile settings',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores CKEditor profile settings';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `colors`
--

DROP TABLE IF EXISTS `colors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `colors` (
  `selector` varchar(255) NOT NULL DEFAULT '' COMMENT 'Unique selector name.',
  `color` longblob NOT NULL COMMENT 'Color configuration array.',
  `module` varchar(128) NOT NULL DEFAULT 'colors' COMMENT 'Module that created the color configuration.',
  PRIMARY KEY (`selector`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores selectors and their matching colors.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comment` (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique comment ID.',
  `pid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid to which this comment is a reply. If set to 0, this comment is not a reply to an existing comment.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid to which this comment is a reply.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid who authored the comment. If set to 0, this comment was created by an anonymous user.',
  `subject` varchar(64) NOT NULL DEFAULT '' COMMENT 'The comment title.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The author’s host name.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was created, as a Unix timestamp.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The time that the comment was last edited, as a Unix timestamp.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The published status of a comment. (0 = Not Published, 1 = Published)',
  `thread` varchar(255) NOT NULL COMMENT 'The vancode representation of the comment’s place in a thread.',
  `name` varchar(60) DEFAULT NULL COMMENT 'The comment author’s name. Uses users.name if the user is logged in, otherwise uses the value typed into the comment form.',
  `mail` varchar(64) DEFAULT NULL COMMENT 'The comment author’s e-mail address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `homepage` varchar(255) DEFAULT NULL COMMENT 'The comment author’s home page address from the comment form, if user is anonymous, and the ’Anonymous users may/must leave their contact information’ setting is turned on.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this comment.',
  PRIMARY KEY (`cid`),
  KEY `comment_status_pid` (`pid`,`status`),
  KEY `comment_num_new` (`nid`,`status`,`created`,`cid`,`thread`),
  KEY `comment_uid` (`uid`),
  KEY `comment_nid_language` (`nid`,`language`),
  KEY `comment_created` (`created`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='Stores comments and associated data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `contact`
--

DROP TABLE IF EXISTS `contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `contact` (
  `cid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique category ID.',
  `category` varchar(255) NOT NULL DEFAULT '' COMMENT 'Category name.',
  `recipients` longtext NOT NULL COMMENT 'Comma-separated list of recipient e-mail addresses.',
  `reply` longtext NOT NULL COMMENT 'Text of the auto-reply message.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The category’s weight.',
  `selected` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether or not category is selected by default. (1 = Yes, 0 = No)',
  PRIMARY KEY (`cid`),
  UNIQUE KEY `category` (`category`),
  KEY `list` (`weight`,`category`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='Contact form category settings.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `content_access`
--

DROP TABLE IF EXISTS `content_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `content_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0',
  `settings` mediumtext,
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `context`
--

DROP TABLE IF EXISTS `context`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `context` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The primary identifier for a context.',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description for this context.',
  `tag` varchar(255) NOT NULL DEFAULT '' COMMENT 'Tag for this context.',
  `conditions` text COMMENT 'Serialized storage of all context condition settings.',
  `reactions` text COMMENT 'Serialized storage of all context reaction settings.',
  `condition_mode` int(11) DEFAULT '0' COMMENT 'Condition mode for this context.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Storage for normal (user-defined) contexts.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctools_access_ruleset`
--

DROP TABLE IF EXISTS `ctools_access_ruleset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_access_ruleset` (
  `rsid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this ruleset. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this ruleset.',
  `admin_description` longtext COMMENT 'Administrative description for this ruleset.',
  `requiredcontexts` longtext COMMENT 'Any required contexts for this ruleset.',
  `contexts` longtext COMMENT 'Any embedded contexts for this ruleset.',
  `relationships` longtext COMMENT 'Any relationships for this ruleset.',
  `access` longtext COMMENT 'The actual group of access plugins for this ruleset.',
  PRIMARY KEY (`rsid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains exportable customized access rulesets.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctools_css_cache`
--

DROP TABLE IF EXISTS `ctools_css_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_css_cache` (
  `cid` varchar(128) NOT NULL COMMENT 'The CSS ID this cache object belongs to.',
  `filename` varchar(255) DEFAULT NULL COMMENT 'The filename this CSS is stored in.',
  `css` longtext COMMENT 'CSS being stored.',
  `filter` tinyint(4) DEFAULT NULL COMMENT 'Whether or not this CSS needs to be filtered.',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store CSS that must be non-volatile.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ctools_object_cache`
--

DROP TABLE IF EXISTS `ctools_object_cache`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ctools_object_cache` (
  `sid` varchar(64) NOT NULL COMMENT 'The session ID this cache object belongs to.',
  `name` varchar(128) NOT NULL COMMENT 'The name of the object this cache is attached to.',
  `obj` varchar(32) NOT NULL COMMENT 'The type of the object this cache is attached to; this essentially represents the owner so that several sub-systems can use this cache.',
  `updated` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The time this cache was created or updated.',
  `data` longblob COMMENT 'Serialized data being stored.',
  PRIMARY KEY (`sid`,`obj`,`name`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A special cache used to store objects that are being...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date_format_locale`
--

DROP TABLE IF EXISTS `date_format_locale`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_locale` (
  `format` varchar(100) NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `language` varchar(12) NOT NULL COMMENT 'A languages.language for this format to be used with.',
  PRIMARY KEY (`type`,`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats for each locale.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date_format_type`
--

DROP TABLE IF EXISTS `date_format_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_format_type` (
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `title` varchar(255) NOT NULL COMMENT 'The human readable name of the format type.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this is a system provided format.',
  PRIMARY KEY (`type`),
  KEY `title` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configured date format types.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `date_formats`
--

DROP TABLE IF EXISTS `date_formats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `date_formats` (
  `dfid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The date format identifier.',
  `format` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT 'The date format string.',
  `type` varchar(64) NOT NULL COMMENT 'The date format type, e.g. medium.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether or not this format can be modified.',
  PRIMARY KEY (`dfid`),
  UNIQUE KEY `formats` (`format`,`type`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='Stores configured date formats.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_config`
--

DROP TABLE IF EXISTS `field_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field',
  `field_name` varchar(32) NOT NULL COMMENT 'The name of this field. Non-deleted field names are unique, but multiple deleted fields can have the same name.',
  `type` varchar(128) NOT NULL COMMENT 'The type of this field.',
  `module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the field type.',
  `active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the field type is enabled.',
  `storage_type` varchar(128) NOT NULL COMMENT 'The storage backend for the field.',
  `storage_module` varchar(128) NOT NULL DEFAULT '' COMMENT 'The module that implements the storage backend.',
  `storage_active` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the module that implements the storage backend is enabled.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT '@TODO',
  `data` longblob NOT NULL COMMENT 'Serialized data containing the field properties that do not warrant a dedicated column.',
  `cardinality` tinyint(4) NOT NULL DEFAULT '0',
  `translatable` tinyint(4) NOT NULL DEFAULT '0',
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name` (`field_name`),
  KEY `active` (`active`),
  KEY `storage_active` (`storage_active`),
  KEY `deleted` (`deleted`),
  KEY `module` (`module`),
  KEY `storage_module` (`storage_module`),
  KEY `type` (`type`),
  KEY `storage_type` (`storage_type`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_config_instance`
--

DROP TABLE IF EXISTS `field_config_instance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_config_instance` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a field instance',
  `field_id` int(11) NOT NULL COMMENT 'The identifier of the field attached by this instance',
  `field_name` varchar(32) NOT NULL DEFAULT '',
  `entity_type` varchar(32) NOT NULL DEFAULT '',
  `bundle` varchar(128) NOT NULL DEFAULT '',
  `data` longblob NOT NULL,
  `deleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `field_name_bundle` (`field_name`,`entity_type`,`bundle`),
  KEY `deleted` (`deleted`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_body`
--

DROP TABLE IF EXISTS `field_data_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 2 (body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_comment_body`
--

DROP TABLE IF EXISTS `field_data_comment_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 1 (comment_body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_date`
--

DROP TABLE IF EXISTS `field_data_field_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_date_value` datetime DEFAULT NULL,
  `field_date_value2` datetime DEFAULT NULL,
  `field_date_rrule` text,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 6 (field_date)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_full_name`
--

DROP TABLE IF EXISTS `field_data_field_full_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_full_name` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_full_name_value` varchar(255) DEFAULT NULL,
  `field_full_name_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_full_name_format` (`field_full_name_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 8 (field_full_name)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_image`
--

DROP TABLE IF EXISTS `field_data_field_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 4 (field_image)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_library`
--

DROP TABLE IF EXISTS `field_data_field_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_library` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_library_target_id` int(10) unsigned NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_library_target_id` (`field_library_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 9 (field_library)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_reservations_date`
--

DROP TABLE IF EXISTS `field_data_field_reservations_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_reservations_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_reservations_date_value` datetime DEFAULT NULL,
  `field_reservations_date_value2` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 9 (field_reservations_date)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_section_of_website`
--

DROP TABLE IF EXISTS `field_data_field_section_of_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_section_of_website` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_section_of_website_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_section_of_website_tid` (`field_section_of_website_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 7 (field_section_of_website)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_simplenews_term`
--

DROP TABLE IF EXISTS `field_data_field_simplenews_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_simplenews_term` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_simplenews_term_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_simplenews_term_tid` (`field_simplenews_term_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 8 (field_simplenews_term)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_tags`
--

DROP TABLE IF EXISTS `field_data_field_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 3 (field_tags)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_test`
--

DROP TABLE IF EXISTS `field_data_field_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_test` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_test_target_id` int(10) unsigned NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_test_target_id` (`field_test_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 8 (field_test)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_data_field_time`
--

DROP TABLE IF EXISTS `field_data_field_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_data_field_time` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned DEFAULT NULL COMMENT 'The entity revision id this data is attached to, or NULL if the entity type is not versioned',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_time_value` datetime DEFAULT NULL,
  `field_time_value2` datetime DEFAULT NULL,
  `field_time_rrule` text,
  PRIMARY KEY (`entity_type`,`entity_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Data storage for field 5 (field_time)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_body`
--

DROP TABLE IF EXISTS `field_revision_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `body_value` longtext,
  `body_summary` longtext,
  `body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `body_format` (`body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 2 (body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_comment_body`
--

DROP TABLE IF EXISTS `field_revision_comment_body`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_comment_body` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `comment_body_value` longtext,
  `comment_body_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `comment_body_format` (`comment_body_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 1 (comment_body)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_date`
--

DROP TABLE IF EXISTS `field_revision_field_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_date_value` datetime DEFAULT NULL,
  `field_date_value2` datetime DEFAULT NULL,
  `field_date_rrule` text,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 6 (field_date)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_full_name`
--

DROP TABLE IF EXISTS `field_revision_field_full_name`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_full_name` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_full_name_value` varchar(255) DEFAULT NULL,
  `field_full_name_format` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_full_name_format` (`field_full_name_format`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 8 (field_full_name)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_image`
--

DROP TABLE IF EXISTS `field_revision_field_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_image` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_image_fid` int(10) unsigned DEFAULT NULL COMMENT 'The file_managed.fid being referenced in this field.',
  `field_image_alt` varchar(512) DEFAULT NULL COMMENT 'Alternative image text, for the image’s ’alt’ attribute.',
  `field_image_title` varchar(1024) DEFAULT NULL COMMENT 'Image title text, for the image’s ’title’ attribute.',
  `field_image_width` int(10) unsigned DEFAULT NULL COMMENT 'The width of the image in pixels.',
  `field_image_height` int(10) unsigned DEFAULT NULL COMMENT 'The height of the image in pixels.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_image_fid` (`field_image_fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 4 (field_image)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_library`
--

DROP TABLE IF EXISTS `field_revision_field_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_library` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_library_target_id` int(10) unsigned NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_library_target_id` (`field_library_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 9 (field_library)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_reservations_date`
--

DROP TABLE IF EXISTS `field_revision_field_reservations_date`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_reservations_date` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_reservations_date_value` datetime DEFAULT NULL,
  `field_reservations_date_value2` datetime DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 9 (field_reservations...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_section_of_website`
--

DROP TABLE IF EXISTS `field_revision_field_section_of_website`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_section_of_website` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_section_of_website_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_section_of_website_tid` (`field_section_of_website_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 7 (field_section_of...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_simplenews_term`
--

DROP TABLE IF EXISTS `field_revision_field_simplenews_term`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_simplenews_term` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_simplenews_term_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_simplenews_term_tid` (`field_simplenews_term_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 8 (field_simplenews_term)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_tags`
--

DROP TABLE IF EXISTS `field_revision_field_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_tags` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_tags_tid` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_tags_tid` (`field_tags_tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 3 (field_tags)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_test`
--

DROP TABLE IF EXISTS `field_revision_field_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_test` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_test_target_id` int(10) unsigned NOT NULL COMMENT 'The id of the target entity.',
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`),
  KEY `field_test_target_id` (`field_test_target_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 8 (field_test)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `field_revision_field_time`
--

DROP TABLE IF EXISTS `field_revision_field_time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `field_revision_field_time` (
  `entity_type` varchar(128) NOT NULL DEFAULT '' COMMENT 'The entity type this data is attached to',
  `bundle` varchar(128) NOT NULL DEFAULT '' COMMENT 'The field instance bundle to which this row belongs, used when deleting a field instance',
  `deleted` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this data item has been deleted',
  `entity_id` int(10) unsigned NOT NULL COMMENT 'The entity id this data is attached to',
  `revision_id` int(10) unsigned NOT NULL COMMENT 'The entity revision id this data is attached to',
  `language` varchar(32) NOT NULL DEFAULT '' COMMENT 'The language for this data item.',
  `delta` int(10) unsigned NOT NULL COMMENT 'The sequence number for this data item, used for multi-value fields',
  `field_time_value` datetime DEFAULT NULL,
  `field_time_value2` datetime DEFAULT NULL,
  `field_time_rrule` text,
  PRIMARY KEY (`entity_type`,`entity_id`,`revision_id`,`deleted`,`delta`,`language`),
  KEY `entity_type` (`entity_type`),
  KEY `bundle` (`bundle`),
  KEY `deleted` (`deleted`),
  KEY `entity_id` (`entity_id`),
  KEY `revision_id` (`revision_id`),
  KEY `language` (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Revision archive storage for field 5 (field_time)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_display`
--

DROP TABLE IF EXISTS `file_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_display` (
  `name` varchar(255) NOT NULL COMMENT 'A combined string (FILE_TYPE__VIEW_MODE__FILE_FORMATTER) identifying a file display configuration. For integration with CTools Exportables, stored as a single string rather than as a compound primary key.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of formatter within the display chain for the associated file type and view mode. A file is rendered using the lowest weighted enabled display configuration that matches the file type and view mode and that is capable of displaying the file.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The status of the display. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the formatter settings for the display.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for file displays.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_managed`
--

DROP TABLE IF EXISTS `file_managed`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_managed` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who is associated with the file.',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the file with no path components. This may differ from the basename of the URI if the file is renamed to avoid overwriting an existing file.',
  `uri` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT 'The URI to access the file (either local or remote).',
  `filemime` varchar(255) NOT NULL DEFAULT '' COMMENT 'The file’s MIME type.',
  `filesize` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT 'The size of the file in bytes.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A field indicating the status of the file. Two status are defined in core: temporary (0) and permanent (1). Temporary files older than DRUPAL_MAXIMUM_TEMP_FILE_AGE will be removed during a cron run.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp for when the file was added.',
  `type` varchar(50) NOT NULL DEFAULT 'undefined' COMMENT 'The type of this file.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `uri` (`uri`),
  KEY `uid` (`uid`),
  KEY `status` (`status`),
  KEY `timestamp` (`timestamp`),
  KEY `file_type` (`type`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='Stores information for uploaded files.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `file_usage`
--

DROP TABLE IF EXISTS `file_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `file_usage` (
  `fid` int(10) unsigned NOT NULL COMMENT 'File ID.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the module that is using the file.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The name of the object type in which the file is used.',
  `id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The primary key of the object using the file.',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times this file is used by this object.',
  PRIMARY KEY (`fid`,`type`,`id`,`module`),
  KEY `type_id` (`type`,`id`),
  KEY `fid_count` (`fid`,`count`),
  KEY `fid_module` (`fid`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Track where a file is used.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter`
--

DROP TABLE IF EXISTS `filter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter` (
  `format` varchar(255) NOT NULL COMMENT 'Foreign key: The filter_format.format to which this filter is assigned.',
  `module` varchar(64) NOT NULL DEFAULT '' COMMENT 'The origin module of the filter.',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Name of the filter being referenced.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of filter within format.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Filter enabled status. (1 = enabled, 0 = disabled)',
  `settings` longblob COMMENT 'A serialized array of name value pairs that store the filter settings for the specific format.',
  PRIMARY KEY (`format`,`name`),
  KEY `list` (`weight`,`module`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table that maps filters (HTML corrector) to text formats ...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `filter_format`
--

DROP TABLE IF EXISTS `filter_format`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `filter_format` (
  `format` varchar(255) NOT NULL COMMENT 'Primary Key: Unique machine name of the format.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the text format (Filtered HTML).',
  `cache` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag to indicate whether format is cacheable. (1 = cacheable, 0 = not cacheable)',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT 'The status of the text format. (1 = enabled, 0 = disabled)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of text format to use when listing.',
  PRIMARY KEY (`format`),
  UNIQUE KEY `name` (`name`),
  KEY `status_weight` (`status`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores text formats: custom groupings of filters, such as...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `flood`
--

DROP TABLE IF EXISTS `flood`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `flood` (
  `fid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique flood event ID.',
  `event` varchar(64) NOT NULL DEFAULT '' COMMENT 'Name of event (e.g. contact).',
  `identifier` varchar(128) NOT NULL DEFAULT '' COMMENT 'Identifier of the visitor, such as an IP address or hostname.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of the event.',
  `expiration` int(11) NOT NULL DEFAULT '0' COMMENT 'Expiration timestamp. Expired events are purged on cron run.',
  PRIMARY KEY (`fid`),
  KEY `allow` (`event`,`identifier`,`timestamp`),
  KEY `purge` (`expiration`)
) ENGINE=InnoDB AUTO_INCREMENT=666 DEFAULT CHARSET=utf8 COMMENT='Flood controls the threshold of events, such as the...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fontyourface_font`
--

DROP TABLE IF EXISTS `fontyourface_font`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fontyourface_font` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique font ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The font name.',
  `enabled` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Whether or not the font is enabled. (0 = disabled, 1 = enabled)',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT 'A URL for the font.',
  `provider` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module providing the font.',
  `css_selector` longtext COMMENT 'CSS selector for applying the font.',
  `css_family` varchar(255) DEFAULT '' COMMENT 'CSS family for the font.',
  `css_style` varchar(255) DEFAULT '' COMMENT 'CSS style for the font.',
  `css_weight` varchar(255) DEFAULT '' COMMENT 'CSS weight for the font.',
  `css_fallbacks` varchar(255) DEFAULT '' COMMENT 'CSS fallbacks for the font.',
  `foundry` varchar(255) DEFAULT '' COMMENT 'Foundry for the font.',
  `foundry_url` varchar(255) DEFAULT '' COMMENT 'URL for foundry for the font.',
  `license` varchar(255) DEFAULT '' COMMENT 'License for the font.',
  `license_url` varchar(255) DEFAULT '' COMMENT 'URL for license for the font.',
  `designer` varchar(255) DEFAULT '' COMMENT 'Designer for the font.',
  `designer_url` varchar(255) DEFAULT '' COMMENT 'URL for designer for the font.',
  `metadata` longtext COMMENT 'Additional serialized metadata about the font.',
  PRIMARY KEY (`fid`),
  UNIQUE KEY `url` (`url`),
  KEY `enabled` (`enabled`)
) ENGINE=InnoDB AUTO_INCREMENT=2481 DEFAULT CHARSET=utf8 COMMENT='Font information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fontyourface_tag`
--

DROP TABLE IF EXISTS `fontyourface_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fontyourface_tag` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique tag ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The font name.',
  `type` varchar(10) NOT NULL DEFAULT 'tag' COMMENT 'Indicator that describes the type of tag (term, subset, etc).',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Font tag information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `fontyourface_tag_font`
--

DROP TABLE IF EXISTS `fontyourface_tag_font`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fontyourface_tag_font` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key: the unique ID of the font.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Foreign Key: the unique ID of the tag.',
  PRIMARY KEY (`fid`,`tid`),
  KEY `fid` (`fid`),
  KEY `tid` (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Relationship information between fonts and tags.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history`
--

DROP TABLE IF EXISTS `history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history` (
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that read the node nid.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid that was read.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp at which the read occurred.',
  PRIMARY KEY (`uid`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A record of which users have read which nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `icon_bundle`
--

DROP TABLE IF EXISTS `icon_bundle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `icon_bundle` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the icon bundle.',
  `bundle` longblob COMMENT 'The array data belonging to the icon bundle.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The enabled status. (1 = enabled, 0 = disabled) of the icon bundle.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the contents of icon bundles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_dimensions`
--

DROP TABLE IF EXISTS `image_dimensions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_dimensions` (
  `fid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'File ID.',
  `height` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The height of the image in pixels.',
  `width` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The width of the image in pixels..',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='Cache images dimensions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_effects`
--

DROP TABLE IF EXISTS `image_effects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_effects` (
  `ieid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image effect.',
  `isid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The image_styles.isid for an image style.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the effect in the style.',
  `name` varchar(255) NOT NULL COMMENT 'The unique name of the effect to be executed.',
  `data` longblob NOT NULL COMMENT 'The configuration data for the effect.',
  PRIMARY KEY (`ieid`),
  KEY `isid` (`isid`),
  KEY `weight` (`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image effects.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `image_styles`
--

DROP TABLE IF EXISTS `image_styles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image_styles` (
  `isid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for an image style.',
  `name` varchar(255) NOT NULL COMMENT 'The style machine name.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The style administrative name.',
  PRIMARY KEY (`isid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration options for image styles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masquerade`
--

DROP TABLE IF EXISTS `masquerade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masquerade` (
  `sid` varchar(64) NOT NULL DEFAULT '' COMMENT 'The current session for this masquerading user corresponding to their sessions.sid.',
  `uid_from` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid corresponding to a session.',
  `uid_as` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid this session is masquerading as.',
  KEY `sid` (`sid`,`uid_from`),
  KEY `sid_2` (`sid`,`uid_as`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each masquerading user has their session recorded into...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `masquerade_users`
--

DROP TABLE IF EXISTS `masquerade_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `masquerade_users` (
  `uid_from` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that can masquerade as masquerade_users.uid_to.',
  `uid_to` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that masquerade_users.uid_from can masquerade as.',
  PRIMARY KEY (`uid_from`,`uid_to`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Per-user permission table granting permissions to switch...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_filter_usage`
--

DROP TABLE IF EXISTS `media_filter_usage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_filter_usage` (
  `fid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The media file_managed.fid.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The timestamp the fid was last recorded by media_filter()',
  PRIMARY KEY (`fid`),
  KEY `timestamp` (`timestamp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores fids that have been included in the media tag in...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_list_type`
--

DROP TABLE IF EXISTS `media_list_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_list_type` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user.uid of the user.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The type of display (table or images).',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the user preference for whether to list as table...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `media_type`
--

DROP TABLE IF EXISTS `media_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `media_type` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The machine name of the media type.',
  `label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The label of the media type.',
  `base` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'If this is a base type (i.e. cannot be deleted)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of media type. Determines which one wins when claiming a piece of media (first wins)',
  `type_callback` varchar(255) DEFAULT '' COMMENT 'Callback to determine if provided media is of this type.',
  `type_callback_args` longtext COMMENT 'A serialized array of name value pairs that will be passed to the callback function',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the settings for media types.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_custom`
--

DROP TABLE IF EXISTS `menu_custom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_custom` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique key for menu. This is used as a block delta so length is 32.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'Menu title; displayed at top of block.',
  `description` text COMMENT 'Menu description.',
  PRIMARY KEY (`menu_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds definitions for top-level custom menus (for example...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_links`
--

DROP TABLE IF EXISTS `menu_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_links` (
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The menu name. All links with the same menu name (such as ’navigation’) are part of the same menu.',
  `mlid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The menu link ID (mlid) is the integer primary key.',
  `plid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The parent link ID (plid) is the mlid of the link above in the hierarchy, or zero if the link is at the top level in its menu.',
  `link_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path or external path this link points to.',
  `router_path` varchar(255) NOT NULL DEFAULT '' COMMENT 'For links corresponding to a Drupal path (external = 0), this connects the link to a menu_router.path for joins.',
  `link_title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The text displayed for the link, which may be modified by a title callback stored in menu_router.',
  `options` blob COMMENT 'A serialized array of options to be passed to the url() or l() function, such as a query string or HTML attributes.',
  `module` varchar(255) NOT NULL DEFAULT 'system' COMMENT 'The name of the module that generated this link.',
  `hidden` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag for whether the link should be rendered in menus. (1 = a disabled menu item that may be shown on admin screens, -1 = a menu callback, 0 = a normal, visible link)',
  `external` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate if the link points to a full URL starting with a protocol, like http:// (1 = external, 0 = internal).',
  `has_children` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag indicating whether any links have this link as a parent (1 = children exist, 0 = no children).',
  `expanded` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag for whether this link should be rendered as expanded in menus - expanded links always have their child links displayed, instead of only when the link is in the active trail (1 = expanded, 0 = not expanded)',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Link weight among links in the same menu at the same depth.',
  `depth` smallint(6) NOT NULL DEFAULT '0' COMMENT 'The depth relative to the top level. A link with plid == 0 will have depth == 1.',
  `customized` smallint(6) NOT NULL DEFAULT '0' COMMENT 'A flag to indicate that the user has manually created or edited the link (1 = customized, 0 = not customized).',
  `p1` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The first mlid in the materialized path. If N = depth, then pN must equal the mlid. If depth > 1 then p(N-1) must equal the plid. All pX where X > depth must equal zero. The columns p1 .. p9 are also called the parents.',
  `p2` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The second mlid in the materialized path. See p1.',
  `p3` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The third mlid in the materialized path. See p1.',
  `p4` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fourth mlid in the materialized path. See p1.',
  `p5` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The fifth mlid in the materialized path. See p1.',
  `p6` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The sixth mlid in the materialized path. See p1.',
  `p7` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The seventh mlid in the materialized path. See p1.',
  `p8` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The eighth mlid in the materialized path. See p1.',
  `p9` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The ninth mlid in the materialized path. See p1.',
  `updated` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Flag that indicates that this link was generated during the update from Drupal 5.',
  PRIMARY KEY (`mlid`),
  KEY `path_menu` (`link_path`(128),`menu_name`),
  KEY `menu_plid_expand_child` (`menu_name`,`plid`,`expanded`,`has_children`),
  KEY `menu_parents` (`menu_name`,`p1`,`p2`,`p3`,`p4`,`p5`,`p6`,`p7`,`p8`,`p9`),
  KEY `router_path` (`router_path`(128))
) ENGINE=InnoDB AUTO_INCREMENT=1167 DEFAULT CHARSET=utf8 COMMENT='Contains the individual links within a menu.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `menu_router`
--

DROP TABLE IF EXISTS `menu_router`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_router` (
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: the Drupal path this entry describes',
  `load_functions` blob NOT NULL COMMENT 'A serialized array of function names (like node_load) to be called to load an object corresponding to a part of the current path.',
  `to_arg_functions` blob NOT NULL COMMENT 'A serialized array of function names (like user_uid_optional_to_arg) to be called to replace a part of the router path with another string.',
  `access_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The callback which determines the access to this router path. Defaults to user_access.',
  `access_arguments` blob COMMENT 'A serialized array of arguments for the access callback.',
  `page_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that renders the page.',
  `page_arguments` blob COMMENT 'A serialized array of arguments for the page callback.',
  `delivery_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function that sends the result of the page_callback function to the browser.',
  `fit` int(11) NOT NULL DEFAULT '0' COMMENT 'A numeric representation of how specific the path is.',
  `number_parts` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Number of parts in this router path.',
  `context` int(11) NOT NULL DEFAULT '0' COMMENT 'Only for local tasks (tabs) - the context of a local task to control its placement.',
  `tab_parent` varchar(255) NOT NULL DEFAULT '' COMMENT 'Only for local tasks (tabs) - the router path of the parent page (which may also be a local task).',
  `tab_root` varchar(255) NOT NULL DEFAULT '' COMMENT 'Router path of the closest non-tab parent page. For pages that are not local tasks, this will be the same as the path.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title for the current page, or the title for the tab if this is a local task.',
  `title_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which will alter the title. Defaults to t()',
  `title_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the title callback. If empty, the title will be used as the sole argument for the title callback.',
  `theme_callback` varchar(255) NOT NULL DEFAULT '' COMMENT 'A function which returns the name of the theme that will be used to render this page. If left empty, the default theme will be used.',
  `theme_arguments` varchar(255) NOT NULL DEFAULT '' COMMENT 'A serialized array of arguments for the theme callback.',
  `type` int(11) NOT NULL DEFAULT '0' COMMENT 'Numeric representation of the type of the menu item, like MENU_LOCAL_TASK.',
  `description` text NOT NULL COMMENT 'A description of this item.',
  `position` varchar(255) NOT NULL DEFAULT '' COMMENT 'The position of the block (left or right) on the system administration page for this item.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'Weight of the element. Lighter weights are higher up, heavier weights go down.',
  `include_file` mediumtext COMMENT 'The file to include for this element, usually the page callback function lives in this file.',
  PRIMARY KEY (`path`),
  KEY `fit` (`fit`),
  KEY `tab_parent` (`tab_parent`(64),`weight`,`title`),
  KEY `tab_root_weight_title` (`tab_root`(64),`weight`,`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps paths to various callbacks (access, page and title)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mollom`
--

DROP TABLE IF EXISTS `mollom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mollom` (
  `entity` varchar(32) NOT NULL DEFAULT '' COMMENT 'Entity type of the content.',
  `id` varchar(36) NOT NULL DEFAULT '' COMMENT 'Unique entity ID of the content.',
  `content_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'Content ID returned by Mollom.',
  `captcha_id` varchar(128) NOT NULL DEFAULT '' COMMENT 'CAPTCHA ID returned by Mollom.',
  `form_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'The form_id of the form being protected.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp when the data was changed.',
  `moderate` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether the content needs to be moderated.',
  `spam_score` float DEFAULT NULL COMMENT 'Text analysis spam check result.',
  `spam_classification` varchar(16) DEFAULT NULL COMMENT 'Text analysis final spam classification result.',
  `solved` tinyint(4) DEFAULT NULL COMMENT 'Whether a CAPTCHA has been solved (1) or not (0).',
  `quality_score` float DEFAULT NULL COMMENT 'Text analysis quality check result.',
  `profanity_score` float DEFAULT NULL COMMENT 'Text analysis profanity check result.',
  `reason` varchar(255) NOT NULL DEFAULT '' COMMENT 'A special reason for why a post was blocked.',
  `languages` varchar(255) NOT NULL DEFAULT '' COMMENT 'Text analysis language check result.',
  `flags_spam` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'Count of spam feedback reports.',
  `flags_ham` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'Count of ham feedback reports.',
  `flags_profanity` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'Count of profanity feedback reports.',
  `flags_quality` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'Count of low quality feedback reports.',
  `flags_unwanted` mediumint(9) NOT NULL DEFAULT '0' COMMENT 'Count of unwanted feedback reports.',
  PRIMARY KEY (`entity`,`id`),
  KEY `content_id` (`content_id`),
  KEY `captcha_id` (`captcha_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores Mollom responses for content.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `mollom_form`
--

DROP TABLE IF EXISTS `mollom_form`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mollom_form` (
  `form_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'The protected form ID.',
  `entity` varchar(32) DEFAULT NULL COMMENT 'Optional: Entity type of the form.',
  `bundle` varchar(128) DEFAULT NULL COMMENT 'Optional: Entity bundle of the form.',
  `mode` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Protection mode for the form.',
  `checks` text COMMENT 'Text analyis checks to perform.',
  `unsure` varchar(24) NOT NULL DEFAULT 'captcha' COMMENT 'Action to perform when text analysis is unsure.',
  `discard` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Whether to discard (1) or retain (0) bad posts.',
  `moderation` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether to integrate with Mollom moderation.',
  `enabled_fields` text COMMENT 'Form elements to analyze.',
  `strictness` varchar(8) NOT NULL DEFAULT 'normal' COMMENT 'Strictness of text analysis checks.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'Module name owning the form.',
  PRIMARY KEY (`form_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores configuration of forms protected by Mollom.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node`
--

DROP TABLE IF EXISTS `node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node` (
  `nid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a node.',
  `vid` int(10) unsigned DEFAULT NULL COMMENT 'The current node_revision.vid version identifier.',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'The node_type.type of this node.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The languages.language of this node.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this node, always treated as non-markup plain text.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that owns this node; initially, this is the user that created it.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node is published (visible to non-administrators).',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  `changed` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was most recently saved.',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node: 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node should be displayed at the top of lists in which it appears.',
  `tnid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The translation set id for this node, which equals the node id of the source post in each set.',
  `translate` int(11) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this translation page needs to be updated.',
  PRIMARY KEY (`nid`),
  UNIQUE KEY `vid` (`vid`),
  KEY `node_changed` (`changed`),
  KEY `node_created` (`created`),
  KEY `node_frontpage` (`promote`,`status`,`sticky`,`created`),
  KEY `node_status_type` (`status`,`type`,`nid`),
  KEY `node_title_type` (`title`,`type`(4)),
  KEY `node_type` (`type`(4)),
  KEY `uid` (`uid`),
  KEY `tnid` (`tnid`),
  KEY `translate` (`translate`),
  KEY `language` (`language`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='The base table for nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_access`
--

DROP TABLE IF EXISTS `node_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_access` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record affects.',
  `gid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The grant ID a user must possess in the specified realm to gain this row’s privileges on the node.',
  `realm` varchar(255) NOT NULL DEFAULT '' COMMENT 'The realm in which the user must possess the grant ID. Each node access node can define one or more realms.',
  `grant_view` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can view this node.',
  `grant_update` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can edit this node.',
  `grant_delete` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether a user with the realm/grant pair can delete this node.',
  PRIMARY KEY (`nid`,`gid`,`realm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Identifies which realm/grant pairs a user must possess in...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_comment_statistics`
--

DROP TABLE IF EXISTS `node_comment_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_comment_statistics` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid for which the statistics are compiled.',
  `cid` int(11) NOT NULL DEFAULT '0' COMMENT 'The comment.cid of the last comment.',
  `last_comment_timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp of the last comment that was posted within this node, from comment.changed.',
  `last_comment_name` varchar(60) DEFAULT NULL COMMENT 'The name of the latest author to post a comment on this node, from comment.name.',
  `last_comment_uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The user ID of the latest author to post a comment on this node, from comment.uid.',
  `comment_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The total number of comments on this node.',
  PRIMARY KEY (`nid`),
  KEY `node_comment_timestamp` (`last_comment_timestamp`),
  KEY `comment_count` (`comment_count`),
  KEY `last_comment_uid` (`last_comment_uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains statistics of node and comments posts to show ...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_revision`
--

DROP TABLE IF EXISTS `node_revision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_revision` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node this version belongs to.',
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for this version.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that created this version.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of this version.',
  `log` longtext NOT NULL COMMENT 'The log entry explaining the changes in this version.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'A Unix timestamp indicating when this version was created.',
  `status` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the node (at the time of this revision) is published (visible to non-administrators).',
  `comment` int(11) NOT NULL DEFAULT '0' COMMENT 'Whether comments are allowed on this node (at the time of this revision): 0 = no, 1 = closed (read only), 2 = open (read/write).',
  `promote` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed on the front page.',
  `sticky` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether the node (at the time of this revision) should be displayed at the top of lists in which it appears.',
  PRIMARY KEY (`vid`),
  KEY `nid` (`nid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB AUTO_INCREMENT=287 DEFAULT CHARSET=utf8 COMMENT='Stores information about each saved version of a node.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `node_type`
--

DROP TABLE IF EXISTS `node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `node_type` (
  `type` varchar(32) NOT NULL COMMENT 'The machine-readable name of this type.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The human-readable name of this type.',
  `base` varchar(255) NOT NULL COMMENT 'The base string used to construct callbacks corresponding to this node type.',
  `module` varchar(255) NOT NULL COMMENT 'The module defining this node type.',
  `description` mediumtext NOT NULL COMMENT 'A brief description of this type.',
  `help` mediumtext NOT NULL COMMENT 'Help information shown to the user when creating a node of this type.',
  `has_title` tinyint(3) unsigned NOT NULL COMMENT 'Boolean indicating whether this type uses the node.title field.',
  `title_label` varchar(255) NOT NULL DEFAULT '' COMMENT 'The label displayed for the title field on the edit form.',
  `custom` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type is defined by a module (FALSE) or by a user via Add content type (TRUE).',
  `modified` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether this type has been modified by an administrator; currently not used in any way.',
  `locked` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the administrator can change the machine name of this type.',
  `disabled` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether the node type is disabled.',
  `orig_type` varchar(255) NOT NULL DEFAULT '' COMMENT 'The original machine-readable name of this node type. This may be different from the current type name if the locked field is 0.',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about all defined node types.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_manager_handlers`
--

DROP TABLE IF EXISTS `page_manager_handlers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_manager_handlers` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `task` varchar(64) DEFAULT NULL COMMENT 'ID of the task this handler is for.',
  `subtask` varchar(64) NOT NULL DEFAULT '' COMMENT 'ID of the subtask this handler is for.',
  `handler` varchar(64) DEFAULT NULL COMMENT 'ID of the task handler being used.',
  `weight` int(11) DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.',
  `conf` longtext NOT NULL COMMENT 'Serialized configuration of the handler, if needed.',
  PRIMARY KEY (`did`),
  UNIQUE KEY `name` (`name`),
  KEY `fulltask` (`task`,`subtask`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_manager_pages`
--

DROP TABLE IF EXISTS `page_manager_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_manager_pages` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary ID field for the table. Not used for anything except internal lookups.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this subtask. Used to identify it programmatically.',
  `task` varchar(64) DEFAULT 'page' COMMENT 'What type of page this is, so that we can use the same mechanism for creating tighter UIs for targeted pages.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Human readable title for this page subtask.',
  `admin_description` longtext COMMENT 'Administrative description of this item.',
  `path` varchar(255) DEFAULT NULL COMMENT 'The menu path that will invoke this task.',
  `access` longtext NOT NULL COMMENT 'Access configuration for this path.',
  `menu` longtext NOT NULL COMMENT 'Serialized configuration of Drupal menu visibility settings for this item.',
  `arguments` longtext NOT NULL COMMENT 'Configuration of arguments for this menu item.',
  `conf` longtext NOT NULL COMMENT 'Serialized configuration of the page, if needed.',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `name` (`name`),
  KEY `task` (`task`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains page subtasks for implementing pages with...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `page_manager_weights`
--

DROP TABLE IF EXISTS `page_manager_weights`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `page_manager_weights` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Unique ID for this task handler. Used to identify it programmatically.',
  `weight` int(11) DEFAULT NULL COMMENT 'The order in which this handler appears. Lower numbers go first.',
  PRIMARY KEY (`name`),
  KEY `weights` (`name`,`weight`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains override weights for page_manager handlers that...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panels_display`
--

DROP TABLE IF EXISTS `panels_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_display` (
  `did` int(11) NOT NULL AUTO_INCREMENT,
  `layout` varchar(255) DEFAULT '',
  `layout_settings` longtext,
  `panel_settings` longtext,
  `cache` text,
  `title` varchar(255) DEFAULT '',
  `hide_title` tinyint(4) DEFAULT '0',
  `title_pane` int(11) DEFAULT '0',
  `uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panels_layout`
--

DROP TABLE IF EXISTS `panels_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_layout` (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this layout.',
  `admin_description` longtext COMMENT 'Administrative description for this layout.',
  `category` varchar(255) DEFAULT NULL COMMENT 'Administrative category for this layout.',
  `plugin` varchar(255) DEFAULT NULL COMMENT 'The layout plugin that owns this layout.',
  `settings` longtext COMMENT 'Serialized settings for the actual layout. The contents of this field are up to the plugin that uses it.',
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains exportable customized layouts for this site.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panels_mini`
--

DROP TABLE IF EXISTS `panels_mini`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_mini` (
  `pid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The primary key for uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'The unique name of the mini panel.',
  `category` varchar(64) DEFAULT NULL COMMENT 'The category this mini panel appears in on the add content pane.',
  `did` int(11) DEFAULT NULL COMMENT 'The display ID of the panel.',
  `admin_title` varchar(128) DEFAULT NULL COMMENT 'The administrative title of the mini panel.',
  `admin_description` longtext COMMENT 'Administrative title of this mini panel.',
  `requiredcontexts` longtext COMMENT 'An array of required contexts.',
  `contexts` longtext COMMENT 'An array of contexts embedded into the panel.',
  `relationships` longtext COMMENT 'An array of relationships embedded into the panel.',
  PRIMARY KEY (`pid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panels_node`
--

DROP TABLE IF EXISTS `panels_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_node` (
  `nid` int(11) NOT NULL DEFAULT '0',
  `css_id` varchar(255) DEFAULT NULL,
  `did` int(11) NOT NULL,
  `pipeline` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panels_pane`
--

DROP TABLE IF EXISTS `panels_pane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_pane` (
  `pid` int(11) NOT NULL AUTO_INCREMENT,
  `did` int(11) NOT NULL DEFAULT '0',
  `panel` varchar(32) DEFAULT '',
  `type` varchar(32) DEFAULT '',
  `subtype` varchar(64) DEFAULT '',
  `shown` tinyint(4) DEFAULT '1',
  `access` longtext,
  `configuration` longtext,
  `cache` longtext,
  `style` longtext,
  `css` longtext,
  `extras` longtext,
  `position` smallint(6) DEFAULT '0',
  `locks` longtext,
  `uuid` char(36) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `did_idx` (`did`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `panels_renderer_pipeline`
--

DROP TABLE IF EXISTS `panels_renderer_pipeline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `panels_renderer_pipeline` (
  `rpid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'A database primary key to ensure uniqueness.',
  `name` varchar(255) DEFAULT NULL COMMENT 'Unique ID for this content. Used to identify it programmatically.',
  `admin_title` varchar(255) DEFAULT NULL COMMENT 'Administrative title for this pipeline.',
  `admin_description` longtext COMMENT 'Administrative description for this pipeline.',
  `weight` smallint(6) DEFAULT '0',
  `settings` longtext COMMENT 'Serialized settings for the actual pipeline. The contents of this field are up to the plugin that uses it.',
  PRIMARY KEY (`rpid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Contains renderer pipelines for Panels. Each pipeline...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `queue`
--

DROP TABLE IF EXISTS `queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `queue` (
  `item_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique item ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The queue name.',
  `data` longblob COMMENT 'The arbitrary data for the item.',
  `expire` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the claim lease expires on the item.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp when the item was created.',
  PRIMARY KEY (`item_id`),
  KEY `name_created` (`name`,`created`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COMMENT='Stores items in queues.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rdf_mapping`
--

DROP TABLE IF EXISTS `rdf_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rdf_mapping` (
  `type` varchar(128) NOT NULL COMMENT 'The name of the entity type a mapping applies to (node, user, comment, etc.).',
  `bundle` varchar(128) NOT NULL COMMENT 'The name of the bundle a mapping applies to.',
  `mapping` longblob COMMENT 'The serialized mapping of the bundle type and fields to RDF terms.',
  PRIMARY KEY (`type`,`bundle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores custom RDF mappings for user defined content types...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `redirect`
--

DROP TABLE IF EXISTS `redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `redirect` (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique redirect ID.',
  `hash` varchar(64) NOT NULL COMMENT 'A unique hash based on source, source_options, and language.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'The redirect type; if value is ’redirect’ it is a normal redirect handled by the module.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who created the redirect.',
  `source` varchar(255) NOT NULL COMMENT 'The source path to redirect from.',
  `source_options` text NOT NULL COMMENT 'A serialized array of source options.',
  `redirect` varchar(255) NOT NULL COMMENT 'The destination path to redirect to.',
  `redirect_options` text NOT NULL COMMENT 'A serialized array of redirect options.',
  `language` varchar(12) NOT NULL DEFAULT 'und' COMMENT 'The language this redirect is for; if blank, the alias will be used for unknown languages.',
  `status_code` smallint(6) NOT NULL COMMENT 'The HTTP status code to use for the redirect.',
  `count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The number of times the redirect has been used.',
  `access` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The timestamp of when the redirect was last accessed.',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `hash` (`hash`),
  KEY `expires` (`type`,`access`),
  KEY `source_language` (`source`,`language`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COMMENT='Stores information on redirects.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registry`
--

DROP TABLE IF EXISTS `registry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registry` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the function, class, or interface.',
  `type` varchar(9) NOT NULL DEFAULT '' COMMENT 'Either function or class or interface.',
  `filename` varchar(255) NOT NULL COMMENT 'Name of the file.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the module the file belongs to.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  PRIMARY KEY (`name`,`type`),
  KEY `hook` (`type`,`weight`,`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Each record is a function, class, or interface name and...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `registry_file`
--

DROP TABLE IF EXISTS `registry_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `registry_file` (
  `filename` varchar(255) NOT NULL COMMENT 'Path to the file.',
  `hash` varchar(64) NOT NULL COMMENT 'sha-256 hash of the file’s contents when last parsed.',
  PRIMARY KEY (`filename`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Files parsed to build the registry.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservations_bucket_node`
--

DROP TABLE IF EXISTS `reservations_bucket_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations_bucket_node` (
  `nid` int(10) unsigned NOT NULL COMMENT 'The bookable resource nid.',
  `vid` int(10) unsigned NOT NULL COMMENT 'The bookable resource vid.',
  `reservations_default_availability` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Default availability of the resource.',
  `reservations_late_fee_per_hour` float NOT NULL DEFAULT '0' COMMENT 'Per hour fee if the resource is returned late.',
  `reservations_rate_per_hour` float NOT NULL DEFAULT '0' COMMENT 'Per hour fee for use of the resource.',
  `reservations_fee_free_hours` float NOT NULL DEFAULT '0' COMMENT 'Number of hours the item can be used before fees are charged.',
  `reservations_min_cancel_hours` int(11) NOT NULL DEFAULT '0' COMMENT 'Minimum number of hours a user can cancel a reservation for the item.',
  `reservations_autocheckout` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is automatically checked out when Reservation starts.',
  `reservations_autocheckin` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is automatically checked in when Reservation starts.',
  `reservations_selfcheckout` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is managed by selfcheckout.',
  `reservations_sub_type` int(11) NOT NULL DEFAULT '0' COMMENT 'The subtype of bucket node, either item or reservation.',
  PRIMARY KEY (`nid`,`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information on bookable bucket nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservations_node_type`
--

DROP TABLE IF EXISTS `reservations_node_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations_node_type` (
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT 'Foreign key for node_type.type.',
  `reservations_type_setting` varchar(20) NOT NULL DEFAULT 'disabled' COMMENT 'The Reservations type for the selected content type.',
  `reservations_max_hours_per_reservation` int(11) NOT NULL DEFAULT '0' COMMENT 'The maximum hours that the resource can be reserved for.',
  `reservations_allow_overnight` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource can be kept overnight.',
  `reservations_push` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource can be kept over weekends.',
  `reservations_late_fee_per_hour` float NOT NULL DEFAULT '0' COMMENT 'Per hour fee if the resource is returned late.',
  `reservations_rate_per_hour` float NOT NULL DEFAULT '0' COMMENT 'Per hour fee for use of the resource.',
  `reservations_fee_free_hours` float NOT NULL DEFAULT '0' COMMENT 'Number of hours the item can be used before fees are charged.',
  `reservations_active_status` int(11) NOT NULL DEFAULT '0' COMMENT 'The status of the resource.',
  `reservations_spare_items` int(11) NOT NULL DEFAULT '0' COMMENT 'Number of spare items to leave unreserved for the resource.',
  `reservations_min_cancel_hours` int(11) NOT NULL DEFAULT '0' COMMENT 'Minimum number of hours a user can cancel a reservation for the item.',
  `reservations_autocheckout` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is automatically checked out when Reservation starts.',
  `reservations_autocheckin` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is automatically checked in when Reservation starts.',
  `reservations_selfcheckout` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is managed by selfcheckout.',
  `reservations_grouping` int(10) unsigned DEFAULT NULL COMMENT 'tid of Reservations Equipment Grouping vocabulary',
  `reservations_auto_assign_bucket_item` tinyint(4) DEFAULT NULL COMMENT 'TRUE if the bucket item is to be assigned automatically.',
  PRIMARY KEY (`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores reservation settings for each content types.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservations_reservation`
--

DROP TABLE IF EXISTS `reservations_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations_reservation` (
  `nid` int(11) NOT NULL COMMENT 'The reservations’s associated nid.',
  `vid` int(11) NOT NULL COMMENT 'The reservations’s associated vid.',
  `reservations_reservation_status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Finalized bookings cannot have time conflicts with each other. Finalized availabilities must be obeyed.',
  PRIMARY KEY (`nid`,`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores bookings reservations.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservations_reservation_detail`
--

DROP TABLE IF EXISTS `reservations_reservation_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations_reservation_detail` (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Unique ID for the reservation detail entry.',
  `nid` int(11) NOT NULL COMMENT 'Foreign key for reservations_reservation.nid.',
  `vid` int(11) NOT NULL COMMENT 'Foreign key for reservations_reservation.vid.',
  `reservations_placeholder_nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The nid for an associated reservation placeholder node for the reservation.',
  `reservations_item_nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The nid for an item node associated with the reservation placeholder node for the reservation.',
  `reservations_item_status` int(11) NOT NULL DEFAULT '0' COMMENT 'The status of the item associated in the item_nid column.',
  PRIMARY KEY (`did`),
  KEY `nids` (`nid`,`vid`,`reservations_placeholder_nid`,`reservations_item_nid`),
  KEY `reservations_item_status` (`reservations_item_status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores details on resources reserved.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservations_reservation_item_node`
--

DROP TABLE IF EXISTS `reservations_reservation_item_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations_reservation_item_node` (
  `nid` int(10) unsigned NOT NULL COMMENT 'The bookable resource nid.',
  `vid` int(10) unsigned NOT NULL COMMENT 'The bookable resource vid.',
  `reservations_default_availability` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Default availability of the item .',
  `reservations_sub_type` int(11) NOT NULL DEFAULT '0' COMMENT 'The subtype of resource node, either item or reservation.',
  `reservations_item_status` int(11) NOT NULL DEFAULT '0' COMMENT 'The status of the item associated in the item_nid column.',
  PRIMARY KEY (`nid`,`vid`),
  KEY `reservations_sub_type` (`reservations_sub_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information on bookable resource and bucket nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `reservations_resource_node`
--

DROP TABLE IF EXISTS `reservations_resource_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reservations_resource_node` (
  `nid` int(10) unsigned NOT NULL COMMENT 'The bookable resource nid.',
  `vid` int(10) unsigned NOT NULL COMMENT 'The bookable resource vid.',
  `reservations_default_availability` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Default availability of the item .',
  `reservations_late_fee_per_hour` float NOT NULL DEFAULT '0' COMMENT 'Per hour fee if the resource is returned late.',
  `reservations_rate_per_hour` float NOT NULL DEFAULT '0' COMMENT 'Per hour fee for use of the resource.',
  `reservations_fee_free_hours` float NOT NULL DEFAULT '0' COMMENT 'Number of hours the item can be used before fees are charged.',
  `reservations_min_cancel_hours` int(11) NOT NULL DEFAULT '0' COMMENT 'Minimum number of hours a user can cancel a reservation for the item.',
  `reservations_autocheckout` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is automatically checked out when Reservation starts.',
  `reservations_autocheckin` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is automatically checked in when Reservation starts.',
  `reservations_selfcheckout` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'TRUE if the resource is managed by selfcheckout.',
  `reservations_sub_type` int(11) NOT NULL DEFAULT '0' COMMENT 'The subtype of resource node, either item or reservation.',
  PRIMARY KEY (`nid`,`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information on bookable resource nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique role ID.',
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT 'Unique role name.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this role in listings and the user interface.',
  PRIMARY KEY (`rid`),
  UNIQUE KEY `name` (`name`),
  KEY `name_weight` (`name`,`weight`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Stores user roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `role_permission`
--

DROP TABLE IF EXISTS `role_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_permission` (
  `rid` int(10) unsigned NOT NULL COMMENT 'Foreign Key: role.rid.',
  `permission` varchar(128) NOT NULL DEFAULT '' COMMENT 'A single permission granted to the role identified by rid.',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module declaring the permission.',
  PRIMARY KEY (`rid`,`permission`),
  KEY `permission` (`permission`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the permissions assigned to user roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_config`
--

DROP TABLE IF EXISTS `rules_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The internal identifier for any configuration.',
  `name` varchar(64) NOT NULL COMMENT 'The name of the configuration.',
  `label` varchar(255) NOT NULL DEFAULT 'unlabeled' COMMENT 'The label of the configuration.',
  `plugin` varchar(127) NOT NULL COMMENT 'The name of the plugin of this configuration.',
  `active` int(11) NOT NULL DEFAULT '1' COMMENT 'Boolean indicating whether the configuration is active. Usage depends on how the using module makes use of it.',
  `weight` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Weight of the configuration. Usage depends on how the using module makes use of it.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'The exportable status of the entity.',
  `dirty` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Dirty configurations fail the integrity check, e.g. due to missing dependencies.',
  `module` varchar(255) DEFAULT NULL COMMENT 'The name of the providing module if the entity has been defined in code.',
  `owner` varchar(255) NOT NULL DEFAULT 'rules' COMMENT 'The name of the module via which the rule has been configured.',
  `access_exposed` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether to use a permission to control access for using components.',
  `data` longblob COMMENT 'Everything else, serialized.',
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `plugin` (`plugin`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_dependencies`
--

DROP TABLE IF EXISTS `rules_dependencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_dependencies` (
  `id` int(10) unsigned NOT NULL COMMENT 'The primary identifier of the configuration.',
  `module` varchar(255) NOT NULL COMMENT 'The name of the module that is required for the configuration.',
  PRIMARY KEY (`id`,`module`),
  KEY `module` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_tags`
--

DROP TABLE IF EXISTS `rules_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_tags` (
  `id` int(10) unsigned NOT NULL COMMENT 'The primary identifier of the configuration.',
  `tag` varchar(255) NOT NULL COMMENT 'The tag string associated with this configuration',
  PRIMARY KEY (`id`,`tag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `rules_trigger`
--

DROP TABLE IF EXISTS `rules_trigger`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules_trigger` (
  `id` int(10) unsigned NOT NULL COMMENT 'The primary identifier of the configuration.',
  `event` varchar(127) NOT NULL DEFAULT '' COMMENT 'The name of the event on which the configuration should be triggered.',
  PRIMARY KEY (`id`,`event`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `scheduler`
--

DROP TABLE IF EXISTS `scheduler`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scheduler` (
  `nid` int(10) unsigned NOT NULL COMMENT 'The foreign key to node.nid',
  `publish_on` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The UNIX UTC timestamp when to publish',
  `unpublish_on` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The UNIX UTC timestamp when to unpublish',
  PRIMARY KEY (`nid`),
  KEY `scheduler_publish_on` (`publish_on`),
  KEY `scheduler_unpublish_on` (`unpublish_on`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='The main table to hold the scheduler data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_dataset`
--

DROP TABLE IF EXISTS `search_dataset`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_dataset` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Search item ID, e.g. node ID for nodes.',
  `type` varchar(16) NOT NULL COMMENT 'Type of item, e.g. node.',
  `data` longtext NOT NULL COMMENT 'List of space-separated words from the item.',
  `reindex` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Set to force node reindexing.',
  PRIMARY KEY (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items that will be searched.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_index`
--

DROP TABLE IF EXISTS `search_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_index` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'The search_total.word that is associated with the search item.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item to which the word belongs.',
  `type` varchar(16) NOT NULL COMMENT 'The search_dataset.type of the searchable item to which the word belongs.',
  `score` float DEFAULT NULL COMMENT 'The numeric score of the word, higher being more important.',
  PRIMARY KEY (`word`,`sid`,`type`),
  KEY `sid_type` (`sid`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the search index, associating words, items and...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_node_links`
--

DROP TABLE IF EXISTS `search_node_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_node_links` (
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The search_dataset.sid of the searchable item containing the link to the node.',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT 'The search_dataset.type of the searchable item containing the link to the node.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid that this item links to.',
  `caption` longtext COMMENT 'The text used to link to the node.nid.',
  PRIMARY KEY (`sid`,`type`,`nid`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores items (like nodes) that link to other nodes, used...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `search_total`
--

DROP TABLE IF EXISTS `search_total`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `search_total` (
  `word` varchar(50) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique word in the search index.',
  `count` float DEFAULT NULL COMMENT 'The count of the word in the index using Zipf’s law to equalize the probability distribution.',
  PRIMARY KEY (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores search totals for words.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `semaphore`
--

DROP TABLE IF EXISTS `semaphore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semaphore` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Unique name.',
  `value` varchar(255) NOT NULL DEFAULT '' COMMENT 'A value for the semaphore.',
  `expire` double NOT NULL COMMENT 'A Unix timestamp with microseconds indicating when the semaphore should expire.',
  PRIMARY KEY (`name`),
  KEY `value` (`value`),
  KEY `expire` (`expire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for holding semaphores, locks, flags, etc. that...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sequences`
--

DROP TABLE IF EXISTS `sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sequences` (
  `value` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The value of the sequence.',
  PRIMARY KEY (`value`)
) ENGINE=InnoDB AUTO_INCREMENT=383 DEFAULT CHARSET=utf8 COMMENT='Stores IDs.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sessions` (
  `uid` int(10) unsigned NOT NULL COMMENT 'The users.uid corresponding to a session, or 0 for anonymous user.',
  `sid` varchar(128) NOT NULL COMMENT 'A session ID. The value is generated by Drupal’s session handlers.',
  `ssid` varchar(128) NOT NULL DEFAULT '' COMMENT 'Secure session ID. The value is generated by Drupal’s session handlers.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'The IP address that last used this session ID (sid).',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when this session last requested a page. Old records are purged by PHP automatically.',
  `cache` int(11) NOT NULL DEFAULT '0' COMMENT 'The time of this user’s last post. This is used when the site has specified a minimum_cache_lifetime. See cache_get().',
  `session` longblob COMMENT 'The serialized contents of $_SESSION, an array of name/value pairs that persists across page requests by this session ID. Drupal loads $_SESSION from here at the start of each request and saves it at the end.',
  PRIMARY KEY (`sid`,`ssid`),
  KEY `timestamp` (`timestamp`),
  KEY `uid` (`uid`),
  KEY `ssid` (`ssid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Drupal’s session handlers read and write into the...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortcut_set`
--

DROP TABLE IF EXISTS `shortcut_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut_set` (
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'Primary Key: The menu_links.menu_name under which the set’s links are stored.',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT 'The title of the set.',
  PRIMARY KEY (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about sets of shortcuts links.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `shortcut_set_users`
--

DROP TABLE IF EXISTS `shortcut_set_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `shortcut_set_users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The users.uid for this set.',
  `set_name` varchar(32) NOT NULL DEFAULT '' COMMENT 'The shortcut_set.set_name that will be displayed for this user.',
  PRIMARY KEY (`uid`),
  KEY `set_name` (`set_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to shortcut sets.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simplenews_category`
--

DROP TABLE IF EXISTS `simplenews_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simplenews_category` (
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'taxonomy_term_data.tid used as newsletter category.',
  `format` varchar(8) NOT NULL DEFAULT '' COMMENT 'Format of the newsletter email (plain, html).',
  `priority` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Email priority according to RFC 2156 and RFC 5231 (0 = none; 1 = highest; 2 = high; 3 = normal; 4 = low; 5 = lowest).',
  `receipt` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boolean indicating request for email receipt confirmation according to RFC 2822.',
  `from_name` varchar(128) NOT NULL DEFAULT '' COMMENT 'Sender name for newsletter emails.',
  `email_subject` varchar(255) NOT NULL DEFAULT '' COMMENT 'Subject of newsletter email. May contain tokens.',
  `from_address` varchar(64) NOT NULL DEFAULT '' COMMENT 'Sender address for newsletter emails',
  `hyperlinks` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Flag indicating type of hyperlink conversion (1 = hyperlinks are in-line; 0 = hyperlinks are placed at email bottom).',
  `new_account` varchar(12) NOT NULL DEFAULT '' COMMENT 'How to treat subscription at account creation (none = None; on = Default on; off = Default off; silent = Invisible subscription).',
  `opt_inout` varchar(12) NOT NULL DEFAULT '' COMMENT 'How to treat subscription confirmation (hidden = Newsletter is hidden from the user; single = Single opt-in; double = Double opt-in).',
  `block` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'For this category a subscription block is available.',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simplenews newsletter categories.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simplenews_mail_spool`
--

DROP TABLE IF EXISTS `simplenews_mail_spool`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simplenews_mail_spool` (
  `msid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The primary identifier for a mail spool record.',
  `mail` varchar(255) NOT NULL DEFAULT '' COMMENT 'The formatted email address of mail message recipient.',
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'The node.nid of this newsletter.',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'The simplenews_category.tid this newsletter belongs to.',
  `status` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The sent status of the email (0 = hold, 1 = pending, 2 = done).',
  `error` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'A boolean indicating whether an error occured while sending the email.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The time status was set or changed.',
  `data` longtext COMMENT 'A serialized array of name value pairs that are related to the email address.',
  `snid` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key for subscriber table (simplenews_subscriptions.snid)',
  PRIMARY KEY (`msid`),
  KEY `tid` (`tid`),
  KEY `status` (`status`),
  KEY `snid_tid` (`snid`,`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Spool for temporary storage of newsletter emails.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simplenews_newsletter`
--

DROP TABLE IF EXISTS `simplenews_newsletter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simplenews_newsletter` (
  `nid` int(11) NOT NULL DEFAULT '0' COMMENT 'node that is used as newsletter.',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'The newsletter category simplenews_category.tid this newsletter belongs to.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'sent status of the newsletter issue (0 = not sent; 1 = pending; 2 = sent, 3 = send on publish).',
  `sent_subscriber_count` int(11) NOT NULL DEFAULT '0' COMMENT 'The count of subscribers to the newsletter when it was sent.',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Simplenews newsletter data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simplenews_subscriber`
--

DROP TABLE IF EXISTS `simplenews_subscriber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simplenews_subscriber` (
  `snid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary key: Unique subscriber ID.',
  `activated` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating the status of the subscription.',
  `mail` varchar(64) NOT NULL DEFAULT '' COMMENT 'The subscriber’s email address.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid that has the same email address.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'Subscriber preferred language.',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp of when the user is (un)subscribed.',
  `changes` text COMMENT 'Contains the requested subscription changes',
  `created` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp of when the subscription record was added.',
  PRIMARY KEY (`snid`),
  KEY `mail` (`mail`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Subscribers to simplenews_category. Many-to-many relation...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simplenews_subscription`
--

DROP TABLE IF EXISTS `simplenews_subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simplenews_subscription` (
  `snid` int(11) NOT NULL DEFAULT '0' COMMENT 'The simplenews_subscriber.snid who is subscribed.',
  `tid` int(11) NOT NULL DEFAULT '0' COMMENT 'The category (simplenews_category.tid) the subscriber is subscribed to.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'A flag indicating whether the user is subscribed (1) or unsubscribed (0).',
  `timestamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'UNIX timestamp of when the user is (un)subscribed.',
  `source` varchar(24) NOT NULL DEFAULT '' COMMENT 'The source via which the user is (un)subscription.',
  PRIMARY KEY (`snid`,`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Newsletter subscription data. Which subscriber is...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simplereservation_item`
--

DROP TABLE IF EXISTS `simplereservation_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simplereservation_item` (
  `iid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Item ID',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the item',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT 'Description of the item',
  `comment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Comment of the item',
  `status` int(10) unsigned DEFAULT '1' COMMENT 'Status of the item (e.g. availability)',
  PRIMARY KEY (`iid`),
  KEY `iid` (`iid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='simplereservation_item holds all items which can be reserved';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simplereservation_reservation`
--

DROP TABLE IF EXISTS `simplereservation_reservation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simplereservation_reservation` (
  `rid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Reservation primary ID',
  `item_id` int(10) unsigned NOT NULL COMMENT 'Reservation item ID',
  `uid` int(10) unsigned NOT NULL COMMENT 'UID of the user for who the item reserved',
  `for_uid` int(10) unsigned DEFAULT NULL COMMENT 'ID of the user for whom the item was reserved for',
  `begin` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Time, when the reservation starts',
  `ending` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Time, when the reservation ends',
  `rcomment` varchar(255) NOT NULL DEFAULT '' COMMENT 'Text comment that accompanies the reservation',
  `whd` int(10) unsigned DEFAULT '1' COMMENT 'Whole day reservations',
  PRIMARY KEY (`rid`),
  KEY `rid` (`rid`),
  KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='simplereservation_reservation holds all reservations done';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simpletest`
--

DROP TABLE IF EXISTS `simpletest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simpletest` (
  `message_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique simpletest message ID.',
  `test_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Test ID, messages belonging to the same ID are reported together',
  `test_class` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the class that created this message.',
  `status` varchar(9) NOT NULL DEFAULT '' COMMENT 'Message status. Core understands pass, fail, exception.',
  `message` text NOT NULL COMMENT 'The message itself.',
  `message_group` varchar(255) NOT NULL DEFAULT '' COMMENT 'The message group this message belongs to. For example: warning, browser, user.',
  `function` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the assertion function or method that created this message.',
  `line` int(11) NOT NULL DEFAULT '0' COMMENT 'Line number on which the function is called.',
  `file` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the file where the function is called.',
  PRIMARY KEY (`message_id`),
  KEY `reporter` (`test_class`,`message_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores simpletest messages';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `simpletest_test_id`
--

DROP TABLE IF EXISTS `simpletest_test_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `simpletest_test_id` (
  `test_id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique simpletest ID used to group test results together. Each time a set of tests\n                            are run a new test ID is used.',
  `last_prefix` varchar(60) DEFAULT '' COMMENT 'The last database prefix used during testing.',
  PRIMARY KEY (`test_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores simpletest test IDs, used to auto-incrament the...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT 'The path of the primary file for this item, relative to the Drupal root; e.g. modules/node/node.module.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The name of the item; e.g. node.',
  `type` varchar(12) NOT NULL DEFAULT '' COMMENT 'The type of the item, either module, theme, or theme_engine.',
  `owner` varchar(255) NOT NULL DEFAULT '' COMMENT 'A theme’s ’parent’ . Can be either a theme or an engine.',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether or not this item is enabled.',
  `bootstrap` int(11) NOT NULL DEFAULT '0' COMMENT 'Boolean indicating whether this module is loaded during Drupal’s early bootstrapping phase (e.g. even before the page cache is consulted).',
  `schema_version` smallint(6) NOT NULL DEFAULT '-1' COMMENT 'The module’s database schema version number. -1 if the module is not installed (its tables do not exist); 0 or the largest N of the module’s hook_update_N() function that has either been run or existed when the module was first installed.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The order in which this module’s hooks should be invoked relative to other modules. Equal-weighted modules are ordered by name.',
  `info` blob COMMENT 'A serialized array containing information from the module’s .info file; keys can include name, description, package, version, core, dependencies, and php.',
  PRIMARY KEY (`filename`),
  KEY `system_list` (`status`,`bootstrap`,`type`,`weight`,`name`),
  KEY `type_name` (`type`,`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='A list of all modules, themes, and theme engines that are...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_index`
--

DROP TABLE IF EXISTS `taxonomy_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_index` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node.nid this record tracks.',
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The term ID.',
  `sticky` tinyint(4) DEFAULT '0' COMMENT 'Boolean indicating whether the node is sticky.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'The Unix timestamp when the node was created.',
  KEY `term_node` (`tid`,`sticky`,`created`),
  KEY `nid` (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maintains denormalized information about node/term...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_term_data`
--

DROP TABLE IF EXISTS `taxonomy_term_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_term_data` (
  `tid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique term ID.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The taxonomy_vocabulary.vid of the vocabulary to which the term is assigned.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The term name.',
  `description` longtext COMMENT 'A description of the term.',
  `format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the description.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this term in relation to other terms.',
  PRIMARY KEY (`tid`),
  KEY `taxonomy_tree` (`vid`,`weight`,`name`),
  KEY `vid_name` (`vid`,`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8 COMMENT='Stores term information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_term_hierarchy`
--

DROP TABLE IF EXISTS `taxonomy_term_hierarchy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_term_hierarchy` (
  `tid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term.',
  `parent` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: The taxonomy_term_data.tid of the term’s parent. 0 indicates no parent.',
  PRIMARY KEY (`tid`,`parent`),
  KEY `parent` (`parent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores the hierarchical relationship between terms.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `taxonomy_vocabulary`
--

DROP TABLE IF EXISTS `taxonomy_vocabulary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `taxonomy_vocabulary` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique vocabulary ID.',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'Name of the vocabulary.',
  `machine_name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The vocabulary machine name.',
  `description` longtext COMMENT 'Description of the vocabulary.',
  `hierarchy` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The type of hierarchy allowed within the vocabulary. (0 = disabled, 1 = single, 2 = multiple)',
  `module` varchar(255) NOT NULL DEFAULT '' COMMENT 'The module which created the vocabulary.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of this vocabulary in relation to other vocabularies.',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `machine_name` (`machine_name`),
  KEY `list` (`weight`,`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='Stores vocabulary information.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trigger_assignments`
--

DROP TABLE IF EXISTS `trigger_assignments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trigger_assignments` (
  `hook` varchar(78) NOT NULL DEFAULT '' COMMENT 'Primary Key: The name of the internal Drupal hook; for example, node_insert.',
  `aid` varchar(255) NOT NULL DEFAULT '' COMMENT 'Primary Key: Action’s actions.aid.',
  `weight` int(11) NOT NULL DEFAULT '0' COMMENT 'The weight of the trigger assignment in relation to other triggers.',
  PRIMARY KEY (`hook`,`aid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps trigger to hook and operation assignments from...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `url_alias`
--

DROP TABLE IF EXISTS `url_alias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `url_alias` (
  `pid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'A unique path alias identifier.',
  `source` varchar(255) NOT NULL DEFAULT '' COMMENT 'The Drupal path this alias is for; e.g. node/12.',
  `alias` varchar(255) NOT NULL DEFAULT '' COMMENT 'The alias for this path; e.g. title-of-the-story.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'The language this alias is for; if ’und’, the alias will be used for unknown languages. Each Drupal path can have an alias for each supported language.',
  PRIMARY KEY (`pid`),
  KEY `alias_language_pid` (`alias`,`language`,`pid`),
  KEY `source_language_pid` (`source`,`language`,`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=494 DEFAULT CHARSET=utf8 COMMENT='A list of URL aliases for Drupal paths; a user may visit...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: Unique user ID.',
  `name` varchar(60) NOT NULL DEFAULT '' COMMENT 'Unique user name.',
  `pass` varchar(128) NOT NULL DEFAULT '' COMMENT 'User’s password (hashed).',
  `mail` varchar(254) DEFAULT '' COMMENT 'User’s e-mail address.',
  `theme` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s default theme.',
  `signature` varchar(255) NOT NULL DEFAULT '' COMMENT 'User’s signature.',
  `signature_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the signature.',
  `created` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for when user was created.',
  `access` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for previous time user accessed the site.',
  `login` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp for user’s last login.',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Whether the user is active(1) or blocked(0).',
  `timezone` varchar(32) DEFAULT NULL COMMENT 'User’s time zone.',
  `language` varchar(12) NOT NULL DEFAULT '' COMMENT 'User’s default language.',
  `picture` int(11) NOT NULL DEFAULT '0' COMMENT 'Foreign key: file_managed.fid of user’s picture.',
  `init` varchar(254) DEFAULT '' COMMENT 'E-mail address used for initial account creation.',
  `data` longblob COMMENT 'A serialized array of name value pairs that are related to the user. Any form values posted during user edit are stored and are loaded into the $user object during user_load(). Use of this field is discouraged and it will likely disappear in a future...',
  PRIMARY KEY (`uid`),
  UNIQUE KEY `name` (`name`),
  KEY `access` (`access`),
  KEY `created` (`created`),
  KEY `mail` (`mail`),
  KEY `picture` (`picture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores user data.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: users.uid for user.',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Primary Key: role.rid for role.',
  PRIMARY KEY (`uid`,`rid`),
  KEY `rid` (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps users to roles.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variable`
--

DROP TABLE IF EXISTS `variable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable` (
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longblob NOT NULL COMMENT 'The value of the variable.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by Drupal core or any...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `variable_store`
--

DROP TABLE IF EXISTS `variable_store`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variable_store` (
  `realm` varchar(50) NOT NULL DEFAULT '' COMMENT 'The realm domain of this variable.',
  `realm_key` varchar(50) NOT NULL DEFAULT '' COMMENT 'The realm key of this variable.',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The name of the variable.',
  `value` longtext NOT NULL COMMENT 'The value of the variable.',
  `serialized` smallint(6) NOT NULL DEFAULT '1' COMMENT 'A flag to indicate whether content is serialized (1) or not (0).',
  PRIMARY KEY (`realm`,`realm_key`,`name`),
  KEY `realm_value` (`realm`,`realm_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Named variable/value pairs created by modules using...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `views_display`
--

DROP TABLE IF EXISTS `views_display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views_display` (
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The view this display is attached to.',
  `id` varchar(64) NOT NULL DEFAULT '' COMMENT 'An identifier for this display; usually generated from the display_plugin, so should be something like page or page_1 or block_2, etc.',
  `display_title` varchar(64) NOT NULL DEFAULT '' COMMENT 'The title of the display, viewable by the administrator.',
  `display_plugin` varchar(64) NOT NULL DEFAULT '' COMMENT 'The type of the display. Usually page, block or embed, but is pluggable so may be other things.',
  `position` int(11) DEFAULT '0' COMMENT 'The order in which this display is loaded.',
  `display_options` longtext COMMENT 'A serialized array of options for this display; it contains options that are generally only pertinent to that display plugin type.',
  PRIMARY KEY (`vid`,`id`),
  KEY `vid` (`vid`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about each display attached to a view.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `views_view`
--

DROP TABLE IF EXISTS `views_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `views_view` (
  `vid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The view ID of the field, defined by the database.',
  `name` varchar(128) NOT NULL DEFAULT '' COMMENT 'The unique name of the view. This is the primary field views are loaded from, and is used so that views may be internal and not necessarily in the database. May only be alphanumeric characters plus underscores.',
  `description` varchar(255) DEFAULT '' COMMENT 'A description of the view for the admin interface.',
  `tag` varchar(255) DEFAULT '' COMMENT 'A tag used to group/sort views in the admin interface',
  `base_table` varchar(64) NOT NULL DEFAULT '' COMMENT 'What table this view is based on, such as node, user, comment, or term.',
  `human_name` varchar(255) DEFAULT '' COMMENT 'A human readable name used to be displayed in the admin interface',
  `core` int(11) DEFAULT '0' COMMENT 'Stores the drupal core version of the view.',
  PRIMARY KEY (`vid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='Stores the general data for a view.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `watchdog`
--

DROP TABLE IF EXISTS `watchdog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `watchdog` (
  `wid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key: Unique watchdog event ID.',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT 'The users.uid of the user who triggered the event.',
  `type` varchar(64) NOT NULL DEFAULT '' COMMENT 'Type of log message, for example `user` or `page not found.`',
  `message` longtext NOT NULL COMMENT 'Text of log message to be passed into the t() function.',
  `variables` longblob NOT NULL COMMENT 'Serialized array of variables that match the message string and that is passed into the t() function.',
  `severity` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'The severity level of the event; ranges from 0 (Emergency) to 7 (Debug)',
  `link` varchar(255) DEFAULT '' COMMENT 'Link to view the result of the event.',
  `location` text NOT NULL COMMENT 'URL of the origin of the event.',
  `referer` text COMMENT 'URL of referring page.',
  `hostname` varchar(128) NOT NULL DEFAULT '' COMMENT 'Hostname of the user who triggered the event.',
  `timestamp` int(11) NOT NULL DEFAULT '0' COMMENT 'Unix timestamp of when event occurred.',
  PRIMARY KEY (`wid`),
  KEY `type` (`type`),
  KEY `uid` (`uid`),
  KEY `severity` (`severity`)
) ENGINE=InnoDB AUTO_INCREMENT=2033 DEFAULT CHARSET=utf8 COMMENT='Table that contains logs of all system events.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform`
--

DROP TABLE IF EXISTS `webform`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform` (
  `nid` int(10) unsigned NOT NULL COMMENT 'The node identifier of a webform.',
  `confirmation` text NOT NULL COMMENT 'The confirmation message or URL displayed to the user after submitting a form.',
  `confirmation_format` varchar(255) DEFAULT NULL COMMENT 'The filter_format.format of the confirmation message.',
  `redirect_url` varchar(255) DEFAULT '<confirmation>' COMMENT 'The URL a user is redirected to after submitting a form.',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value of a webform for open (1) or closed (0).',
  `block` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether this form be available as a block.',
  `teaser` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether the entire form should be displayed on the teaser.',
  `allow_draft` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether submissions to this form be saved as a draft.',
  `auto_save` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean value for whether submissions to this form should be auto-saved between pages.',
  `submit_notice` tinyint(4) NOT NULL DEFAULT '1' COMMENT 'Boolean value for whether to show or hide the previous submissions notification.',
  `submit_text` varchar(255) DEFAULT NULL COMMENT 'The title of the submit button on the form.',
  `submit_limit` tinyint(4) NOT NULL DEFAULT '-1' COMMENT 'The number of submissions a single user is allowed to submit within an interval. -1 is unlimited.',
  `submit_interval` int(11) NOT NULL DEFAULT '-1' COMMENT 'The amount of time in seconds that must pass before a user can submit another submission within the set limit.',
  `total_submit_limit` int(11) NOT NULL DEFAULT '-1' COMMENT 'The total number of submissions allowed within an interval. -1 is unlimited.',
  `total_submit_interval` int(11) NOT NULL DEFAULT '-1' COMMENT 'The amount of time in seconds that must pass before another submission can be submitted within the set limit.',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table for storing additional properties for webform nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_component`
--

DROP TABLE IF EXISTS `webform_component`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_component` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'The identifier for this component within this node, starts at 0 for each node.',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'If this component has a parent fieldset, the cid of that component.',
  `form_key` varchar(128) DEFAULT NULL COMMENT 'When the form is displayed and processed, this key can be used to reference the results.',
  `name` varchar(255) DEFAULT NULL COMMENT 'The label for this component.',
  `type` varchar(16) DEFAULT NULL COMMENT 'The field type of this component (textfield, select, hidden, etc.).',
  `value` text NOT NULL COMMENT 'The default value of the component when displayed to the end-user.',
  `extra` text NOT NULL COMMENT 'Additional information unique to the display or processing of this component.',
  `mandatory` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Boolean flag for if this component is required.',
  `weight` smallint(6) NOT NULL DEFAULT '0' COMMENT 'Determines the position of this component in the form.',
  PRIMARY KEY (`nid`,`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores information about components for webform nodes.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_emails`
--

DROP TABLE IF EXISTS `webform_emails`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_emails` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `eid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'The e-mail identifier for this row’s settings.',
  `email` text COMMENT 'The e-mail address that will be sent to upon submission. This may be an e-mail address, the special key `default` or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `subject` varchar(255) DEFAULT NULL COMMENT 'The e-mail subject that will be used. This may be a string, the special key `default` or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `from_name` varchar(255) DEFAULT NULL COMMENT 'The e-mail `from` name that will be used. This may be a string, the special key `default` or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `from_address` varchar(255) DEFAULT NULL COMMENT 'The e-mail `from` e-mail address that will be used. This may be a string, the special key `default` or a numeric value. If a numeric value is used, the value of a component will be substituted on submission.',
  `template` text COMMENT 'A template that will be used for the sent e-mail. This may be a string or the special key `default`, which will use the template provided by the theming layer.',
  `excluded_components` text NOT NULL COMMENT 'A list of components that will not be included in the %email_values token. A list of CIDs separated by commas.',
  `html` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Determines if the e-mail will be sent in an HTML format. Requires Mime Mail module.',
  `attachments` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Determines if the e-mail will include file attachments. Requires Mime Mail module.',
  PRIMARY KEY (`nid`,`eid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds information regarding e-mails that should be sent...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_last_download`
--

DROP TABLE IF EXISTS `webform_last_download`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_last_download` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user identifier.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The last downloaded submission number.',
  `requested` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Timestamp of last download request.',
  PRIMARY KEY (`nid`,`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores last submission number per user download.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_roles`
--

DROP TABLE IF EXISTS `webform_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_roles` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `rid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The role identifier.',
  PRIMARY KEY (`nid`,`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Holds access information regarding which roles are...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_submissions`
--

DROP TABLE IF EXISTS `webform_submissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_submissions` (
  `sid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'The unique identifier for this submission.',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The id of the user that completed this submission.',
  `is_draft` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'Is this a draft of the submission?',
  `submitted` int(11) NOT NULL DEFAULT '0' COMMENT 'Timestamp of when the form was submitted.',
  `remote_addr` varchar(128) DEFAULT NULL COMMENT 'The IP address of the user that submitted the form.',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `sid_nid` (`sid`,`nid`),
  KEY `nid_uid_sid` (`nid`,`uid`,`sid`),
  KEY `nid_sid` (`nid`,`sid`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='Holds general information about submissions outside of...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `webform_submitted_data`
--

DROP TABLE IF EXISTS `webform_submitted_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webform_submitted_data` (
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The node identifier of a webform.',
  `sid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The unique identifier for this submission.',
  `cid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT 'The identifier for this component within this node, starts at 0 for each node.',
  `no` varchar(128) NOT NULL DEFAULT '0' COMMENT 'Usually this value is 0, but if a field has multiple values (such as a time or date), it may require multiple rows in the database.',
  `data` mediumtext NOT NULL COMMENT 'The submitted value of this field, may be serialized for some components.',
  PRIMARY KEY (`nid`,`sid`,`cid`,`no`),
  KEY `nid` (`nid`),
  KEY `sid_nid` (`sid`,`nid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Stores all submitted field data for webform submissions.';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_access`
--

DROP TABLE IF EXISTS `workbench_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_access` (
  `access_id` varchar(80) NOT NULL DEFAULT '' COMMENT 'The section identifier, which may be non-numeric.',
  `access_scheme` varchar(40) NOT NULL DEFAULT '' COMMENT 'The module responsbile for this access system.',
  `access_type` varchar(40) NOT NULL DEFAULT '' COMMENT 'The access type (e.g. taxonomy).',
  `access_type_id` varchar(255) NOT NULL DEFAULT '' COMMENT 'The primary key for the access type (e.g. a vocabulary id).',
  PRIMARY KEY (`access_id`,`access_scheme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the active sections for hierarchical access...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_access_node`
--

DROP TABLE IF EXISTS `workbench_access_node`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_access_node` (
  `nid` int(11) NOT NULL COMMENT 'The node identifier. Foreign key to node.',
  `access_id` varchar(80) NOT NULL DEFAULT '' COMMENT 'The section identifier. Foreign key to workbench_access.',
  `access_scheme` varchar(40) NOT NULL DEFAULT '' COMMENT 'The module responsbile for this access system.',
  PRIMARY KEY (`nid`,`access_id`,`access_scheme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps sections to nodes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_access_role`
--

DROP TABLE IF EXISTS `workbench_access_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_access_role` (
  `rid` int(11) NOT NULL COMMENT 'The role identifier. Foreign key to role.',
  `access_id` varchar(80) NOT NULL DEFAULT '' COMMENT 'The section identifier. Foreign key to workbench_access.',
  `access_scheme` varchar(40) NOT NULL DEFAULT '' COMMENT 'The module responsbile for this access system.',
  PRIMARY KEY (`rid`,`access_id`,`access_scheme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps role access to sections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_access_user`
--

DROP TABLE IF EXISTS `workbench_access_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_access_user` (
  `uid` int(11) NOT NULL COMMENT 'The user identifier. Foreign key to users.',
  `access_id` varchar(80) NOT NULL DEFAULT '' COMMENT 'The section identifier. Foreign key to workbench_access.',
  `access_scheme` varchar(40) NOT NULL DEFAULT '' COMMENT 'The module responsbile for this access system.',
  PRIMARY KEY (`uid`,`access_id`,`access_scheme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Maps user access to sections';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_moderation_node_history`
--

DROP TABLE IF EXISTS `workbench_moderation_node_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_moderation_node_history` (
  `hid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Node history entry key.',
  `vid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Node revision id. Foreign key to node_revision',
  `nid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Node id. Foreign key to node',
  `from_state` varchar(255) DEFAULT NULL COMMENT 'The old moderation state of the node',
  `state` varchar(255) DEFAULT NULL COMMENT 'The current moderation state of the node.',
  `uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The user id of the moderator who made the change. Foreign key to users.',
  `stamp` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'The timestamp of the change.',
  `published` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicated the live revision of a node.',
  `current` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Indicated the current revision of a node.',
  PRIMARY KEY (`hid`),
  KEY `nid` (`nid`),
  KEY `vid` (`vid`)
) ENGINE=InnoDB AUTO_INCREMENT=436 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_moderation_states`
--

DROP TABLE IF EXISTS `workbench_moderation_states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_moderation_states` (
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT 'The machine name of the moderation state.',
  `label` varchar(255) DEFAULT NULL COMMENT 'A label for the moderation state.',
  `description` varchar(255) DEFAULT NULL COMMENT 'A description of the moderation state.',
  `weight` int(11) DEFAULT '0' COMMENT 'Sort weight for the moderation state.',
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines all possible states';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_moderation_transitions`
--

DROP TABLE IF EXISTS `workbench_moderation_transitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_moderation_transitions` (
  `from_name` varchar(255) DEFAULT NULL COMMENT 'The starting moderation state.',
  `to_name` varchar(255) DEFAULT NULL COMMENT 'The ending moderation state.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Defines the valid transitions for states';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_scheduler_nodes`
--

DROP TABLE IF EXISTS `workbench_scheduler_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_scheduler_nodes` (
  `nid` int(10) unsigned NOT NULL COMMENT 'The node id',
  `vid` int(10) unsigned NOT NULL COMMENT 'The revision id of the node',
  `sid` int(10) unsigned NOT NULL COMMENT 'The id of the schedule',
  `start_date` int(10) unsigned NOT NULL COMMENT 'the date when the start state should be applied',
  `end_date` int(10) unsigned DEFAULT '0' COMMENT 'the date when the end state should be applied',
  `completed` int(10) unsigned DEFAULT '0' COMMENT 'mark if the schedule has been completed for this node',
  UNIQUE KEY `vid` (`vid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Saves the schedule information for nodes';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_scheduler_schedules`
--

DROP TABLE IF EXISTS `workbench_scheduler_schedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_scheduler_schedules` (
  `sid` int(11) NOT NULL AUTO_INCREMENT COMMENT 'The unique id for a schedule',
  `name` varchar(255) NOT NULL COMMENT 'A unique machine name to identify the schedule',
  `label` varchar(255) NOT NULL COMMENT 'A label for the schedule',
  `start_state` varchar(255) NOT NULL COMMENT 'The state to set at the start date',
  `end_state` varchar(255) NOT NULL COMMENT 'The state to set at the end date',
  PRIMARY KEY (`sid`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='Saves data for workbench schedules that can be run on the...';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `workbench_scheduler_types`
--

DROP TABLE IF EXISTS `workbench_scheduler_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workbench_scheduler_types` (
  `name` varchar(255) NOT NULL COMMENT 'The machine name of a schedule',
  `type` varchar(255) NOT NULL COMMENT 'The machine name of a content type',
  UNIQUE KEY `name_type` (`name`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Saves the associations between schedules and content types';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-10-14 23:43:18
