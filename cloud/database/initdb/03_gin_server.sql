/*
 Navicat Premium Data Transfer

 Source Server         : 10.1.160.101
 Source Server Type    : MySQL
 Source Server Version : 80039
 Source Host           : 10.1.160.101:3306
 Source Schema         : gin_server

 Target Server Type    : MySQL
 Target Server Version : 80039
 File Encoding         : 65001

 Date: 23/06/2025 14:41:04
*/

use gin_server;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for certs
-- ----------------------------
DROP TABLE IF EXISTS `certs`;
CREATE TABLE `certs`  (
                          `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                          `created_at` datetime(3) NULL DEFAULT NULL,
                          `updated_at` datetime(3) NULL DEFAULT NULL,
                          `deleted_at` datetime(3) NULL DEFAULT NULL,
                          `entity_type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `entity_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `cert_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `key_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `upload_time` datetime(3) NOT NULL,
                          PRIMARY KEY (`id`) USING BTREE,
                          INDEX `idx_certs_deleted_at`(`deleted_at` ASC) USING BTREE,
                          INDEX `idx_entity`(`entity_type` ASC, `entity_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_execution_results
-- ----------------------------
DROP TABLE IF EXISTS `config_execution_results`;
CREATE TABLE `config_execution_results`  (
                                             `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                             `execution_id` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                             `config_file_id` int UNSIGNED NOT NULL,
                                             `timestamp` datetime NOT NULL,
                                             `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                             `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                             `detail_json` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                             `created_at` datetime NULL DEFAULT NULL,
                                             `updated_at` datetime NULL DEFAULT NULL,
                                             PRIMARY KEY (`id`) USING BTREE,
                                             INDEX `idx_execution_id`(`execution_id` ASC) USING BTREE,
                                             INDEX `idx_config_file_id`(`config_file_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for config_files
-- ----------------------------
DROP TABLE IF EXISTS `config_files`;
CREATE TABLE `config_files`  (
                                 `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `filename` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `file_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                 `content` longblob NULL,
                                 `status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'pending',
                                 `fetch_time` datetime(3) NULL DEFAULT NULL,
                                 `process_time` datetime(3) NULL DEFAULT NULL,
                                 `result` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                 `created_at` datetime(3) NULL DEFAULT NULL,
                                 `updated_at` datetime(3) NULL DEFAULT NULL,
                                 `deleted_at` datetime(3) NULL DEFAULT NULL,
                                 `remote_path` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
                                 `approval_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'none',
                                 `approval_time` datetime(3) NULL DEFAULT NULL,
                                 `approval_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
                                 `approval_comment` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
                                 `requested_by` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'system',
                                 `request_time` datetime(3) NULL DEFAULT NULL,
                                 PRIMARY KEY (`id`) USING BTREE,
                                 UNIQUE INDEX `idx_config_files_filename`(`filename` ASC) USING BTREE,
                                 INDEX `idx_status`(`status` ASC) USING BTREE,
                                 INDEX `idx_deleted_at`(`deleted_at` ASC) USING BTREE,
                                 INDEX `idx_config_files_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for device_logs
-- ----------------------------
DROP TABLE IF EXISTS `device_logs`;
CREATE TABLE `device_logs`  (
                                `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                                `created_at` datetime(3) NULL DEFAULT NULL,
                                `updated_at` datetime(3) NULL DEFAULT NULL,
                                `deleted_at` datetime(3) NULL DEFAULT NULL,
                                `device_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `report_time` datetime(3) NOT NULL,
                                `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                                `file_size` bigint NULL DEFAULT 0,
                                `processed_at` datetime(3) NULL DEFAULT NULL,
                                PRIMARY KEY (`id`) USING BTREE,
                                INDEX `idx_device_logs_deleted_at`(`deleted_at` ASC) USING BTREE,
                                INDEX `idx_device_logs_device_id`(`device_id` ASC) USING BTREE,
                                INDEX `idx_device_logs_report_time`(`report_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1015 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for devices
-- ----------------------------
DROP TABLE IF EXISTS `devices`;
CREATE TABLE `devices`  (
                            `device_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `created_at` datetime(3) NULL DEFAULT NULL,
                            `updated_at` datetime(3) NULL DEFAULT NULL,
                            `deleted_at` datetime(3) NULL DEFAULT NULL,
                            `device_name` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `device_type` bigint NOT NULL,
                            `pass_wd` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                            `superior_device_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `peak_cpu_usage` bigint NULL DEFAULT 0,
                            `peak_memory_usage` bigint NULL DEFAULT 0,
                            `online_duration` bigint NULL DEFAULT 0,
                            `cert_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `key_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `register_ip` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `hardware_fingerprint` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `anonymous_user` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `long_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `short_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `ses_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `auth_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'normal',
                            `login_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'offline',
                            `gateway_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                            `is_ready` tinyint(1) NOT NULL DEFAULT 0,
                            PRIMARY KEY (`device_id`) USING BTREE,
                            INDEX `idx_devices_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for events
-- ----------------------------
DROP TABLE IF EXISTS `events`;
CREATE TABLE `events`  (
                           `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                           `created_at` datetime(3) NULL DEFAULT NULL,
                           `updated_at` datetime(3) NULL DEFAULT NULL,
                           `deleted_at` datetime(3) NULL DEFAULT NULL,
                           `event_id` bigint NULL DEFAULT NULL,
                           `device_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                           `event_time` datetime(3) NULL DEFAULT NULL,
                           `event_type` bigint NULL DEFAULT NULL,
                           `event_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                           `event_desc` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                           PRIMARY KEY (`id`) USING BTREE,
                           UNIQUE INDEX `idx_events_event_id`(`event_id` ASC) USING BTREE,
                           INDEX `idx_events_deleted_at`(`deleted_at` ASC) USING BTREE,
                           INDEX `idx_events_device_id`(`device_id` ASC) USING BTREE,
                           INDEX `idx_events_event_time`(`event_time` ASC) USING BTREE,
                           INDEX `idx_events_event_type`(`event_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for last_process_timestamps
-- ----------------------------
DROP TABLE IF EXISTS `last_process_timestamps`;
CREATE TABLE `last_process_timestamps`  (
                                            `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                                            `key` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                            `timestamp` datetime(3) NULL DEFAULT NULL,
                                            `updated_at` datetime(3) NULL DEFAULT NULL,
                                            PRIMARY KEY (`id`) USING BTREE,
                                            UNIQUE INDEX `idx_last_process_timestamps_key`(`key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for log_files
-- ----------------------------
DROP TABLE IF EXISTS `log_files`;
CREATE TABLE `log_files`  (
                              `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                              `created_at` datetime(3) NULL DEFAULT NULL,
                              `updated_at` datetime(3) NULL DEFAULT NULL,
                              `deleted_at` datetime(3) NULL DEFAULT NULL,
                              `file_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                              `file_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                              `file_size` bigint NOT NULL,
                              `start_time` datetime(3) NULL DEFAULT NULL,
                              `end_time` datetime(3) NULL DEFAULT NULL,
                              `is_encrypted` tinyint(1) NULL DEFAULT 0,
                              `is_uploaded` tinyint(1) NULL DEFAULT 0,
                              `remote_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '',
                              `uploaded_time` datetime(3) NULL DEFAULT NULL,
                              PRIMARY KEY (`id`) USING BTREE,
                              UNIQUE INDEX `idx_log_files_file_name`(`file_name` ASC) USING BTREE,
                              INDEX `idx_log_files_start_time`(`start_time` ASC) USING BTREE,
                              INDEX `idx_log_files_end_time`(`end_time` ASC) USING BTREE,
                              INDEX `idx_log_files_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 501 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_events
-- ----------------------------
DROP TABLE IF EXISTS `login_events`;
CREATE TABLE `login_events`  (
                                 `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                 `entity_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实体类型(user或gateway)',
                                 `entity_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实体ID(用户ID或设备ID)',
                                 `gateway_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联的网关ID',
                                 `operation_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型(online或offline)',
                                 `operation_time` datetime NOT NULL COMMENT '操作发生时间',
                                 `login_result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'success' COMMENT '登录结果(success或failed)',
                                 `created_at` datetime NOT NULL,
                                 `updated_at` datetime NOT NULL,
                                 PRIMARY KEY (`id`) USING BTREE,
                                 INDEX `idx_entity_type`(`entity_type` ASC) USING BTREE,
                                 INDEX `idx_entity_id`(`entity_id` ASC) USING BTREE,
                                 INDEX `idx_gateway_id`(`gateway_id` ASC) USING BTREE,
                                 INDEX `idx_operation_type`(`operation_type` ASC) USING BTREE,
                                 INDEX `idx_operation_time`(`operation_time` ASC) USING BTREE,
                                 INDEX `idx_login_result`(`login_result` ASC) USING BTREE,
                                 INDEX `idx_entity_id_operation_time`(`entity_id` ASC, `operation_time` ASC) USING BTREE,
                                 INDEX `idx_gateway_id_operation_time`(`gateway_id` ASC, `operation_time` ASC) USING BTREE,
                                 INDEX `idx_entity_type_operation_type`(`entity_type` ASC, `operation_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录事件记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for login_events_backup
-- ----------------------------
DROP TABLE IF EXISTS `login_events_backup`;
CREATE TABLE `login_events_backup`  (
                                        `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                        `entity_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实体类型(user或gateway)',
                                        `entity_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '实体ID(用户ID或设备ID)',
                                        `gateway_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '关联的网关ID',
                                        `operation_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '操作类型(online或offline)',
                                        `operation_time` datetime NOT NULL COMMENT '操作发生时间',
                                        `login_result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT 'success' COMMENT '登录结果(success或failed)',
                                        `created_at` datetime NOT NULL,
                                        `updated_at` datetime NOT NULL,
                                        PRIMARY KEY (`id`) USING BTREE,
                                        INDEX `idx_entity_type`(`entity_type` ASC) USING BTREE,
                                        INDEX `idx_entity_id`(`entity_id` ASC) USING BTREE,
                                        INDEX `idx_gateway_id`(`gateway_id` ASC) USING BTREE,
                                        INDEX `idx_operation_type`(`operation_type` ASC) USING BTREE,
                                        INDEX `idx_operation_time`(`operation_time` ASC) USING BTREE,
                                        INDEX `idx_login_result`(`login_result` ASC) USING BTREE,
                                        INDEX `idx_entity_id_operation_time`(`entity_id` ASC, `operation_time` ASC) USING BTREE,
                                        INDEX `idx_gateway_id_operation_time`(`gateway_id` ASC, `operation_time` ASC) USING BTREE,
                                        INDEX `idx_entity_type_operation_type`(`entity_type` ASC, `operation_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '登录事件记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for operation_events
-- ----------------------------
DROP TABLE IF EXISTS `operation_events`;
CREATE TABLE `operation_events`  (
                                     `id` bigint UNSIGNED NOT NULL AUTO_INCREMENT,
                                     `entity_type` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `entity_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `superior_device_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                                     `event_code` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                     `operation_time` datetime(3) NOT NULL,
                                     `login_result` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'success',
                                     `created_at` datetime(3) NULL DEFAULT NULL,
                                     `updated_at` datetime(3) NULL DEFAULT NULL,
                                     PRIMARY KEY (`id`) USING BTREE,
                                     INDEX `idx_operation_events_superior_device_id`(`superior_device_id` ASC) USING BTREE,
                                     INDEX `idx_operation_events_event_code`(`event_code` ASC) USING BTREE,
                                     INDEX `idx_operation_events_operation_time`(`operation_time` ASC) USING BTREE,
                                     INDEX `idx_operation_events_login_result`(`login_result` ASC) USING BTREE,
                                     INDEX `idx_operation_events_entity_type`(`entity_type` ASC) USING BTREE,
                                     INDEX `idx_operation_events_entity_id`(`entity_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_behaviors
-- ----------------------------
DROP TABLE IF EXISTS `user_behaviors`;
CREATE TABLE `user_behaviors`  (
                                   `behavior_id` bigint NOT NULL AUTO_INCREMENT,
                                   `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                                   `behavior_time` datetime(3) NOT NULL,
                                   `behavior_type` bigint NOT NULL,
                                   `data_type` bigint NOT NULL,
                                   `data_size` bigint NOT NULL,
                                   `gateway_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                                   `created_at` datetime(3) NULL DEFAULT NULL,
                                   `updated_at` datetime(3) NULL DEFAULT NULL,
                                   `deleted_at` datetime(3) NULL DEFAULT NULL,
                                   PRIMARY KEY (`behavior_id`) USING BTREE,
                                   INDEX `idx_user_behaviors_user_id`(`user_id` ASC) USING BTREE,
                                   INDEX `idx_user_behaviors_behavior_time`(`behavior_time` ASC) USING BTREE,
                                   INDEX `idx_user_behaviors_behavior_type`(`behavior_type` ASC) USING BTREE,
                                   INDEX `idx_user_behaviors_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_connect_list
-- ----------------------------
DROP TABLE IF EXISTS `user_connect_list`;
CREATE TABLE `user_connect_list`  (
                                      `id` int UNSIGNED NOT NULL AUTO_INCREMENT,
                                      `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      `connect_user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
                                      PRIMARY KEY (`id`) USING BTREE,
                                      INDEX `idx_user_id`(`user_id` ASC) USING BTREE,
                                      INDEX `idx_user_connect_list_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
                          `user_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `created_at` datetime(3) NULL DEFAULT NULL,
                          `updated_at` datetime(3) NULL DEFAULT NULL,
                          `deleted_at` datetime(3) NULL DEFAULT NULL,
                          `user_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `pass_wd` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `user_type` bigint NOT NULL,
                          `gateway_device_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
                          `online_duration` bigint NULL DEFAULT 0,
                          `cert_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `key_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `email` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `permission_mask` char(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `last_login_time_stamp` datetime(3) NULL DEFAULT NULL,
                          `off_line_time_stamp` datetime(3) NULL DEFAULT NULL,
                          `login_ip` char(24) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `illegal_login_times` bigint NULL DEFAULT NULL,
                          `auth_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'normal',
                          `login_status` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'offline',
                          `user_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          `mac_address` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
                          PRIMARY KEY (`user_id`) USING BTREE,
                          INDEX `idx_users_deleted_at`(`deleted_at` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
