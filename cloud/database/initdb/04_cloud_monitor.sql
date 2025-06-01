/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80041
 Source Host           : localhost:3307
 Source Schema         : cloud_monitor

 Target Server Type    : MySQL
 Target Server Version : 80041
 File Encoding         : 65001

 Date: 01/06/2025 20:03:33
*/

use cloud-monitor;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for device_login_status
-- ----------------------------
DROP TABLE IF EXISTS `device_login_status`;
CREATE TABLE `device_login_status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `loginStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `onlineDuration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `updateTime` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_login_status
-- ----------------------------

-- ----------------------------
-- Table structure for device_runtime_status
-- ----------------------------
DROP TABLE IF EXISTS `device_runtime_status`;
CREATE TABLE `device_runtime_status`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `device_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `cpu_usage` float NULL DEFAULT NULL,
  `memory_usage` float NULL DEFAULT NULL,
  `upload_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of device_runtime_status
-- ----------------------------

-- ----------------------------
-- Table structure for gateway
-- ----------------------------
DROP TABLE IF EXISTS `gateway`;
CREATE TABLE `gateway`  (
  `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `authStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gateway
-- ----------------------------

-- ----------------------------
-- Table structure for user_operation
-- ----------------------------
DROP TABLE IF EXISTS `user_operation`;
CREATE TABLE `user_operation`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `behavior_type` int NULL DEFAULT NULL,
  `data_type` int NULL DEFAULT NULL,
  `data_size` double NULL DEFAULT NULL,
  `gateway_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `behavior_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1400 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_operation
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;
