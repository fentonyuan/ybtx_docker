/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.160.101
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : 10.1.160.101:3306
 Source Schema         : radius

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 02/06/2025 14:57:15
*/
use radius;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for nas
-- ----------------------------
DROP TABLE IF EXISTS `nas`;
CREATE TABLE `nas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nasname` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `shortname` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'other',
  `ports` int NULL DEFAULT NULL,
  `secret` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'secret',
  `server` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `community` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'RADIUS Client',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `nasname`(`nasname` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of nas
-- ----------------------------

-- ----------------------------
-- Table structure for radacct
-- ----------------------------
DROP TABLE IF EXISTS `radacct`;
CREATE TABLE `radacct`  (
  `radacctid` bigint NOT NULL AUTO_INCREMENT,
  `acctsessionid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `realm` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
  `nasipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `nasportid` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `nasporttype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `acctstarttime` datetime NULL DEFAULT NULL,
  `acctupdatetime` datetime NULL DEFAULT NULL,
  `acctstoptime` datetime NULL DEFAULT NULL,
  `acctinterval` int NULL DEFAULT NULL,
  `acctsessiontime` int UNSIGNED NULL DEFAULT NULL,
  `acctauthentic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `connectinfo_start` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `connectinfo_stop` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `acctinputoctets` bigint NULL DEFAULT NULL,
  `acctoutputoctets` bigint NULL DEFAULT NULL,
  `calledstationid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `callingstationid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `servicetype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `framedprotocol` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `framedipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `framedipv6address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `framedipv6prefix` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `framedinterfaceid` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `delegatedipv6prefix` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`radacctid`) USING BTREE,
  UNIQUE INDEX `acctuniqueid`(`acctuniqueid` ASC) USING BTREE,
  INDEX `username`(`username` ASC) USING BTREE,
  INDEX `framedipaddress`(`framedipaddress` ASC) USING BTREE,
  INDEX `framedipv6address`(`framedipv6address` ASC) USING BTREE,
  INDEX `framedipv6prefix`(`framedipv6prefix` ASC) USING BTREE,
  INDEX `framedinterfaceid`(`framedinterfaceid` ASC) USING BTREE,
  INDEX `delegatedipv6prefix`(`delegatedipv6prefix` ASC) USING BTREE,
  INDEX `acctsessionid`(`acctsessionid` ASC) USING BTREE,
  INDEX `acctsessiontime`(`acctsessiontime` ASC) USING BTREE,
  INDEX `acctstarttime`(`acctstarttime` ASC) USING BTREE,
  INDEX `acctinterval`(`acctinterval` ASC) USING BTREE,
  INDEX `acctstoptime`(`acctstoptime` ASC) USING BTREE,
  INDEX `nasipaddress`(`nasipaddress` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radacct
-- ----------------------------
INSERT INTO `radacct` VALUES (1, '734d2981-a9a6-4b3b-ac5a-04066fb969fd', '68721f47376ed5f684ba3e854c0ac2c2', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-01 13:22:10', '2025-06-01 13:22:10', '2025-06-01 13:22:10', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (2, '63ab063c-4a15-42d9-a7cc-de669c5343f4', '56769325ddc2ed734ecab141966fcf3d', 'eap', '', '127.0.0.1', '1', '', '2025-06-02 01:46:22', '2025-06-02 01:46:22', '2025-06-02 01:46:22', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (3, '6a2ba882-7d4c-400b-9560-c3e02191f23f', 'c4a031982f7e50bc16ffdeaeb545eba1', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 01:48:26', '2025-06-02 01:48:26', '2025-06-02 01:48:26', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (4, '0de3cf93-fb38-4749-9789-120ddd7653f8', '0194417344e8b56cf2aa6db49b3444ff', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 01:54:34', '2025-06-02 01:54:34', '2025-06-02 01:54:35', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (5, '2a60e658-22d4-4cde-ac5c-396cfdd38d27', 'ff3f055811c43dd142f82f6bb9d67d53', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 01:56:12', '2025-06-02 01:56:12', '2025-06-02 01:56:13', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (6, '7bdc2f87-970d-42b2-8067-5fa4eb71d19c', '9100c871c5009f7ed9ff566dd7c03af1', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 01:59:49', '2025-06-02 01:59:49', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (7, 'a636ab44-acfa-455e-9f61-7a4e023d74cc', 'c5097cfa7f8bf014648228ed2b836052', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 02:05:48', '2025-06-02 02:05:48', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (8, '886dcb4f-7383-49d0-8509-5549907b41ba', 'e70b5e72897de1a985c6ab9fa5832127', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 02:06:59', '2025-06-02 02:06:59', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (9, 'f727adbb-48a6-4467-8057-686265dd0f44', '817851c0f0e1df9651e1ffc2b44aea64', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 02:07:39', '2025-06-02 02:07:40', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (10, '983888df-88e9-4735-96b1-9f46e329ba34', '7074056ff68e483feab861744d7c7108', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 02:08:03', '2025-06-02 02:08:03', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (11, '4bdac550-9ffe-4e61-b884-97852921e729', '9eb09c6a5405965ae5dba91b9e4c7d1a', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 06:31:28', '2025-06-02 06:31:28', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');
INSERT INTO `radacct` VALUES (12, 'fa963436-d735-43d2-ba66-8c67fb47d304', 'cd4932962bea86233afd87e16ce12363', 'edge_01', '', '127.0.0.1', '1', '', '2025-06-02 06:36:43', '2025-06-02 06:36:43', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '');

-- ----------------------------
-- Table structure for radcheck
-- ----------------------------
DROP TABLE IF EXISTS `radcheck`;
CREATE TABLE `radcheck`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '==',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `mac_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`(32) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radcheck
-- ----------------------------
INSERT INTO `radcheck` VALUES (1, 'eap', 'Cleartext-Password', ':=', 'eap', '1111');
INSERT INTO `radcheck` VALUES (2, 'edge01', 'Cleartext-Password', ':=', '123456', '1111');
INSERT INTO `radcheck` VALUES (3, 'edge02', 'Cleartext-Password', ':=', '666666', '1111');

-- ----------------------------
-- Table structure for radgroupcheck
-- ----------------------------
DROP TABLE IF EXISTS `radgroupcheck`;
CREATE TABLE `radgroupcheck`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '==',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `groupname`(`groupname`(32) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radgroupcheck
-- ----------------------------

-- ----------------------------
-- Table structure for radgroupreply
-- ----------------------------
DROP TABLE IF EXISTS `radgroupreply`;
CREATE TABLE `radgroupreply`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `groupname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `groupname`(`groupname`(32) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radgroupreply
-- ----------------------------

-- ----------------------------
-- Table structure for radpostauth
-- ----------------------------
DROP TABLE IF EXISTS `radpostauth`;
CREATE TABLE `radpostauth`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `pass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reply` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `authdate` timestamp(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  `class` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`(32) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radpostauth
-- ----------------------------
INSERT INTO `radpostauth` VALUES (1, 'edge_01', '0x11b14861990240cfa3be9a9fd2aa83d2d0', 'Access-Reject', '2025-06-01 13:20:09.000000', NULL);
INSERT INTO `radpostauth` VALUES (2, 'edge_01', '0x614e0577cbbcae6c5034a0a9eb8cc187af', 'Access-Accept', '2025-06-01 13:22:10.000000', NULL);
INSERT INTO `radpostauth` VALUES (3, 'edge_01', '0xce4213a7aa99c4f244932bc56ce84eade7', 'Access-Reject', '2025-06-02 01:34:16.000000', NULL);
INSERT INTO `radpostauth` VALUES (4, 'edge_01', '0xb0012e9b54006c31507f6932d0453333ca', 'Access-Reject', '2025-06-02 01:43:37.000000', NULL);
INSERT INTO `radpostauth` VALUES (5, 'edge_01', '0xe983e50bda714523c4d25f8f1eea527dcd', 'Access-Reject', '2025-06-02 01:45:22.000000', NULL);
INSERT INTO `radpostauth` VALUES (6, 'eap', '0xde79d132598777e4fd91422ff13c64de3e', 'Access-Accept', '2025-06-02 01:46:22.000000', NULL);
INSERT INTO `radpostauth` VALUES (7, 'edge_01', '0x0186ff34b0d701e49a4ea1d4d54ede4e8c', 'Access-Reject', '2025-06-02 01:46:52.000000', NULL);
INSERT INTO `radpostauth` VALUES (8, 'edge_01', '0xf94b6217f3a45597c47596427a83f40dce', 'Access-Accept', '2025-06-02 01:48:25.000000', NULL);
INSERT INTO `radpostauth` VALUES (9, 'eap', '0x680dd0b1c63a5a0555ddeb4a189b664fd8', 'Access-Accept', '2025-06-02 01:48:46.000000', NULL);
INSERT INTO `radpostauth` VALUES (10, 'edge_01', '0xb1ed1786454e684c358c59ccdef1ce340e', 'Access-Accept', '2025-06-02 01:54:34.000000', NULL);
INSERT INTO `radpostauth` VALUES (11, 'edge_01', '0x0a83afbd675716e90e05a0894bc96378d5', 'Access-Accept', '2025-06-02 01:56:12.000000', NULL);
INSERT INTO `radpostauth` VALUES (12, 'edge_01', '0x57fa00fd75cbb84101dde1f1624ca44c6c', 'Access-Accept', '2025-06-02 01:59:49.000000', NULL);
INSERT INTO `radpostauth` VALUES (13, 'edge_01', '0x38a990115055808541ed097abdf0d8f0fe', 'Access-Accept', '2025-06-02 02:05:48.000000', NULL);
INSERT INTO `radpostauth` VALUES (14, 'edge_01', '0xbeeec6d7c9474fdbcca3071d9f197a8da4', 'Access-Accept', '2025-06-02 02:06:59.000000', NULL);
INSERT INTO `radpostauth` VALUES (15, 'edge_01', '0x2e5c6565790424a2cf2a4c15cbb5a72ac0', 'Access-Accept', '2025-06-02 02:07:39.000000', NULL);
INSERT INTO `radpostauth` VALUES (16, 'edge_01', '0xbbc34b4951522b1dfb038e81e5cf8310ad', 'Access-Accept', '2025-06-02 02:08:03.000000', NULL);
INSERT INTO `radpostauth` VALUES (17, 'eap', '0x0c18b5ddd2b91aaa313c625f3d16d42683', 'Access-Accept', '2025-06-02 02:28:50.000000', NULL);
INSERT INTO `radpostauth` VALUES (18, 'eap', '0xe4904c06dfc4de35599a27f826503d8be2', 'Access-Accept', '2025-06-02 02:41:59.000000', NULL);
INSERT INTO `radpostauth` VALUES (19, 'eap', '0xde79d132598777e4fd91422ff13c64de3e', 'Access-Accept', '2025-06-02 02:42:50.000000', NULL);
INSERT INTO `radpostauth` VALUES (20, 'eap', '0x05b4de111375bd64e933044927176b2b36', 'Access-Accept', '2025-06-02 02:46:00.000000', NULL);
INSERT INTO `radpostauth` VALUES (21, 'eap', '0x080fd2199e3acc3971912ef7c8045de98a', 'Access-Reject', '2025-06-02 02:58:05.000000', NULL);
INSERT INTO `radpostauth` VALUES (22, 'eap', '0xa73ec29533600800cb3472ee2b452c2d58', 'Access-Accept', '2025-06-02 02:58:25.000000', NULL);
INSERT INTO `radpostauth` VALUES (23, 'edge_01', '0xa75f455f0e213995142136c497ae0673f7', 'Access-Accept', '2025-06-02 06:31:28.000000', NULL);
INSERT INTO `radpostauth` VALUES (24, 'edge_01', '0x90d7d102c18f4fb186075809288c2aee79', 'Access-Accept', '2025-06-02 06:36:43.000000', NULL);

-- ----------------------------
-- Table structure for radreply
-- ----------------------------
DROP TABLE IF EXISTS `radreply`;
CREATE TABLE `radreply`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `attribute` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `op` char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '=',
  `value` varchar(253) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`(32) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radreply
-- ----------------------------

-- ----------------------------
-- Table structure for radusergroup
-- ----------------------------
DROP TABLE IF EXISTS `radusergroup`;
CREATE TABLE `radusergroup`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `groupname` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `priority` int NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`(32) ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radusergroup
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
