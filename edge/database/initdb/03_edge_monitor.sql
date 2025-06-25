/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : edge_monitor

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 02/06/2025 18:00:28
*/

use edge_monitor;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
                                          `uploaded` tinyint(1) NULL DEFAULT NULL,
                                          PRIMARY KEY (`id`) USING BTREE,
                                          UNIQUE INDEX `idx_device_time`(`device_id` ASC, `upload_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7623 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for event
-- ----------------------------
DROP TABLE IF EXISTS `event`;
CREATE TABLE `event`  (
                          `id` int NOT NULL AUTO_INCREMENT,
                          `entity_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户id/设备id',
                          `entity_type` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户/设备',
                          `event_time` datetime NULL DEFAULT NULL,
                          `event_code` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '事件类型',
                          `event_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                          `superior_device_id` varbinary(255) NULL DEFAULT NULL,
                          `uploaded` tinyint(1) NULL DEFAULT 0,
                          `auth_method` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                          PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 223 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for gateway
-- ----------------------------
DROP TABLE IF EXISTS `gateway`;
CREATE TABLE `gateway`  (
                            `id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                            `authStatus` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                            PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Table structure for user_login_status
-- ----------------------------
DROP TABLE IF EXISTS `user_login_status`;
CREATE TABLE `user_login_status`  (
                                      `id` int NOT NULL AUTO_INCREMENT,
                                      `user_id` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
                                      `user_login_status` int NULL DEFAULT NULL,
                                      `user_auth_status` int NULL DEFAULT NULL,
                                      `user_online_duration` int NULL DEFAULT NULL,
                                      `user_upload_time` datetime NULL DEFAULT NULL,
                                      PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134587 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

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
                                   `uploaded` tinyint(1) NULL DEFAULT NULL,
                                   PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1783 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

SET FOREIGN_KEY_CHECKS = 1;
