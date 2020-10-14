/*
MySQL Data Transfer
Source Host: 127.0.0.1
Source Database: interpreterdb
Target Host: 127.0.0.1
Target Database: interpreterdb
Date: 1/15/2013 2:18:39 PM
*/

SET FOREIGN_KEY_CHECKS=0;
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
INSERT INTO `users` VALUES ('3', 'raychorn@gmail.com', '$2a$10$0sw2y8TBUSL/vLfTY6.SPeKgejwqvC2n.1trt01kthUW832mR5emG', null, null, null, '2', '2013-01-15 18:20:27', '2013-01-15 16:10:18', '192.168.1.7', '192.168.1.7', null, '2013-01-15 16:10:18', '2013-01-15 18:20:27', null, 'other');
INSERT INTO `users_roles` VALUES ('1', '1');
INSERT INTO `users_roles` VALUES ('2', '2');
INSERT INTO `users_roles` VALUES ('2', '3');
