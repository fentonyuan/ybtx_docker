/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : mail

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 27/05/2025 15:02:47
*/
use mail;
SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for attachments
-- ----------------------------
DROP TABLE IF EXISTS `attachments`;
CREATE TABLE `attachments`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `originalFileName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `storedName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fileSize` bigint(0) NULL DEFAULT NULL,
  `fileType` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `uploadDate` datetime(0) NULL DEFAULT NULL,
  `status` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `mailId` int(0) NULL DEFAULT NULL COMMENT '逻辑外键，关联邮件表的id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 333 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of attachments
-- ----------------------------
INSERT INTO `attachments` VALUES (276, '项目发送逻辑.mdj', '3a470212c4864691bd1c9a1f85c981a1.mdj', 46072, '.mdj', '2025-05-16 20:27:20', '0', 38222);
INSERT INTO `attachments` VALUES (277, 'RAISE模块.eddx', '3a5e17308ec34e1aac41fb745962744b.eddx', 14431, '.eddx', '2025-05-16 20:30:36', '0', 38223);
INSERT INTO `attachments` VALUES (278, 'RAISE邮件管理系统.mdj', '167f42c840a44c17bee33ede308a264d.mdj', 225498, '.mdj', '2025-05-16 20:30:36', '0', 38223);
INSERT INTO `attachments` VALUES (279, '网络安全综合实验课-RAISE邮件管理系统.docx', '134b3b52cad54601bfb68f798257ee10.docx', 122996, '.docx', '2025-05-16 20:30:36', '0', 38223);
INSERT INTO `attachments` VALUES (280, '项目发送逻辑.mdj', '90a82b6cf6ed43dab39300561419a933.mdj', 46072, '.mdj', '2025-05-16 20:30:36', '0', 38223);
INSERT INTO `attachments` VALUES (281, 'RAISE模块.eddx', 'a1a95a6042964fa4810a0a413b68b33b.eddx', 14431, '.eddx', '2025-05-16 20:42:07', '0', 38229);
INSERT INTO `attachments` VALUES (282, 'RAISE邮件管理系统.mdj', '429543f72b6f49fc9a890ba05bb39739.mdj', 225498, '.mdj', '2025-05-16 20:42:07', '0', 38229);
INSERT INTO `attachments` VALUES (283, '网络安全综合实验课-RAISE邮件管理系统.docx', 'c798fffaac794a99be258c0782c43dfe.docx', 122996, '.docx', '2025-05-16 20:42:07', '0', 38229);
INSERT INTO `attachments` VALUES (284, '项目发送逻辑.mdj', 'b8916ac4894d4a33a80999d8e2eb759e.mdj', 46072, '.mdj', '2025-05-16 20:42:07', '0', 38229);
INSERT INTO `attachments` VALUES (285, 'RAISE模块.eddx', '84703dc59c4e41a88d9fcc8d2e24e56c.eddx', 14431, '.eddx', '2025-05-17 21:17:38', '0', 38232);
INSERT INTO `attachments` VALUES (286, 'RAISE邮件管理系统.mdj', 'f987294690c640609215bbc104f74d3a.mdj', 225498, '.mdj', '2025-05-17 21:17:38', '0', 38232);
INSERT INTO `attachments` VALUES (287, '网络安全综合实验课-RAISE邮件管理系统.docx', '76f68e351c7a4612baaac9f50e324af8.docx', 122996, '.docx', '2025-05-17 21:17:38', '0', 38232);
INSERT INTO `attachments` VALUES (288, '项目发送逻辑.mdj', 'f9c68a6af0ea4fedbda09dc82dcd45a6.mdj', 46072, '.mdj', '2025-05-17 21:17:38', '0', 38232);
INSERT INTO `attachments` VALUES (289, '项目提示词指令.docx', '7ccbcfa6ea5b47d4aef8cd8a4c07eae0.docx', 18433, '.docx', '2025-05-18 20:51:05', '0', 38238);
INSERT INTO `attachments` VALUES (290, '项目提示词指令.docx', '20e0e42a51674ca4a9b1809be05bcdfb.docx', 18433, '.docx', '2025-05-18 20:51:10', '0', 38239);
INSERT INTO `attachments` VALUES (291, '项目提示词指令.docx', 'ee2e86b0061a4d39bd9eec3fc90b93ec.docx', 18433, '.docx', '2025-05-18 20:51:22', '0', 38240);
INSERT INTO `attachments` VALUES (292, '项目提示词指令.docx', '34a60aa17aa84bea8b9671ce3f0506c9.docx', 18433, '.docx', '2025-05-18 20:51:29', '0', 38241);
INSERT INTO `attachments` VALUES (293, '项目提示词指令.docx', 'ae29caa80760406aa9abc2e95b041b21.docx', 18433, '.docx', '2025-05-18 21:00:15', '0', 38242);
INSERT INTO `attachments` VALUES (294, '项目提示词指令.docx', '9fd45d8a5712475ba7d3765cc0785ac7.docx', 18433, '.docx', '2025-05-18 21:13:11', '0', 38243);
INSERT INTO `attachments` VALUES (295, '蓝光光盘.pdf', 'f6a07eaa346a4ef2b0810c3054bb9a59.pdf', 94552, '.pdf', '2025-05-19 18:09:00', '0', 38245);
INSERT INTO `attachments` VALUES (296, '蓝光光盘.pdf', 'd955ca9d32f244e4a34c017d7318a3fa.pdf', 94552, '.pdf', '2025-05-19 20:36:26', '0', 38248);
INSERT INTO `attachments` VALUES (297, '蓝光光盘.pdf', '5a0eff27f6d544e592d66a1ea8694d73.pdf', 94552, '.pdf', '2025-05-19 20:37:48', '0', 38249);
INSERT INTO `attachments` VALUES (298, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '370c698133f0410090f06333991564a9.pdf', 852526, '.pdf', '2025-05-22 13:07:38', '0', 85679);
INSERT INTO `attachments` VALUES (299, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '20d6e440e5ea482f926f9ea96be618c5.pdf', 1658784, '.pdf', '2025-05-22 13:10:12', '0', 85680);
INSERT INTO `attachments` VALUES (300, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '039ee896feca4b4388cef290cbd3005f.pdf', 852526, '.pdf', '2025-05-22 13:14:07', '0', 85681);
INSERT INTO `attachments` VALUES (301, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '1cb6fcf6ea1b4c52b0072c6f48a84bb5.pdf', 852526, '.pdf', '2025-05-22 13:15:45', '0', 85682);
INSERT INTO `attachments` VALUES (302, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', 'a96ee707e90c45048b59919389e53e70.pdf', 1658784, '.pdf', '2025-05-22 13:17:30', '0', 85683);
INSERT INTO `attachments` VALUES (303, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '903b08540f6c4f8b8ae8fd3abcca6bae.pdf', 1658784, '.pdf', '2025-05-22 13:22:39', '0', 85684);
INSERT INTO `attachments` VALUES (304, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '71dbc4c0ffe44ebb8986f0b070198ca3.pdf', 852526, '.pdf', '2025-05-22 13:22:39', '0', 85684);
INSERT INTO `attachments` VALUES (305, '杨渡翔-A Decentralized SDN Architecture for the WAN.docx', '79fb2902283044e29775dd4b979a1046.docx', 793541, '.docx', '2025-05-22 13:26:49', '0', 85685);
INSERT INTO `attachments` VALUES (306, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '5bfdc5d862c64f308dfd8161ec842f86.pdf', 1658784, '.pdf', '2025-05-22 13:26:49', '0', 85685);
INSERT INTO `attachments` VALUES (307, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', 'fb1c0c1876c04cf4b118e10510513733.pdf', 852526, '.pdf', '2025-05-22 13:26:49', '0', 85685);
INSERT INTO `attachments` VALUES (308, '杨渡翔-A Decentralized SDN Architecture for the WAN.docx', '29ccc777aa0347efa1b44d32f780e70b.docx', 793541, '.docx', '2025-05-22 13:30:59', '0', 85686);
INSERT INTO `attachments` VALUES (309, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', 'e8f4c2114ff34beab5a07da8e541d16e.pdf', 1658784, '.pdf', '2025-05-22 13:30:59', '0', 85686);
INSERT INTO `attachments` VALUES (310, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '8c5918564aed4e628a86cce417aad318.pdf', 852526, '.pdf', '2025-05-22 13:30:59', '0', 85686);
INSERT INTO `attachments` VALUES (311, '杨渡翔-A Decentralized SDN Architecture for the WAN.docx', '2290bb0a005e4ee1a40586bbd4a757b4.docx', 793541, '.docx', '2025-05-22 15:03:44', '0', 85687);
INSERT INTO `attachments` VALUES (312, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '35c42a3bccb04e2d8c2e0e396ad03ca4.pdf', 1658784, '.pdf', '2025-05-22 15:03:44', '0', 85687);
INSERT INTO `attachments` VALUES (313, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '82cc28a3fb214a6b9d226d04d78e7af6.pdf', 852526, '.pdf', '2025-05-22 15:03:44', '0', 85687);
INSERT INTO `attachments` VALUES (314, '杨渡翔-A Decentralized SDN Architecture for the WAN.docx', '0abb147194c2415580516b8c11d247ec.docx', 793541, '.docx', '2025-05-23 14:14:21', '0', 113909);
INSERT INTO `attachments` VALUES (315, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '6170297c3fbd48db8db77cf94021ea2b.pdf', 1658784, '.pdf', '2025-05-23 14:14:21', '0', 113909);
INSERT INTO `attachments` VALUES (316, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '9e93291cf4704aaa883bfe9641502459.pdf', 852526, '.pdf', '2025-05-23 14:14:21', '0', 113909);
INSERT INTO `attachments` VALUES (317, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', 'e7c4eb02a13b408181c45affdb84576c.pdf', 1658784, '.pdf', '2025-05-23 14:21:51', '0', 113910);
INSERT INTO `attachments` VALUES (318, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', 'a0fd6608e9284574b9ade4df0211f47c.pdf', 1658784, '.pdf', '2025-05-23 14:30:52', '0', 113911);
INSERT INTO `attachments` VALUES (319, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', 'a27f45665dcb4f9c8e494e91c75cbe08.pdf', 852526, '.pdf', '2025-05-23 14:36:10', '0', 113912);
INSERT INTO `attachments` VALUES (320, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '1560959871434c2a92a1a59e0cacacd6.pdf', 1658784, '.pdf', '2025-05-23 14:36:10', '0', 113912);
INSERT INTO `attachments` VALUES (321, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', 'e312ff5a96214d8eb6840bdfaa7a2529.pdf', 852526, '.pdf', '2025-05-23 15:09:00', '0', 113913);
INSERT INTO `attachments` VALUES (322, '杨渡翔-A Decentralized SDN Architecture for the WAN.docx', '9390927489ee4227b26e206acb846dc8.docx', 793541, '.docx', '2025-05-23 15:21:07', '0', 113914);
INSERT INTO `attachments` VALUES (323, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', 'fdef3cb3d2794e0c8354d580e20d01a2.pdf', 1658784, '.pdf', '2025-05-23 15:21:07', '0', 113914);
INSERT INTO `attachments` VALUES (324, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '918acb7d8e314d1abf21f5c948bb7f54.pdf', 852526, '.pdf', '2025-05-23 15:21:07', '0', 113914);
INSERT INTO `attachments` VALUES (325, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '39c7b84cbd1d41e6a40a8d1257624e6e.pdf', 1658784, '.pdf', '2025-05-23 19:17:21', '0', 113915);
INSERT INTO `attachments` VALUES (326, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', 'ed089e972eee41f4afab742e36b062bb.pdf', 852526, '.pdf', '2025-05-24 22:38:57', '0', 113925);
INSERT INTO `attachments` VALUES (327, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '7f3800a81f934563853a0b864dbce010.pdf', 852526, '.pdf', '2025-05-24 22:40:09', '0', 113926);
INSERT INTO `attachments` VALUES (328, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '95db3c74759040cd86bfc629909ed1ea.pdf', 852526, '.pdf', '2025-05-24 22:40:09', '0', 113927);
INSERT INTO `attachments` VALUES (329, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', '20fbd5451e1140d8aa9af506b844fe30.pdf', 852526, '.pdf', '2025-05-24 22:57:29', '0', 113929);
INSERT INTO `attachments` VALUES (330, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', 'd5d70296e5bb4a9dbf199e9d706dce97.pdf', 852526, '.pdf', '2025-05-24 22:58:14', '0', 113930);
INSERT INTO `attachments` VALUES (331, '杨渡翔-面向广域网的去中心化 SDN 架构+胡宁老师.pdf', 'ac809d1d5fd94d8b93db15bfdc0a9fa6.pdf', 852526, '.pdf', '2025-05-24 23:10:45', '0', 113933);
INSERT INTO `attachments` VALUES (332, '杨渡翔-A Decentralized SDN Architecture for the WAN.pdf', '3d834939c5414eb5a843fc0cdf7567ba.pdf', 1658784, '.pdf', '2025-05-24 23:11:32', '0', 113934);

-- ----------------------------
-- Table structure for mails
-- ----------------------------
DROP TABLE IF EXISTS `mails`;
CREATE TABLE `mails`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `fromUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `toUser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(0) NOT NULL DEFAULT 0 COMMENT '1 已发送邮件\r\n2 回收站邮件',
  `createTime` datetime(0) NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  `delflag` tinyint(0) NULL DEFAULT NULL COMMENT '0 未删除  1 已删除',
  `hasAttach` int(0) NULL DEFAULT NULL COMMENT '附件数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 113938 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of mails
-- ----------------------------
INSERT INTO `mails` VALUES (113910, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123456', 0, '2025-05-23 14:21:51', '2025-05-23 14:21:51', 0, 1);
INSERT INTO `mails` VALUES (113911, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '13564321', 0, '2025-05-23 14:30:52', '2025-05-23 14:30:52', 0, 1);
INSERT INTO `mails` VALUES (113912, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123456789', 0, '2025-05-23 14:36:10', '2025-05-23 14:36:10', 0, 2);
INSERT INTO `mails` VALUES (113913, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '21345', 0, '2025-05-23 15:09:00', '2025-05-23 15:09:00', 0, 1);
INSERT INTO `mails` VALUES (113914, 'Test邮件', 'mail@aa.com', 'mail@aa.com', '123456', 0, '2025-05-23 15:21:07', '2025-05-23 15:21:07', 0, 4);
INSERT INTO `mails` VALUES (113915, 'Test邮件', 'mail@aa.com', 'mail@aa.com', '124561351354351231231231231564561231354351321231324354231231234564321234564321321\n14231231354\n24135468765312316576812315678674\n23413246876841312315687564123156789789435612.1564561231324\n23\n15645', 1, '2025-05-23 19:17:21', '2025-05-23 19:17:21', 0, 1);
INSERT INTO `mails` VALUES (113916, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123456', 0, '2025-05-24 21:52:17', '2025-05-24 21:52:17', 0, 0);
INSERT INTO `mails` VALUES (113917, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '12313564631', 0, '2025-05-24 22:25:10', '2025-05-24 22:25:10', 0, 0);
INSERT INTO `mails` VALUES (113918, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '3123123', 0, '2025-05-24 22:29:26', '2025-05-24 22:29:26', 0, 0);
INSERT INTO `mails` VALUES (113919, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '132123', 0, '2025-05-24 22:29:42', '2025-05-24 22:29:42', 0, 0);
INSERT INTO `mails` VALUES (113920, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '012314564', 0, '2025-05-24 22:31:40', '2025-05-24 22:31:40', 0, 0);
INSERT INTO `mails` VALUES (113921, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123456', 0, '2025-05-24 22:33:38', '2025-05-24 22:33:38', 0, 0);
INSERT INTO `mails` VALUES (113922, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123456', 0, '2025-05-24 22:35:06', '2025-05-24 22:35:06', 0, 0);
INSERT INTO `mails` VALUES (113923, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '12314564', 0, '2025-05-24 22:36:20', '2025-05-24 22:36:20', 0, 0);
INSERT INTO `mails` VALUES (113924, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '12314564', 0, '2025-05-24 22:36:20', '2025-05-24 22:36:20', 0, 0);
INSERT INTO `mails` VALUES (113925, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '1231354', 0, '2025-05-24 22:38:57', '2025-05-24 22:38:57', 0, 1);
INSERT INTO `mails` VALUES (113926, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123124123', 0, '2025-05-24 22:40:08', '2025-05-24 22:40:08', 0, 1);
INSERT INTO `mails` VALUES (113927, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123124123', 0, '2025-05-24 22:40:09', '2025-05-24 22:40:09', 0, 1);
INSERT INTO `mails` VALUES (113928, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '1234564', 0, '2025-05-24 22:55:18', '2025-05-24 22:55:18', 0, 0);
INSERT INTO `mails` VALUES (113929, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '213\n1351', 0, '2025-05-24 22:57:29', '2025-05-24 22:57:29', 0, 1);
INSERT INTO `mails` VALUES (113930, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123132435', 0, '2025-05-24 22:58:14', '2025-05-24 22:58:14', 0, 1);
INSERT INTO `mails` VALUES (113931, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '12343', 0, '2025-05-24 22:58:50', '2025-05-24 22:58:50', 0, 0);
INSERT INTO `mails` VALUES (113932, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '32143432', 0, '2025-05-24 23:01:18', '2025-05-24 23:01:18', 0, 0);
INSERT INTO `mails` VALUES (113933, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '32131243', 0, '2025-05-24 23:10:45', '2025-05-24 23:10:45', 0, 1);
INSERT INTO `mails` VALUES (113934, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '321312423432', 0, '2025-05-24 23:11:32', '2025-05-24 23:11:32', 0, 1);
INSERT INTO `mails` VALUES (113935, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '1231432', 0, '2025-05-24 23:14:00', '2025-05-24 23:14:00', 0, 0);
INSERT INTO `mails` VALUES (113936, 'Test邮件', 'mail@aa.com', 'mail@bb.com', '123124312432', 0, '2025-05-24 23:15:04', '2025-05-24 23:15:04', 0, 0);
INSERT INTO `mails` VALUES (113937, 'mail@aa.com', 'admin', 'mail@aa.com', '4123456', 0, '2025-05-26 13:08:02', '2025-05-26 13:08:02', 1, 0);

-- ----------------------------
-- Table structure for operations
-- ----------------------------
DROP TABLE IF EXISTS `operations`;
CREATE TABLE `operations`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名也是邮箱',
  `operation_time` datetime(0) NOT NULL COMMENT '行为发生时间',
  `operation_type` int(0) NOT NULL COMMENT '0接收,1发送',
  `data_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '数据类型',
  `data_size` int(0) NOT NULL COMMENT '数据大小（字节）',
  `create_time` datetime(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '记录创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户行为日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of operations
-- ----------------------------
INSERT INTO `operations` VALUES (5, 'mail@aa.com', '2025-05-24 23:10:52', 0, 'DATA', 77, '2025-05-24 23:10:52');
INSERT INTO `operations` VALUES (6, 'mail@aa.com', '2025-05-24 23:11:39', 0, 'DATA', 77, '2025-05-24 23:11:39');
INSERT INTO `operations` VALUES (7, 'mail@aa.com', '2025-05-24 23:14:03', 0, 'DATA', 77, '2025-05-24 23:14:03');
INSERT INTO `operations` VALUES (8, 'mail@aa.com', '2025-05-24 23:15:07', 0, 'DATA', 77, '2025-05-24 23:15:07');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `userStatus` int(0) NOT NULL DEFAULT 1,
  `loginStatus` int(0) NOT NULL DEFAULT 0,
  `createTime` datetime(0) NULL DEFAULT NULL,
  `updateTime` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'mail@aa.com', '123456', 1, 0, NULL, NULL);
INSERT INTO `users` VALUES (2, 'user1@bb.com', 'abc@123', 1, 1, '2023-05-10 14:30:00', '2023-05-15 09:45:00');
INSERT INTO `users` VALUES (3, 'test@cc.net', 'qwerty', 0, 0, '2023-06-20 10:15:00', NULL);
INSERT INTO `users` VALUES (4, 'admin', '123456', 2, 1, '2023-01-01 00:00:00', '2023-07-22 18:20:00');
INSERT INTO `users` VALUES (5, 'guest@ee.com', 'guest123', 1, 0, '2023-08-05 11:10:00', '2023-08-05 11:10:00');

-- ----------------------------
-- Table structure for users_login_log
-- ----------------------------
DROP TABLE IF EXISTS `users_login_log`;
CREATE TABLE `users_login_log`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT,
  `user_id` int(0) NOT NULL,
  `user_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `time` datetime(0) NOT NULL,
  `type` tinyint(0) NOT NULL COMMENT '0: 登录, 1: 离线',
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_login_log
-- ----------------------------
INSERT INTO `users_login_log` VALUES (1, 1, 'mail@aa.com', '2025-05-26 22:57:49', 0, '口令登录');
INSERT INTO `users_login_log` VALUES (2, 1, 'mail@aa.com', '2025-05-26 22:58:50', 1, '主动退出');
INSERT INTO `users_login_log` VALUES (3, 4, 'admin', '2025-05-26 22:59:12', 0, '口令登录');
INSERT INTO `users_login_log` VALUES (4, 1, 'mail@aa.com', '2025-05-26 23:06:57', 0, '口令登录');
INSERT INTO `users_login_log` VALUES (5, 1, 'mail@aa.com', '2025-05-26 23:13:20', 1, '主动退出');
INSERT INTO `users_login_log` VALUES (6, 1, 'mail@aa.com', '2025-05-27 08:58:20', 0, '口令登录');
INSERT INTO `users_login_log` VALUES (7, 1, 'mail@aa.com', '2025-05-27 09:01:05', 0, '口令登录');
INSERT INTO `users_login_log` VALUES (8, 1, 'mail@aa.com', '2025-05-27 09:01:11', 1, '主动退出');
INSERT INTO `users_login_log` VALUES (9, 1, 'mail@aa.com', '2025-05-27 09:01:34', 0, '口令登录');
INSERT INTO `users_login_log` VALUES (10, 1, 'mail@aa.com', '2025-05-27 09:04:50', 1, '离线踢出');
INSERT INTO `users_login_log` VALUES (11, 1, 'mail@aa.com', '2025-05-27 09:05:23', 1, '离线踢出');
INSERT INTO `users_login_log` VALUES (12, 1, 'mail@aa.com', '2025-05-27 09:37:03', 0, '口令登录');
INSERT INTO `users_login_log` VALUES (13, 1, 'mail@aa.com', '2025-05-27 09:38:00', 1, '主动退出');

SET FOREIGN_KEY_CHECKS = 1;
