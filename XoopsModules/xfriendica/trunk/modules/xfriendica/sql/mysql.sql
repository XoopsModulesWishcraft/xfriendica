/*
SQLyog Community v10.12 
MySQL - 5.5.24 : Database - xfriendica
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
/*Table structure for table `xfriendica_addons` */

CREATE TABLE `xfriendica_addons` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `salt` char(128) NOT NULL,
  `guid` char(64) NOT NULL,
  `name` char(255) NOT NULL,
  `version` char(255) NOT NULL,
  `version-php` char(16) DEFAULT '5.3.17',
  `version-xoops` char(16) DEFAULT '2.5.5',
  `version-xfriendica` char(16) DEFAULT '1.0.1',
  `dirname` char(128) NOT NULL,
  `filename` char(128) NOT NULL,
  `protocol-id` bigint(24) DEFAULT '0',
  `function` char(128) NOT NULL,
  `class` char(128) NOT NULL,
  `prefix` char(8) NOT NULL DEFAULT 'addon_',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `upgraded` int(12) unsigned NOT NULL DEFAULT '0',
  `installed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hidden` enum('Yes','No') NOT NULL DEFAULT 'No',
  `system` enum('Yes','No') NOT NULL DEFAULT 'No',
  `admin` enum('Yes','No') NOT NULL DEFAULT 'No',
  `resources` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `modules` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `protocols` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `optionals` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `last` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hidden` (`hidden`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_addons` */

/*Table structure for table `xfriendica_addons_functions` */

CREATE TABLE `xfriendica_addons_functions` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `addon-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `filename` char(255) NOT NULL,
  `function` char(255) NOT NULL,
  `class` char(255) NOT NULL,
  `command` char(128) NOT NULL,
  `last` bigint(24) unsigned DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`addon-id`,`filename`,`function`,`class`,`command`),
  UNIQUE KEY `UNIQUES` (`addon-id`,`function`(64),`class`(64),`command`(32)),
  KEY `SEARCH` (`id`,`addon-id`,`command`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_addons_functions` */

/*Table structure for table `xfriendica_addons_modules` */

CREATE TABLE `xfriendica_addons_modules` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `addon-id` bigint(24) unsigned NOT NULL,
  `dirname` char(128) NOT NULL,
  `version` decimal(5,3) unsigned NOT NULL DEFAULT '0.000',
  `required` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `optional` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`addon-id`,`dirname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_addons_modules` */

/*Table structure for table `xfriendica_addons_protocols` */

CREATE TABLE `xfriendica_addons_protocols` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `addon-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `protocol-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `guid` char(64) DEFAULT '',
  `required` enum('Yes','No') DEFAULT 'Yes',
  `optional` enum('Yes','No') DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUES` (`protocol-id`,`guid`,`required`,`optional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_addons_protocols` */

/*Table structure for table `xfriendica_addons_resources` */

CREATE TABLE `xfriendica_addons_resources` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `addon-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `type` enum('function','extension','class','module','core') NOT NULL DEFAULT 'extension',
  `name` char(128) NOT NULL DEFAULT '',
  `dirname` char(128) DEFAULT '',
  `version` decimal(5,3) unsigned DEFAULT '1.000',
  `class` char(128) NOT NULL DEFAULT '',
  `command` char(128) DEFAULT '',
  `required` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `optional` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_addons_resources` */

/*Table structure for table `xfriendica_avartas` */

CREATE TABLE `xfriendica_avartas` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) DEFAULT NULL,
  `state` enum('network','server','local','remote','client') DEFAULT 'local',
  `state-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `file-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `last` int(12) unsigned NOT NULL DEFAULT '0',
  `retrieved` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_avartas` */

/*Table structure for table `xfriendica_clients` */

CREATE TABLE `xfriendica_clients` (
  `client-id` varchar(20) NOT NULL,
  `guid` char(64) NOT NULL,
  `name` char(255) DEFAULT NULL,
  `keys-id` bigint(24) NOT NULL DEFAULT '0',
  `avarta-id` bigint(24) NOT NULL DEFAULT '0',
  `go-url-id` bigint(24) NOT NULL DEFAULT '0',
  `website-url-id` bigint(24) NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`client-id`,`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_clients` */

/*Table structure for table `xfriendica_discussions` */

CREATE TABLE `xfriendica_discussions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) NOT NULL,
  `person-id` int(12) NOT NULL,
  `recipients` int(5) unsigned NOT NULL DEFAULT '0',
  `blocked` int(5) unsigned NOT NULL DEFAULT '0',
  `spam` int(5) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `created` (`created`),
  KEY `updated` (`updated`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_discussions` */

/*Table structure for table `xfriendica_discussions_recipients` */

CREATE TABLE `xfriendica_discussions_recipients` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `discussion-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`discussion-id`,`person-id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_discussions_recipients` */

/*Table structure for table `xfriendica_event` */

CREATE TABLE `xfriendica_event` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `guid` char(64) DEFAULT NULL,
  `type-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `location-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `invitees` int(10) unsigned NOT NULL DEFAULT '0',
  `attending` int(10) unsigned NOT NULL DEFAULT '0',
  `missing` int(10) unsigned NOT NULL DEFAULT '0',
  `maybe` int(10) unsigned NOT NULL DEFAULT '0',
  `uri-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `start` int(12) unsigned NOT NULL DEFAULT '0',
  `finish` int(12) unsigned NOT NULL DEFAULT '0',
  `passon` enum('Yes','No') NOT NULL DEFAULT 'No',
  `nofinish` enum('Yes','No') NOT NULL DEFAULT 'No',
  `adjust` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `ignore` enum('Yes','No') NOT NULL DEFAULT 'No',
  `activity` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`person-id`),
  KEY `cid` (`attending`),
  KEY `uri` (`uri-id`),
  KEY `type` (`type-id`),
  KEY `start` (`start`),
  KEY `finish` (`finish`),
  KEY `adjust` (`adjust`),
  KEY `ignore` (`ignore`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_event` */

/*Table structure for table `xfriendica_event_persons` */

CREATE TABLE `xfriendica_event_persons` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('attenting','missing','maybe','invitee') DEFAULT 'maybe',
  `event-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `to-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `from-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `notified` int(12) unsigned NOT NULL DEFAULT '0',
  `syndicated` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_event_persons` */

/*Table structure for table `xfriendica_event_types` */

CREATE TABLE `xfriendica_event_types` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `type` char(128) NOT NULL,
  `language` char(5) DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_event_types` */

/*Table structure for table `xfriendica_files` */

CREATE TABLE `xfriendica_files` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) DEFAULT NULL,
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `source` enum('server','remote','unknown') DEFAULT 'server',
  `state` enum('image','binary') DEFAULT 'image',
  `mode` enum('photo','icon','avarta','binary') DEFAULT 'avarta',
  `relative` enum('XOOPS_ROOT_PATH','XOOPS_UPLOAD_PATH','XOOPS_VAR_PATH','XOOPS_TRUST_PATH','URL','REMOTE') DEFAULT 'XOOPS_VAR_PATH',
  `availability` enum('global','network','private','tribe','friends','individual','tokenised','password') DEFAULT 'network',
  `auth-method` enum('handshake','identity','trust','header','path','get','post','none') DEFAULT 'none',
  `md5` char(32) DEFAULT NULL,
  `path` char(255) DEFAULT '/xfriendica',
  `storedas` char(128) DEFAULT NULL,
  `filename` char(128) DEFAULT NULL,
  `size` bigint(24) DEFAULT '0',
  `type` char(128) DEFAULT 'application/octet',
  `activity` decimal(10,4) DEFAULT '0.0000',
  `url-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `scheduled` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_files` */

/*Table structure for table `xfriendica_files_destruct` */

CREATE TABLE `xfriendica_files_destruct` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `file-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `retrieved` enum('Yes','No') NOT NULL DEFAULT 'No',
  `downloaded` enum('Yes','No') NOT NULL DEFAULT 'No',
  `destroyed` int(12) unsigned NOT NULL DEFAULT '0',
  `expires` int(12) unsigned NOT NULL DEFAULT '0',
  `notified` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_files_destruct` */

/*Table structure for table `xfriendica_friends` */

CREATE TABLE `xfriendica_friends` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `from-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `intro-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `knowyou` enum('Yes','No') NOT NULL DEFAULT 'No',
  `collegue` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `ignored` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hiding` enum('Yes','No') NOT NULL DEFAULT 'No',
  `invited` int(12) unsigned NOT NULL DEFAULT '0',
  `actioned` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `network` (`intro-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_friends` */

/*Table structure for table `xfriendica_friends_finder` */

CREATE TABLE `xfriendica_friends_finder` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `intro-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `results` int(5) unsigned NOT NULL DEFAULT '0',
  `span` int(5) unsigned NOT NULL DEFAULT '0',
  `networks` int(5) unsigned NOT NULL DEFAULT '0',
  `seperation` int(5) unsigned NOT NULL DEFAULT '0',
  `terms` char(255) NOT NULL,
  `firstname` char(128) NOT NULL DEFAULT '0',
  `lastname` char(128) NOT NULL DEFAULT '0',
  `dob-year` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `region-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `city-id` bigint(12) unsigned NOT NULL DEFAULT '0',
  `country-id` int(11) unsigned NOT NULL DEFAULT '0',
  `auto-approach` enum('Yes','No') NOT NULL DEFAULT 'No',
  `flex-firstname` enum('Yes','No') NOT NULL DEFAULT 'No',
  `flex-lastname` enum('Yes','No') NOT NULL DEFAULT 'No',
  `flex-dob` enum('Yes','No') NOT NULL DEFAULT 'No',
  `flex-region` enum('Yes','No') NOT NULL DEFAULT 'No',
  `flex-city` enum('Yes','No') NOT NULL DEFAULT 'No',
  `flex-country` enum('Yes','No') NOT NULL DEFAULT 'No',
  `flex-terms` enum('Yes','No') NOT NULL DEFAULT 'No',
  `expries` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_friends_finder` */

/*Table structure for table `xfriendica_friends_intro` */

CREATE TABLE `xfriendica_friends_intro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `from-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `by-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `note` text,
  `hash` char(255) DEFAULT NULL,
  `when` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_friends_intro` */

/*Table structure for table `xfriendica_friends_suggestion` */

CREATE TABLE `xfriendica_friends_suggestion` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `to-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `from-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `by-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `note` text,
  `hash` char(255) DEFAULT NULL,
  `when` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_friends_suggestion` */

/*Table structure for table `xfriendica_group` */

CREATE TABLE `xfriendica_group` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('global','user','network','tribe') DEFAULT 'user',
  `guid` char(64) DEFAULT NULL,
  `avarta-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `name` char(255) NOT NULL,
  `summary` char(255) DEFAULT NULL,
  `desciption` text,
  `activity` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_group` */

insert  into `xfriendica_group`(`id`,`state`,`guid`,`avarta-id`,`name`,`summary`,`desciption`,`activity`,`created`,`updated`) values (1,'global',NULL,0,'Friends',NULL,NULL,'0.00000',0,0);

/*Table structure for table `xfriendica_group_keywords` */

CREATE TABLE `xfriendica_group_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `keyword-id` bigint(24) NOT NULL,
  `group-id` bigint(24) DEFAULT NULL,
  `language` char(5) DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_group_keywords` */

/*Table structure for table `xfriendica_group_persons` */

CREATE TABLE `xfriendica_group_persons` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `group-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `deleted` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `INDEXES` (`group-id`,`person-id`,`deleted`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_group_persons` */

/*Table structure for table `xfriendica_guid` */

CREATE TABLE `xfriendica_guid` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('internal','protocol','network','server','route','path','plugin','addon','mail','group','album','photo','profile','event','item','api','package','file','avarta','client','discussion','key','location','person','queue','template') NOT NULL DEFAULT 'internal',
  `guid` char(64) NOT NULL,
  `network-guid` char(64) DEFAULT NULL,
  `hash` char(32) DEFAULT NULL,
  `key-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `class` char(64) DEFAULT NULL,
  `module` char(64) DEFAULT NULL,
  `tags` char(255) DEFAULT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_guid` */

/*Table structure for table `xfriendica_item` */

CREATE TABLE `xfriendica_item` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person-id` bigint(24) DEFAULT '0',
  `parent` int(10) unsigned NOT NULL DEFAULT '0',
  `child` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` char(64) NOT NULL,
  `method` enum('raw','json','serial','xml') DEFAULT 'raw',
  `storage` enum('item','state') DEFAULT 'item',
  `visibility` enum('global','network','localised','public','admins','moderators','friends','groups','open','closed') DEFAULT 'public',
  `type` enum('plugin','adaptor','addon','connector','unknown') DEFAULT NULL,
  `type-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `template-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `longitude` float(14,10) NOT NULL DEFAULT '0.0000000000',
  `latitude` float(14,10) NOT NULL DEFAULT '0.0000000000',
  `location-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `owner-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `author-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `moderator-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `parent-url-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `url-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `chars-id-title` bigint(24) unsigned NOT NULL DEFAULT '0',
  `chars-id-subtitle` bigint(24) unsigned NOT NULL DEFAULT '0',
  `texts-id-parent-paths` bigint(24) unsigned NOT NULL DEFAULT '0',
  `texts-id-body` bigint(24) unsigned NOT NULL DEFAULT '0',
  `texts-id-footer` bigint(24) unsigned NOT NULL DEFAULT '0',
  `moderated` enum('Yes','No') NOT NULL DEFAULT 'No',
  `event` enum('Yes','No') NOT NULL DEFAULT 'No',
  `forum` enum('Yes','No') NOT NULL DEFAULT 'No',
  `wall` enum('Yes','No') NOT NULL DEFAULT 'No',
  `gravity` enum('Yes','No') NOT NULL DEFAULT 'No',
  `visible` enum('Yes','No') NOT NULL DEFAULT 'No',
  `spam` enum('Yes','No') NOT NULL DEFAULT 'No',
  `starred` enum('Yes','No') NOT NULL DEFAULT 'No',
  `bookmark` enum('Yes','No') NOT NULL DEFAULT 'No',
  `unseen` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `deleted` enum('Yes','No') NOT NULL DEFAULT 'No',
  `original` enum('Yes','No') NOT NULL DEFAULT 'No',
  `last-child` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `network` enum('Yes','No') NOT NULL DEFAULT 'No',
  `syndicated` enum('Yes','No') NOT NULL DEFAULT 'No',
  `radius` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `score` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `activity` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `files` int(5) unsigned NOT NULL DEFAULT '0',
  `hits` int(12) unsigned NOT NULL DEFAULT '0',
  `votes` int(12) NOT NULL DEFAULT '0',
  `votes-close` int(12) NOT NULL DEFAULT '0',
  `commented` int(12) unsigned NOT NULL DEFAULT '0',
  `received` int(12) unsigned NOT NULL DEFAULT '0',
  `changed` int(12) unsigned NOT NULL DEFAULT '0',
  `responded` int(12) unsigned NOT NULL DEFAULT '0',
  `state` enum('adaptor','plugin','addon','connector','event','item') DEFAULT 'plugin',
  `state-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-key-id` bigint(24) unsigned NOT NULL,
  `state-token` char(64) DEFAULT NULL,
  `state-parent-id` bigint(24) unsigned NOT NULL,
  `state-network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-check` int(12) unsigned NOT NULL DEFAULT '0',
  `state-expired` int(12) unsigned NOT NULL DEFAULT '0',
  `state-deleted` int(12) unsigned NOT NULL DEFAULT '0',
  `state-pushed` int(12) unsigned NOT NULL DEFAULT '0',
  `state-pulled` int(12) unsigned NOT NULL DEFAULT '0',
  `state-hash` char(32) NOT NULL,
  `state-template-hash` char(32) DEFAULT NULL,
  `state-template-guid` char(64) DEFAULT NULL,
  `state-source` enum('server','network','unknown') DEFAULT 'server',
  `state-source-guid` char(64) DEFAULT NULL,
  `state-source-network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-source-path-id` bigint(24) NOT NULL DEFAULT '0',
  `state-source-server-id` bigint(24) NOT NULL DEFAULT '0',
  `state-source-notified` int(12) NOT NULL DEFAULT '0',
  `state-source-called` int(12) NOT NULL DEFAULT '0',
  `state-source-given` int(12) NOT NULL DEFAULT '0',
  `state-source-hopped` enum('Yes','No') NOT NULL DEFAULT 'No',
  `state-source-direct` enum('Yes','No') NOT NULL DEFAULT 'No',
  `state-source-unknown` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) NOT NULL DEFAULT '0',
  `updated` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uri` (`url-id`),
  KEY `type` (`type-id`),
  KEY `parent` (`parent`),
  KEY `parent-uri` (`parent-url-id`),
  KEY `created` (`created`),
  KEY `edited` (`updated`),
  KEY `visible` (`visible`),
  KEY `deleted` (`deleted`),
  KEY `last-child` (`last-child`),
  KEY `unseen` (`unseen`),
  KEY `received` (`received`),
  KEY `starred` (`starred`),
  KEY `guid` (`guid`),
  KEY `origin` (`original`),
  KEY `wall` (`wall`),
  KEY `forum_mode` (`forum`),
  KEY `bookmark` (`bookmark`),
  KEY `moderated` (`moderated`),
  KEY `spam` (`spam`),
  KEY `author-name` (`author-person-id`),
  KEY `uid_commented` (`commented`),
  KEY `uid_created` (`created`),
  KEY `uid_unseen` (`unseen`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_item` */

/*Table structure for table `xfriendica_item_chars` */

CREATE TABLE `xfriendica_item_chars` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `item-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `type` enum('title','subtitle') NOT NULL,
  `value` char(255) DEFAULT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item-id`,`type`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_item_chars` */

/*Table structure for table `xfriendica_item_files` */

CREATE TABLE `xfriendica_item_files` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `item-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `file-id` bigint(24) NOT NULL DEFAULT '0',
  `destruct` enum('Yes','No') NOT NULL DEFAULT 'No',
  `md5` char(32) NOT NULL,
  `created` bigint(24) unsigned NOT NULL DEFAULT '0',
  `updated` bigint(24) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_item_files` */

/*Table structure for table `xfriendica_item_keywords` */

CREATE TABLE `xfriendica_item_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `keyword-id` bigint(24) NOT NULL,
  `item-id` bigint(24) DEFAULT NULL,
  `language` char(5) DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_item_keywords` */

/*Table structure for table `xfriendica_item_signed` */

CREATE TABLE `xfriendica_item_signed` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item-id` int(10) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `author-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `owner-person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `retract-item-id` int(10) unsigned NOT NULL DEFAULT '0',
  `item-hash` varchar(32) NOT NULL,
  `item-date` int(12) unsigned NOT NULL,
  `signature` text NOT NULL,
  `signed` int(12) unsigned NOT NULL DEFAULT '0',
  `notified` int(12) unsigned NOT NULL DEFAULT '0',
  `requested` int(12) unsigned NOT NULL DEFAULT '0',
  `resigned` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `iid` (`item-id`),
  KEY `retract_iid` (`retract-item-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_item_signed` */

/*Table structure for table `xfriendica_item_templates` */

CREATE TABLE `xfriendica_item_templates` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('smarty') NOT NULL DEFAULT 'smarty',
  `type` enum('adaptor','addon','plugin','connector','network') NOT NULL DEFAULT 'adaptor',
  `guid` char(64) NOT NULL,
  `passing` char(128) NOT NULL DEFAULT 'item',
  `user` char(128) NOT NULL DEFAULT 'user',
  `network` char(128) NOT NULL DEFAULT 'network',
  `node` char(128) NOT NULL DEFAULT 'node',
  `opening` char(5) NOT NULL DEFAULT '<{',
  `closing` char(5) NOT NULL DEFAULT '}>',
  `template` longtext NOT NULL,
  `hash` char(32) NOT NULL,
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_item_templates` */

/*Table structure for table `xfriendica_item_texts` */

CREATE TABLE `xfriendica_item_texts` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `item-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `type` enum('parent-paths','body','footer') NOT NULL DEFAULT 'body',
  `value` longtext,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`item-id`,`type`),
  KEY `INDEXES` (`item-id`,`type`,`value`(128)),
  KEY `IDS` (`id`),
  FULLTEXT KEY `TEXTUAL` (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_item_texts` */

/*Table structure for table `xfriendica_keys` */

CREATE TABLE `xfriendica_keys` (
  `id` int(22) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('contact','network','server','route','api','addon','plugin','adaptor','connector','resource','user','guid') CHARACTER SET latin1 DEFAULT NULL,
  `type` enum('ssl','xips','other') DEFAULT 'ssl',
  `key-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `guid` char(64) CHARACTER SET latin1 DEFAULT NULL,
  `public` text CHARACTER SET latin1,
  `private` text CHARACTER SET latin1,
  `public-set` enum('Yes','No') NOT NULL DEFAULT 'No',
  `private-set` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_keys` */

/*Table structure for table `xfriendica_keywords` */

CREATE TABLE `xfriendica_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) NOT NULL,
  `keyword` char(255) CHARACTER SET latin1 NOT NULL,
  `language` char(5) NOT NULL DEFAULT 'en',
  `tagged` int(12) unsigned NOT NULL DEFAULT '0',
  `uses` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_keywords` */

/*Table structure for table `xfriendica_keywords_links` */

CREATE TABLE `xfriendica_keywords_links` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('internal','network','item','plugin','addon','user','group','photo','album') CHARACTER SET latin1 DEFAULT NULL,
  `keyword-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `state-guid` char(64) CHARACTER SET latin1 DEFAULT NULL,
  `network-id` bigint(24) unsigned DEFAULT '0',
  `server-id` bigint(24) unsigned DEFAULT '0',
  `path-id` bigint(24) unsigned DEFAULT '0',
  `api-id` bigint(24) unsigned DEFAULT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_keywords_links` */

/*Table structure for table `xfriendica_keywords_same` */

CREATE TABLE `xfriendica_keywords_same` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `from-keyword-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `from-language-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `to-keyword-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `to-language-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_keywords_same` */

/*Table structure for table `xfriendica_languages` */

CREATE TABLE `xfriendica_languages` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `name` char(128) DEFAULT NULL,
  `code` char(5) DEFAULT NULL,
  `dirname` char(128) DEFAULT NULL,
  `charset` char(10) DEFAULT 'utf8',
  `font` char(128) DEFAULT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_languages` */

/*Table structure for table `xfriendica_locations` */

CREATE TABLE `xfriendica_locations` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) NOT NULL,
  `street-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `region-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `city-id` bigint(12) unsigned NOT NULL DEFAULT '0',
  `country-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `postcode-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `country-code` char(2) DEFAULT 'AU',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_locations` */

/*Table structure for table `xfriendica_locations_cities` */

CREATE TABLE `xfriendica_locations_cities` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `country-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `longitude` float(14,10) NOT NULL DEFAULT '0.0000000000',
  `latitude` float(14,10) NOT NULL DEFAULT '0.0000000000',
  `name` char(128) DEFAULT NULL,
  `uses` int(5) unsigned NOT NULL DEFAULT '0',
  `regions` int(5) unsigned NOT NULL DEFAULT '0',
  `activity` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_locations_cities` */

/*Table structure for table `xfriendica_locations_countries` */

CREATE TABLE `xfriendica_locations_countries` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `status` enum('active','inactive','waiting','deleted') CHARACTER SET latin1 DEFAULT 'inactive',
  `code` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `name` varchar(196) CHARACTER SET latin1 DEFAULT NULL,
  `dialcode` varchar(6) CHARACTER SET latin1 DEFAULT NULL,
  `tldexists` year(4) DEFAULT NULL,
  `tld` varchar(4) CHARACTER SET latin1 DEFAULT NULL,
  `startgmt` decimal(4,2) DEFAULT '0.00',
  `endgmt` decimal(4,2) DEFAULT '0.00',
  `region` enum('Antarctica','Australasia','Caribbean','Central Africa','Central America','Central Asia','Eastern Africa','Eastern Asia','Eastern Europe','Middle East','North America','Northern Africa','Northern Asia','Northern Europe','South America','Southeastern Asia','Southeastern Europe','Southern Africa','Southern Asia','Southern Europe','Southwestern Asia','United States','Western Africa','Western Europe','Other') CHARACTER SET latin1 DEFAULT NULL,
  `continent` enum('Africa','Asia','Europe','North America','South America','Oceania','Other') CHARACTER SET latin1 DEFAULT NULL,
  `daylightsaving` enum('Yes','No') CHARACTER SET latin1 DEFAULT 'No',
  `start-dls-day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') CHARACTER SET latin1 DEFAULT 'Sunday',
  `start-dls-week` enum('1st','2nd','3rd','4th') CHARACTER SET latin1 DEFAULT '4th',
  `start-dls-month` enum('January','Febuary','March','April','May','June','July','August','September','October','November','December') CHARACTER SET latin1 DEFAULT 'March',
  `start-dls-dayno` int(2) unsigned DEFAULT '0',
  `start-dls-mode` enum('day','dayno') CHARACTER SET latin1 DEFAULT 'day',
  `end-dls-day` enum('Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday') CHARACTER SET latin1 DEFAULT 'Sunday',
  `end-dls-week` enum('1st','2nd','3rd','4th') CHARACTER SET latin1 DEFAULT '4th',
  `end-dls-month` enum('January','Febuary','March','April','May','June','July','August','September','October','November','December') CHARACTER SET latin1 DEFAULT 'October',
  `end-dls-dayno` int(2) unsigned DEFAULT '0',
  `end-dls-mode` enum('day','dayno') CHARACTER SET latin1 DEFAULT 'day',
  `activity` decimal(10,5) unsigned DEFAULT '0.00000',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `SEARCH` (`status`,`code`(3),`name`(10),`daylightsaving`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_locations_countries` */

insert  into `xfriendica_locations_countries`(`id`,`status`,`code`,`name`,`dialcode`,`tldexists`,`tld`,`startgmt`,`endgmt`,`region`,`continent`,`daylightsaving`,`start-dls-day`,`start-dls-week`,`start-dls-month`,`start-dls-dayno`,`start-dls-mode`,`end-dls-day`,`end-dls-week`,`end-dls-month`,`end-dls-dayno`,`end-dls-mode`,`activity`,`created`,`updated`) values (1,'inactive','AD','Andorra','376',1974,'.ad','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621715),(2,'inactive','AE','United Arab Emirates','971',1974,'.ae','4.00','4.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(3,'inactive','AF','Afghanistan','93',1974,'.af','4.50','4.50','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(4,'inactive','AG','Antigua and Barbuda','268',1974,'.ag','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621715),(5,'inactive','AI','Anguilla','264',1983,'.ai','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(6,'inactive','AL','Albania','355',1974,'.al','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621715),(7,'inactive','AM','Armenia','374',1992,'.am','4.00','4.00','Central Asia','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621715),(8,'inactive','AO','Angola','244',1974,'.ao','1.00','1.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(9,'inactive','AQ','Antarctica','672',1974,'.aq','12.00','12.00','Antarctica','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(10,'inactive','AR','Argentina','54',1974,'.ar','-3.00','-3.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(11,'inactive','AS','American Samoa','684',1974,'.as','-11.00','-11.00','Other','Other','Yes','Sunday','4th','October',0,'day','Sunday','4th','March',0,'day','0.00000',0,1346621715),(12,'inactive','AT','Austria','43',1974,'.at','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621715),(13,'active','AU','Australia','61',1974,'.au','10.00','7.00','Australasia','Oceania','Yes','Sunday','4th','October',0,'day','Sunday','4th','March',0,'day','0.00000',0,1346621763),(14,'inactive','AW','Aruba','297',1986,'.aw','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(15,'inactive','AX','Ascension Island','247',2004,'.ax','0.00','0.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(16,'inactive','AZ','Azerbaijan','994',1992,'.az','4.00','4.00','Central Asia','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621715),(17,'inactive','BA','Bosnia and Herzegovina','387',1992,'.ba','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621715),(18,'inactive','BB','Barbados','246',1974,'.bb','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621715),(19,'inactive','BD','Bangladesh','880',1974,'.bd','6.00','6.00','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621715),(20,'inactive','BE','Belgium','32',1974,'.be','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621715),(21,'inactive','BF','Burkina Faso','226',1984,'.bf','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(22,'inactive','BG','Bulgaria','359',1974,'.bg','2.00','2.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621716),(23,'inactive','BH','Bahrain','973',1974,'.bh','3.00','3.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(24,'inactive','BI','Burundi','257',1974,'.bi','2.00','2.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(25,'inactive','BJ','Benin','229',1977,'.bj','1.00','1.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(26,'inactive','BL','Saint Barthélemy','590',2007,'.bl','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(27,'inactive','BM','Bermuda','441',1974,'.bm','-4.00','-4.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(28,'inactive','BN','Brunei Darussalam','673',1974,'.bn','8.00','8.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(29,'inactive','BO','Bolivia, Plurinational State of','591',1974,'.bo','4.00','4.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(30,'inactive','BQ','Bonaire, Sint Eustatius and Saba','599',2010,'.bq','2.00','2.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(31,'inactive','BR','Brazil','55',1974,'.br','-3.00','-5.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(32,'inactive','BS','Bahamas','242',1974,'.bs','-5.00','-5.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621716),(33,'inactive','BT','Bhutan','975',1974,'.bt','5.50','5.50','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(34,'inactive','BV','Bouvet Island','47',1974,'.bv','1.00','1.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(35,'inactive','BW','Botswana','267',1974,'.bw','2.00','2.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621716),(36,'inactive','BY','Belarus','375',1974,'.by','3.00','3.00','Eastern Europe','Europe','No','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621716),(37,'inactive','BZ','Belize','501',1974,'.bz','-6.00','-6.00','Central America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621716),(38,'inactive','CA','Canada','1',1974,'.ca','-4.00','-8.00','North America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621716),(39,'inactive','CC','Cocos (Keeling) Islands','61',1974,'.cc','6.50','6.50','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(40,'inactive','CD','Congo, the Democratic Republic of the','243',1997,'.cd','2.00','1.00','Other','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(41,'inactive','CF','Central African Republic','236',1974,'.cf','1.00','1.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(42,'inactive','CG','Congo','242',1974,'.cg','1.00','1.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(43,'inactive','CH','Switzerland','41',1974,'.ch','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621717),(44,'inactive','CI','Côte d\'Ivoire','225',1974,'.ci','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(45,'inactive','CK','Cook Islands','682',1974,'.ck','-10.00','-10.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(46,'inactive','CL','Chile','56',1974,'.cl','-4.00','-4.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(47,'inactive','CM','Cameroon','237',1974,'.cm','1.00','1.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(48,'inactive','CN','China','86',1974,'.cn','8.00','8.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(49,'inactive','CO','Colombia','57',1974,'.co','-5.00','-5.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(50,'inactive','CR','Costa Rica','506',1974,'.cr','-6.00','-6.00','Central America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621717),(51,'inactive','CU','Cuba','53',1974,'.cu','-3.00','-3.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621717),(52,'inactive','CV','Cape Verde','238',1974,'.cv','-1.00','-1.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621717),(53,'inactive','CW','Curaçao','599',2010,'.cw','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(54,'inactive','CX','Christmas Island','61',1974,'.cx','8.00','8.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(55,'inactive','CY','Cyprus','357',1974,'.cy','2.00','2.00','Other','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621718),(56,'inactive','CZ','Czech Republic','420',1993,'.cz','1.00','1.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621718),(57,'inactive','DE','Germany','49',1974,'.de','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621718),(58,'inactive','DJ','Djibouti','253',1977,'.dj','3.00','3.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(59,'inactive','DK','Denmark','45',1974,'.dk','1.00','1.00','Southeastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621718),(60,'inactive','DM','Dominica','767',1974,'.dm','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621718),(61,'inactive','DO','Dominican Republic','809',1974,'.do','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621718),(62,'inactive','DZ','Algeria','213',1974,'.dz','1.00','1.00','Northern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(63,'inactive','EC','Ecuador','593',1974,'.ec','-5.00','-5.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(64,'inactive','EE','Estonia','372',1992,'.ee','3.00','3.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621718),(65,'inactive','EG','Egypt','20',1974,'.eg','2.00','2.00','Northern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(66,'inactive','EH','Western Sahara','212',1974,'.eh','0.00','0.00','Northern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(67,'inactive','ER','Eritrea','291',1993,'.er','3.00','3.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(68,'inactive','ES','Spain','34',1974,'.es','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621718),(69,'inactive','ET','Ethiopia','251',1974,'.et','3.00','3.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621718),(70,'inactive','FI','Finland','358',1974,'.fi','2.00','2.00','Northern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621718),(71,'inactive','FJ','Fiji','679',1974,'.fj','12.00','12.00','Australasia','Oceania','Yes','Sunday','4th','October',0,'day','Sunday','4th','March',0,'day','0.00000',0,1346621719),(72,'inactive','FK','Falkland Islands (Malvinas)','500',1974,'.fk','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(73,'inactive','FM','Micronesia, Federated States of','691',1986,'.fm','10.00','10.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(74,'inactive','FO','Faroe Islands','298',1974,'.fo','0.00','0.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(75,'inactive','FR','France','33',1974,'.fr','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621719),(76,'inactive','GA','Gabon','241',1974,'.ga','1.00','1.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(77,'inactive','GB','United Kingdom','44',1974,'.uk','0.00','0.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621719),(78,'inactive','GD','Grenada','473',1974,'.gd','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621719),(79,'inactive','GE','Georgia','995',1992,'.ge','4.00','4.00','Southwestern Asia','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621719),(80,'inactive','GF','French Guiana','594',1974,'.gf','-4.00','-4.00','South America','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621719),(81,'inactive','GG','Guernsey','44',2006,'.gg','1.00','1.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(82,'inactive','GH','Ghana','233',1974,'.gh','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(83,'inactive','GI','Gibraltar','350',1974,'.gi','1.00','1.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(84,'inactive','GL','Greenland','299',1974,'.gl','-3.00','-3.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621719),(85,'inactive','GM','Gambia','220',1974,'.gm','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(86,'inactive','GN','Guinea','224',1974,'.gn','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(87,'inactive','GP','Guadeloupe','590',1974,'.gp','-4.00','-4.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(88,'inactive','GQ','Equatorial Guinea','240',1974,'.gq','1.00','1.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621719),(89,'inactive','GR','Greece','30',1974,'.gr','2.00','2.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621720),(90,'inactive','GS','South Georgia and the South Sandwich Islands','44',1993,'.gs','-2.00','-2.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621720),(91,'inactive','GT','Guatemala','502',1974,'.gt','-6.00','-6.00','Central America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621720),(92,'inactive','GU','Guam','671',1974,'.gu','10.00','10.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621720),(93,'inactive','GW','Guinea-Bissau','245',1974,'.gw','-1.00','-1.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621720),(94,'inactive','GY','Guyana','592',1974,'.gy','-3.00','-3.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621720),(95,'inactive','HK','Hong Kong','852',1974,'.hk','8.00','8.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621720),(96,'inactive','HM','Heard Island and McDonald Islands','',1974,'.hm','2.00','2.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621720),(97,'inactive','HN','Honduras','503',1974,'.hn','-6.00','-6.00','Central America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621720),(98,'inactive','HR','Croatia','385',1992,'.hr','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621720),(99,'inactive','HT','Haiti','509',1974,'.ht','-5.00','-5.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621720),(100,'inactive','HU','Hungary','36',1974,'.hu','1.00','1.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621720),(101,'inactive','ID','Indonesia','62',1974,'.id','9.00','7.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(102,'inactive','IE','Ireland','353',1974,'.ie','0.00','0.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621721),(103,'inactive','IL','Israel','972',1974,'.il','2.00','2.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(104,'inactive','IM','Isle of Man','44',2006,'.im','0.00','0.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(105,'inactive','IN','India','91',1974,'.in','5.50','5.50','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(106,'inactive','IO','British Indian Ocean Territory','246',1974,'.io','6.00','6.00','Australasia','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(107,'inactive','IQ','Iraq','964',1974,'.iq','3.00','3.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(108,'inactive','IR','Iran, Islamic Republic of','98',1974,'.ir','3.50','3.50','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(109,'inactive','IS','Iceland','354',1974,'.is','0.00','0.00','Northern Europe','Europe','No','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621721),(110,'inactive','IT','Italy','39',1974,'.it','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621721),(111,'inactive','JE','Jersey','44',2006,'.je','1.00','1.00','Antarctica','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621721),(112,'inactive','JM','Jamaica','876',1974,'.jm','-5.00','-5.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621721),(113,'inactive','JO','Jordan','962',1974,'.jo','2.00','2.00','Middle East','Asia','Yes','Friday','4th','March',0,'day','Friday','4th','October',0,'day','0.00000',0,1346621722),(114,'inactive','JP','Japan','81',1974,'.jp','9.00','9.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(115,'inactive','KE','Kenya','254',1974,'.ke','3.00','3.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(116,'inactive','KG','Kyrgyzstan','996',1992,'.kg','6.00','6.00','Central Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(117,'inactive','KH','Cambodia','855',1974,'.kh','7.00','7.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(118,'inactive','KI','Kiribati','686',1979,'.ki','12.00','12.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(119,'inactive','KM','Comoros','269',1974,'.km','3.00','3.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(120,'inactive','KN','Saint Kitts and Nevis','869',1974,'.kn','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621722),(121,'inactive','KP','Korea, Democratic People\'s Republic of','82',1974,'.kp','9.00','9.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(122,'inactive','KR','Korea, Republic of','850',1974,'.kr','9.00','9.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(123,'inactive','KW','Kuwait','965',1974,'.kw','3.00','3.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(124,'inactive','KY','Cayman Islands','345',1974,'.ky','-5.00','-5.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(125,'inactive','KZ','Kazakhstan','7',1992,'.kz','6.00','6.00','Central Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(126,'inactive','LA','Lao People\'s Democratic Republic','856',1974,'.la','7.00','7.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(127,'inactive','LB','Lebanon','961',1974,'.lb','2.00','2.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621722),(128,'inactive','LC','Saint Lucia','758',1974,'.lc','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621722),(129,'inactive','LI','Liechtenstein','423',1974,'.li','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621723),(130,'inactive','LK','Sri Lanka','94',1974,'.lk','5.50','5.50','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621723),(131,'inactive','LR','Liberia','231',1974,'.lr','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621723),(132,'inactive','LS','Lesotho','266',1974,'.ls','2.00','2.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621723),(133,'inactive','LT','Lithuania','370',1992,'.lt','2.00','2.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621723),(134,'inactive','LU','Luxembourg','352',1974,'.lu','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621723),(135,'inactive','LV','Latvia','371',1992,'.lv','3.00','3.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621723),(136,'inactive','LY','Libya','218',1974,'.ly','2.00','2.00','Northern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621723),(137,'inactive','MA','Morocco','212',1974,'.ma','0.00','0.00','Northern Africa','Africa','Yes',NULL,'4th','July',31,'dayno',NULL,'1st','April',2,'dayno','0.00000',0,1346621723),(138,'inactive','MC','Monaco','377',1974,'.mc','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621723),(139,'inactive','MD','Moldova, Republic of','373',1992,'.md','3.00','3.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621723),(140,'inactive','ME','Montenegro','382',2006,'.me','2.00','2.00','Caribbean','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621723),(141,'inactive','MF','Saint Martin (French part)','590',2007,'.mf','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621723),(142,'inactive','MG','Madagascar','261',1974,'.mg','3.00','3.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621723),(143,'inactive','MH','Marshall Islands','692',1986,'.mh','10.00','10.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621723),(144,'inactive','MK','Macedonia, the former Yugoslav Republic of','389',1993,'.mk','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621724),(145,'inactive','ML','Mali','223',1974,'.ml','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621724),(146,'inactive','MM','Myanmar','95',1989,'.mm','6.50','6.50','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621724),(147,'inactive','MN','Mongolia','976',1974,'.mn','8.00','8.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621724),(148,'inactive','MO','Macao','853',1974,'.mo','8.00','8.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621724),(149,'inactive','MP','Northern Mariana Islands','670',1986,'.mp','10.00','10.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621724),(150,'inactive','MQ','Martinique','596',1974,'.mq','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621724),(151,'inactive','MR','Mauritania','222',1974,'.mr','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621725),(152,'inactive','MS','Montserrat','664',1974,'.ms','-4.00','-4.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621725),(153,'inactive','MT','Malta','356',1974,'.mt','1.00','1.00','Other','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621725),(154,'inactive','MU','Mauritius','230',1974,'.mu','4.00','4.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621725),(155,'inactive','MV','Maldives','960',1974,'.mv','5.00','5.00','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621725),(156,'inactive','MW','Malawi','265',1974,'.mw','2.00','2.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621725),(157,'inactive','MX','Mexico','52',1974,'.mx','-6.00','-8.00','North America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621725),(158,'inactive','MY','Malaysia','60',1974,'.my','8.00','8.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621725),(159,'inactive','MZ','Mozambique','258',1974,'.mz','2.00','2.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621725),(160,'inactive','NA','Namibia','264',1974,'.na','2.00','2.00','Southern Africa','Africa','Yes','Sunday','1st','September',0,'day','Sunday','1st','April',0,'day','0.00000',0,1346621726),(161,'inactive','NC','New Caledonia','687',1974,'.nc','11.00','11.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(162,'inactive','NE','Niger','227',1974,'.ne','1.00','1.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(163,'inactive','NF','Norfolk Island','672',1974,'.nf','11.50','11.50','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(164,'inactive','NG','Nigeria','234',1974,'.ng','1.00','1.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(165,'inactive','NI','Nicaragua','505',1974,'.ni','-6.00','-6.00','Central America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621726),(166,'inactive','NL','Netherlands','31',1974,'.nl','1.00','1.00','Western Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621726),(167,'inactive','NO','Norway','47',1974,'.no','1.00','1.00','Northern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621726),(168,'inactive','NP','Nepal','977',1974,'.np','5.50','5.50','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(169,'inactive','NR','Nauru','674',1974,'.nr','12.00','12.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(170,'inactive','NU','Niue','683',1974,'.nu','-11.00','-11.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(171,'inactive','NZ','New Zealand','64',1974,'.nz','12.00','12.00','Australasia','Oceania','Yes','Sunday','4th','September',0,'day','Sunday','1st','April',0,'day','0.00000',0,1346621726),(172,'inactive','OM','Oman','968',1974,'.om','4.00','4.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(173,'inactive','PA','Panama','507',1974,'.pa','-5.00','-5.00','Central America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621726),(174,'inactive','PE','Peru','51',1974,'.pe','-5.00','-5.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(175,'inactive','PF','French Polynesia','689',1974,'.pf','-10.00','-10.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621726),(176,'inactive','PG','Papua New Guinea','675',1974,'.pg','10.00','10.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(177,'inactive','PH','Philippines','63',1974,'.ph','8.00','8.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(178,'inactive','PK','Pakistan','92',1974,'.pk','5.00','5.00','Southern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(179,'inactive','PL','Poland','48',1974,'.pl','1.00','1.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621727),(180,'inactive','PM','Saint Pierre and Miquelon','508',1974,'.pm','-2.00','-2.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(181,'inactive','PN','Pitcairn','870',1974,'.pn','-8.00','-8.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(182,'inactive','PR','Puerto Rico','787',1974,'.pr','-4.00','-4.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(183,'inactive','PS','Palestinian Territory, Occupied','970',1999,'.ps','2.00','2.00','Middle East','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621727),(184,'inactive','PT','Portugal','351',1974,'.pt','1.00','1.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621727),(185,'inactive','PW','Palau','680',1986,'.pw','9.00','9.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(186,'inactive','PY','Paraguay','595',1974,'.py','-4.00','-4.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(187,'inactive','QA','Qatar','974',1974,'.qa','3.00','3.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(188,'inactive','RE','Réunion','262',1974,'.re','4.00','4.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(189,'inactive','RO','Romania','40',1974,'.ro','2.00','2.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621727),(190,'inactive','RS','Serbia','381',2006,'.rs','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621727),(191,'inactive','RU','Russian Federation','7',1992,'.ru','3.00','3.00','Northern Europe','Europe','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(192,'inactive','RW','Rwanda','250',1974,'.rw','2.00','2.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(193,'inactive','SA','Saudi Arabia','966',1974,'.sa','3.00','3.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(194,'inactive','SB','Solomon Islands','677',1974,'.sb','11.00','11.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621727),(195,'inactive','SC','Seychelles','248',1974,'.sc','4.00','4.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(196,'inactive','SD','Sudan','249',1974,'.sd','2.00','2.00','Northern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(197,'inactive','SE','Sweden','46',1974,'.se','1.00','1.00','Northern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621728),(198,'inactive','SG','Singapore','65',1974,'.sg','8.00','8.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(199,'inactive','SH','Saint Helena, Ascension and Tristan da Cunha','290',1974,'.sh','0.00','0.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(200,'inactive','SI','Slovenia','386',1992,'.si','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621728),(201,'inactive','SJ','Svalbard and Jan Mayen','47',1974,'.sj','1.00','1.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(202,'inactive','SK','Slovakia','421',1993,'.sk','1.00','1.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621728),(203,'inactive','SL','Sierra Leone','232',1974,'.sl','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(204,'inactive','SM','San Marino','378',1974,'.sm','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621728),(205,'inactive','SN','Senegal','221',1974,'.sn','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(206,'inactive','SO','Somalia','677',1974,'.so','11.00','11.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(207,'inactive','SR','Suriname','597',1974,'.sr','-3.50','-3.50','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621728),(208,'inactive','SS','South Sudan','211',2011,'.ss','3.00','3.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(209,'inactive','ST','Sao Tome and Principe','239',1974,'.st','0.00','0.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(210,'inactive','SV','El Salvador','503',1974,'.sv','6.00','6.00','Central America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621729),(211,'inactive','SX','Sint Maarten (Dutch part)','599',2010,'.sx','-4.00','-4.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(212,'inactive','SY','Syrian Arab Republic','963',1974,'.sy','2.00','2.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(213,'inactive','SZ','Swaziland','268',1974,'.sz','2.00','2.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(214,'inactive','TC','Turks and Caicos Islands','649',1974,'.tc','-5.00','-5.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(215,'inactive','TD','Chad','235',1974,'.td','1.00','1.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(216,'inactive','TF','French Southern Territories','689',1979,'.tf','5.00','5.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(217,'inactive','TG','Togo','228',1974,'.tg','0.00','0.00','Western Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(218,'inactive','TH','Thailand','66',1974,'.th','7.00','7.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(219,'inactive','TJ','Tajikistan','992',1992,'.tj','6.00','6.00','Central Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(220,'inactive','TK','Tokelau','690',1974,'.tk','14.00','14.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(221,'inactive','TL','Timor-Leste','670',2002,'.tl','9.00','9.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621729),(222,'inactive','TM','Turkmenistan','993',1992,'.tm','5.00','5.00','Central Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(223,'inactive','TN','Tunisia','216',1974,'.tn','1.00','1.00','Northern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(224,'inactive','TO','Tonga','676',1974,'.to','13.00','13.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(225,'inactive','TR','Turkey','90',1974,'.tr','2.00','2.00','Southern Europe','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(226,'inactive','TT','Trinidad and Tobago','868',1974,'.tt','-4.00','-4.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621730),(227,'inactive','TV','Tuvalu','688',1979,'.tv','12.00','12.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(228,'inactive','TW','Taiwan, Province of China','886',1974,'.tw','8.00','8.00','Eastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(229,'inactive','TZ','Tanzania, United Republic of','255',1974,'.tz','3.00','3.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(230,'inactive','UA','Ukraine','380',1974,'.ua','3.00','3.00','Eastern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621730),(231,'inactive','UG','Uganda','256',1974,'.ug','3.00','3.00','Eastern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(232,'inactive','UM','United States Minor Outlying Islands','1',1986,'.um','0.00','0.00','North America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621730),(233,'inactive','US','United States','1',1974,'.us','-5.00','-11.00','North America','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621730),(234,'inactive','UY','Uruguay','598',1974,'.uy','3.00','3.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(235,'inactive','UZ','Uzbekistan','998',1992,'.uz','6.00','6.00','Central Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(236,'inactive','VA','Holy See (Vatican City State)','396',1974,'.va','1.00','1.00','Southern Europe','Europe','Yes','Sunday','4th','March',0,'day','Sunday','4th','October',0,'day','0.00000',0,1346621730),(237,'inactive','VC','Saint Vincent and the Grenadines','784',1974,'.vc','-4.00','-5.00','Caribbean','North America','Yes','Sunday','2nd','March',0,'day','Sunday','1st','November',0,'day','0.00000',0,1346621730),(238,'inactive','VE','Venezuela, Bolivarian Republic of','58',1974,'.ve','-4.00','-4.00','South America','South America','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621730),(239,'inactive','VG','Virgin Islands, British','284',1974,'.vg','-4.00','-4.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(240,'inactive','VI','Virgin Islands, U.S.','340',1974,'.vi','-4.00','-4.00','Caribbean','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(241,'inactive','VN','Viet Nam','84',1974,'.vn','7.00','7.00','Southeastern Asia','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(242,'inactive','VU','Vanuatu','678',1980,'.vu','11.00','11.00','Australasia','Oceania','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(243,'inactive','WF','Wallis and Futuna','681',1974,'.wf','12.00','12.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(244,'inactive','WS','Samoa','685',1974,'.ws','-11.00','-11.00','Australasia','Oceania','Yes','Sunday','4th','September',0,'day','Sunday','1st','April',0,'day','0.00000',0,1346621731),(245,'inactive','YE','Yemen','967',1974,'.ye','3.00','3.00','Middle East','Asia','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(246,'inactive','YT','Mayotte','269',1993,'.yt','3.00','3.00','Other','Other','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(247,'inactive','ZA','South Africa','27',1974,'.za','2.00','2.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(248,'inactive','ZM','Zambia','260',1974,'.zm','2.00','2.00','Central Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731),(249,'inactive','ZW','Zimbabwe','263',1980,'.zw','2.00','2.00','Southern Africa','Africa','No',NULL,NULL,NULL,0,'day',NULL,NULL,NULL,0,'day','0.00000',0,1346621731);

/*Table structure for table `xfriendica_locations_postcodes` */

CREATE TABLE `xfriendica_locations_postcodes` (
  `id` bigint(24) unsigned NOT NULL,
  `region-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `city-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `country-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `postcode` char(15) DEFAULT NULL,
  `uses` int(5) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_locations_postcodes` */

/*Table structure for table `xfriendica_locations_regions` */

CREATE TABLE `xfriendica_locations_regions` (
  `id` bigint(12) unsigned NOT NULL,
  `city-id` bigint(12) unsigned NOT NULL DEFAULT '0',
  `country-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `postcode-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `longitude` float(14,10) unsigned NOT NULL DEFAULT '0.0000000000',
  `latitude` float(14,10) unsigned NOT NULL DEFAULT '0.0000000000',
  `name` char(128) CHARACTER SET latin1 DEFAULT NULL,
  `uses` int(5) unsigned NOT NULL DEFAULT '0',
  `activity` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_locations_regions` */

/*Table structure for table `xfriendica_locations_streets` */

CREATE TABLE `xfriendica_locations_streets` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `region-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `city-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `country-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `postcode-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `unit` char(8) CHARACTER SET latin1 DEFAULT NULL,
  `number` char(10) CHARACTER SET latin1 DEFAULT NULL,
  `street` char(128) CHARACTER SET latin1 DEFAULT NULL,
  `street-type` char(32) CHARACTER SET latin1 DEFAULT NULL,
  `suplimental` char(128) CHARACTER SET latin1 DEFAULT NULL,
  `longitude` float(14,10) NOT NULL DEFAULT '0.0000000000',
  `latitude` float(14,10) NOT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_locations_streets` */

/*Table structure for table `xfriendica_mail` */

CREATE TABLE `xfriendica_mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `users` int(10) unsigned NOT NULL DEFAULT '0',
  `contacts` int(10) unsigned NOT NULL DEFAULT '0',
  `guid` char(64) NOT NULL,
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `discussion-id` bigint(24) unsigned NOT NULL,
  `chars-id-title` bigint(24) unsigned NOT NULL DEFAULT '0',
  `texts-id-body` bigint(24) unsigned NOT NULL DEFAULT '0',
  `url-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `parent-url-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `activity` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `guid` (`guid`),
  KEY `uri` (`url-id`),
  KEY `parent-uri` (`parent-url-id`),
  KEY `created` (`created`),
  KEY `convid` (`discussion-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_mail` */

/*Table structure for table `xfriendica_mail_chars` */

CREATE TABLE `xfriendica_mail_chars` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `mail-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `type` enum('from-name','from-photo','from-url','title','uri','parent-uri') NOT NULL,
  `value` char(255) DEFAULT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail-id`,`type`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_mail_chars` */

/*Table structure for table `xfriendica_mail_files` */

CREATE TABLE `xfriendica_mail_files` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `mail-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `file-id` bigint(24) NOT NULL DEFAULT '0',
  `destruct` enum('Yes','No') NOT NULL DEFAULT 'No',
  `md5` char(32) NOT NULL,
  `created` bigint(24) unsigned NOT NULL DEFAULT '0',
  `updated` bigint(24) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_mail_files` */

/*Table structure for table `xfriendica_mail_persons` */

CREATE TABLE `xfriendica_mail_persons` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('to','cc','bcc') NOT NULL DEFAULT 'to',
  `mail-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `deleted` int(12) unsigned NOT NULL DEFAULT '0',
  `seen` int(12) unsigned NOT NULL DEFAULT '0',
  `replied` int(12) unsigned NOT NULL DEFAULT '0',
  `spam` enum('Yes','No') NOT NULL DEFAULT 'No',
  `reply` enum('Yes','No') NOT NULL DEFAULT 'No',
  `unknown` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail-id`,`person-id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_mail_persons` */

/*Table structure for table `xfriendica_mail_texts` */

CREATE TABLE `xfriendica_mail_texts` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `mail-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `type` enum('body') NOT NULL,
  `value` longtext,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`mail-id`,`type`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_mail_texts` */

/*Table structure for table `xfriendica_networks` */

CREATE TABLE `xfriendica_networks` (
  `id` int(25) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('master','member','repeater') DEFAULT 'member',
  `type` enum('public','private') NOT NULL DEFAULT 'public',
  `salt` char(128) DEFAULT NULL,
  `name` char(255) DEFAULT NULL,
  `guid` char(64) DEFAULT NULL,
  `avarta-id` bigint(24) unsigned DEFAULT '0',
  `language` char(5) DEFAULT 'en',
  `auth-key` char(255) DEFAULT NULL,
  `auth-key-expires` int(12) unsigned NOT NULL DEFAULT '0',
  `master-server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `master-called` int(12) unsigned NOT NULL DEFAULT '0',
  `master-acknowledged` int(12) NOT NULL DEFAULT '0',
  `email` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `requests` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `syndicate` enum('Yes','No') NOT NULL DEFAULT 'No',
  `population` bigint(24) NOT NULL DEFAULT '0',
  `nodes` int(12) NOT NULL DEFAULT '0',
  `called` int(12) unsigned NOT NULL DEFAULT '0',
  `polled` int(12) unsigned NOT NULL DEFAULT '0',
  `pushed` int(12) unsigned NOT NULL DEFAULT '0',
  `hidden` enum('Yes','No') NOT NULL DEFAULT 'No',
  `system` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `activity` decimal(10,5) unsigned DEFAULT '0.00000',
  `protocols` int(10) unsigned NOT NULL DEFAULT '0',
  `plugins` int(10) unsigned NOT NULL DEFAULT '0',
  `addons` int(10) unsigned NOT NULL DEFAULT '0',
  `adaptors` int(10) unsigned NOT NULL DEFAULT '0',
  `connectors` int(10) unsigned NOT NULL DEFAULT '0',
  `resources` int(10) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks` */

/*Table structure for table `xfriendica_networks_apis` */

CREATE TABLE `xfriendica_networks_apis` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) DEFAULT NULL,
  `state` enum('system','repeater','master','secondary','shared') NOT NULL DEFAULT 'system',
  `method` enum('push','pull','callback','all') DEFAULT 'all',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `version` char(16) NOT NULL DEFAULT '1.0.0',
  `heard` int(12) unsigned NOT NULL DEFAULT '0',
  `push` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_networks_apis` */

/*Table structure for table `xfriendica_networks_apis_files` */

CREATE TABLE `xfriendica_networks_apis_files` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `function-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `package-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `addon-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `plugin-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `relative-to` enum('XOOPS_ROOT_PATH','XOOPS_VAR_PATH','XOOPS_UPLOAD_PATH','XOOPS_TRUST_PATH','Xxfriendica_ROOT_PATH','Xxfriendica_PLUGINS_PATH','Xxfriendica_ADAPTORS_PATH','Xxfriendica_ADDONS_PATH','Xxfriendica_CONNECTORS_PATH') DEFAULT 'XOOPS_ROOT_PATH',
  `file-guid` char(64) NOT NULL,
  `file-name` char(128) NOT NULL,
  `file-type` char(128) DEFAULT NULL,
  `file-path` char(255) NOT NULL,
  `file-size` int(10) unsigned NOT NULL DEFAULT '0',
  `file-md5` char(32) NOT NULL,
  `retrieved` int(12) NOT NULL DEFAULT '0',
  `created` int(12) NOT NULL DEFAULT '0',
  `updated` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_apis_files` */

/*Table structure for table `xfriendica_networks_apis_functions` */

CREATE TABLE `xfriendica_networks_apis_functions` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `function` char(128) CHARACTER SET latin1 NOT NULL,
  `command` char(128) NOT NULL,
  `variables` int(10) NOT NULL DEFAULT '0',
  `action` enum('retrieve','lodge','response','check') CHARACTER SET latin1 NOT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_apis_functions` */

/*Table structure for table `xfriendica_networks_apis_packages` */

CREATE TABLE `xfriendica_networks_apis_packages` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `function-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `key-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `type` enum('plugin','adaptor','addon','connector','resource') NOT NULL,
  `dirname` char(128) DEFAULT NULL,
  `name` char(128) NOT NULL,
  `description` varchar(650) DEFAULT NULL,
  `version` char(16) NOT NULL DEFAULT '1.0.0',
  `guid` char(64) NOT NULL,
  `files` int(10) unsigned NOT NULL DEFAULT '0',
  `size` int(10) NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_apis_packages` */

/*Table structure for table `xfriendica_networks_apis_variables` */

CREATE TABLE `xfriendica_networks_apis_variables` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `function-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `protocol-id` bigint(24) NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `method` enum('path','get','post','array','header','callback') DEFAULT 'post',
  `from` enum('constant','routine','authentication','pass-thru') DEFAULT 'routine',
  `weight` int(5) NOT NULL DEFAULT '0',
  `name` char(128) NOT NULL,
  `value` char(128) DEFAULT NULL,
  `class` char(128) DEFAULT NULL,
  `function` char(128) DEFAULT NULL,
  `dirname` char(128) DEFAULT NULL,
  `created` int(12) NOT NULL DEFAULT '0',
  `updated` int(12) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_apis_variables` */

/*Table structure for table `xfriendica_networks_challenges` */

CREATE TABLE `xfriendica_networks_challenges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('plugin','addon','adaptor','connector','protocol','network','handshake','server','authenication','unkown') NOT NULL DEFAULT 'server',
  `type-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `started` int(12) unsigned NOT NULL DEFAULT '0',
  `expired` int(12) NOT NULL DEFAULT '0',
  `token` char(255) NOT NULL,
  `secret` char(255) DEFAULT NULL,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`type`,`type-id`,`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_challenges` */

/*Table structure for table `xfriendica_networks_friends` */

CREATE TABLE `xfriendica_networks_friends` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `server` (`network-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_friends` */

/*Table structure for table `xfriendica_networks_keywords` */

CREATE TABLE `xfriendica_networks_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('network-public','network-private') NOT NULL,
  `keyword-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_keywords` */

/*Table structure for table `xfriendica_networks_languages` */

CREATE TABLE `xfriendica_networks_languages` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `language-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_networks_languages` */

/*Table structure for table `xfriendica_networks_paths` */

CREATE TABLE `xfriendica_networks_paths` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) NOT NULL,
  `state` enum('active','inactive','dead','offline') NOT NULL DEFAULT 'active',
  `type` enum('protocol','plugin','addon','unknown') NOT NULL DEFAULT 'protocol',
  `mode` enum('callback','functions','packages','pull','push','bidirection','all') NOT NULL DEFAULT 'all',
  `network-id` bigint(24) unsigned DEFAULT '0',
  `server-id` bigint(24) unsigned DEFAULT '0',
  `protocol-id` bigint(24) unsigned DEFAULT '0',
  `plugin-id` bigint(24) unsigned DEFAULT '0',
  `addon-id` bigint(24) unsigned DEFAULT '0',
  `path` char(255) CHARACTER SET latin1 NOT NULL DEFAULT '/',
  `online` int(12) unsigned NOT NULL DEFAULT '0',
  `packages` int(12) unsigned NOT NULL DEFAULT '0',
  `functions` int(12) unsigned NOT NULL DEFAULT '0',
  `requests-received` int(12) unsigned NOT NULL DEFAULT '0',
  `requests-sent` int(12) unsigned NOT NULL DEFAULT '0',
  `items-received` int(12) unsigned NOT NULL DEFAULT '0',
  `items-sent` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_networks_paths` */

/*Table structure for table `xfriendica_networks_routes` */

CREATE TABLE `xfriendica_networks_routes` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `parent-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `guid` char(64) NOT NULL,
  `method` enum('direct','hop') NOT NULL DEFAULT 'direct',
  `depth` int(5) unsigned DEFAULT '0',
  `weight` int(5) unsigned DEFAULT '0',
  `keys-id` bigint(24) unsigned DEFAULT '0',
  `network-id` bigint(24) unsigned DEFAULT '0',
  `server-id` bigint(24) unsigned DEFAULT '0',
  `ciphered` enum('Yes','No') DEFAULT 'No',
  `called-server-id` bigint(24) unsigned DEFAULT '0',
  `called-path-id` bigint(24) unsigned DEFAULT '0',
  `called-api-id` bigint(24) unsigned DEFAULT '0',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_networks_routes` */

/*Table structure for table `xfriendica_networks_servers` */

CREATE TABLE `xfriendica_networks_servers` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('online','offline','listening','ignoring','partial','repeater','dropbox','system') NOT NULL DEFAULT 'offline',
  `route` enum('direct','route') NOT NULL DEFAULT 'direct',
  `verify` enum('IP','NetBios','Master') NOT NULL DEFAULT 'IP',
  `trust` enum('banned','listen','untrusted','trusted','signed') NOT NULL DEFAULT 'untrusted',
  `client-id` char(20) NOT NULL,
  `avarta-id` bigint(24) unsigned DEFAULT '0',
  `keys-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `gmt` decimal(5,3) NOT NULL DEFAULT '0.000',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `route-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `routes` int(5) unsigned NOT NULL DEFAULT '0',
  `name` char(255) DEFAULT NULL,
  `guid` char(64) DEFAULT NULL,
  `netbios` char(255) DEFAULT NULL,
  `protocol` enum('http://','https://','ftp://','ftps://') DEFAULT NULL,
  `cipher-key` char(128) DEFAULT NULL,
  `trust-key` char(128) DEFAULT NULL,
  `handshake-method` char(128) NOT NULL DEFAULT 'XIPSNetworkAuth',
  `handshake-key` char(128) DEFAULT NULL,
  `handshake-secret` char(128) DEFAULT NULL,
  `auth-token` char(128) DEFAULT NULL,
  `auth-secret` char(128) DEFAULT NULL,
  `auth-expires` int(12) unsigned DEFAULT '0',
  `allow-push` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allow-pull` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allow-route` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `allow-callback` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `method-push` enum('json','serial','xml','soap') NOT NULL DEFAULT 'json',
  `method-package` enum('raw','base64','cipher','url') NOT NULL DEFAULT 'raw',
  `method-cipher` enum('crypt','aes') NOT NULL DEFAULT 'aes',
  `method-cipher-key` enum('push','pull') NOT NULL DEFAULT 'push',
  `interval` int(12) unsigned DEFAULT '0',
  `items` int(12) unsigned DEFAULT '0',
  `quota` int(12) unsigned DEFAULT '0',
  `queued` int(12) unsigned DEFAULT '0',
  `networks` int(12) unsigned DEFAULT '0',
  `population` int(12) unsigned DEFAULT '0',
  `hookups` int(12) unsigned DEFAULT '0',
  `hops` int(12) unsigned DEFAULT '0',
  `heard` int(12) unsigned DEFAULT '0',
  `pushed` int(12) unsigned DEFAULT '0',
  `opens` int(12) unsigned DEFAULT '0',
  `closes` int(12) unsigned DEFAULT '0',
  `offline` int(12) unsigned DEFAULT '0',
  `notified` int(12) unsigned DEFAULT '0',
  `batch-when` int(12) unsigned DEFAULT '0',
  `batch-minimum` int(12) unsigned DEFAULT '1',
  `batch-quantity` int(12) unsigned DEFAULT '0',
  `activity` decimal(10,5) unsigned DEFAULT '0.00000',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`,`state`,`route`,`verify`,`trust`,`client-id`,`keys-id`,`network-id`,`handshake-method`,`method-push`,`method-package`,`method-cipher`,`method-cipher-key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_networks_servers` */

/*Table structure for table `xfriendica_networks_servers_ips` */

CREATE TABLE `xfriendica_networks_servers_ips` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `ip` char(128) DEFAULT NULL,
  `netbios` char(255) DEFAULT NULL,
  `listening` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `ignoring` enum('Yes','No') NOT NULL DEFAULT 'No',
  `unknown` enum('Yes','No') NOT NULL DEFAULT 'No',
  `verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `banned` enum('Yes','No') NOT NULL DEFAULT 'No',
  `notified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `last` int(12) NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_networks_servers_ips` */

/*Table structure for table `xfriendica_persons` */

CREATE TABLE `xfriendica_persons` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) CHARACTER SET latin1 DEFAULT NULL,
  `state` enum('local','remote','unknown') CHARACTER SET latin1 DEFAULT 'local',
  `code` char(32) DEFAULT NULL,
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `url-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `keys-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `skeys-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `longitude` float(14,10) NOT NULL DEFAULT '0.0000000000',
  `latitude` float(14,10) NOT NULL DEFAULT '0.0000000000',
  `location-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `avarta-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `last-url-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `protocol-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `key-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `firstname` char(128) CHARACTER SET latin1 DEFAULT NULL,
  `lastname` char(128) CHARACTER SET latin1 DEFAULT NULL,
  `alias` char(128) CHARACTER SET latin1 DEFAULT NULL,
  `one-liner` char(255) DEFAULT NULL,
  `priority` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `activity` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000',
  `rating` decimal(10,6) unsigned NOT NULL DEFAULT '0.000000',
  `readonly` enum('Yes','No') NOT NULL DEFAULT 'No',
  `writable` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `private` enum('Yes','No') NOT NULL DEFAULT 'No',
  `archived` enum('Yes','No') NOT NULL DEFAULT 'No',
  `rank` enum('Yes','No') NOT NULL DEFAULT 'No',
  `update` int(12) unsigned NOT NULL DEFAULT '0',
  `success` int(12) unsigned NOT NULL DEFAULT '0',
  `name` int(12) unsigned NOT NULL DEFAULT '0',
  `dob-year` int(4) unsigned zerofill NOT NULL DEFAULT '0000',
  `votes` int(10) unsigned NOT NULL DEFAULT '0',
  `items` int(10) unsigned NOT NULL DEFAULT '0',
  `replies` int(10) unsigned NOT NULL DEFAULT '0',
  `emails` int(10) unsigned NOT NULL DEFAULT '0',
  `spams` int(10) unsigned NOT NULL DEFAULT '0',
  `polled` int(12) unsigned NOT NULL DEFAULT '0',
  `requested` int(12) unsigned NOT NULL DEFAULT '0',
  `notified` int(12) NOT NULL DEFAULT '0',
  `confirmed` int(12) unsigned DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_persons` */

/*Table structure for table `xfriendica_persons_keywords` */

CREATE TABLE `xfriendica_persons_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `keyword-id` bigint(24) NOT NULL,
  `person-id` bigint(24) DEFAULT NULL,
  `language` char(5) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_persons_keywords` */

/*Table structure for table `xfriendica_persons_search` */

CREATE TABLE `xfriendica_persons_search` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `person-id` bigint(24) NOT NULL,
  `term` char(255) NOT NULL,
  `results` int(10) unsigned NOT NULL DEFAULT '0',
  `pages` int(10) unsigned NOT NULL DEFAULT '0',
  `networks` int(10) unsigned NOT NULL DEFAULT '0',
  `servers` int(10) unsigned NOT NULL DEFAULT '0',
  `tribes` int(10) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `delete` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`person-id`),
  KEY `term` (`term`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_persons_search` */

/*Table structure for table `xfriendica_persons_servers_mail` */

CREATE TABLE `xfriendica_persons_servers_mail` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server` char(255) NOT NULL,
  `port` bigint(24) unsigned NOT NULL DEFAULT '21',
  `ssltype` char(16) NOT NULL,
  `mailbox` char(255) NOT NULL,
  `user` char(255) NOT NULL,
  `pass` text NOT NULL,
  `action` bigint(24) unsigned NOT NULL DEFAULT '0',
  `movetofolder` char(255) NOT NULL,
  `reply-to` char(255) NOT NULL,
  `pubmail` enum('Yes','No') NOT NULL DEFAULT 'No',
  `last-check` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_persons_servers_mail` */

/*Table structure for table `xfriendica_persons_spam` */

CREATE TABLE `xfriendica_persons_spam` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `person-id` bigint(24) NOT NULL DEFAULT '0',
  `spam` bigint(24) NOT NULL DEFAULT '0',
  `ham` bigint(24) NOT NULL DEFAULT '0',
  `term-id` bigint(24) NOT NULL DEFAULT '0',
  `score` decimal(10,6) NOT NULL DEFAULT '0.000000',
  `date` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`person-id`,`spam`,`ham`,`term-id`,`score`,`date`),
  KEY `uid` (`person-id`),
  KEY `spam` (`spam`),
  KEY `ham` (`ham`),
  KEY `term` (`term-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_persons_spam` */

/*Table structure for table `xfriendica_persons_tokens` */

CREATE TABLE `xfriendica_persons_tokens` (
  `id` varchar(40) NOT NULL,
  `request` int(12) DEFAULT '0',
  `expires` int(12) unsigned NOT NULL DEFAULT '0',
  `addon-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `plugin-id` bigint(24) NOT NULL DEFAULT '0',
  `protocol-id` bigint(24) NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `client-id` varchar(20) NOT NULL,
  `secret` text NOT NULL,
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_persons_tokens` */

/*Table structure for table `xfriendica_persons_user` */

CREATE TABLE `xfriendica_persons_user` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `uid` int(13) unsigned NOT NULL DEFAULT '0',
  `openid` char(255) NOT NULL,
  `openid-server` text NOT NULL,
  `register-date` int(12) unsigned NOT NULL DEFAULT '0',
  `login-date` int(12) unsigned NOT NULL DEFAULT '0',
  `removed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `score` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `ranking` decimal(10,3) unsigned NOT NULL DEFAULT '0.000',
  `votes` int(5) unsigned NOT NULL DEFAULT '0',
  `spammer` enum('Yes','No') NOT NULL DEFAULT 'No',
  `verified` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blocked` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blockwall` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hidewall` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blocktags` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blockmail` enum('Yes','No') NOT NULL DEFAULT 'No',
  `blockitem` enum('Yes','No') NOT NULL DEFAULT 'No',
  `moderator` enum('Yes','No') NOT NULL DEFAULT 'No',
  `expired` enum('Yes','No') NOT NULL DEFAULT 'No',
  `allow-location` enum('Yes','No') NOT NULL DEFAULT 'No',
  `allow-coordinates` enum('Yes','No') NOT NULL DEFAULT 'No',
  `heard` int(12) unsigned NOT NULL DEFAULT '10',
  `expired-notification-sent` int(12) unsigned NOT NULL DEFAULT '0',
  `expires` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `login_date` (`login-date`),
  KEY `account_expired` (`expired`),
  KEY `hidewall` (`hidewall`),
  KEY `blockwall` (`blockwall`),
  KEY `blocked` (`blocked`),
  KEY `verified` (`verified`),
  KEY `unkmail` (`blockmail`),
  KEY `cntunkmail` (`heard`),
  KEY `account_removed` (`removed`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_persons_user` */

/*Table structure for table `xfriendica_photo` */

CREATE TABLE `xfriendica_photo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `source` enum('file','database') DEFAULT 'file',
  `guid` char(64) NOT NULL,
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `album-id` bigint(24) NOT NULL DEFAULT '0',
  `file-id` bigint(24) DEFAULT '0',
  `data-id` bigint(24) NOT NULL DEFAULT '0',
  `title` char(255) NOT NULL,
  `description` text NOT NULL,
  `height` smallint(6) NOT NULL DEFAULT '0',
  `width` smallint(6) NOT NULL DEFAULT '0',
  `scale` tinyint(1) NOT NULL DEFAULT '0',
  `profile` tinyint(1) NOT NULL DEFAULT '0',
  `activity` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `created` int(12) NOT NULL DEFAULT '0',
  `updated` int(12) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `uid` (`person-id`),
  KEY `album` (`album-id`),
  KEY `scale` (`scale`),
  KEY `profile` (`profile`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_photo` */

/*Table structure for table `xfriendica_photo_albums` */

CREATE TABLE `xfriendica_photo_albums` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('global','network','group','user','private') DEFAULT 'user',
  `network-id` int(10) unsigned DEFAULT '0',
  `path-id` int(10) unsigned DEFAULT '0',
  `person-id` bigint(24) unsigned DEFAULT '0',
  `guid` char(64) DEFAULT NULL,
  `title` char(255) DEFAULT NULL,
  `description` text,
  `photos` int(10) unsigned DEFAULT '0',
  `activity` decimal(10,5) unsigned DEFAULT '0.00000',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_photo_albums` */

/*Table structure for table `xfriendica_photo_albums_groups` */

CREATE TABLE `xfriendica_photo_albums_groups` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `group-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `album-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `deleted` enum('Yes','No') DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `INDEXES` (`group-id`,`album-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_photo_albums_groups` */

/*Table structure for table `xfriendica_photo_albums_keywords` */

CREATE TABLE `xfriendica_photo_albums_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `keyword-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `album-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `person-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `language` char(5) NOT NULL DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_photo_albums_keywords` */

/*Table structure for table `xfriendica_photo_data` */

CREATE TABLE `xfriendica_photo_data` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `photo-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `album-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `contact-id` bigint(24) unsigned DEFAULT '0',
  `person-id` bigint(24) unsigned DEFAULT '0',
  `image` longblob,
  `type` char(12) NOT NULL DEFAULT 'image/jpeg',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_photo_data` */

/*Table structure for table `xfriendica_photo_keywords` */

CREATE TABLE `xfriendica_photo_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `keyword-id` bigint(24) NOT NULL,
  `person-id` bigint(24) NOT NULL,
  `photo-id` bigint(24) DEFAULT NULL,
  `language` char(5) DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_photo_keywords` */

/*Table structure for table `xfriendica_plugins` */

CREATE TABLE `xfriendica_plugins` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `state` enum('adaptors','connectors','plugins') NOT NULL DEFAULT 'adaptors',
  `salt` char(128) NOT NULL,
  `guid` char(64) DEFAULT NULL,
  `name` char(255) NOT NULL,
  `version` char(255) NOT NULL DEFAULT '1.0.0',
  `dirname` char(128) NOT NULL DEFAULT '/',
  `version-php` char(16) DEFAULT '5.3.17',
  `version-xoops` char(16) DEFAULT '2.5.5',
  `version-xfriendica` char(16) DEFAULT '1.0.2',
  `module` char(128) NOT NULL DEFAULT '',
  `poll` int(12) unsigned NOT NULL DEFAULT '0',
  `cron` int(12) unsigned NOT NULL DEFAULT '0',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `downloaded` enum('Yes','No') NOT NULL DEFAULT 'No',
  `installed` enum('Yes','No') NOT NULL DEFAULT 'No',
  `haspreload` enum('Yes','No') NOT NULL DEFAULT 'No',
  `haspoll` enum('Yes','No') NOT NULL DEFAULT 'No',
  `haspush` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hascron` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hasadmin` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hassource` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hidden` enum('Yes','No') NOT NULL DEFAULT 'No',
  `timestamp` int(12) unsigned NOT NULL DEFAULT '0',
  `activity` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `hidden` (`hidden`),
  KEY `timing` (`poll`,`cron`,`timestamp`),
  KEY `modules` (`module`),
  KEY `search` (`haspoll`,`hascron`,`hasadmin`,`haspreload`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_plugins` */

/*Table structure for table `xfriendica_plugins_functions` */

CREATE TABLE `xfriendica_plugins_functions` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('main','poll','cron','admin','preload','internal') DEFAULT NULL,
  `plugin-id` bigint(24) unsigned DEFAULT '0',
  `filename` char(255) DEFAULT NULL,
  `function` char(255) DEFAULT NULL,
  `class` char(255) DEFAULT NULL,
  `command` char(128) DEFAULT NULL,
  `when` bigint(24) unsigned DEFAULT '0',
  `interval` bigint(24) unsigned DEFAULT '0',
  `last` bigint(24) unsigned DEFAULT '0',
  `offline` bigint(24) unsigned DEFAULT '0',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUES` (`plugin-id`,`function`(64),`class`(64),`command`(32)),
  KEY `SEARCH` (`id`,`plugin-id`,`command`(64)),
  KEY `TIMING` (`when`,`interval`,`last`,`offline`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_plugins_functions` */

/*Table structure for table `xfriendica_plugins_modules` */

CREATE TABLE `xfriendica_plugins_modules` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `plugin-id` bigint(24) unsigned NOT NULL,
  `dirname` char(128) NOT NULL,
  `version` decimal(5,3) unsigned NOT NULL DEFAULT '0.000',
  `required` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `optional` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`,`plugin-id`,`dirname`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_plugins_modules` */

/*Table structure for table `xfriendica_plugins_protocols` */

CREATE TABLE `xfriendica_plugins_protocols` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `plugin-id` bigint(24) unsigned DEFAULT '0',
  `protocol-id` bigint(24) unsigned DEFAULT '0',
  `guid` char(64) DEFAULT '',
  `required` enum('Yes','No') DEFAULT 'No',
  `optional` enum('Yes','No') DEFAULT 'No',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUES` (`protocol-id`,`guid`,`required`,`optional`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_plugins_protocols` */

/*Table structure for table `xfriendica_plugins_resources` */

CREATE TABLE `xfriendica_plugins_resources` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `plugin-id` bigint(24) unsigned NOT NULL,
  `type` enum('function','extension','class','module','core') NOT NULL DEFAULT 'extension',
  `name` char(128) NOT NULL DEFAULT '',
  `dirname` char(128) DEFAULT '',
  `version` decimal(5,3) unsigned DEFAULT '0.000',
  `class` char(128) NOT NULL DEFAULT '',
  `command` char(128) DEFAULT '',
  `required` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `optional` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned DEFAULT '0',
  `update` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`,`plugin-id`,`type`,`name`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_plugins_resources` */

/*Table structure for table `xfriendica_profile` */

CREATE TABLE `xfriendica_profile` (
  `id` bigint(24) NOT NULL AUTO_INCREMENT,
  `person-id` bigint(24) NOT NULL DEFAULT '0',
  `avarta-id` bigint(24) NOT NULL DEFAULT '0',
  `guid` char(64) NOT NULL,
  `public-keywords` int(10) NOT NULL DEFAULT '0',
  `private-keywords` int(10) NOT NULL DEFAULT '0',
  `default` tinyint(1) NOT NULL DEFAULT '0',
  `published` tinyint(1) NOT NULL DEFAULT '0',
  `syndicated` tinyint(1) NOT NULL DEFAULT '0',
  `hide-friends` tinyint(1) NOT NULL DEFAULT '0',
  `hide-name` tinyint(1) NOT NULL DEFAULT '0',
  `hide-wall` tinyint(1) NOT NULL DEFAULT '0',
  `hide-forums` tinyint(1) NOT NULL DEFAULT '0',
  `only-tribes` tinyint(1) NOT NULL DEFAULT '0',
  `polled` int(12) unsigned NOT NULL DEFAULT '0',
  `expires` int(12) unsigned NOT NULL DEFAULT '0',
  `activity` decimal(10,5) DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_profile` */

/*Table structure for table `xfriendica_profile_category` */

CREATE TABLE `xfriendica_profile_category` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `description` text CHARACTER SET latin1,
  `weight` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_profile_category` */

insert  into `xfriendica_profile_category`(`id`,`title`,`description`,`weight`) values (1,'Personal Details',NULL,0),(2,'Family Details',NULL,0),(3,'Your Profile',NULL,0);

/*Table structure for table `xfriendica_profile_check` */

CREATE TABLE `xfriendica_profile_check` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `person-id` int(10) unsigned NOT NULL,
  `contact-id` int(10) unsigned NOT NULL DEFAULT '0',
  `protocol-id` bigint(24) NOT NULL DEFAULT '0',
  `protocol-guid` char(64) DEFAULT NULL,
  `sec` char(255) NOT NULL,
  `expire` bigint(24) NOT NULL,
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_profile_check` */

/*Table structure for table `xfriendica_profile_data` */

CREATE TABLE `xfriendica_profile_data` (
  `profile-id` int(12) unsigned NOT NULL DEFAULT '0',
  `dob` int(12) NOT NULL DEFAULT '0',
  `address` char(255) CHARACTER SET latin1 NOT NULL,
  `locality` char(255) CHARACTER SET latin1 NOT NULL,
  `region` char(255) CHARACTER SET latin1 NOT NULL,
  `postal-code` char(32) CHARACTER SET latin1 NOT NULL,
  `country-name` char(255) CHARACTER SET latin1 NOT NULL,
  `hometown` char(255) CHARACTER SET latin1 NOT NULL,
  `gender` char(32) CHARACTER SET latin1 NOT NULL,
  `marital` char(255) CHARACTER SET latin1 NOT NULL,
  `with` text CHARACTER SET latin1 NOT NULL,
  `howlong` int(12) NOT NULL DEFAULT '0',
  `sexual` char(255) CHARACTER SET latin1 NOT NULL,
  `politic` char(255) CHARACTER SET latin1 NOT NULL,
  `religion` char(255) CHARACTER SET latin1 NOT NULL,
  `likes` text CHARACTER SET latin1 NOT NULL,
  `dislikes` text CHARACTER SET latin1 NOT NULL,
  `about` text CHARACTER SET latin1 NOT NULL,
  `summary` char(255) CHARACTER SET latin1 NOT NULL,
  `music` text CHARACTER SET latin1 NOT NULL,
  `book` text CHARACTER SET latin1 NOT NULL,
  `tv` text CHARACTER SET latin1 NOT NULL,
  `film` text CHARACTER SET latin1 NOT NULL,
  `interest` text CHARACTER SET latin1 NOT NULL,
  `romance` text CHARACTER SET latin1 NOT NULL,
  `work` text CHARACTER SET latin1 NOT NULL,
  `education` text CHARACTER SET latin1 NOT NULL,
  `contact` text CHARACTER SET latin1 NOT NULL,
  PRIMARY KEY (`profile-id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_profile_data` */

/*Table structure for table `xfriendica_profile_field` */

CREATE TABLE `xfriendica_profile_field` (
  `id` int(12) unsigned NOT NULL AUTO_INCREMENT,
  `cat-id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `field-type` varchar(30) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `field-valuetype` tinyint(2) unsigned NOT NULL DEFAULT '0',
  `field-name` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `field-title` varchar(255) CHARACTER SET latin1 NOT NULL DEFAULT '',
  `field-description` text CHARACTER SET latin1,
  `field-required` enum('Yes','No') NOT NULL DEFAULT 'No',
  `field-maxlength` smallint(6) unsigned NOT NULL DEFAULT '0',
  `field-weight` smallint(6) unsigned NOT NULL DEFAULT '0',
  `field-default` text CHARACTER SET latin1,
  `field-notnull` enum('Yes','No') NOT NULL DEFAULT 'No',
  `field-edit` enum('Yes','No') NOT NULL DEFAULT 'No',
  `field-show` enum('Yes','No') NOT NULL DEFAULT 'No',
  `field-syndicated` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `field-local` enum('Yes','No') DEFAULT 'Yes',
  `field-config` enum('Yes','No') NOT NULL DEFAULT 'No',
  `field-options` text CHARACTER SET latin1,
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `field_name` (`field-name`),
  KEY `step` (`field-weight`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_profile_field` */

insert  into `xfriendica_profile_field`(`id`,`cat-id`,`field-type`,`field-valuetype`,`field-name`,`field-title`,`field-description`,`field-required`,`field-maxlength`,`field-weight`,`field-default`,`field-notnull`,`field-edit`,`field-show`,`field-syndicated`,`field-local`,`field-config`,`field-options`,`created`,`updated`) values (1,1,'date',3,'dob','DOB',NULL,'Yes',10,1,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(2,1,'textbox',1,'address','Address',NULL,'Yes',255,2,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(3,1,'textbox',1,'locality','Locality',NULL,'Yes',255,6,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(4,1,'textbox',1,'region','Region',NULL,'Yes',255,3,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(5,1,'textbox',1,'post-cide','Post Code',NULL,'Yes',32,4,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(6,1,'textbox',1,'country-name','Country Name',NULL,'Yes',255,5,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(7,1,'textbox',1,'hometown','Hometown',NULL,'Yes',255,7,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(8,1,'textbox',1,'gender','Gender','Mail / Female / Transsexual','Yes',32,8,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(9,2,'textbox',1,'martial','Significant Other',NULL,'Yes',255,9,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(10,2,'textarea',1,'with','Children',NULL,'Yes',65535,10,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(11,2,'textbox',1,'howlong','Number of Years in Wedlock',NULL,'Yes',10,11,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(12,2,'textbox',1,'politics','Political View',NULL,'Yes',255,12,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(13,2,'textbox',1,'religion','Religious Views',NULL,'Yes',255,13,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(14,2,'textbox',1,'summary','Personal Summary',NULL,'Yes',255,14,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(15,3,'textarea',1,'likes','Your Likes',NULL,'Yes',65535,15,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(16,3,'textarea',1,'dislikes','Your Dislikes',NULL,'Yes',65535,16,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(17,3,'textarea',1,'about','About You',NULL,'Yes',65535,17,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(18,3,'textarea',1,'music','Your Music Taste / Experiences',NULL,'Yes',65535,18,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(19,3,'textarea',1,'book','Book Interest / Favorite Publisher',NULL,'Yes',65535,19,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(20,3,'textarea',1,'tv','Favorite TV',NULL,'Yes',65535,20,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(21,3,'textarea',1,'film','Favorite Movies',NULL,'Yes',65535,21,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(22,3,'textarea',1,'interest','General Interests',NULL,'Yes',65535,22,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(23,3,'textarea',1,'romance','Romance Story / Experiences',NULL,'Yes',65535,23,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(24,3,'textarea',1,'work','Work History',NULL,'Yes',65535,24,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(25,3,'textarea',1,'education','Eduction Qualifications',NULL,'Yes',65535,25,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0),(26,1,'textarea',1,'contact','Contact Instructions',NULL,'Yes',65535,26,NULL,'No','Yes','Yes','Yes','Yes','Yes',NULL,0,0);

/*Table structure for table `xfriendica_profile_keywords` */

CREATE TABLE `xfriendica_profile_keywords` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('profile-public','profile-private') DEFAULT NULL,
  `keyword-id` bigint(24) NOT NULL,
  `person-id` bigint(24) NOT NULL,
  `profile-id` bigint(24) DEFAULT NULL,
  `language` char(5) DEFAULT 'en',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_profile_keywords` */

/*Table structure for table `xfriendica_profile_visibility` */

CREATE TABLE `xfriendica_profile_visibility` (
  `field-id` int(12) unsigned NOT NULL DEFAULT '0',
  `network-group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `user-group` smallint(5) unsigned NOT NULL DEFAULT '0',
  `profile-group` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`field-id`,`network-group`,`user-group`,`profile-group`),
  KEY `visible` (`user-group`,`profile-group`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_profile_visibility` */

/*Table structure for table `xfriendica_protocols` */

CREATE TABLE `xfriendica_protocols` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `salt` char(128) DEFAULT NULL,
  `client-id` char(20) NOT NULL,
  `guid` char(64) NOT NULL,
  `name` char(255) DEFAULT NULL,
  `summary` varchar(600) DEFAULT NULL,
  `path` char(128) DEFAULT '/',
  `prefix` char(8) NOT NULL,
  `version` char(16) NOT NULL DEFAULT '1.0.0',
  `system` enum('Yes','No') NOT NULL DEFAULT 'No',
  `forapi` tinyint(1) NOT NULL DEFAULT '0',
  `forservice` tinyint(1) NOT NULL DEFAULT '0',
  `fornetwork` tinyint(1) NOT NULL DEFAULT '0',
  `hidden` enum('Yes','No') NOT NULL DEFAULT 'No',
  `haspoll` enum('Yes','No') NOT NULL DEFAULT 'No',
  `haspush` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hascron` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hasadmin` enum('Yes','No') NOT NULL DEFAULT 'No',
  `hassource` enum('Yes','No') NOT NULL DEFAULT 'No',
  `activity` decimal(10,5) NOT NULL DEFAULT '0.00000',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`client-id`,`guid`,`prefix`,`version`,`system`,`forapi`,`forservice`,`fornetwork`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_protocols` */

/*Table structure for table `xfriendica_protocols_functions` */

CREATE TABLE `xfriendica_protocols_functions` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `protocol-id` bigint(24) unsigned DEFAULT '0',
  `filename` char(255) DEFAULT NULL,
  `function` char(255) DEFAULT NULL,
  `class` char(255) DEFAULT NULL,
  `command` char(128) DEFAULT NULL,
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQUES` (`protocol-id`,`function`(64),`class`(64),`command`(32)),
  KEY `SEARCH` (`id`,`protocol-id`,`command`(64))
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_protocols_functions` */

/*Table structure for table `xfriendica_protocols_resources` */

CREATE TABLE `xfriendica_protocols_resources` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `protocol-id` bigint(24) unsigned NOT NULL,
  `type` enum('function','extension','class','module','core') NOT NULL DEFAULT 'extension',
  `name` char(128) NOT NULL DEFAULT '',
  `dirname` char(128) DEFAULT '',
  `version` decimal(5,3) unsigned DEFAULT '0.000',
  `class` char(128) NOT NULL DEFAULT '',
  `command` char(128) DEFAULT '',
  `required` enum('Yes','No') NOT NULL DEFAULT 'Yes',
  `optional` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned DEFAULT '0',
  `updated` int(12) unsigned DEFAULT '0',
  PRIMARY KEY (`id`,`protocol-id`,`type`,`name`,`class`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_protocols_resources` */

/*Table structure for table `xfriendica_queue` */

CREATE TABLE `xfriendica_queue` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `guid` char(64) NOT NULL,
  `method` enum('push','pull','ping','check','patch','update','none') NOT NULL DEFAULT 'none',
  `type` enum('plugin','addon','adaptor','connector','event','profile','photo','item','mail','file','person','syndicate','announce','update','none','search','friends','keywords') NOT NULL DEFAULT 'none',
  `type-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `command` char(32) NOT NULL,
  `start` int(12) unsigned NOT NULL DEFAULT '0',
  `finish` int(12) unsigned NOT NULL DEFAULT '0',
  `tasks` int(12) NOT NULL DEFAULT '0',
  `taken` int(12) NOT NULL DEFAULT '0',
  `calls` int(10) NOT NULL DEFAULT '0',
  `success` int(10) NOT NULL DEFAULT '0',
  `failed` int(10) NOT NULL DEFAULT '0',
  `retries` int(10) NOT NULL DEFAULT '0',
  `rescheduled` enum('Yes','No') NOT NULL DEFAULT 'No',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`guid`,`method`,`type`,`type-id`,`command`,`start`,`finish`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_queue` */

/*Table structure for table `xfriendica_queue_batches` */

CREATE TABLE `xfriendica_queue_batches` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `queue-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `minimum` int(10) unsigned NOT NULL DEFAULT '0',
  `started` int(12) unsigned NOT NULL DEFAULT '0',
  `finished` int(12) unsigned NOT NULL DEFAULT '0',
  `delay` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`queue-id`,`server-id`,`minimum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_queue_batches` */

/*Table structure for table `xfriendica_queue_tasks` */

CREATE TABLE `xfriendica_queue_tasks` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `queue-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `path-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `api-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `protocol-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `plugin-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `addon-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `batch-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `command` char(32) DEFAULT NULL,
  `when` int(12) unsigned NOT NULL DEFAULT '0',
  `failed` int(12) unsigned NOT NULL DEFAULT '0',
  `success` int(12) unsigned NOT NULL DEFAULT '0',
  `took` int(12) unsigned NOT NULL DEFAULT '0',
  `bytes` int(12) unsigned NOT NULL DEFAULT '0',
  `created` int(12) unsigned NOT NULL DEFAULT '0',
  `updated` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_queue_tasks` */

/*Table structure for table `xfriendica_statistics` */

CREATE TABLE `xfriendica_statistics` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('network','server','api','addon','avarta','discussion','event','file','group','item','key','location','mail','person','photo','album','plugin','profile','protocol','url','country','city','region') DEFAULT NULL,
  `type-id` bigint(24) unsigned DEFAULT NULL,
  `hits-week` int(12) unsigned NOT NULL DEFAULT '0',
  `hits-fortnight` int(12) unsigned NOT NULL DEFAULT '0',
  `hits-month` int(12) unsigned NOT NULL DEFAULT '0',
  `hits-quarter` int(12) unsigned NOT NULL DEFAULT '0',
  `hits-year` int(12) unsigned NOT NULL DEFAULT '0',
  `ends-week` int(12) unsigned NOT NULL DEFAULT '0',
  `ends-fortnight` int(12) unsigned NOT NULL DEFAULT '0',
  `ends-month` int(12) unsigned NOT NULL DEFAULT '0',
  `ends-quarter` int(12) unsigned NOT NULL DEFAULT '0',
  `ends-year` int(12) unsigned NOT NULL DEFAULT '0',
  `session-week` int(12) unsigned NOT NULL DEFAULT '0',
  `session-fortnight` int(12) unsigned NOT NULL DEFAULT '0',
  `session-month` int(12) unsigned NOT NULL DEFAULT '0',
  `session-quarter` int(12) unsigned NOT NULL DEFAULT '0',
  `session-year` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_statistics` */

/*Table structure for table `xfriendica_statistics_forecasting` */

CREATE TABLE `xfriendica_statistics_forecasting` (
  `id` bigint(12) unsigned NOT NULL AUTO_INCREMENT,
  `type` enum('weekly','fortnightly','monthly','quarterly','yearly') NOT NULL,
  `state` enum('network','server','api','addon','avarta','discussion','event','file','group','item','key','location','mail','person','photo','album','plugin','profile','protocol','url','country','city','region') DEFAULT NULL,
  `state-id` bigint(24) unsigned DEFAULT NULL,
  `sessions` int(5) unsigned NOT NULL DEFAULT '6',
  `last-session` int(12) unsigned NOT NULL DEFAULT '0',
  `ended` int(12) unsigned NOT NULL DEFAULT '0',
  `seconds` int(12) unsigned NOT NULL DEFAULT '0',
  `average` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `deviation` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `maximum` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `minimum` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `range` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `activity` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `scope` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_statistics_forecasting` */

/*Table structure for table `xfriendica_statistics_history` */

CREATE TABLE `xfriendica_statistics_history` (
  `id` bigint(24) unsigned NOT NULL,
  `type` enum('weekly','fortnightly','monthly','quarterly','yearly') NOT NULL,
  `state` enum('network','server','api','addon','avarta','discussion','event','file','group','item','key','location','mail','person','photo','album','plugin','profile','protocol','url','country','city','region') DEFAULT NULL,
  `state-id` bigint(24) unsigned DEFAULT NULL,
  `session` int(12) unsigned NOT NULL DEFAULT '0',
  `hits` int(12) unsigned NOT NULL DEFAULT '0',
  `activity` decimal(10,5) unsigned NOT NULL DEFAULT '0.00000',
  `ended` int(12) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `xfriendica_statistics_history` */

/*Table structure for table `xfriendica_urls` */

CREATE TABLE `xfriendica_urls` (
  `id` bigint(24) unsigned NOT NULL AUTO_INCREMENT,
  `state` enum('redirect','profile','item','mail','discussion','directory','ping','tribe','announce','site','support') NOT NULL,
  `url` text NOT NULL,
  `person-id` bigint(24) unsigned DEFAULT '0',
  `network-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `server-id` bigint(24) unsigned NOT NULL DEFAULT '0',
  `method` enum('guid','callback','request','push','protocol','master','url','none') NOT NULL DEFAULT 'none',
  `method-key` enum('sprintf','str_replace','headers','none') NOT NULL DEFAULT 'none',
  `variable-key` char(32) DEFAULT NULL,
  `guest-pass-key` char(128) DEFAULT NULL,
  `friend-pass-key` char(128) DEFAULT NULL,
  `member-pass-key` char(128) DEFAULT NULL,
  `tribal-pass-key` char(128) DEFAULT NULL,
  `activity` decimal(10,5) DEFAULT '0.00000',
  `created` int(12) DEFAULT '0',
  `updated` int(12) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `xfriendica_urls` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
