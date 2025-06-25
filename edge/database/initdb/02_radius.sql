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

 Date: 01/06/2025 22:18:04
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 160 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
                             UNIQUE INDEX `username_2`(`username` ASC) USING BTREE,
                             UNIQUE INDEX `username_3`(`username` ASC) USING BTREE,
                             INDEX `username`(`username`(32) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 389 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 188 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;