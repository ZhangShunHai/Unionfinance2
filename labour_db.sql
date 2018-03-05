/*
 Navicat Premium Data Transfer

 Source Server         : 阿里云mysql
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : labour_db

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 24/11/2017 16:13:48
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for z_cost
-- ----------------------------
DROP TABLE IF EXISTS `z_cost`;
CREATE TABLE `z_cost`  (
  `co_id` int(11) NOT NULL AUTO_INCREMENT,
  `co_entry` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `co_money` double(10, 1) NULL DEFAULT NULL,
  `co_operator` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `co_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `co_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `co_union` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `co_fortor` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`co_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for z_entry
-- ----------------------------
DROP TABLE IF EXISTS `z_entry`;
CREATE TABLE `z_entry`  (
  `en_id` int(11) NOT NULL AUTO_INCREMENT,
  `en_type` varbinary(8) NULL DEFAULT NULL,
  `en_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`en_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_entry
-- ----------------------------
INSERT INTO `z_entry` VALUES (1, 0x30, '会员会费收入的70%');
INSERT INTO `z_entry` VALUES (2, 0x30, '校工会拨付的各项活动和奖励经费');
INSERT INTO `z_entry` VALUES (3, 0x30, '校工会拨付的各项补助经费');
INSERT INTO `z_entry` VALUES (4, 0x31, '开展的教职工教育活动');
INSERT INTO `z_entry` VALUES (5, 0x31, '开展的教职工文艺、体育和女工活动');
INSERT INTO `z_entry` VALUES (6, 0x31, '开展的宣传活动');
INSERT INTO `z_entry` VALUES (7, 0x31, '慰问困难教职工');
INSERT INTO `z_entry` VALUES (13, 0x30, '结余');
INSERT INTO `z_entry` VALUES (15, 0x30, '送温暖');

-- ----------------------------
-- Table structure for z_income
-- ----------------------------
DROP TABLE IF EXISTS `z_income`;
CREATE TABLE `z_income`  (
  `in_id` int(11) NOT NULL AUTO_INCREMENT,
  `in_entry` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_money` double(10, 1) NULL DEFAULT NULL,
  `in_operator` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_time` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `in_union` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`in_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for z_user
-- ----------------------------
DROP TABLE IF EXISTS `z_user`;
CREATE TABLE `z_user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `company` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `identity` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `name` varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `password` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 111 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of z_user
-- ----------------------------
INSERT INTO `z_user` VALUES (1, '0', '0', 'manage', '0', '15537364889', '0');
INSERT INTO `z_user` VALUES (2, '1', '1', 'cost', '1', '15537364889', '0');

-- ----------------------------
-- View structure for balance
-- ----------------------------
DROP VIEW IF EXISTS `balance`;
CREATE ALGORITHM = UNDEFINED DEFINER = `root`@`localhost` SQL SECURITY DEFINER VIEW `balance` AS select `zi`.`in_union` AS `in_union`,`zi`.`income` AS `income`,ifnull(`zc`.`cost`,0) AS `IFNULL(zc.cost,0)`,(`zi`.`income` - ifnull(`zc`.`cost`,0)) AS `balance` from (((select `labour_db`.`z_income`.`in_union` AS `in_union`,sum(`labour_db`.`z_income`.`in_money`) AS `income` from `labour_db`.`z_income` group by `labour_db`.`z_income`.`in_union`)) `zi` left join (select `labour_db`.`z_cost`.`co_union` AS `co_union`,sum(`labour_db`.`z_cost`.`co_money`) AS `cost` from `labour_db`.`z_cost` group by `labour_db`.`z_cost`.`co_union`) `zc` on((`zi`.`in_union` = `zc`.`co_union`)));

SET FOREIGN_KEY_CHECKS = 1;
