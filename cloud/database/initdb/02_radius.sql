/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80041
 Source Host           : localhost:3307
 Source Schema         : radius

 Target Server Type    : MySQL
 Target Server Version : 80041
 File Encoding         : 65001

 Date: 01/06/2025 20:03:22
*/

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
  `acctsessionid` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `acctuniqueid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `realm` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '',
  `nasipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `nasportid` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nasporttype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `acctstarttime` datetime NULL DEFAULT NULL,
  `acctupdatetime` datetime NULL DEFAULT NULL,
  `acctstoptime` datetime NULL DEFAULT NULL,
  `acctinterval` int NULL DEFAULT NULL,
  `acctsessiontime` int UNSIGNED NULL DEFAULT NULL,
  `acctauthentic` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `connectinfo_start` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `connectinfo_stop` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `acctinputoctets` bigint NULL DEFAULT NULL,
  `acctoutputoctets` bigint NULL DEFAULT NULL,
  `calledstationid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `callingstationid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `acctterminatecause` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `servicetype` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `framedprotocol` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `framedipaddress` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `framedipv6address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `framedipv6prefix` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `framedinterfaceid` varchar(44) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `delegatedipv6prefix` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '',
  `class` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
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
  INDEX `nasipaddress`(`nasipaddress` ASC) USING BTREE,
  INDEX `class`(`class` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 91 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of radacct
-- ----------------------------
INSERT INTO `radacct` VALUES (1, '47c3939f-ae8c-4777-b2ff-e98773990ce2', 'c1c8d7ee1d39c2b67305835cb958cbdd', 'test', '', '127.0.0.1', '1', '', '2025-05-05 14:29:53', '2025-05-05 14:29:53', '2025-05-15 22:40:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (15, '41948b27-f93c-4552-b5a4-3db1cd60d84d', '1638d0f06764bd378f4b288e7bf52266', 'user2', '', '127.0.0.1', '1', '', '2025-05-05 17:19:08', '2025-05-05 17:19:08', '2025-05-15 22:40:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (16, 'a55aa1a8-d9e1-4724-9248-fcc12c021ecd', '0f152bcc912d09f68116177cc31bc376', 'user1', '', '127.0.0.1', '1', '', '2025-05-12 11:12:48', '2025-05-12 11:12:48', '2025-05-15 22:40:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (17, 'a5e0fa8c-318a-403f-9340-0a8c77e618a3', '4208fd284015fb36e13c5223720f99fa', 'user1', '', '127.0.0.1', '1', '', '2025-05-12 11:24:57', '2025-05-12 11:24:57', '2025-05-15 22:40:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (18, '8e390842-2215-498b-a291-4df2d325f066', '2589e1219c3b1ecfb0a540583d146372', 'user1', '', '127.0.0.1', '1', '', '2025-05-12 11:29:43', '2025-05-12 11:29:43', '2025-05-15 22:40:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (19, '525398f3-af08-4926-83bb-69f0671907c7', 'eb4453c05c3d854b4b028fe6b6b88d5a', 'user1', '', '127.0.0.1', '1', '', '2025-05-12 11:34:15', '2025-05-12 11:34:15', '2025-05-15 22:40:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (20, '6c0147ac-8c29-4bcd-9738-926492e82553', 'e2c282dbb45a81ba6bdc91de7951a8de', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:32:08', '2025-05-15 20:32:08', '2025-05-15 22:40:02', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (21, 'e1b7523d-ad8e-432e-8137-056572d736e1', '707adc1033ecd5fb0d136907984e8d95', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:34:41', '2025-05-15 20:34:41', '2025-05-15 22:40:02', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (22, '340c8f02-ef1d-4c3c-b4cc-e1bc298b179f', 'd98f63d4d30e19edc0404e79c8397558', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:37:24', '2025-05-15 20:37:24', '2025-05-15 20:37:24', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (23, '14d6414e-54e1-4c5b-a849-e4abc9a6b3ad', '443ec206f19f8b7f6ad9385c01383997', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:38:59', '2025-05-15 20:38:59', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (24, '44548f0a-d55d-4d13-b6cf-bb9f55f89c92', '4d767044e08ab10092794a7ad69dff5f', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:46:24', '2025-05-15 20:46:24', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (25, '9ce6d6db-5c8d-4db0-91a3-51c609fe1fe8', '7c3fb0f3718f00524d67472c6f0e54c2', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:48:45', '2025-05-15 20:48:45', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (26, '4ab5ce56-cc52-4de3-99e4-e862afc40203', '76171728b9349aebef431847cda18c4c', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:49:49', '2025-05-15 20:49:49', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (27, '45b1badd-1c5e-48fb-aafc-7d1b965f79c8', '224330ef1aa3ef28640f23653c43a311', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:52:06', '2025-05-15 20:52:06', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (28, '40ca911e-ac8b-4bf9-8209-786dfcbcf4e7', '478adba90c3d0e0183e463471075b612', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 20:55:11', '2025-05-15 20:55:11', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (29, '4b34bb09-211b-4604-98d7-6b473fcd1693', '5ac18dbb20648524056055fc87e612a1', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 21:07:08', '2025-05-15 21:07:08', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (30, 'a248aacd-ea98-4846-bf65-866491184cb1', '545b8c2dde6bfd6e5139525a711df728', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 21:07:54', '2025-05-15 21:07:54', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (31, '11e52bba-d951-4fee-a7a5-c256d3f73f09', 'f7718901c9feb06e2236ff47a00d7ffc', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 21:25:24', '2025-05-15 21:25:24', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (32, '7db81655-a9a0-47e8-b715-370d505cbc9a', '15a4bef66dac425532e055270be25588', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 21:27:42', '2025-05-15 21:27:42', '2025-05-15 21:30:11', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (33, '0d3ebc63-1833-4b03-84a7-89ffb62ef108', '6b403d1c2d3d1d6648fea2bc2cc6dbe9', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 21:30:28', '2025-05-15 21:30:28', '2025-05-15 21:32:00', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (34, '41e0000d-387c-4c74-aa61-90627eec68c4', '41da5fb9a8a7b1dc60ba2efa6fdf6257', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 22:11:13', '2025-05-15 22:11:13', '2025-05-15 22:12:45', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (35, '3cd17bd0-1070-4262-86d7-3ceb0eac4b4c', '75606e096813ed8f128e831cec92a619', 'user1', '', '127.0.0.1', '1', '', '2025-05-15 22:17:05', '2025-05-15 22:17:41', '2025-05-15 22:33:34', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (36, '6305affa-e24f-41d6-90b3-21a18e5b0c0e', 'b4039de31e43e8047c7997e61792e80c', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 10:38:00', '2025-05-16 10:38:00', '2025-05-16 10:40:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (37, 'e3fbcaf6-dae1-46da-bb60-fd78d0fa987a', 'd56a5a5f05d280ba762dbdee08becbeb', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 10:43:06', '2025-05-16 10:43:06', '2025-05-16 10:46:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (38, '887dcfe4-47d6-4f61-a05c-00d3873c5906', 'bbf79289bf2762c695c4a79c411961cd', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 10:46:21', '2025-05-16 10:46:21', '2025-05-16 10:46:34', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (39, 'ecd81c8b-b4c7-4e35-b21f-e22f0bafc6d4', '751d901573f913b2b7438ddb93b68f8d', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 10:51:15', '2025-05-16 10:51:15', '2025-05-16 10:51:29', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (40, 'de34a9e9-2612-40d1-aaaf-b74b8387a46a', '306cc80fe5ee53f45e5b1a28315b613a', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 10:54:52', '2025-05-16 10:54:52', '2025-05-16 10:54:55', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (41, '42e7e357-c9c0-46e0-8616-b068c04bf961', '001f6298094d265e445c7cd0575f3428', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:02:27', '2025-05-16 11:02:27', '2025-05-16 11:05:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (42, '144bfd92-40ad-46f1-a115-057895b98fd8', '9b08409a2bc0e070bbfcbd63fea1643e', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:05:18', '2025-05-16 11:05:18', '2025-05-16 11:08:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (43, '3daa923d-a720-4466-a1e5-cf22618466db', '825ac90ab689795168f52adcf18e0772', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:08:31', '2025-05-16 11:08:31', '2025-05-16 11:11:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (44, '213bafd9-d664-4607-a47d-68f5fb161513', '1027f97d44404534d1b8a24f57df7e9d', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:16:37', '2025-05-16 11:16:37', '2025-05-16 11:17:40', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (45, 'fad0b049-9a95-4955-85f9-e0e014203504', '0ec0b4dc695113daea7e5dfee529a1ea', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:17:51', '2025-05-16 11:20:23', '2025-05-16 11:23:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (46, '84f955f5-ce61-46b9-be5f-73241a92bd50', '702d58ea6aa9f6f400537bc759b1e7f0', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:20:43', '2025-05-16 11:21:23', '2025-05-16 11:24:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (47, '6e3a8c5e-f82f-4649-9cab-5302cbd60270', '560559367a13adb3c7c7815176623f60', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:23:26', '2025-05-16 11:23:40', '2025-05-16 11:26:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (48, 'f981b228-0cbb-4fe5-a50f-6570b922cc4e', '0ccbc35e6b21c0e6d829155e51705339', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:27:22', '2025-05-16 11:27:23', '2025-05-16 11:30:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (49, '751ed598-1aa5-469a-8e5c-d7b5b4010f4e', 'ad9efbc33444267d1b7c94e186f627cf', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 11:28:04', '2025-05-16 11:28:06', '2025-05-16 11:31:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (50, '6d408d45-67a3-4b3e-bf1e-4a6d630c1dab', '6618003b62f4834ce8fb30c53fc70418', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 14:12:16', '2025-05-16 14:12:16', '2025-05-16 14:12:18', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (51, '388aa394-8e54-4819-9ab1-219d512b8900', '76702e67ed08874f5edca739d227c553', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 14:18:42', '2025-05-16 14:18:44', '2025-05-16 14:21:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (52, '80928250-6fff-49dc-8140-2129051c2112', 'e5e90e4a3327d254a1fbfcfe1635ea7a', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 14:28:14', '2025-05-16 14:28:28', '2025-05-16 14:31:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (53, '82364d27-42ff-4e5d-8298-26bcac02bfe0', '45064b0cd6268fe7a9dad88f70968a62', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 14:34:19', '2025-05-16 14:44:10', '2025-05-16 14:45:23', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (54, 'ffe14b94-3f61-47b3-8e14-829eefe517d6', 'dd6f41d005ec86c3ac39c6c01bf24040', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 14:57:14', '2025-05-16 14:57:14', '2025-05-16 14:57:40', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (55, '931b3387-2bb8-41c1-9135-16cd21b8b807', 'e7728d35df3f5a6a6ccb5ef3ef822a09', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 14:59:11', '2025-05-16 14:59:11', '2025-05-16 14:59:38', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (56, '7e22c5d1-255b-46ff-8e50-b1040cee3ddf', '00306f09de13e4b6e90e56bdef96e0aa', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:02:44', '2025-05-16 15:02:44', '2025-05-16 15:02:58', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (57, '1b76de05-6201-40aa-86d6-dcd8862fcc68', 'e5d81430c0e79ca322a925bbdda27fc6', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:05:11', '2025-05-16 15:05:11', '2025-05-16 15:05:14', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (58, 'ee676f92-b5a9-46c5-bb76-5b3c8d2e8ecd', '5b32e2437a622d1801045ed74527acb0', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:08:13', '2025-05-16 15:08:13', '2025-05-16 15:08:15', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (59, '4e210334-a2e4-4d21-b8b7-2a0491d9b495', '9f806668675377f446f10d52d6097c26', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:08:16', '2025-05-16 15:08:16', '2025-05-16 15:08:18', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (60, '9d08d3eb-d467-4da9-a6d8-48b862debf9f', 'cbf36b4cf7f61177e940deac256edd18', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:10:21', '2025-05-16 15:10:22', '2025-05-16 15:10:46', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (61, '30476414-6b77-47cf-9a7a-0c658e4defa5', '504eee05483e9002fcf3b3e8c03e8a86', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:11:35', '2025-05-16 15:11:36', '2025-05-16 15:12:47', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (62, '7d587a8b-aca8-4118-964e-a6336936d516', '35fc734190d4ac66abf2d807327f9b46', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:12:57', '2025-05-16 15:12:58', '2025-05-16 15:13:10', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (63, 'b21379b9-b82a-42bc-945e-c2bc670c43f8', '12fb9b3a647afdcaa790f10e38e83360', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:17:20', '2025-05-16 15:18:10', '2025-05-16 15:21:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (64, '24a20d06-58ef-4fad-987a-5b7f84bc5d95', 'c8c9a187677bef4fb38e888aabd10535', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:26:44', '2025-05-16 15:26:44', '2025-05-16 15:29:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (65, '46f311ab-310d-476f-bb2c-44c5c268b5f1', '8c20c673033855a5da97ffdd8aaec304', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:29:06', '2025-05-16 15:29:06', '2025-05-16 15:32:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (66, 'edaffda4-6b93-4c8a-aceb-d47a6214e3ee', 'e1023713b5900cb3a71d9b45e8adef6c', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 15:29:38', '2025-05-16 15:35:17', '2025-05-16 15:41:43', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (67, 'a669ff3d-23ec-449c-bec8-d44c3a343fad', '762999c16e86b92ee33e4ecf448caa0e', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 19:01:04', '2025-05-16 19:01:18', '2025-05-16 19:04:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (68, 'b9260776-a09c-4f46-ab2b-804b21dd9942', '71535f88894b862c64e340cc5a74dd4c', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 19:02:39', '2025-05-16 19:02:52', '2025-05-16 19:05:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (69, '8bac54c2-777f-4fc2-bb05-e669ad0226e7', 'ca955ed1b66a0a2f309abd42ecab5945', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 19:03:14', '2025-05-16 19:03:27', '2025-05-16 19:06:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (70, '766e2c97-19fe-4a4e-a743-a29ccc2f11ef', '73175764ffc7305973a9da98c1230fa9', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 19:04:53', '2025-05-16 19:05:06', '2025-05-16 19:08:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (71, 'b516f193-d7f3-475c-9af8-81c5dca014ee', 'fc2c42791256e8576cb9bbe604ab3551', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 20:02:22', '2025-05-16 20:02:46', '2025-05-16 20:05:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (72, 'c4e920b7-412b-46e1-a7e7-0c380037ecf8', 'b1b971300462abceb6b95a0710d38488', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 20:13:40', '2025-05-16 20:14:28', '2025-05-16 20:17:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (73, '10a3c3ac-21a2-4ea0-b9dc-2fb3dd326b5b', 'eaad06e525216b33c211094cc437b82a', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 20:30:05', '2025-05-16 20:30:16', '2025-05-16 20:33:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (74, 'c96cc06d-b9ae-44a9-b8e9-8e4f7d692f97', 'c7706034e16e09d2193251e95abea395', 'user1', '', '127.0.0.1', '1', '', '2025-05-16 20:30:55', '2025-05-16 20:31:08', '2025-05-16 20:34:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (75, 'ca2b281f-370a-4e4a-9145-33476c17c021', '9a4fedd55c41337e543478377ad85ab7', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 10:52:15', '2025-05-26 10:52:15', '2025-05-26 10:52:17', NULL, NULL, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (76, '2660feec-9e8f-41c2-9db2-23510c7b810d', '508187e5fdd47293dbbd5d50af105b35', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:00:25', '2025-05-26 11:01:05', '2025-05-26 11:04:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (77, 'd9ea31d7-0bfa-4ae0-bb15-680e20cada63', 'd8ace717c995c81c56337d46b2e6e0f4', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:03:31', '2025-05-26 11:05:02', '2025-05-26 11:08:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (78, 'e4e0838f-2163-4929-8db9-ecfc69973cc2', '4e6fc09c250c73e152d155db8b3461e6', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:06:04', '2025-05-26 11:06:04', '2025-05-26 11:09:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (79, '9de397fb-4d17-4ba2-9f70-e03f6d4cf3fd', 'b5aab91a0e910c2ff1cfc8c020daa2c4', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:23:52', '2025-05-26 11:23:53', '2025-05-26 11:26:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (80, 'f6fb68d9-c729-4f1e-8b24-7122d59ab8a0', '698aca8e7588d4e9442e73cd80c96c58', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:24:39', '2025-05-26 11:24:40', '2025-05-26 11:27:01', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (81, '75cdeedf-23f7-41ae-aad1-2af139b15d03', '163ef077723b1faa3f8e80f44937bc51', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:35:37', '2025-05-26 11:37:07', '2025-05-26 11:40:02', NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (82, 'fbad5cf2-9acf-4166-b5a1-b78b4e96641a', '3b595ab3ab6320315467239d656be24d', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:46:34', '2025-05-26 11:46:36', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (83, 'b1449d9b-9de3-4110-95ce-be5590f62ccb', '9c3543c71359aad3294fcc58b9b29e51', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 11:47:36', '2025-05-26 11:47:37', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (84, '862e5505-4456-46c2-93a0-a79ab602d97c', 'c1061019472cc5de1a067d7b25f98ed0', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 16:48:24', '2025-05-26 16:48:37', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (85, 'eddaf911-d1f6-47fb-b828-3cc3f9de8734', 'd81549023c57453003d59a23b16d1f24', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 16:55:06', '2025-05-26 16:55:07', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (86, 'cf369611-21fc-4c88-9efe-d0b2f043b629', '0218a2b83649b9eb16a1f982c2d64374', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 17:00:36', '2025-05-26 17:01:02', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (87, '858e83e0-7b8a-4185-bafc-43ed9f2b9758', '391ca34e1d64b94375fba55a95a53e69', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 17:01:11', '2025-05-26 17:01:12', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (88, '0cdaedc2-b96e-4beb-887f-97edbb30e57d', '5c6ebe5bb9e55d5e9773604c45db0b5d', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 17:07:15', '2025-05-26 17:07:28', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (89, 'cd00da4b-06ae-43be-93c4-2094fed98f7f', 'abe2fc6661530d1f4bcdaa8c7bb34ef7', 'user1', '', '127.0.0.1', '1', '', '2025-05-26 17:16:04', '2025-05-26 17:16:17', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (90, '8351f6e1-6d57-4f3f-bb83-c77c94f6d7b2', '1039bae4ab4c80b46ea601bd0b8cb9bf', 'user2', '', '127.0.0.1', '1', '', '2025-05-26 17:17:47', '2025-05-26 17:17:48', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);
INSERT INTO `radacct` VALUES (91, '4d56e477-2479-4181-9400-a438da9f017e', '851f3b0c74990e6b5d52e8d964d79a4b', 'user3', '', '127.0.0.1', '1', '', '2025-05-26 20:18:34', '2025-05-26 20:18:45', NULL, NULL, 0, '', '', '', 0, 0, '', '', '', '', '', '', '', '', '', '', NULL);

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
  `mac_address` varchar(17) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`(32) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radcheck
-- ----------------------------
INSERT INTO `radcheck` VALUES (1, 'eap', 'Cleartext-Password', ':=', 'eap', '1111');
INSERT INTO `radcheck` VALUES (2, 'edge_01', 'Cleartext-Password', '==', '123456', '1212');
INSERT INTO `radcheck` VALUES (3, 'edge_02', 'Cleartext-Password', '==', '666666', '8888');

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
  `username` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `pass` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `reply` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `authdate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `username`(`username`(32) ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of radpostauth
-- ----------------------------
INSERT INTO `radpostauth` VALUES (1, 'eap', 'eap', 'Access-Accept', '2025-05-28 08:59:41');
INSERT INTO `radpostauth` VALUES (2, 'eap', 'eap', 'Access-Accept', '2025-05-29 02:43:03');
INSERT INTO `radpostauth` VALUES (3, 'eap', 'eap', 'Access-Accept', '2025-05-29 07:02:31');
INSERT INTO `radpostauth` VALUES (4, 'eap', 'eap', 'Access-Accept', '2025-05-29 07:08:52');
INSERT INTO `radpostauth` VALUES (5, 'eap', 'eap', 'Access-Accept', '2025-05-29 07:25:54');
INSERT INTO `radpostauth` VALUES (6, 'eap', '0x2a8889420d2eea9fc8815d2ad3be7c7386', 'Access-Accept', '2025-05-29 07:29:47');
INSERT INTO `radpostauth` VALUES (7, 'eap', '0xb7b2d58e15bf2a51ef4423d480105514f9', 'Access-Accept', '2025-05-29 07:35:37');
INSERT INTO `radpostauth` VALUES (8, 'eap', '0x5c7b9e2e3f148375c28bd1f092ab1355b2', 'Access-Reject', '2025-05-29 07:40:22');
INSERT INTO `radpostauth` VALUES (9, 'eap', '0xac6990b5a254e18c79fdbbe7c47c57e409', 'Access-Accept', '2025-05-29 07:40:31');
INSERT INTO `radpostauth` VALUES (10, 'eap', '0xfda74b7df1f264f9259b42076a15596ffb', 'Access-Reject', '2025-05-29 07:50:53');
INSERT INTO `radpostauth` VALUES (11, 'eap', '0x9fb4be07ac39457d3159e63a46396dbe3f', 'Access-Accept', '2025-05-29 07:51:01');
INSERT INTO `radpostauth` VALUES (12, 'test', '', 'Access-Accept', '2025-05-29 08:39:04');
INSERT INTO `radpostauth` VALUES (13, 'test', '', 'Access-Reject', '2025-05-29 09:38:09');
INSERT INTO `radpostauth` VALUES (14, 'test', '', 'Access-Accept', '2025-05-29 09:43:27');
INSERT INTO `radpostauth` VALUES (15, 'test', '', 'Access-Accept', '2025-05-29 10:08:31');
INSERT INTO `radpostauth` VALUES (16, 'eap', '', 'Access-Reject', '2025-05-29 11:13:21');
INSERT INTO `radpostauth` VALUES (17, 'test', '', 'Access-Accept', '2025-05-29 11:14:30');
INSERT INTO `radpostauth` VALUES (18, 'eap', '', 'Access-Reject', '2025-05-29 11:14:56');
INSERT INTO `radpostauth` VALUES (19, 'eap', '', 'Access-Reject', '2025-05-29 11:16:52');
INSERT INTO `radpostauth` VALUES (20, 'eap', '', 'Access-Reject', '2025-05-29 11:17:22');
INSERT INTO `radpostauth` VALUES (21, 'eap', '', 'Access-Reject', '2025-05-29 11:17:52');
INSERT INTO `radpostauth` VALUES (22, 'eap', '', 'Access-Accept', '2025-05-29 11:19:22');
INSERT INTO `radpostauth` VALUES (23, 'eap', '', 'Access-Reject', '2025-05-29 11:21:10');
INSERT INTO `radpostauth` VALUES (24, 'eap', '', 'Access-Reject', '2025-05-29 11:21:59');
INSERT INTO `radpostauth` VALUES (25, 'eap', '', 'Access-Accept', '2025-05-29 11:22:57');
INSERT INTO `radpostauth` VALUES (26, 'test', '', 'Access-Reject', '2025-05-29 11:47:05');
INSERT INTO `radpostauth` VALUES (27, 'test', '', 'Access-Accept', '2025-05-29 11:47:35');
INSERT INTO `radpostauth` VALUES (28, 'eap', 'eap', 'Access-Accept', '2025-05-29 11:48:26');

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
