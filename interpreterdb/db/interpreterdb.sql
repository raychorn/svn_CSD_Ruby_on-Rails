/*
MySQL Data Transfer
Source Host: 127.0.0.1
Source Database: interpreterdb
Target Host: 127.0.0.1
Target Database: interpreterdb
Date: 1/15/2013 3:29:20 PM
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for cdosysmail_failures
-- ----------------------------
DROP TABLE IF EXISTS `cdosysmail_failures`;
CREATE TABLE `cdosysmail_failures` (
  `Date of Failure` datetime DEFAULT NULL,
  `Spid` int(11) DEFAULT NULL,
  `From` varchar(100) DEFAULT NULL,
  `To` varchar(100) DEFAULT NULL,
  `Subject` varchar(100) DEFAULT NULL,
  `Body` varchar(4000) DEFAULT NULL,
  `iMsg` int(11) DEFAULT NULL,
  `Hr` int(11) DEFAULT NULL,
  `Source of Failure` varchar(255) DEFAULT NULL,
  `Description of Failure` varchar(500) DEFAULT NULL,
  `Output from Failure` varchar(1000) DEFAULT NULL,
  `Comment about Failure` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lss_clients
-- ----------------------------
DROP TABLE IF EXISTS `lss_clients`;
CREATE TABLE `lss_clients` (
  `Client Code` varchar(8) DEFAULT NULL,
  `F2` varchar(255) DEFAULT NULL,
  `Customer Last` varchar(255) DEFAULT NULL,
  `Tax Exempt Status` varchar(255) DEFAULT NULL,
  `Address Type` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `Address3` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL,
  `Address1` varchar(255) DEFAULT NULL,
  `Address21` varchar(255) DEFAULT NULL,
  `Address31` varchar(255) DEFAULT NULL,
  `City1` varchar(255) DEFAULT NULL,
  `State1` varchar(255) DEFAULT NULL,
  `Zip1` varchar(255) DEFAULT NULL,
  `Phone Type` varchar(255) DEFAULT NULL,
  `Phone1` varchar(255) DEFAULT NULL,
  `Phone2` varchar(255) DEFAULT NULL,
  `Email` varchar(255) DEFAULT NULL,
  `Fax` varchar(255) DEFAULT NULL,
  `Contact Name` varchar(255) DEFAULT NULL,
  `Rate Type` varchar(255) DEFAULT NULL,
  `RateGroup` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lss_clients2
-- ----------------------------
DROP TABLE IF EXISTS `lss_clients2`;
CREATE TABLE `lss_clients2` (
  `Client Code` varchar(12) DEFAULT NULL,
  `Customer First` varchar(255) DEFAULT NULL,
  `Customer Last` varchar(255) DEFAULT NULL,
  `Tax Exempt Status` varchar(255) DEFAULT NULL,
  `Address Type` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `Address2` varchar(255) DEFAULT NULL,
  `Address3` varchar(255) DEFAULT NULL,
  `City` varchar(255) DEFAULT NULL,
  `State` varchar(255) DEFAULT NULL,
  `Zip` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lss_fname
-- ----------------------------
DROP TABLE IF EXISTS `lss_fname`;
CREATE TABLE `lss_fname` (
  `Client Code` varchar(12) DEFAULT NULL,
  `Customer First` varchar(510) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lss_jobs
-- ----------------------------
DROP TABLE IF EXISTS `lss_jobs`;
CREATE TABLE `lss_jobs` (
  `ActivityDate` datetime DEFAULT NULL,
  `StartTime` varchar(24) DEFAULT NULL,
  `EndTime` varchar(24) DEFAULT NULL,
  `Client Dur` double DEFAULT NULL,
  `Staff Dur` double DEFAULT NULL,
  `Program` varchar(32) DEFAULT NULL,
  `Recipient` varchar(32) DEFAULT NULL,
  `ServiceCode` varchar(32) DEFAULT NULL,
  `ServiceGroupID` int(11) DEFAULT NULL,
  `Location` varchar(32) DEFAULT NULL,
  `Language` varchar(32) DEFAULT NULL,
  `LanguageID` int(11) DEFAULT NULL,
  `Status` varchar(32) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `WONum` int(11) DEFAULT NULL,
  `RequestedBy` varchar(255) DEFAULT NULL,
  `SvcsReceivedby` varchar(255) DEFAULT NULL,
  `TouchDate` datetime DEFAULT NULL,
  `TouchUser` varchar(255) DEFAULT NULL,
  `CreateDate` datetime DEFAULT NULL,
  `CreateUser` varchar(255) DEFAULT NULL,
  `Reminder` varchar(512) DEFAULT NULL,
  `ClientLSSID` int(11) DEFAULT NULL,
  `ClientFirst` varchar(255) DEFAULT NULL,
  `ClientLast` varchar(255) DEFAULT NULL,
  `Staff` varchar(255) DEFAULT NULL,
  `StaffCode` varchar(255) DEFAULT NULL,
  `StaffFirst` varchar(255) DEFAULT NULL,
  `StaffLast` varchar(255) DEFAULT NULL,
  `InterpID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lss_terp
-- ----------------------------
DROP TABLE IF EXISTS `lss_terp`;
CREATE TABLE `lss_terp` (
  `RowID` int(11) DEFAULT NULL,
  `Country` varchar(255) DEFAULT NULL,
  `Cert` varchar(32) DEFAULT NULL,
  `Gender` varchar(32) DEFAULT NULL,
  `TempID` int(11) DEFAULT NULL,
  `FullName` varchar(255) DEFAULT NULL,
  `FirstName` varchar(255) DEFAULT NULL,
  `LastName` varchar(255) DEFAULT NULL,
  `Availability` varchar(512) DEFAULT NULL,
  `Home` varchar(32) DEFAULT NULL,
  `Work` varchar(32) DEFAULT NULL,
  `Cell` varchar(32) DEFAULT NULL,
  `OtherPhone` varchar(32) DEFAULT NULL,
  `OtherType` varchar(32) DEFAULT NULL,
  `Pager` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for lss_terplang
-- ----------------------------
DROP TABLE IF EXISTS `lss_terplang`;
CREATE TABLE `lss_terplang` (
  `RowID` int(11) DEFAULT NULL,
  `TerpID` int(11) DEFAULT NULL,
  `Language` varchar(510) DEFAULT NULL,
  `LangID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for rails_admin_histories
-- ----------------------------
DROP TABLE IF EXISTS `rails_admin_histories`;
CREATE TABLE `rails_admin_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text COLLATE utf8_unicode_ci,
  `username` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item` int(11) DEFAULT NULL,
  `table` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `month` smallint(6) DEFAULT NULL,
  `year` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_rails_admin_histories` (`item`,`table`,`month`,`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `resource_id` int(11) DEFAULT NULL,
  `resource_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`),
  KEY `index_roles_on_name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for schema_migrations
-- ----------------------------
DROP TABLE IF EXISTS `schema_migrations`;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for tblbilledjobstemp
-- ----------------------------
DROP TABLE IF EXISTS `tblbilledjobstemp`;
CREATE TABLE `tblbilledjobstemp` (
  `Date` datetime DEFAULT NULL,
  `JobNumber` int(11) NOT NULL,
  `ClientKey` int(11) DEFAULT NULL,
  `ServiceLocation` longtext,
  `ServiceCode` varchar(100) DEFAULT NULL,
  `ServiceGrp` int(11) DEFAULT NULL,
  `InterpreterID` int(11) DEFAULT NULL,
  `StatusID` int(11) DEFAULT NULL,
  `SchedCode` varchar(100) DEFAULT NULL,
  `FromTime` datetime DEFAULT NULL,
  `EndTime` datetime DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `PageStatus` varchar(100) DEFAULT NULL,
  `RequestedBy` varchar(100) DEFAULT NULL,
  `RequestedByPhone` varchar(100) DEFAULT NULL,
  `PONumber` varchar(100) DEFAULT NULL,
  `ServicesFor` varchar(100) DEFAULT NULL,
  `PersonalSchedCode` int(11) DEFAULT NULL,
  `BillingRateID` int(11) DEFAULT NULL,
  `PayRateID` int(11) DEFAULT NULL,
  `TaxRateID` double DEFAULT NULL,
  `Requested` tinyint(1) NOT NULL,
  `Taxable` tinyint(1) NOT NULL,
  `TaxRate` double DEFAULT NULL,
  `EnteredBy` varchar(100) DEFAULT NULL,
  `EnteredDate` datetime DEFAULT NULL,
  `InvoiceNumber` int(11) DEFAULT NULL,
  `InvoiceDate` datetime DEFAULT NULL,
  `LocationNotes` varchar(100) DEFAULT NULL,
  `TravelTime` decimal(18,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblbillinggroups
-- ----------------------------
DROP TABLE IF EXISTS `tblbillinggroups`;
CREATE TABLE `tblbillinggroups` (
  `billgroupid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) NOT NULL,
  `billgroupname` varchar(48) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`billgroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblbillingrates
-- ----------------------------
DROP TABLE IF EXISTS `tblbillingrates`;
CREATE TABLE `tblbillingrates` (
  `billingrateid` int(11) NOT NULL AUTO_INCREMENT,
  `rategroupid` int(11) DEFAULT NULL,
  `datefrom` datetime DEFAULT NULL,
  `dateto` datetime DEFAULT NULL,
  `servicegroupid` int(11) DEFAULT NULL,
  `servicecode` varchar(16) DEFAULT NULL,
  `rate1st` decimal(19,4) DEFAULT NULL,
  `rate2nd` decimal(19,4) DEFAULT NULL,
  `rate3rd` decimal(19,4) DEFAULT NULL,
  `intlevel` int(11) DEFAULT NULL,
  `rate1stAddl` decimal(19,4) DEFAULT NULL,
  `rate2ndAddl` decimal(19,4) DEFAULT NULL,
  `rate3rdAddl` decimal(19,4) DEFAULT NULL,
  `rate1stIO` decimal(19,4) DEFAULT '0.0000',
  `rate2ndIO` decimal(19,4) DEFAULT '0.0000',
  `rate3rdIO` decimal(19,4) DEFAULT '0.0000',
  `rate1stIOAddl` decimal(19,4) DEFAULT '0.0000',
  `rate2ndIOAddl` decimal(19,4) DEFAULT '0.0000',
  `rate3rdIOAddl` decimal(19,4) DEFAULT '0.0000',
  `adminfee` decimal(19,4) DEFAULT NULL,
  `adminfeeIO` decimal(19,4) DEFAULT NULL,
  PRIMARY KEY (`billingrateid`),
  KEY `FK_tblBillingRates_tblBillingGroups` (`rategroupid`),
  CONSTRAINT `FK_tblBillingRates_tblBillingGroups` FOREIGN KEY (`rategroupid`) REFERENCES `tblbillinggroups` (`billgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblbillingrules
-- ----------------------------
DROP TABLE IF EXISTS `tblbillingrules`;
CREATE TABLE `tblbillingrules` (
  `id` int(11) NOT NULL,
  `rategroupid` int(11) NOT NULL,
  `datefrom` datetime DEFAULT NULL,
  `dateto` datetime DEFAULT NULL,
  `rateclass` varchar(24) DEFAULT NULL,
  `servicecode` varchar(128) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `days` varchar(12) DEFAULT NULL,
  `minlabel` varchar(32) DEFAULT NULL,
  `minlength` int(11) DEFAULT NULL,
  `mintype` varchar(16) DEFAULT NULL,
  `firstlabel` varchar(32) DEFAULT NULL,
  `firstrate` decimal(19,4) DEFAULT NULL,
  `firstlength` int(11) DEFAULT NULL,
  `addllabel` varchar(32) DEFAULT NULL,
  `addlrate` decimal(19,4) DEFAULT NULL,
  `increments` int(11) DEFAULT NULL,
  `feelabel` varchar(32) DEFAULT NULL,
  `feerate` decimal(19,4) DEFAULT NULL,
  `feequantity` int(11) DEFAULT NULL,
  `description` varchar(128) DEFAULT NULL,
  `servicegroupid` int(11) DEFAULT NULL,
  `payservicegroupid` int(11) DEFAULT NULL,
  `payservicecode` varchar(24) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcertifications
-- ----------------------------
DROP TABLE IF EXISTS `tblcertifications`;
CREATE TABLE `tblcertifications` (
  `certificationsid` int(11) NOT NULL AUTO_INCREMENT,
  `interpreterid` int(11) DEFAULT NULL,
  `servicecode` varchar(32) DEFAULT NULL,
  `certificationdate` datetime DEFAULT NULL,
  `comments` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`certificationsid`),
  KEY `FK_tblCertifications_tblInterpreters` (`interpreterid`),
  CONSTRAINT `FK_tblCertifications_tblInterpreters` FOREIGN KEY (`interpreterid`) REFERENCES `tblinterpreters` (`interpreterid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblclient
-- ----------------------------
DROP TABLE IF EXISTS `tblclient`;
CREATE TABLE `tblclient` (
  `clientid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT '1',
  `clientabbrev` varchar(64) DEFAULT NULL,
  `clientname` varchar(64) DEFAULT NULL,
  `clienttag` varchar(16) DEFAULT NULL,
  `attn` varchar(64) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `billaddress1` varchar(128) DEFAULT NULL,
  `billaddress2` varchar(128) DEFAULT NULL,
  `billcity` varchar(64) DEFAULT NULL,
  `billstate` varchar(32) DEFAULT NULL,
  `billzip` varchar(16) DEFAULT NULL,
  `contact1` varchar(64) DEFAULT NULL,
  `contact1phone` varchar(32) DEFAULT NULL,
  `contact2` varchar(64) DEFAULT NULL,
  `contact2phone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `schedulingnotes` varchar(1024) DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL DEFAULT '1',
  `porequired` tinyint(1) NOT NULL DEFAULT '0',
  `defaultpo` varchar(32) DEFAULT NULL,
  `billgroupid` int(11) DEFAULT NULL,
  `minimumunits` decimal(8,4) DEFAULT NULL,
  `minimumamount` decimal(19,4) DEFAULT NULL,
  `reimburseexpenses` tinyint(1) DEFAULT '1',
  `locationid` int(11) DEFAULT NULL,
  `terms` varchar(32) DEFAULT NULL,
  `invoicecycle` varchar(32) DEFAULT NULL,
  `taxrateid` int(11) DEFAULT NULL,
  `billto` int(11) DEFAULT NULL,
  `invparamid` int(11) DEFAULT NULL,
  `miles` decimal(18,4) DEFAULT NULL,
  `MAS90ID` varchar(32) DEFAULT NULL,
  `CreationDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `io_billgroupid` int(11) DEFAULT NULL,
  `io_minunits` decimal(8,4) DEFAULT NULL,
  `io_minamount` decimal(12,4) DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `ioready` tinyint(1) DEFAULT NULL,
  `iodatechecked` datetime DEFAULT NULL,
  `iocheckedby` varchar(64) DEFAULT NULL,
  `email` varchar(130) DEFAULT NULL,
  `sf_acct_id` varchar(40) DEFAULT NULL,
  `rate_type` int(11) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `LSSID` varchar(8) DEFAULT NULL,
  PRIMARY KEY (`clientid`),
  KEY `FK_tblClient_tblBillingGroups` (`billgroupid`),
  KEY `FK_tblClient_tblLocations` (`locationid`),
  KEY `FK_tblClient_tblTaxRates` (`taxrateid`),
  CONSTRAINT `FK_tblClient_tblBillingGroups` FOREIGN KEY (`billgroupid`) REFERENCES `tblbillinggroups` (`billgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblClient_tblLocations` FOREIGN KEY (`locationid`) REFERENCES `tbllocations` (`locationid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblClient_tblTaxRates` FOREIGN KEY (`taxrateid`) REFERENCES `tbltaxrates` (`taxrateid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblclient_b
-- ----------------------------
DROP TABLE IF EXISTS `tblclient_b`;
CREATE TABLE `tblclient_b` (
  `clientid` int(11) NOT NULL,
  `officeid` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `clientabbrev` varchar(64) DEFAULT NULL,
  `clientname` varchar(64) DEFAULT NULL,
  `clienttag` varchar(16) DEFAULT NULL,
  `attn` varchar(64) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `contact1` varchar(64) DEFAULT NULL,
  `contact1phone` varchar(32) DEFAULT NULL,
  `contact2` varchar(64) DEFAULT NULL,
  `contact2phone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `schedulingnotes` varchar(1024) DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL,
  `porequired` tinyint(1) NOT NULL,
  `defaultpo` varchar(32) DEFAULT NULL,
  `billgroupid` int(11) DEFAULT NULL,
  `minimumunits` decimal(8,4) DEFAULT NULL,
  `minimumamount` decimal(19,4) DEFAULT NULL,
  `reimburseexpenses` tinyint(1) DEFAULT NULL,
  `locationid` int(11) DEFAULT NULL,
  `terms` varchar(32) DEFAULT NULL,
  `invoicecycle` varchar(32) DEFAULT NULL,
  `taxrateid` int(11) DEFAULT NULL,
  `billto` int(11) DEFAULT NULL,
  `invparamid` int(11) DEFAULT NULL,
  `miles` decimal(18,4) DEFAULT NULL,
  `MAS90ID` varchar(32) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `io_billgroupid` int(11) DEFAULT NULL,
  `io_minunits` decimal(8,4) DEFAULT NULL,
  `io_minamount` decimal(12,4) DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `ioready` tinyint(1) DEFAULT NULL,
  `iodatechecked` datetime DEFAULT NULL,
  `iocheckedby` varchar(64) DEFAULT NULL,
  `email` varchar(130) DEFAULT NULL,
  `sf_acct_id` varchar(40) DEFAULT NULL,
  `rate_type` int(11) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblclientbackup010809
-- ----------------------------
DROP TABLE IF EXISTS `tblclientbackup010809`;
CREATE TABLE `tblclientbackup010809` (
  `clientid` int(11) NOT NULL,
  `officeid` int(11) NOT NULL,
  `active` tinyint(1) DEFAULT NULL,
  `clientabbrev` varchar(64) DEFAULT NULL,
  `clientname` varchar(64) DEFAULT NULL,
  `clienttag` varchar(16) DEFAULT NULL,
  `attn` varchar(64) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `contact1` varchar(64) DEFAULT NULL,
  `contact1phone` varchar(32) DEFAULT NULL,
  `contact2` varchar(64) DEFAULT NULL,
  `contact2phone` varchar(32) DEFAULT NULL,
  `fax` varchar(32) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `notes` varchar(1024) DEFAULT NULL,
  `schedulingnotes` varchar(1024) DEFAULT NULL,
  `taxable` tinyint(1) NOT NULL,
  `porequired` tinyint(1) NOT NULL,
  `defaultpo` varchar(32) DEFAULT NULL,
  `billgroupid` int(11) DEFAULT NULL,
  `minimumunits` decimal(8,4) DEFAULT NULL,
  `minimumamount` decimal(19,4) DEFAULT NULL,
  `reimburseexpenses` tinyint(1) DEFAULT NULL,
  `locationid` int(11) DEFAULT NULL,
  `terms` varchar(32) DEFAULT NULL,
  `invoicecycle` varchar(32) DEFAULT NULL,
  `taxrateid` int(11) DEFAULT NULL,
  `billto` int(11) DEFAULT NULL,
  `invparamid` int(11) DEFAULT NULL,
  `miles` decimal(18,4) DEFAULT NULL,
  `MAS90ID` varchar(32) DEFAULT NULL,
  `CreationDate` datetime DEFAULT NULL,
  `io_billgroupid` int(11) DEFAULT NULL,
  `io_minunits` decimal(8,4) DEFAULT NULL,
  `io_minamount` decimal(12,4) DEFAULT NULL,
  `ipaddress` varchar(64) DEFAULT NULL,
  `ioready` tinyint(1) DEFAULT NULL,
  `iodatechecked` datetime DEFAULT NULL,
  `iocheckedby` varchar(64) DEFAULT NULL,
  `email` varchar(130) DEFAULT NULL,
  `sf_acct_id` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblclientio
-- ----------------------------
DROP TABLE IF EXISTS `tblclientio`;
CREATE TABLE `tblclientio` (
  `clientid` int(11) NOT NULL,
  `updatedby` varchar(64) DEFAULT NULL,
  `updatedate` datetime DEFAULT NULL,
  `businesspoc` varchar(128) DEFAULT NULL,
  `businessnumber` varchar(64) DEFAULT NULL,
  `techpoc` varchar(128) DEFAULT NULL,
  `technumber` varchar(64) DEFAULT NULL,
  `techemail` varchar(128) DEFAULT NULL,
  `speakerphone` varchar(64) DEFAULT NULL,
  `equipment` varchar(128) DEFAULT NULL,
  `software` varchar(128) DEFAULT NULL,
  `callmethod` varchar(64) DEFAULT NULL,
  `location1` varchar(64) DEFAULT NULL,
  `siteip1` varchar(64) DEFAULT NULL,
  `location2` varchar(64) DEFAULT NULL,
  `siteip2` varchar(64) DEFAULT NULL,
  `location3` varchar(64) DEFAULT NULL,
  `siteip3` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`clientid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblclientnotes
-- ----------------------------
DROP TABLE IF EXISTS `tblclientnotes`;
CREATE TABLE `tblclientnotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `clientid` int(11) DEFAULT NULL,
  `datestamp` datetime DEFAULT NULL,
  `addedby` varchar(64) DEFAULT NULL,
  `warning` tinyint(1) NOT NULL DEFAULT '0',
  `color` varchar(16) DEFAULT NULL,
  `message` varchar(2048) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblcommissionrates
-- ----------------------------
DROP TABLE IF EXISTS `tblcommissionrates`;
CREATE TABLE `tblcommissionrates` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `salesrepid` int(11) NOT NULL,
  `objecttype` varchar(12) NOT NULL,
  `objectid` int(11) NOT NULL,
  `startdate` datetime NOT NULL,
  `enddate` datetime NOT NULL,
  `commpercent` decimal(12,4) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblemployeestatus
-- ----------------------------
DROP TABLE IF EXISTS `tblemployeestatus`;
CREATE TABLE `tblemployeestatus` (
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) DEFAULT NULL,
  `status` varchar(16) DEFAULT NULL,
  `Xstatusid` int(11) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblevent
-- ----------------------------
DROP TABLE IF EXISTS `tblevent`;
CREATE TABLE `tblevent` (
  `id` int(11) NOT NULL,
  `interpreterid` int(11) DEFAULT NULL,
  `eventtype` varchar(2) DEFAULT NULL,
  `validfrom` datetime DEFAULT NULL,
  `validuntil` datetime DEFAULT NULL,
  `weeks` tinyint(3) unsigned DEFAULT NULL,
  `startDDMM` int(11) DEFAULT NULL,
  `endDDMM` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblgeo
-- ----------------------------
DROP TABLE IF EXISTS `tblgeo`;
CREATE TABLE `tblgeo` (
  `id` int(11) NOT NULL,
  `Country` varchar(2) DEFAULT NULL,
  `City` varchar(64) DEFAULT NULL,
  `AccentCity` varchar(64) DEFAULT NULL,
  `Region` varchar(2) DEFAULT NULL,
  `Population` int(11) DEFAULT NULL,
  `Latitude` double DEFAULT NULL,
  `Longitude` double DEFAULT NULL,
  UNIQUE KEY `idxCityState` (`City`,`Region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinterplang
-- ----------------------------
DROP TABLE IF EXISTS `tblinterplang`;
CREATE TABLE `tblinterplang` (
  `langid` int(11) NOT NULL,
  `terpid` int(11) NOT NULL,
  KEY `FK_tblInterpLang_tblInterpreters` (`terpid`),
  KEY `FK_tblInterpLang_tblLanguages` (`langid`),
  CONSTRAINT `FK_tblInterpLang_tblInterpreters` FOREIGN KEY (`terpid`) REFERENCES `tblinterpreters` (`interpreterid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblInterpLang_tblLanguages` FOREIGN KEY (`langid`) REFERENCES `tbllanguages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinterpreters
-- ----------------------------
DROP TABLE IF EXISTS `tblinterpreters`;
CREATE TABLE `tblinterpreters` (
  `interpreterid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) DEFAULT NULL,
  `interpreterssn` varchar(12) DEFAULT NULL,
  `gender` varchar(12) DEFAULT NULL,
  `firstname` varchar(32) DEFAULT NULL,
  `mi` varchar(4) DEFAULT NULL,
  `lastname` varchar(32) DEFAULT NULL,
  `address1` varchar(64) DEFAULT NULL,
  `address2` varchar(64) DEFAULT NULL,
  `city` varchar(32) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `country` varchar(64) DEFAULT NULL,
  `homephone` varchar(16) DEFAULT NULL,
  `workphone` varchar(16) DEFAULT NULL,
  `cellphone` varchar(16) DEFAULT NULL,
  `pager` varchar(16) DEFAULT NULL,
  `otherphonetype` varchar(32) DEFAULT NULL,
  `otherphone` varchar(16) DEFAULT NULL,
  `comments` varchar(1024) DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `certificationlevel` varchar(4) DEFAULT NULL,
  `statusid` int(11) DEFAULT NULL,
  `paygroupid` int(11) DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `locationid` int(11) DEFAULT NULL,
  `username` varchar(16) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `email2` varchar(128) DEFAULT NULL,
  `liability_exp_date` datetime DEFAULT NULL,
  `back_check_date` datetime DEFAULT NULL,
  `tb_test_date` datetime DEFAULT NULL,
  `birthday_date` datetime DEFAULT NULL,
  `terpnet_access` int(11) DEFAULT '0',
  PRIMARY KEY (`interpreterid`),
  KEY `FK_tblInterpreters_tblEmployeeStatus` (`statusid`),
  KEY `FK_tblInterpreters_tblLocations` (`locationid`),
  KEY `FK_tblInterpreters_tblPayGroups` (`paygroupid`),
  CONSTRAINT `FK_tblInterpreters_tblEmployeeStatus` FOREIGN KEY (`statusid`) REFERENCES `tblemployeestatus` (`statusid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblInterpreters_tblLocations` FOREIGN KEY (`locationid`) REFERENCES `tbllocations` (`locationid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblInterpreters_tblPayGroups` FOREIGN KEY (`paygroupid`) REFERENCES `tblpaygroups` (`paygroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinterpreterservice
-- ----------------------------
DROP TABLE IF EXISTS `tblinterpreterservice`;
CREATE TABLE `tblinterpreterservice` (
  `interpreterid` int(11) NOT NULL,
  `servicegroupid` int(11) NOT NULL,
  `servicecode` varchar(40) DEFAULT NULL,
  `allow` varchar(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinterpsessions
-- ----------------------------
DROP TABLE IF EXISTS `tblinterpsessions`;
CREATE TABLE `tblinterpsessions` (
  `sessid` varchar(32) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `officeid` int(11) DEFAULT NULL,
  `lasthit` datetime NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `terpnet_access` int(11) DEFAULT NULL,
  PRIMARY KEY (`sessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinvoicecycles
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoicecycles`;
CREATE TABLE `tblinvoicecycles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `invoicecycle` varchar(16) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinvoicelines
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoicelines`;
CREATE TABLE `tblinvoicelines` (
  `lineitemid` int(11) NOT NULL AUTO_INCREMENT,
  `jobnumber` int(11) DEFAULT NULL,
  `billorpay` varchar(1) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `itemid` int(11) DEFAULT NULL,
  `label` varchar(32) DEFAULT NULL,
  `units` decimal(8,4) DEFAULT NULL,
  `rate` decimal(19,4) DEFAULT NULL,
  `updatedby` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`lineitemid`),
  KEY `jobnumber` (`jobnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinvoices
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoices`;
CREATE TABLE `tblinvoices` (
  `officeid` int(11) DEFAULT NULL,
  `invoice_no` int(11) NOT NULL,
  `invoice_type` varchar(2) DEFAULT NULL,
  `division_no` varchar(2) DEFAULT NULL,
  `customer_no` varchar(32) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `terms_code` varchar(2) DEFAULT NULL,
  `tax_schedule` varchar(9) DEFAULT NULL,
  `sales_code` varchar(6) DEFAULT NULL,
  `tax_class` varchar(2) DEFAULT NULL,
  `customer_po_no` varchar(32) DEFAULT NULL,
  `inv_due_date` datetime DEFAULT NULL,
  `taxable_amt` decimal(8,2) DEFAULT NULL,
  `non_tax_amt` decimal(8,2) DEFAULT NULL,
  `sales_tax` decimal(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `exported` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinvoicetemp
-- ----------------------------
DROP TABLE IF EXISTS `tblinvoicetemp`;
CREATE TABLE `tblinvoicetemp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `clientid` int(11) DEFAULT NULL,
  `invoicetype` varchar(2) DEFAULT NULL,
  `invoice_date` datetime DEFAULT NULL,
  `sales_code` varchar(6) DEFAULT NULL,
  `taxable_amt` decimal(8,2) DEFAULT NULL,
  `non_tax_amt` decimal(8,2) DEFAULT NULL,
  `sales_tax` decimal(8,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `exported` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblinvparameters
-- ----------------------------
DROP TABLE IF EXISTS `tblinvparameters`;
CREATE TABLE `tblinvparameters` (
  `invParamID` int(11) NOT NULL AUTO_INCREMENT,
  `invParam` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`invParamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbljobsclosedtmp
-- ----------------------------
DROP TABLE IF EXISTS `tbljobsclosedtmp`;
CREATE TABLE `tbljobsclosedtmp` (
  `jobnumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbljobtemp
-- ----------------------------
DROP TABLE IF EXISTS `tbljobtemp`;
CREATE TABLE `tbljobtemp` (
  `JobNumber` int(11) NOT NULL,
  `InvoiceNumber` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbljobviews
-- ----------------------------
DROP TABLE IF EXISTS `tbljobviews`;
CREATE TABLE `tbljobviews` (
  `jobnumber` int(11) NOT NULL,
  `dateviewed` datetime NOT NULL,
  `viewedby` varchar(64) NOT NULL,
  `editlock` datetime DEFAULT NULL,
  KEY `IX_tblJobViews` (`jobnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbllanguages
-- ----------------------------
DROP TABLE IF EXISTS `tbllanguages`;
CREATE TABLE `tbllanguages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `langname` varchar(32) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbllineitems
-- ----------------------------
DROP TABLE IF EXISTS `tbllineitems`;
CREATE TABLE `tbllineitems` (
  `itemid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) NOT NULL,
  `shift` int(11) DEFAULT NULL,
  `itemtype` varchar(1) DEFAULT NULL,
  `description` varchar(48) DEFAULT NULL,
  `defaultamount` decimal(19,4) DEFAULT '0.0000',
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbllocations
-- ----------------------------
DROP TABLE IF EXISTS `tbllocations`;
CREATE TABLE `tbllocations` (
  `locationid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) DEFAULT NULL,
  `locationname` varchar(64) DEFAULT NULL,
  `defaultoffice` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`locationid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblnextinvoice
-- ----------------------------
DROP TABLE IF EXISTS `tblnextinvoice`;
CREATE TABLE `tblnextinvoice` (
  `officeid` int(11) NOT NULL,
  `invoiceid` int(11) DEFAULT NULL,
  PRIMARY KEY (`officeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbloffices
-- ----------------------------
DROP TABLE IF EXISTS `tbloffices`;
CREATE TABLE `tbloffices` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `division` varchar(2) DEFAULT NULL,
  `salescode` varchar(6) DEFAULT NULL,
  `salesacct` varchar(12) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `timezone` varchar(50) DEFAULT NULL,
  `active_office` tinyint(1) DEFAULT NULL,
  `top_menu` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblofficesettings
-- ----------------------------
DROP TABLE IF EXISTS `tblofficesettings`;
CREATE TABLE `tblofficesettings` (
  `officeid` int(11) NOT NULL,
  `adminfee` tinyint(1) NOT NULL DEFAULT '0',
  `enforceminimums` tinyint(1) NOT NULL DEFAULT '1',
  `increments` int(11) DEFAULT NULL,
  PRIMARY KEY (`officeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblpaygroups
-- ----------------------------
DROP TABLE IF EXISTS `tblpaygroups`;
CREATE TABLE `tblpaygroups` (
  `paygroupid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) DEFAULT NULL,
  `paygroupname` varchar(32) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`paygroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblpayrates
-- ----------------------------
DROP TABLE IF EXISTS `tblpayrates`;
CREATE TABLE `tblpayrates` (
  `payrateid` int(11) NOT NULL AUTO_INCREMENT,
  `paygroupid` int(11) NOT NULL,
  `datefrom` datetime DEFAULT NULL,
  `dateto` datetime DEFAULT NULL,
  `servicegroupid` int(11) DEFAULT NULL,
  `servicecode` varchar(16) DEFAULT NULL,
  `rate1st` decimal(19,4) DEFAULT NULL,
  `rate2nd` decimal(19,4) DEFAULT NULL,
  `rate3rd` decimal(19,4) DEFAULT NULL,
  `intlevel` int(11) DEFAULT NULL,
  PRIMARY KEY (`payrateid`),
  KEY `FK_tblPayRates_tblPayGroups` (`paygroupid`),
  CONSTRAINT `FK_tblPayRates_tblPayGroups` FOREIGN KEY (`paygroupid`) REFERENCES `tblpaygroups` (`paygroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblpayrules
-- ----------------------------
DROP TABLE IF EXISTS `tblpayrules`;
CREATE TABLE `tblpayrules` (
  `id` int(11) NOT NULL,
  `rategroupid` int(11) NOT NULL,
  `description` varchar(128) DEFAULT NULL,
  `datefrom` datetime DEFAULT NULL,
  `dateto` datetime DEFAULT NULL,
  `rateclass` varchar(24) DEFAULT NULL,
  `servicegroupid` int(11) DEFAULT NULL,
  `servicecode` varchar(24) DEFAULT NULL,
  `payservicegroupid` int(11) DEFAULT NULL,
  `payservicecode` varchar(24) DEFAULT NULL,
  `starttime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `days` varchar(12) DEFAULT NULL,
  `minlabel` varchar(32) DEFAULT NULL,
  `minlength` int(11) DEFAULT NULL,
  `mintype` varchar(16) DEFAULT NULL,
  `firstlabel` varchar(32) DEFAULT NULL,
  `firstrate` decimal(19,4) DEFAULT NULL,
  `firstlength` int(11) DEFAULT NULL,
  `addllabel` varchar(32) DEFAULT NULL,
  `addlrate` decimal(19,4) DEFAULT NULL,
  `increments` int(11) DEFAULT NULL,
  `feelabel` varchar(32) DEFAULT NULL,
  `feerate` decimal(19,4) DEFAULT NULL,
  `feequantity` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblpersonalsched
-- ----------------------------
DROP TABLE IF EXISTS `tblpersonalsched`;
CREATE TABLE `tblpersonalsched` (
  `personalid` int(11) NOT NULL AUTO_INCREMENT,
  `schedulecode` varchar(32) DEFAULT NULL,
  `paid` tinyint(1) NOT NULL DEFAULT '1',
  `officeid` int(11) DEFAULT NULL,
  PRIMARY KEY (`personalid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblplaces
-- ----------------------------
DROP TABLE IF EXISTS `tblplaces`;
CREATE TABLE `tblplaces` (
  `geonameid` int(11) DEFAULT NULL,
  `name` varchar(400) DEFAULT NULL,
  `asciiname` varchar(400) DEFAULT NULL,
  `alternatenames` varchar(8000) DEFAULT NULL,
  `latitude` float(24,0) DEFAULT NULL,
  `longitude` float(24,0) DEFAULT NULL,
  `featureclass` varchar(2) DEFAULT NULL,
  `featurecode` varchar(20) DEFAULT NULL,
  `countrycode` varchar(4) DEFAULT NULL,
  `cc2` varchar(120) DEFAULT NULL,
  `admin1code` varchar(40) DEFAULT NULL,
  `admin2code` varchar(160) DEFAULT NULL,
  `admin3code` varchar(40) DEFAULT NULL,
  `admin4code` varchar(40) DEFAULT NULL,
  `population` bigint(20) DEFAULT NULL,
  `elevation` int(11) DEFAULT NULL,
  `gtopo30` int(11) DEFAULT NULL,
  `timezone` varchar(200) DEFAULT NULL,
  `modificationdate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblreminders
-- ----------------------------
DROP TABLE IF EXISTS `tblreminders`;
CREATE TABLE `tblreminders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(12) DEFAULT NULL,
  `status` varchar(12) DEFAULT NULL,
  `alarmdate` datetime DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  `officeid` int(11) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `notes` longtext,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblreportoptions
-- ----------------------------
DROP TABLE IF EXISTS `tblreportoptions`;
CREATE TABLE `tblreportoptions` (
  `report` varchar(24) NOT NULL,
  `param` varchar(24) NOT NULL,
  `label` varchar(64) DEFAULT NULL,
  `value` varchar(64) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblreportparams
-- ----------------------------
DROP TABLE IF EXISTS `tblreportparams`;
CREATE TABLE `tblreportparams` (
  `sessid` char(32) DEFAULT NULL,
  `paramtype` varchar(16) DEFAULT NULL,
  `paramvalue` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblrequestedinterpreter
-- ----------------------------
DROP TABLE IF EXISTS `tblrequestedinterpreter`;
CREATE TABLE `tblrequestedinterpreter` (
  `requestid` int(11) NOT NULL AUTO_INCREMENT,
  `servicesforid` int(11) DEFAULT NULL,
  `interpreterid` int(11) DEFAULT NULL,
  `servicecode` varchar(16) DEFAULT NULL,
  `preferencenumber` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`requestid`),
  KEY `FK_tblRequestedInterpreter_tblInterpreters` (`interpreterid`),
  KEY `FK_tblRequestedInterpreter_tblServicesFor` (`servicesforid`),
  CONSTRAINT `FK_tblRequestedInterpreter_tblInterpreters` FOREIGN KEY (`interpreterid`) REFERENCES `tblinterpreters` (`interpreterid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblRequestedInterpreter_tblServicesFor` FOREIGN KEY (`servicesforid`) REFERENCES `tblservicesfor` (`servicesforid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblrptuserlog
-- ----------------------------
DROP TABLE IF EXISTS `tblrptuserlog`;
CREATE TABLE `tblrptuserlog` (
  `logID` int(11) NOT NULL,
  `username` char(50) DEFAULT NULL,
  `reportURL` char(255) DEFAULT NULL,
  `DateTime` datetime DEFAULT NULL,
  `LocationID` char(18) DEFAULT NULL,
  `ip` char(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblsalesreps
-- ----------------------------
DROP TABLE IF EXISTS `tblsalesreps`;
CREATE TABLE `tblsalesreps` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `rep_office` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rep_client` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `rep_interp` tinyint(3) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblschedstatus
-- ----------------------------
DROP TABLE IF EXISTS `tblschedstatus`;
CREATE TABLE `tblschedstatus` (
  `statusid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) DEFAULT NULL,
  `schedstatus` varchar(32) DEFAULT NULL,
  `schedgroup` varchar(32) DEFAULT NULL,
  `isdefault` tinyint(1) DEFAULT '0',
  `hold` tinyint(1) DEFAULT NULL,
  `processbilling` tinyint(1) DEFAULT NULL,
  `processpay` tinyint(1) DEFAULT NULL,
  `credit` tinyint(1) DEFAULT NULL,
  `interpOption` tinyint(1) DEFAULT NULL,
  `bgcolor` char(7) DEFAULT NULL,
  `fgcolor` char(7) DEFAULT NULL,
  `active` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`statusid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblscheduleassignments
-- ----------------------------
DROP TABLE IF EXISTS `tblscheduleassignments`;
CREATE TABLE `tblscheduleassignments` (
  `jobnumber` int(11) NOT NULL AUTO_INCREMENT,
  `date` datetime DEFAULT NULL,
  `timezone` varchar(16) DEFAULT NULL,
  `officeid` int(11) DEFAULT NULL,
  `locationid` int(11) DEFAULT NULL,
  `flagio` tinyint(1) NOT NULL DEFAULT '0',
  `servicegroupid` int(11) DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL,
  `interpreterid` int(11) DEFAULT NULL,
  `statusid` int(11) DEFAULT NULL,
  `billinggroupid` int(11) DEFAULT NULL,
  `paygroupid` int(11) DEFAULT NULL,
  `personalid` int(11) DEFAULT NULL,
  `servicesforid` int(11) DEFAULT NULL,
  `taxrateid` int(11) DEFAULT NULL,
  `taxrate` decimal(8,4) DEFAULT '0.0000',
  `taxable` tinyint(1) DEFAULT '1',
  `languageid` int(11) DEFAULT NULL,
  `fromtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `servicecode` varchar(16) DEFAULT NULL,
  `requestedby` varchar(64) DEFAULT NULL,
  `requestedbyphone` varchar(64) DEFAULT NULL,
  `pagestatus` varchar(64) DEFAULT NULL,
  `ponumber` varchar(64) DEFAULT NULL,
  `requested` tinyint(1) DEFAULT NULL,
  `enteredby` varchar(32) DEFAULT NULL,
  `entereddate` datetime DEFAULT NULL,
  `invoicenumber` int(11) DEFAULT NULL,
  `invoicedate` datetime DEFAULT NULL,
  `notes_interp` longtext,
  `notes_scheduler` longtext,
  `notes_invoice` longtext,
  `closed` tinyint(1) NOT NULL DEFAULT '0',
  `dateclosed` datetime DEFAULT NULL,
  `payrolldate` datetime DEFAULT NULL,
  `lockrates` tinyint(1) NOT NULL DEFAULT '0',
  `interpChanged` tinyint(1) DEFAULT '0',
  `codeflags` varchar(20) DEFAULT '--------------------',
  `address` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `sameloc` tinyint(1) DEFAULT NULL,
  `rateclass` varchar(24) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  PRIMARY KEY (`jobnumber`),
  KEY `idxInterpreter` (`interpreterid`,`fromtime`,`endtime`),
  KEY `idxTSAFromtime` (`fromtime`),
  KEY `idxTSAofficeid` (`officeid`),
  KEY `FK_tblScheduleAssignments_tblBillingGroups` (`billinggroupid`),
  KEY `FK_tblScheduleAssignments_tblClient` (`clientid`),
  KEY `FK_tblScheduleAssignments_tblLocations` (`locationid`),
  KEY `FK_tblScheduleAssignments_tblPayGroups` (`paygroupid`),
  KEY `FK_tblScheduleAssignments_tblPersonalSched` (`personalid`),
  KEY `FK_tblScheduleAssignments_tblServicesFor` (`servicesforid`),
  KEY `FK_tblScheduleAssignments_tblTaxRates` (`taxrateid`),
  CONSTRAINT `FK_tblScheduleAssignments_tblBillingGroups` FOREIGN KEY (`billinggroupid`) REFERENCES `tblbillinggroups` (`billgroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblScheduleAssignments_tblClient` FOREIGN KEY (`clientid`) REFERENCES `tblclient` (`clientid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblScheduleAssignments_tblInterpreters` FOREIGN KEY (`interpreterid`) REFERENCES `tblinterpreters` (`interpreterid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblScheduleAssignments_tblLocations` FOREIGN KEY (`locationid`) REFERENCES `tbllocations` (`locationid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblScheduleAssignments_tblPayGroups` FOREIGN KEY (`paygroupid`) REFERENCES `tblpaygroups` (`paygroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblScheduleAssignments_tblPersonalSched` FOREIGN KEY (`personalid`) REFERENCES `tblpersonalsched` (`personalid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblScheduleAssignments_tblServicesFor` FOREIGN KEY (`servicesforid`) REFERENCES `tblservicesfor` (`servicesforid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_tblScheduleAssignments_tblTaxRates` FOREIGN KEY (`taxrateid`) REFERENCES `tbltaxrates` (`taxrateid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblscheduleassignmentslog
-- ----------------------------
DROP TABLE IF EXISTS `tblscheduleassignmentslog`;
CREATE TABLE `tblscheduleassignmentslog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `jobnumber` int(11) NOT NULL,
  `datestamp` datetime DEFAULT NULL,
  `changedby` varchar(64) DEFAULT NULL,
  `remoteip` varchar(32) DEFAULT NULL,
  `changeaction` varchar(48) DEFAULT NULL,
  `changedetail` varchar(256) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `timezone` varchar(12) DEFAULT NULL,
  `officeid` int(11) DEFAULT NULL,
  `locationid` int(11) DEFAULT NULL,
  `flagio` tinyint(1) DEFAULT NULL,
  `servicegroupid` int(11) DEFAULT NULL,
  `clientid` int(11) DEFAULT NULL,
  `interpreterid` int(11) DEFAULT NULL,
  `statusid` int(11) DEFAULT NULL,
  `billinggroupid` int(11) DEFAULT NULL,
  `paygroupid` int(11) DEFAULT NULL,
  `personalid` int(11) DEFAULT NULL,
  `servicesforid` int(11) DEFAULT NULL,
  `taxrateid` int(11) DEFAULT NULL,
  `taxrate` decimal(8,4) DEFAULT NULL,
  `taxable` tinyint(1) DEFAULT NULL,
  `languageid` int(11) DEFAULT NULL,
  `fromtime` datetime DEFAULT NULL,
  `endtime` datetime DEFAULT NULL,
  `servicecode` varchar(16) DEFAULT NULL,
  `requestedby` varchar(64) DEFAULT NULL,
  `requestedbyphone` varchar(64) DEFAULT NULL,
  `pagestatus` varchar(64) DEFAULT NULL,
  `ponumber` varchar(64) DEFAULT NULL,
  `requested` tinyint(1) DEFAULT NULL,
  `enteredby` varchar(32) DEFAULT NULL,
  `entereddate` datetime DEFAULT NULL,
  `invoicenumber` int(11) DEFAULT NULL,
  `invoicedate` datetime DEFAULT NULL,
  `locationnotes` varchar(64) DEFAULT NULL,
  `servicelocation` longtext,
  `closed` tinyint(1) DEFAULT NULL,
  `interpChanged` tinyint(1) DEFAULT NULL,
  `internalnotes` longtext,
  `address` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(2) DEFAULT NULL,
  `zipcode` varchar(16) DEFAULT NULL,
  `sameloc` tinyint(1) DEFAULT NULL,
  `interpnotes` longtext,
  PRIMARY KEY (`id`),
  KEY `idxJobnumber` (`jobnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblservicecode
-- ----------------------------
DROP TABLE IF EXISTS `tblservicecode`;
CREATE TABLE `tblservicecode` (
  `servicecode` varchar(32) NOT NULL,
  `officeid` int(11) NOT NULL,
  `active` tinyint(1) NOT NULL DEFAULT '1',
  `servicedescription` varchar(64) DEFAULT NULL,
  `servicegroupid` int(11) DEFAULT NULL,
  PRIMARY KEY (`servicecode`,`officeid`),
  KEY `FK_tblServiceCode_tblServiceGroup` (`servicegroupid`),
  CONSTRAINT `FK_tblServiceCode_tblServiceGroup` FOREIGN KEY (`servicegroupid`) REFERENCES `tblservicegroup` (`servicegroupid`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblservicegroup
-- ----------------------------
DROP TABLE IF EXISTS `tblservicegroup`;
CREATE TABLE `tblservicegroup` (
  `servicegroupid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) DEFAULT NULL,
  `servicegroup` varchar(16) DEFAULT NULL,
  `servicedescription` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`servicegroupid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblservicesfor
-- ----------------------------
DROP TABLE IF EXISTS `tblservicesfor`;
CREATE TABLE `tblservicesfor` (
  `servicesforid` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(1) DEFAULT '1',
  `officeid` int(11) DEFAULT NULL,
  `firstname` varchar(64) DEFAULT NULL,
  `lastname` varchar(64) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL,
  `phone` varchar(16) DEFAULT NULL,
  `altphonedesc` varchar(32) DEFAULT NULL,
  `altphone` varchar(16) DEFAULT NULL,
  `preferred` tinyint(1) NOT NULL DEFAULT '0',
  `comments` varchar(1024) DEFAULT NULL,
  `schedcomments` varchar(1024) DEFAULT NULL,
  `email` varchar(128) DEFAULT NULL,
  `warn` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`servicesforid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblsessions
-- ----------------------------
DROP TABLE IF EXISTS `tblsessions`;
CREATE TABLE `tblsessions` (
  `sessid` varchar(32) NOT NULL,
  `userid` int(11) DEFAULT NULL,
  `officeid` int(11) DEFAULT NULL,
  `userlevel` int(11) DEFAULT NULL,
  `lasthit` datetime DEFAULT NULL,
  `startdate` datetime DEFAULT NULL,
  `enddate` datetime DEFAULT NULL,
  `interpreterid` int(11) DEFAULT NULL,
  `clientid` varchar(250) DEFAULT NULL,
  `consumerid` int(11) DEFAULT NULL,
  `pagesize` int(11) DEFAULT NULL,
  `closed` int(11) DEFAULT NULL,
  `sortby` varchar(16) DEFAULT NULL,
  `ioonly` int(11) DEFAULT NULL,
  `dayofweek` varchar(14) DEFAULT NULL,
  `locationid` int(11) DEFAULT NULL,
  `requestedby` varchar(100) DEFAULT NULL,
  `mas90id` varchar(20) DEFAULT NULL,
  `requestedbyphone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`sessid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblshifttimes
-- ----------------------------
DROP TABLE IF EXISTS `tblshifttimes`;
CREATE TABLE `tblshifttimes` (
  `officeid` int(11) DEFAULT NULL,
  `Rate1Start` varchar(12) DEFAULT NULL,
  `Rate2Start` varchar(12) DEFAULT NULL,
  `Rate3Start` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblskillassign
-- ----------------------------
DROP TABLE IF EXISTS `tblskillassign`;
CREATE TABLE `tblskillassign` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `objectid` int(11) NOT NULL,
  `objecttype` varchar(12) NOT NULL,
  `skillid` int(11) NOT NULL,
  `dateissued` datetime DEFAULT NULL,
  `dateexpires` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblskills
-- ----------------------------
DROP TABLE IF EXISTS `tblskills`;
CREATE TABLE `tblskills` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) NOT NULL,
  `skillname` varchar(64) NOT NULL,
  `active` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tbltaxrates
-- ----------------------------
DROP TABLE IF EXISTS `tbltaxrates`;
CREATE TABLE `tbltaxrates` (
  `taxrateid` int(11) NOT NULL AUTO_INCREMENT,
  `officeid` int(11) DEFAULT NULL,
  `taxcode` varchar(8) DEFAULT NULL,
  `taxdesc` varchar(32) DEFAULT NULL,
  `taxrate` decimal(8,4) DEFAULT NULL,
  PRIMARY KEY (`taxrateid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblterms
-- ----------------------------
DROP TABLE IF EXISTS `tblterms`;
CREATE TABLE `tblterms` (
  `termsID` int(11) NOT NULL AUTO_INCREMENT,
  `terms` varchar(32) DEFAULT NULL,
  `termdays` int(11) DEFAULT NULL,
  `default` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`termsID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblusergroups
-- ----------------------------
DROP TABLE IF EXISTS `tblusergroups`;
CREATE TABLE `tblusergroups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `groupname` varchar(50) DEFAULT NULL,
  `sys_admin` tinyint(1) DEFAULT NULL,
  `all_locations` tinyint(1) DEFAULT NULL,
  `all_interps` tinyint(1) DEFAULT NULL,
  `access_ctrl` tinyint(1) DEFAULT NULL,
  `rw_billing` tinyint(1) DEFAULT NULL,
  `rw_pay` tinyint(1) DEFAULT NULL,
  `rw_schedule` tinyint(1) DEFAULT NULL,
  `rw_reports` tinyint(1) DEFAULT NULL,
  `rw_profiles` tinyint(1) DEFAULT NULL,
  `read_only` tinyint(1) DEFAULT NULL,
  `rw_commission` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for tblversions
-- ----------------------------
DROP TABLE IF EXISTS `tblversions`;
CREATE TABLE `tblversions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major` int(11) DEFAULT NULL,
  `minor` int(11) DEFAULT NULL,
  `sub` int(11) DEFAULT NULL,
  `description` varchar(1024) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for temp_mailinglist
-- ----------------------------
DROP TABLE IF EXISTS `temp_mailinglist`;
CREATE TABLE `temp_mailinglist` (
  `clientid` int(11) NOT NULL,
  `clientabbrev` varchar(64) DEFAULT NULL,
  `clientname` varchar(64) DEFAULT NULL,
  `attn` varchar(64) DEFAULT NULL,
  `address1` varchar(128) DEFAULT NULL,
  `address2` varchar(128) DEFAULT NULL,
  `city` varchar(64) DEFAULT NULL,
  `state` varchar(32) DEFAULT NULL,
  `zip` varchar(16) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `sign_in_count` int(11) DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `last_sign_in_ip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `authentication_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `user_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'other',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles` (
  `user_id` int(11) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  KEY `index_users_roles_on_user_id_and_role_id` (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records 
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', null, null, '2013-01-15 01:39:48', '2013-01-15 01:39:48');
INSERT INTO `roles` VALUES ('2', 'client', null, null, '2013-01-15 01:39:48', '2013-01-15 01:39:48');
INSERT INTO `roles` VALUES ('3', 'client_admin', null, null, '2013-01-15 01:39:48', '2013-01-15 01:39:48');
INSERT INTO `schema_migrations` VALUES ('20120813185853');
INSERT INTO `schema_migrations` VALUES ('20120813185900');
INSERT INTO `schema_migrations` VALUES ('20120813185904');
INSERT INTO `schema_migrations` VALUES ('20120916013427');
INSERT INTO `schema_migrations` VALUES ('20121128183011');
INSERT INTO `schema_migrations` VALUES ('20121213192922');
INSERT INTO `users` VALUES ('1', 'admin@c-s-d.org', '$2a$10$unW.wRNSlYdSgD/xwdwAZOCAaNeN7xzsjexUgl0RMgzv.ufEycqL.', null, null, null, '0', null, null, null, null, null, '2013-01-15 01:39:48', '2013-01-15 01:39:48', null, 'other');
INSERT INTO `users` VALUES ('2', 'client@c-s-d.org', '$2a$10$yttUIqvufEW.Ak6FEJwHU.OVMjCzEEvsRZfnsij4JuZmuhwLAoczG', null, null, null, '0', null, null, null, null, null, '2013-01-15 01:39:48', '2013-01-15 01:39:48', null, 'other');
INSERT INTO `users` VALUES ('3', 'raychorn@gmail.com', '$2a$10$tqkm94KPo0cCJGm74/QNQupIl7NJJc4rJFcZz0s2f.6dkUJ8MqVre', null, null, null, '2', '2013-01-15 18:20:27', '2013-01-15 16:10:18', '192.168.1.7', '192.168.1.7', null, '2013-01-15 16:10:18', '2013-01-15 20:53:21', null, 'other');
INSERT INTO `users_roles` VALUES ('1', '1');
INSERT INTO `users_roles` VALUES ('2', '2');
INSERT INTO `users_roles` VALUES ('2', '3');
