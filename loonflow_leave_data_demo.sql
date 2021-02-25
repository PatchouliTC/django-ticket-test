/*
 Navicat Premium Data Transfer

 Source Server         : Dev_MySql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 172.29.112.172:10087
 Source Schema         : loonflow

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 25/02/2021 16:02:09
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_apptoken
-- ----------------------------
DROP TABLE IF EXISTS `account_apptoken`;
CREATE TABLE `account_apptoken`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `app_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '调用源应用名',
  `token` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '调用令牌',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `workflow_ids` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '有权限的工作流',
  `ticket_sn_prefix` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '生成工单前缀',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_apptoken
-- ----------------------------
INSERT INTO `account_apptoken` VALUES (1, 'leavefront', '8cd585da-3cc6-11e8-9946-784f437daad6', 'admin', '2020-04-12 16:55:46', '2021-02-25 15:24:21', 0, '3', 'leave');

-- ----------------------------
-- Table structure for account_loondept
-- ----------------------------
DROP TABLE IF EXISTS `account_loondept`;
CREATE TABLE `account_loondept`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门名称',
  `parent_dept_id` int(0) NOT NULL DEFAULT 0 COMMENT '上级部门id',
  `leader` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '部门leader',
  `approver` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '部门审批人，逗号隔开的username',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loondept
-- ----------------------------
INSERT INTO `account_loondept` VALUES (1, 'loonflow', 0, 'admin', 'admin', '', 'admin', '2020-04-12 11:24:29', '2020-04-12 16:20:24', 0);
INSERT INTO `account_loondept` VALUES (8, '临时', 1, 'admin', 'admin', '', 'admin', '2021-02-25 14:32:37', '2021-02-25 14:32:37', 0);
INSERT INTO `account_loondept` VALUES (9, '教导部', 1, 'admin', 'admin', '', 'admin', '2021-02-25 14:34:57', '2021-02-25 14:34:57', 0);
INSERT INTO `account_loondept` VALUES (10, '班级1', 9, 'teacherA', 'teacherA', '', 'admin', '2021-02-25 14:36:42', '2021-02-25 07:14:59', 0);
INSERT INTO `account_loondept` VALUES (11, '班级2', 9, 'teacherB', 'teacherB', '', 'admin', '2021-02-25 14:36:54', '2021-02-25 07:15:08', 0);

-- ----------------------------
-- Table structure for account_loonrole
-- ----------------------------
DROP TABLE IF EXISTS `account_loonrole`;
CREATE TABLE `account_loonrole`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '角色描述',
  `label` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '标签',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loonrole
-- ----------------------------
INSERT INTO `account_loonrole` VALUES (1, '运维人员', '', '', 'admin', '2020-04-12 16:31:59', '2020-04-12 16:31:59', 0);
INSERT INTO `account_loonrole` VALUES (2, '教师', '教师人员', '', 'admin', '2021-02-25 14:28:42', '2021-02-25 14:28:42', 0);
INSERT INTO `account_loonrole` VALUES (3, '学生', '学生人员', '', 'admin', '2021-02-25 14:28:56', '2021-02-25 14:28:56', 0);

-- ----------------------------
-- Table structure for account_loonuser
-- ----------------------------
DROP TABLE IF EXISTS `account_loonuser`;
CREATE TABLE `account_loonuser`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '密码',
  `last_login` datetime(0) NULL DEFAULT '0001-01-01 00:00:00' COMMENT '最后登录时间',
  `username` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `alias` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '中文(昵称)',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '邮箱',
  `phone` varchar(13) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '手机号',
  `dept_id` int(0) NOT NULL DEFAULT 0 COMMENT '所属部门id',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '在职',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '超级管理员',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `is_workflow_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '工作流管理员',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loonuser
-- ----------------------------
INSERT INTO `account_loonuser` VALUES (1, 'pbkdf2_sha256$100000$wZONVjuD1eMK$QM6m9gBR44Elj+Qx65kwzPleULawmgzCQm08xMOyZOQ=', '2021-02-25 14:55:02', 'admin', '超级管理员', 'admin@admin.com', '', 1, 1, 1, 'admin', '2020-03-15 09:57:07', '2021-02-25 07:04:12', 0, 0);
INSERT INTO `account_loonuser` VALUES (12, 'pbkdf2_sha256$100000$1M0if5wrBnsW$Pkyi1T1XMkJN49zPtDmqFq/pV6OI5IDSgIod4+N3dDw=', '2021-02-25 14:53:59', 'teacherA', 'Mr.A', 'A@teacher.com', '', 9, 1, 0, 'admin', '2021-02-25 14:35:38', '2021-02-25 06:53:58', 0, 1);
INSERT INTO `account_loonuser` VALUES (13, 'pbkdf2_sha256$100000$jireFrQxKYMk$YdcndWlZ8H3/0X19URTHEQxzYtQ3yysPOU1c7+s+uak=', NULL, 'teacherB', 'Mr.B', 'B@teacher.com', '', 9, 1, 0, 'admin', '2021-02-25 14:35:56', '2021-02-25 14:39:06', 0, 1);
INSERT INTO `account_loonuser` VALUES (14, 'pbkdf2_sha256$100000$5UWrcGcMs2Qp$nexBBYaNImtcIhbf9msIVnC30XwrWCKfwLdhzpZZAe0=', NULL, 'student001', 'Stu.1', 'stu1@student.com', '', 10, 1, 0, 'admin', '2021-02-25 14:37:46', '2021-02-25 14:37:46', 0, 0);
INSERT INTO `account_loonuser` VALUES (15, 'pbkdf2_sha256$100000$NWHiLNmN5Fsy$ebrS/Y34KIoTVhjU1bgyz0JNcGyuGGVb7Ztiryd6FcE=', NULL, 'student002', 'Stu.2', 'stu2@student.com', '', 10, 1, 0, 'admin', '2021-02-25 14:38:08', '2021-02-25 14:38:08', 0, 0);
INSERT INTO `account_loonuser` VALUES (16, 'pbkdf2_sha256$100000$jgOeWjGGotP1$OFc7iFXMuqFb09FWdk2mfMne6Hy61sbujXLIPozy9l4=', NULL, 'student003', 'Stu.3', 'stu3@student.com', '', 11, 1, 0, 'admin', '2021-02-25 14:38:23', '2021-02-25 14:38:23', 0, 0);

-- ----------------------------
-- Table structure for account_loonuserrole
-- ----------------------------
DROP TABLE IF EXISTS `account_loonuserrole`;
CREATE TABLE `account_loonuserrole`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `user_id` int(0) NOT NULL DEFAULT 0 COMMENT '用户id',
  `role_id` int(0) NOT NULL DEFAULT 0 COMMENT '角色id',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_loonuserrole
-- ----------------------------
INSERT INTO `account_loonuserrole` VALUES (1, 3, 1, 'admin', '2020-04-12 16:32:08', '2020-04-12 16:32:08', 0);
INSERT INTO `account_loonuserrole` VALUES (2, 11, 1, 'admin', '2020-04-12 16:32:15', '2020-04-12 16:32:15', 0);
INSERT INTO `account_loonuserrole` VALUES (3, 12, 2, 'admin', '2021-02-25 14:36:17', '2021-02-25 14:36:17', 0);
INSERT INTO `account_loonuserrole` VALUES (4, 13, 2, 'admin', '2021-02-25 14:36:21', '2021-02-25 14:36:21', 0);
INSERT INTO `account_loonuserrole` VALUES (5, 14, 3, 'admin', '2021-02-25 14:40:00', '2021-02-25 14:40:00', 0);
INSERT INTO `account_loonuserrole` VALUES (6, 15, 3, 'admin', '2021-02-25 14:40:04', '2021-02-25 14:40:04', 0);
INSERT INTO `account_loonuserrole` VALUES (7, 16, 3, 'admin', '2021-02-25 14:40:07', '2021-02-25 14:40:07', 0);

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `group_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_group_permissions_group_id_permission_id_0cd325b0_uniq`(`group_id`, `permission_id`) USING BTREE,
  INDEX `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NOT NULL,
  `codename` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `auth_permission_content_type_id_codename_01ab375a_uniq`(`content_type_id`, `codename`) USING BTREE,
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(0) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_account_loonuser_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_account_loonuser_id` FOREIGN KEY (`user_id`) REFERENCES `account_loonuser` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `model` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `django_content_type_app_label_model_76bd3d3b_uniq`(`app_label`, `model`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (20, 'account', 'apptoken');
INSERT INTO `django_content_type` VALUES (8, 'account', 'loondept');
INSERT INTO `django_content_type` VALUES (7, 'account', 'loonrole');
INSERT INTO `django_content_type` VALUES (9, 'account', 'loonuser');
INSERT INTO `django_content_type` VALUES (6, 'account', 'loonuserrole');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');
INSERT INTO `django_content_type` VALUES (12, 'ticket', 'ticketcustomfield');
INSERT INTO `django_content_type` VALUES (13, 'ticket', 'ticketflowlog');
INSERT INTO `django_content_type` VALUES (10, 'ticket', 'ticketrecord');
INSERT INTO `django_content_type` VALUES (11, 'ticket', 'ticketstatelastman');
INSERT INTO `django_content_type` VALUES (21, 'ticket', 'ticketuser');
INSERT INTO `django_content_type` VALUES (16, 'workflow', 'customfield');
INSERT INTO `django_content_type` VALUES (14, 'workflow', 'customnotice');
INSERT INTO `django_content_type` VALUES (17, 'workflow', 'state');
INSERT INTO `django_content_type` VALUES (19, 'workflow', 'transition');
INSERT INTO `django_content_type` VALUES (18, 'workflow', 'workflow');
INSERT INTO `django_content_type` VALUES (22, 'workflow', 'workflowadmin');
INSERT INTO `django_content_type` VALUES (15, 'workflow', 'workflowscript');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(0) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('2u4a3uup5v85arx0cgz0440umv3fuxya', 'ZDI2MDU0YTk2Njc2MDhmZWUxM2NkNDBhNzIwYzg0NjQwYzNhMDQxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZWExYWY0MWY2Mzg0NzI5ZGYzN2M5YWJjYmM5YjM4YjhlMGE4YzI3In0=', '2020-04-26 10:59:13');
INSERT INTO `django_session` VALUES ('dwc31jp72h8jqrjexicqwztofw9y6lrt', 'ZDI2MDU0YTk2Njc2MDhmZWUxM2NkNDBhNzIwYzg0NjQwYzNhMDQxMDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJhZWExYWY0MWY2Mzg0NzI5ZGYzN2M5YWJjYmM5YjM4YjhlMGE4YzI3In0=', '2021-03-11 14:55:02');
INSERT INTO `django_session` VALUES ('gnq8ua2c47at1m055h67qj6ml0sc8bmy', 'ZWUzZTM3NGMyMTkwOGU0ZDEzY2U4ZDYxZDFjNTM3Y2Q2YzhiZDZmNTp7Il9hdXRoX3VzZXJfaWQiOiI0OCIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWVhMWFmNDFmNjM4NDcyOWRmMzdjOWFiY2JjOWIzOGI4ZTBhOGMyNyJ9', '2020-03-29 09:57:34');

-- ----------------------------
-- Table structure for ticket_ticketcustomfield
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketcustomfield`;
CREATE TABLE `ticket_ticketcustomfield`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `field_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段标识',
  `ticket_id` int(0) NOT NULL DEFAULT 0 COMMENT '工单id',
  `field_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '字段类型',
  `char_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字符串值',
  `int_value` int(0) NOT NULL DEFAULT 0 COMMENT '整形值',
  `float_value` double NOT NULL DEFAULT 0 COMMENT '浮点值',
  `bool_value` tinyint(1) NOT NULL DEFAULT 0 COMMENT '布尔值',
  `date_value` date NOT NULL DEFAULT '1000-00-01' COMMENT '日期值',
  `datetime_value` datetime(0) NOT NULL DEFAULT '1000-00-01 00:00:00' COMMENT '日期时间值',
  `time_value` time(6) NOT NULL DEFAULT '00:00:01.000000' COMMENT '时间值',
  `radio_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单选框值',
  `checkbox_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '复选框值',
  `select_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '单选下拉列表值',
  `multi_select_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '多选下拉列表值',
  `text_value` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文本域值',
  `username_value` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名值',
  `multi_username_value` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '多选用户名值',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ticket_id_field_key`(`ticket_id`, `field_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_ticketcustomfield
-- ----------------------------
INSERT INTO `ticket_ticketcustomfield` VALUES (1, '', '2020-04-12 17:00:25', '2020-04-12 17:00:25', 0, '开始日期', 'date_start', 1, 30, '', 0, 0, 0, '0001-01-01', '2020-04-13 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (2, '', '2020-04-12 17:00:25', '2020-04-12 17:00:25', 0, '截止时间', 'date_end', 1, 30, '', 0, 0, 0, '0001-01-01', '2020-04-23 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (3, '', '2020-04-12 17:00:25', '2020-04-12 17:00:25', 0, '请假原因', 'reason', 1, 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00', '00:00:01.000000', '', '', '', '', '<p>世界这么大，出去看看</p>', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (4, '', '2020-04-12 17:02:28', '2020-04-12 17:02:28', 0, '开始日期', 'date_start', 2, 30, '', 0, 0, 0, '0001-01-01', '2020-04-13 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (5, '', '2020-04-12 17:02:28', '2020-04-12 17:02:28', 0, '截止时间', 'date_end', 2, 30, '', 0, 0, 0, '0001-01-01', '2020-04-14 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (6, '', '2020-04-12 17:02:28', '2020-04-12 17:02:28', 0, '请假原因', 'reason', 2, 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00', '00:00:01.000000', '', '', '', '', '<p>找不到老婆，请假去相亲</p>', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (7, '', '2020-04-12 17:03:28', '2020-04-12 17:03:28', 0, '申请原因', 'reason', 3, 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00', '00:00:01.000000', '', '', '', '', '<p>远程办公</p>', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (8, '', '2021-02-25 15:14:17', '2021-02-25 15:14:17', 0, '请假开始时间', 'date_start', 4, 30, '', 0, 0, 0, '0001-01-01', '2021-02-26 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (9, '', '2021-02-25 15:14:17', '2021-02-25 15:14:17', 0, '结束时间', 'date_end', 4, 30, '', 0, 0, 0, '0001-01-01', '2021-02-28 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (10, '', '2021-02-25 15:14:17', '2021-02-25 15:14:17', 0, '请假原因', 'reason', 4, 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00', '00:00:01.000000', '', '', '', '', '<p>肚子疼</p>', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (11, '', '2021-02-25 15:16:23', '2021-02-25 15:16:23', 0, '请假开始时间', 'date_start', 5, 30, '', 0, 0, 0, '0001-01-01', '2021-02-26 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (12, '', '2021-02-25 15:16:23', '2021-02-25 15:16:23', 0, '结束时间', 'date_end', 5, 30, '', 0, 0, 0, '0001-01-01', '2021-02-27 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (13, '', '2021-02-25 15:16:23', '2021-02-25 15:16:23', 0, '请假原因', 'reason', 5, 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00', '00:00:01.000000', '', '', '', '', '<p>肚子疼</p>', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (14, '', '2021-02-25 15:16:56', '2021-02-25 15:16:56', 0, '请假开始时间', 'date_start', 6, 30, '', 0, 0, 0, '0001-01-01', '2021-02-26 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (15, '', '2021-02-25 15:16:56', '2021-02-25 15:16:56', 0, '结束时间', 'date_end', 6, 30, '', 0, 0, 0, '0001-01-01', '2021-02-27 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (16, '', '2021-02-25 15:16:56', '2021-02-25 15:16:56', 0, '请假原因', 'reason', 6, 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00', '00:00:01.000000', '', '', '', '', '<p>头疼</p>', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (17, '', '2021-02-25 15:53:07', '2021-02-25 15:53:07', 0, '请假开始时间', 'date_start', 7, 30, '', 0, 0, 0, '0001-01-01', '2021-02-26 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (18, '', '2021-02-25 15:53:07', '2021-02-25 15:53:07', 0, '结束时间', 'date_end', 7, 30, '', 0, 0, 0, '0001-01-01', '2021-02-27 00:00:00', '00:00:01.000000', '', '', '', '', '', '', '');
INSERT INTO `ticket_ticketcustomfield` VALUES (19, '', '2021-02-25 15:53:07', '2021-02-25 15:53:07', 0, '请假原因', 'reason', 7, 55, '', 0, 0, 0, '0001-01-01', '0001-01-01 00:00:00', '00:00:01.000000', '', '', '', '', '<p>肚子疼</p>', '', '');

-- ----------------------------
-- Table structure for ticket_ticketflowlog
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketflowlog`;
CREATE TABLE `ticket_ticketflowlog`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `ticket_id` int(0) NOT NULL DEFAULT 0 COMMENT '工单id',
  `transition_id` int(0) NOT NULL DEFAULT 0 COMMENT '流转id',
  `suggestion` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' COMMENT '处理意见',
  `participant_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '参与人类型',
  `participant` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参与人',
  `state_id` int(0) NOT NULL DEFAULT 0 COMMENT '状态id',
  `intervene_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '干预类型',
  `ticket_data` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '工单数据',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ticket_id`(`ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_ticketflowlog
-- ----------------------------
INSERT INTO `ticket_ticketflowlog` VALUES (1, 'admin', '2020-04-12 17:00:25', '2020-04-12 17:00:25', 0, 1, 1, '', 1, 'admin', 1, 0, '{\"id\": 1, \"creator\": \"admin\", \"gmt_created\": \"2020-04-12 17:00:25\", \"gmt_modified\": \"2020-04-12 17:00:25\", \"is_deleted\": false, \"title\": \"\\u4e16\\u754c\\u8fd9\\u4e48\\u5927\\uff0c\\u51fa\\u53bb\\u770b\\u770b\", \"workflow_id\": 1, \"sn\": \"ops_202004120001\", \"state_id\": 2, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 5, \"participant\": \"create_tl\", \"relation\": \"admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2020-04-13 00:00:00\", \"date_end\": \"2020-04-23 00:00:00\", \"reason\": \"<p>\\u4e16\\u754c\\u8fd9\\u4e48\\u5927\\uff0c\\u51fa\\u53bb\\u770b\\u770b</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (2, 'admin', '2020-04-12 17:02:28', '2020-04-12 17:02:28', 0, 2, 1, '', 1, 'admin', 1, 0, '{\"id\": 2, \"creator\": \"admin\", \"gmt_created\": \"2020-04-12 17:02:28\", \"gmt_modified\": \"2020-04-12 17:02:28\", \"is_deleted\": false, \"title\": \"\\u8bf7\\u5047\\u53bb\\u76f8\\u4eb2\", \"workflow_id\": 1, \"sn\": \"ops_202004120002\", \"state_id\": 2, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"admin\", \"relation\": \"admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2020-04-13 00:00:00\", \"date_end\": \"2020-04-14 00:00:00\", \"reason\": \"<p>\\u627e\\u4e0d\\u5230\\u8001\\u5a46\\uff0c\\u8bf7\\u5047\\u53bb\\u76f8\\u4eb2</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (3, 'admin', '2020-04-12 17:03:28', '2020-04-12 17:03:28', 0, 3, 6, '', 1, 'admin', 5, 0, '{\"id\": 3, \"creator\": \"admin\", \"gmt_created\": \"2020-04-12 17:03:28\", \"gmt_modified\": \"2020-04-12 17:03:28\", \"is_deleted\": false, \"title\": \"\\u7533\\u8bf7vpn\\u5728\\u5bb6\\u8fdc\\u7a0b\\u529e\\u516c\", \"workflow_id\": 2, \"sn\": \"ops_202004120003\", \"state_id\": 6, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 4, \"participant\": \"1\", \"relation\": \"ops,ops2,admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"reason\": \"<p>\\u8fdc\\u7a0b\\u529e\\u516c</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (4, 'admin', '2021-02-25 14:17:12', '2021-02-25 14:17:12', 0, 3, 0, '', 1, 'admin', 6, 6, '{\"id\": 3, \"creator\": \"admin\", \"gmt_created\": \"2020-04-12 17:03:28\", \"gmt_modified\": \"2020-04-12 17:03:28\", \"is_deleted\": false, \"title\": \"\\u7533\\u8bf7vpn\\u5728\\u5bb6\\u8fdc\\u7a0b\\u529e\\u516c\", \"workflow_id\": 2, \"sn\": \"ops_202004120003\", \"state_id\": 6, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 4, \"participant\": \"1\", \"relation\": \"ops,ops2,admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"reason\": \"<p>\\u8fdc\\u7a0b\\u529e\\u516c</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (5, 'admin', '2021-02-25 14:53:18', '2021-02-25 14:53:18', 0, 2, 0, '', 1, 'admin', 2, 6, '{\"id\": 2, \"creator\": \"admin\", \"gmt_created\": \"2020-04-12 17:02:28\", \"gmt_modified\": \"2020-04-12 17:02:28\", \"is_deleted\": false, \"title\": \"\\u8bf7\\u5047\\u53bb\\u76f8\\u4eb2\", \"workflow_id\": 1, \"sn\": \"ops_202004120002\", \"state_id\": 2, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"admin\", \"relation\": \"admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2020-04-13 00:00:00\", \"date_end\": \"2020-04-14 00:00:00\", \"reason\": \"<p>\\u627e\\u4e0d\\u5230\\u8001\\u5a46\\uff0c\\u8bf7\\u5047\\u53bb\\u76f8\\u4eb2</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (6, 'admin', '2021-02-25 14:53:21', '2021-02-25 14:53:21', 0, 1, 0, '', 1, 'admin', 2, 6, '{\"id\": 1, \"creator\": \"admin\", \"gmt_created\": \"2020-04-12 17:00:25\", \"gmt_modified\": \"2020-04-12 17:02:43\", \"is_deleted\": false, \"title\": \"\\u4e16\\u754c\\u8fd9\\u4e48\\u5927\\uff0c\\u51fa\\u53bb\\u770b\\u770b\", \"workflow_id\": 1, \"sn\": \"ops_202004120001\", \"state_id\": 2, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"admin\", \"relation\": \"admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2020-04-13 00:00:00\", \"date_end\": \"2020-04-23 00:00:00\", \"reason\": \"<p>\\u4e16\\u754c\\u8fd9\\u4e48\\u5927\\uff0c\\u51fa\\u53bb\\u770b\\u770b</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (7, 'student001', '2021-02-25 15:14:17', '2021-02-25 15:14:17', 0, 4, 12, '', 1, 'student001', 10, 0, '{\"id\": 4, \"creator\": \"student001\", \"gmt_created\": \"2021-02-25 15:14:17\", \"gmt_modified\": \"2021-02-25 15:14:17\", \"is_deleted\": false, \"title\": \"\\u751f\\u75c5\\u8bf7\\u5047\", \"workflow_id\": 3, \"sn\": \"leavefront_202102250001\", \"state_id\": 11, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 2, \"participant\": \"teacherA,admin\", \"relation\": \"teacherA,student001,admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2021-02-26 00:00:00\", \"date_end\": \"2021-02-28 00:00:00\", \"reason\": \"<p>\\u809a\\u5b50\\u75bc</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (8, 'admin', '2021-02-25 15:15:25', '2021-02-25 15:15:25', 0, 4, 0, '', 1, 'admin', 11, 6, '{\"id\": 4, \"creator\": \"student001\", \"gmt_created\": \"2021-02-25 15:14:17\", \"gmt_modified\": \"2021-02-25 15:14:17\", \"is_deleted\": false, \"title\": \"\\u751f\\u75c5\\u8bf7\\u5047\", \"workflow_id\": 3, \"sn\": \"leavefront_202102250001\", \"state_id\": 11, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 2, \"participant\": \"teacherA,admin\", \"relation\": \"teacherA,student001,admin\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2021-02-26 00:00:00\", \"date_end\": \"2021-02-28 00:00:00\", \"reason\": \"<p>\\u809a\\u5b50\\u75bc</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (9, 'student001', '2021-02-25 15:16:23', '2021-02-25 15:16:23', 0, 5, 12, '', 1, 'student001', 10, 0, '{\"id\": 5, \"creator\": \"student001\", \"gmt_created\": \"2021-02-25 15:16:23\", \"gmt_modified\": \"2021-02-25 15:16:23\", \"is_deleted\": false, \"title\": \"\\u809a\\u5b50\\u75bc\", \"workflow_id\": 3, \"sn\": \"leavefront_202102250002\", \"state_id\": 11, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"teacherA\", \"relation\": \"teacherA,student001\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2021-02-26 00:00:00\", \"date_end\": \"2021-02-27 00:00:00\", \"reason\": \"<p>\\u809a\\u5b50\\u75bc</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (10, 'student001', '2021-02-25 15:16:56', '2021-02-25 15:16:56', 0, 6, 12, '', 1, 'student001', 10, 0, '{\"id\": 6, \"creator\": \"student001\", \"gmt_created\": \"2021-02-25 15:16:56\", \"gmt_modified\": \"2021-02-25 15:16:56\", \"is_deleted\": false, \"title\": \"\\u5934\\u75bc\", \"workflow_id\": 3, \"sn\": \"leavefront_202102250003\", \"state_id\": 11, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"teacherA\", \"relation\": \"teacherA,student001\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2021-02-26 00:00:00\", \"date_end\": \"2021-02-27 00:00:00\", \"reason\": \"<p>\\u5934\\u75bc</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (11, 'teacherA', '2021-02-25 15:17:33', '2021-02-25 15:17:33', 0, 6, 13, '同意', 1, 'teacherA', 11, 0, '\"{\\\"id\\\": 6, \\\"creator\\\": \\\"student001\\\", \\\"gmt_created\\\": \\\"2021-02-25 15:16:56\\\", \\\"gmt_modified\\\": \\\"2021-02-25 15:17:33\\\", \\\"is_deleted\\\": false, \\\"title\\\": \\\"\\\\u5934\\\\u75bc\\\", \\\"workflow_id\\\": 3, \\\"sn\\\": \\\"leavefront_202102250003\\\", \\\"state_id\\\": 12, \\\"parent_ticket_id\\\": 0, \\\"parent_ticket_state_id\\\": 0, \\\"participant_type_id\\\": 1, \\\"participant\\\": \\\"\\\", \\\"relation\\\": \\\"teacherA,student001\\\", \\\"in_add_node\\\": false, \\\"add_node_man\\\": \\\"\\\", \\\"script_run_last_result\\\": true, \\\"act_state_id\\\": 4, \\\"multi_all_person\\\": \\\"{}\\\", \\\"date_start\\\": \\\"2021-02-26 00:00:00\\\", \\\"date_end\\\": \\\"2021-02-27 00:00:00\\\", \\\"reason\\\": \\\"<p>\\\\u5934\\\\u75bc</p>\\\"}\"');
INSERT INTO `ticket_ticketflowlog` VALUES (12, 'teacherA', '2021-02-25 15:17:39', '2021-02-25 15:17:39', 0, 5, 14, '拒绝', 1, 'teacherA', 11, 0, '\"{\\\"id\\\": 5, \\\"creator\\\": \\\"student001\\\", \\\"gmt_created\\\": \\\"2021-02-25 15:16:23\\\", \\\"gmt_modified\\\": \\\"2021-02-25 15:17:39\\\", \\\"is_deleted\\\": false, \\\"title\\\": \\\"\\\\u809a\\\\u5b50\\\\u75bc\\\", \\\"workflow_id\\\": 3, \\\"sn\\\": \\\"leavefront_202102250002\\\", \\\"state_id\\\": 10, \\\"parent_ticket_id\\\": 0, \\\"parent_ticket_state_id\\\": 0, \\\"participant_type_id\\\": 1, \\\"participant\\\": \\\"student001\\\", \\\"relation\\\": \\\"teacherA,student001\\\", \\\"in_add_node\\\": false, \\\"add_node_man\\\": \\\"\\\", \\\"script_run_last_result\\\": true, \\\"act_state_id\\\": 2, \\\"multi_all_person\\\": \\\"{}\\\", \\\"date_start\\\": \\\"2021-02-26 00:00:00\\\", \\\"date_end\\\": \\\"2021-02-27 00:00:00\\\", \\\"reason\\\": \\\"<p>\\\\u809a\\\\u5b50\\\\u75bc</p>\\\"}\"');
INSERT INTO `ticket_ticketflowlog` VALUES (13, 'admin', '2021-02-25 15:23:57', '2021-02-25 15:23:57', 0, 6, 0, '', 1, 'admin', 12, 6, '{\"id\": 6, \"creator\": \"student001\", \"gmt_created\": \"2021-02-25 15:16:56\", \"gmt_modified\": \"2021-02-25 15:17:33\", \"is_deleted\": false, \"title\": \"\\u5934\\u75bc\", \"workflow_id\": 3, \"sn\": \"leavefront_202102250003\", \"state_id\": 12, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"\", \"relation\": \"teacherA,student001\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 4, \"multi_all_person\": \"{}\", \"date_start\": \"2021-02-26 00:00:00\", \"date_end\": \"2021-02-27 00:00:00\", \"reason\": \"<p>\\u5934\\u75bc</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (14, 'admin', '2021-02-25 15:24:00', '2021-02-25 15:24:00', 0, 5, 0, '', 1, 'admin', 10, 6, '{\"id\": 5, \"creator\": \"student001\", \"gmt_created\": \"2021-02-25 15:16:23\", \"gmt_modified\": \"2021-02-25 15:17:39\", \"is_deleted\": false, \"title\": \"\\u809a\\u5b50\\u75bc\", \"workflow_id\": 3, \"sn\": \"leavefront_202102250002\", \"state_id\": 10, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"student001\", \"relation\": \"teacherA,student001\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 2, \"multi_all_person\": \"{}\", \"date_start\": \"2021-02-26 00:00:00\", \"date_end\": \"2021-02-27 00:00:00\", \"reason\": \"<p>\\u809a\\u5b50\\u75bc</p>\"}');
INSERT INTO `ticket_ticketflowlog` VALUES (15, 'student001', '2021-02-25 15:53:07', '2021-02-25 15:53:07', 0, 7, 12, '', 1, 'student001', 10, 0, '{\"id\": 7, \"creator\": \"student001\", \"gmt_created\": \"2021-02-25 15:53:07\", \"gmt_modified\": \"2021-02-25 15:53:07\", \"is_deleted\": false, \"title\": \"\\u809a\\u5b50\\u75bc\", \"workflow_id\": 3, \"sn\": \"leave_202102250004\", \"state_id\": 11, \"parent_ticket_id\": 0, \"parent_ticket_state_id\": 0, \"participant_type_id\": 1, \"participant\": \"teacherA\", \"relation\": \"teacherA,student001\", \"in_add_node\": false, \"add_node_man\": \"\", \"script_run_last_result\": true, \"act_state_id\": 1, \"multi_all_person\": \"{}\", \"date_start\": \"2021-02-26 00:00:00\", \"date_end\": \"2021-02-27 00:00:00\", \"reason\": \"<p>\\u809a\\u5b50\\u75bc</p>\"}');

-- ----------------------------
-- Table structure for ticket_ticketrecord
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketrecord`;
CREATE TABLE `ticket_ticketrecord`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `title` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '标题',
  `workflow_id` int(0) NOT NULL DEFAULT 0 COMMENT '工作流id',
  `sn` varchar(25) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '工单流水号',
  `state_id` int(0) NOT NULL DEFAULT 0 COMMENT '状态id',
  `parent_ticket_id` int(0) NOT NULL DEFAULT 0 COMMENT '父工单id',
  `parent_ticket_state_id` int(0) NOT NULL DEFAULT 0 COMMENT '对应父工单状态id',
  `participant_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '参与人类型id',
  `participant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参与人',
  `relation` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '工单关系人',
  `in_add_node` tinyint(1) NOT NULL DEFAULT 0 COMMENT '加签中',
  `add_node_man` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '加签对象',
  `script_run_last_result` tinyint(1) NOT NULL DEFAULT 1 COMMENT '脚本/hook执行状态',
  `multi_all_person` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{}' COMMENT '多人全部处理进展',
  `act_state_id` int(0) NOT NULL DEFAULT 1 COMMENT '进行状态',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_act_state_id`(`act_state_id`) USING BTREE,
  INDEX `idx_sn`(`sn`) USING BTREE,
  INDEX `idx_workflow_id`(`workflow_id`) USING BTREE,
  INDEX `idx_creator`(`creator`) USING BTREE,
  INDEX `idx_gmt_created`(`gmt_created`) USING BTREE,
  INDEX `idx_parent_ticket_id`(`parent_ticket_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_ticketrecord
-- ----------------------------
INSERT INTO `ticket_ticketrecord` VALUES (4, 'student001', '2021-02-25 15:14:17', '2021-02-25 15:15:25', 1, '生病请假', 3, 'leavefront_202102250001', 11, 0, 0, 2, 'teacherA,admin', 'teacherA,student001,admin', 0, '', 1, '{}', 1);
INSERT INTO `ticket_ticketrecord` VALUES (5, 'student001', '2021-02-25 15:16:23', '2021-02-25 15:24:00', 1, '肚子疼', 3, 'leavefront_202102250002', 10, 0, 0, 1, 'student001', 'teacherA,student001', 0, '', 1, '{}', 2);
INSERT INTO `ticket_ticketrecord` VALUES (6, 'student001', '2021-02-25 15:16:56', '2021-02-25 15:23:57', 1, '头疼', 3, 'leavefront_202102250003', 12, 0, 0, 1, '', 'teacherA,student001', 0, '', 1, '{}', 4);
INSERT INTO `ticket_ticketrecord` VALUES (7, 'student001', '2021-02-25 15:53:07', '2021-02-25 15:53:07', 0, '肚子疼', 3, 'leave_202102250004', 11, 0, 0, 1, 'teacherA', 'teacherA,student001', 0, '', 1, '{}', 1);

-- ----------------------------
-- Table structure for ticket_ticketuser
-- ----------------------------
DROP TABLE IF EXISTS `ticket_ticketuser`;
CREATE TABLE `ticket_ticketuser`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `in_process` tinyint(1) NOT NULL DEFAULT 0 COMMENT '处理中',
  `worked` tinyint(1) NOT NULL DEFAULT 0 COMMENT '处理过的',
  `ticket_id` int(0) NOT NULL DEFAULT 0 COMMENT '工单id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_ticket_id`(`ticket_id`) USING BTREE,
  INDEX `idx_username_in_process`(`username`, `in_process`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of ticket_ticketuser
-- ----------------------------
INSERT INTO `ticket_ticketuser` VALUES (1, '', '2020-04-12 17:00:25', '2020-04-12 17:00:25', 0, 'admin', 0, 0, 1);
INSERT INTO `ticket_ticketuser` VALUES (2, '', '2020-04-12 17:00:25', '2020-04-12 17:00:25', 0, '', 1, 0, 1);
INSERT INTO `ticket_ticketuser` VALUES (3, '', '2020-04-12 17:02:28', '2020-04-12 17:02:27', 0, 'admin', 1, 0, 2);
INSERT INTO `ticket_ticketuser` VALUES (4, '', '2020-04-12 17:03:28', '2020-04-12 17:03:28', 0, 'admin', 0, 0, 3);
INSERT INTO `ticket_ticketuser` VALUES (5, '', '2020-04-12 17:03:28', '2020-04-12 17:03:28', 0, 'ops', 1, 0, 3);
INSERT INTO `ticket_ticketuser` VALUES (6, '', '2020-04-12 17:03:28', '2020-04-12 17:03:28', 0, 'ops2', 1, 0, 3);
INSERT INTO `ticket_ticketuser` VALUES (7, '', '2021-02-25 15:14:17', '2021-02-25 15:14:17', 0, 'student001', 0, 0, 4);
INSERT INTO `ticket_ticketuser` VALUES (8, '', '2021-02-25 15:14:17', '2021-02-25 15:14:17', 0, 'teacherA', 1, 0, 4);
INSERT INTO `ticket_ticketuser` VALUES (9, '', '2021-02-25 15:14:17', '2021-02-25 15:14:17', 0, 'admin', 1, 0, 4);
INSERT INTO `ticket_ticketuser` VALUES (10, '', '2021-02-25 15:16:23', '2021-02-25 07:17:39', 0, 'student001', 1, 0, 5);
INSERT INTO `ticket_ticketuser` VALUES (11, '', '2021-02-25 15:16:23', '2021-02-25 07:17:39', 0, 'teacherA', 0, 1, 5);
INSERT INTO `ticket_ticketuser` VALUES (12, '', '2021-02-25 15:16:56', '2021-02-25 15:16:56', 0, 'student001', 0, 0, 6);
INSERT INTO `ticket_ticketuser` VALUES (13, '', '2021-02-25 15:16:56', '2021-02-25 07:17:32', 0, 'teacherA', 1, 1, 6);
INSERT INTO `ticket_ticketuser` VALUES (14, '', '2021-02-25 15:53:07', '2021-02-25 15:53:07', 0, 'student001', 0, 0, 7);
INSERT INTO `ticket_ticketuser` VALUES (15, '', '2021-02-25 15:53:07', '2021-02-25 15:53:07', 0, 'teacherA', 1, 0, 7);

-- ----------------------------
-- Table structure for workflow_customfield
-- ----------------------------
DROP TABLE IF EXISTS `workflow_customfield`;
CREATE TABLE `workflow_customfield`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `workflow_id` int(0) NOT NULL DEFAULT 0 COMMENT '工作流id',
  `field_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '字段类型id',
  `field_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段标识',
  `field_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '字段名称',
  `order_id` int(0) NOT NULL DEFAULT 0 COMMENT '顺序id',
  `default_value` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '默认值',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `field_template` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字段模板',
  `boolean_field_display` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{}' COMMENT '布尔类型显示',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `field_choice` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{}' COMMENT '布尔类型显示',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{}' COMMENT '布尔类型显示',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_customfield
-- ----------------------------
INSERT INTO `workflow_customfield` VALUES (1, 1, 30, 'date_start', '开始日期', 30, '', '请选择请假开始日期', '', '{}', 'admin', '2020-04-12 16:37:44', '2020-04-12 16:39:08', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (2, 1, 30, 'date_end', '截止时间', 31, '', '请假截止时间', '', '{}', 'admin', '2020-04-12 16:38:04', '2020-04-12 16:39:14', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (3, 1, 55, 'reason', '请假原因', 200, '', '请填写请假原因', '', '{}', 'admin', '2020-04-12 16:38:48', '2020-04-12 16:39:24', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (4, 2, 55, 'reason', '申请原因', 200, '', '', '', '{}', 'admin', '2020-04-12 16:46:02', '2020-04-12 16:46:02', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (5, 3, 30, 'date_start', '请假开始时间', 30, '', '请选择请假开始日期', '', '{}', 'admin', '2021-02-25 14:43:05', '2021-02-25 14:43:05', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (6, 3, 30, 'date_end', '结束时间', 31, '', '请假截至时间', '', '{}', 'admin', '2021-02-25 14:43:39', '2021-02-25 14:43:39', 0, '{}', '{}');
INSERT INTO `workflow_customfield` VALUES (7, 3, 55, 'reason', '请假原因', 200, '', '请填写请假理由', '', '{}', 'admin', '2021-02-25 14:44:15', '2021-02-25 14:44:15', 0, '{}', '{}');

-- ----------------------------
-- Table structure for workflow_customnotice
-- ----------------------------
DROP TABLE IF EXISTS `workflow_customnotice`;
CREATE TABLE `workflow_customnotice`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `hook_token` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'hook令牌',
  `hook_url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT 'hook地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for workflow_state
-- ----------------------------
DROP TABLE IF EXISTS `workflow_state`;
CREATE TABLE `workflow_state`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态名称',
  `workflow_id` int(0) NOT NULL DEFAULT 0 COMMENT '工作id',
  `is_hidden` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否隐藏',
  `order_id` int(0) NOT NULL DEFAULT 0 COMMENT '顺序id',
  `type_id` int(0) NOT NULL DEFAULT 0 COMMENT '类型id',
  `participant_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '参与人类型id',
  `participant` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '参与人',
  `distribute_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '分配类型id',
  `state_field_str` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{}' COMMENT '状态表单字段',
  `label` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{}' COMMENT '状态表单字段',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `remember_last_man_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '记忆最后处理人',
  `enable_retreat` tinyint(1) NOT NULL DEFAULT 0 COMMENT '允许发起人撤回',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_state
-- ----------------------------
INSERT INTO `workflow_state` VALUES (1, '申请人-编辑中', 1, 0, 0, 1, 0, '', 2, '{\"title\":2,\"reason\":2,\"date_start\":2,\"date_end\":2}', '{}', 'admin', '2020-04-12 16:40:21', '2021-02-25 06:22:10', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (2, '教师审批中', 1, 0, 1, 0, 5, 'creator_tl', 2, '{\"title\":1,\"reason\":1,\"date_start\":1,\"date_end\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2020-04-12 16:41:23', '2021-02-25 06:22:23', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (3, '人事审批中', 1, 0, 3, 0, 3, '2', 2, '{\"title\":1,\"reason\":1,\"date_start\":1,\"date_end\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2020-04-12 16:41:59', '2020-04-12 16:42:28', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (4, '结束', 1, 0, 4, 2, 0, '', 2, '{\"title\":1,\"reason\":1, \"date_start\":1,\"date_end\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2020-04-12 16:42:47', '2020-04-12 16:42:47', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (5, '发起人-新建中', 2, 0, 1, 1, 0, '', 2, '{\"title\":2,\"reason\":2}', '{}', 'admin', '2020-04-12 16:46:34', '2020-04-12 16:46:34', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (6, '运维人员-审批中', 2, 0, 2, 0, 4, '1', 2, '{\"title\":1,\"reason\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2020-04-12 16:47:25', '2020-04-12 16:47:25', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (7, 'vpn授权中', 2, 0, 3, 0, 10, '{\"hook_url\":\"http://www.baidu.com\", \"hook_token\":\"xxxx\", \"wait\":false, \"extra_info\":\"xxxx\"}', 2, '{\"title\":1,\"reason\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2020-04-12 16:48:27', '2020-04-12 16:48:42', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (8, '发起人-确认中', 2, 0, 4, 0, 5, 'creator', 2, '{\"title\":1,\"reason\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2020-04-12 16:49:10', '2020-04-12 16:49:10', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (9, '结束', 2, 0, 5, 2, 0, '', 2, '{\"title\":1,\"reason\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2020-04-12 16:49:24', '2020-04-12 16:49:24', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (10, '申请人-编辑中', 3, 0, 0, 1, 0, '', 2, '{\"title\":2,\"reason\":2,\"date_start\":2,\"date_end\":2}', '{}', 'admin', '2021-02-25 14:45:13', '2021-02-25 14:45:13', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (11, '教师审批中', 3, 0, 1, 0, 5, 'creator_tl', 2, '{\"title\":1,\"reason\":1,\"date_start\":1,\"date_end\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2021-02-25 14:48:33', '2021-02-25 14:48:33', 0, 0, 0);
INSERT INTO `workflow_state` VALUES (12, '审批完毕', 3, 0, 3, 2, 0, '', 2, '{\"title\":1,\"reason\":1,\"date_start\":1,\"date_end\":1,\"participant_info.participant_name\":1,\"state.state_name\":1,\"workflow.workflow_name\":1}', '{}', 'admin', '2021-02-25 14:49:07', '2021-02-25 14:49:07', 0, 0, 0);

-- ----------------------------
-- Table structure for workflow_transition
-- ----------------------------
DROP TABLE IF EXISTS `workflow_transition`;
CREATE TABLE `workflow_transition`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '流转名称',
  `workflow_id` int(0) NOT NULL DEFAULT 0 COMMENT '工作流id',
  `transition_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '流转类型id',
  `source_state_id` int(0) NOT NULL DEFAULT 0 COMMENT '源状态id',
  `destination_state_id` int(0) NOT NULL DEFAULT 0 COMMENT '目标状态id',
  `alert_enable` tinyint(1) NOT NULL DEFAULT 0 COMMENT '点击弹窗提示',
  `alert_text` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '点击弹窗提示的内容',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `field_require_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否校验必填项',
  `timer` int(0) NOT NULL DEFAULT 0 COMMENT '定时器时长(单位:秒)',
  `attribute_type_id` int(0) NOT NULL DEFAULT 0 COMMENT '属性类型id',
  `condition_expression` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '条件表达式',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_transition
-- ----------------------------
INSERT INTO `workflow_transition` VALUES (1, '提交', 1, 1, 1, 2, 0, '', 'admin', '2020-04-12 16:42:58', '2020-04-12 16:42:58', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (2, '同意', 1, 1, 2, 3, 0, '', 'admin', '2020-04-12 16:43:21', '2020-04-12 16:43:21', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (3, '拒绝', 1, 1, 2, 1, 0, '', 'admin', '2020-04-12 16:43:34', '2020-04-12 16:44:57', 0, 0, 0, 2, '[]');
INSERT INTO `workflow_transition` VALUES (4, '同意', 1, 1, 3, 4, 0, '', 'admin', '2020-04-12 16:44:18', '2020-04-12 16:44:18', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (5, '拒绝', 1, 1, 3, 1, 0, '', 'admin', '2020-04-12 16:44:32', '2020-04-12 16:45:13', 0, 0, 0, 2, '[]');
INSERT INTO `workflow_transition` VALUES (6, '提交', 2, 1, 5, 6, 0, '', 'admin', '2020-04-12 16:50:42', '2020-04-12 16:50:42', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (7, '拒绝', 2, 1, 6, 5, 0, '', 'admin', '2020-04-12 16:51:06', '2020-04-12 16:51:06', 0, 0, 0, 2, '[]');
INSERT INTO `workflow_transition` VALUES (8, '同意', 2, 1, 6, 7, 0, '', 'admin', '2020-04-12 16:51:29', '2020-04-12 16:51:29', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (9, '完成', 2, 1, 7, 8, 0, '', 'admin', '2020-04-12 16:51:54', '2020-04-12 16:51:54', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (10, '确认完成', 2, 1, 8, 9, 0, '', 'admin', '2020-04-12 16:52:13', '2020-04-12 16:52:13', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (11, '权限未成功开通', 2, 1, 8, 6, 0, '', 'admin', '2020-04-12 16:52:55', '2020-04-12 16:52:55', 0, 0, 0, 2, '[]');
INSERT INTO `workflow_transition` VALUES (12, '提交', 3, 1, 10, 11, 0, '', 'admin', '2021-02-25 14:50:22', '2021-02-25 14:50:22', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (13, '同意', 3, 1, 11, 12, 0, '', 'admin', '2021-02-25 14:50:45', '2021-02-25 14:50:45', 0, 0, 0, 1, '[]');
INSERT INTO `workflow_transition` VALUES (14, '驳回', 3, 1, 11, 10, 0, '', 'admin', '2021-02-25 14:51:21', '2021-02-25 06:52:34', 0, 0, 0, 2, '[]');

-- ----------------------------
-- Table structure for workflow_workflow
-- ----------------------------
DROP TABLE IF EXISTS `workflow_workflow`;
CREATE TABLE `workflow_workflow`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `description` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '描述',
  `display_form_str` varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '[]' COMMENT '展现表单字段',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `view_permission_check` tinyint(1) NOT NULL DEFAULT 0 COMMENT '查看权限校验',
  `limit_expression` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '{}' COMMENT '限制表达式',
  `notices` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '通知',
  `content_template` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '内容模板',
  `title_template` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题模板',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_workflow
-- ----------------------------
INSERT INTO `workflow_workflow` VALUES (1, '请假申请a', '', '[\"title\",\"sn\",\"gmt_created\", \"state.state_name\", \"participant_info.participant_name\",\"workflow.workflow_name\"]', 'admin', '2020-04-12 16:34:25', '2021-02-25 06:53:29', 1, 0, '{}', '', '标题:{title}, 创建时间:{gmt_created}', '你有一个待办工单:{title}');
INSERT INTO `workflow_workflow` VALUES (2, 'vpn申请', '', '[\"title\",\"sn\",\"gmt_created\", \"state.state_name\", \"participant_info.participant_name\",\"workflow.workflow_name\"]', 'admin', '2020-04-12 16:36:10', '2021-02-25 06:53:02', 1, 0, '{}', '', '标题:{title}, 创建时间:{gmt_created}', '你有一个待办工单:{title}');
INSERT INTO `workflow_workflow` VALUES (3, '请假申请', '学生请假申请', '[\"title\",\"sn\",\"gmt_created\", \"state.state_name\", \"participant_info.participant_name\",\"workflow.workflow_name\"]', 'admin', '2021-02-25 14:27:36', '2021-02-25 06:28:07', 0, 0, '{}', '', '申请标题:{title}, 申请时间:{gmt_created}', '你有一个待处理请假申请:{title}');

-- ----------------------------
-- Table structure for workflow_workflowadmin
-- ----------------------------
DROP TABLE IF EXISTS `workflow_workflowadmin`;
CREATE TABLE `workflow_workflowadmin`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `workflow_id` int(0) NOT NULL DEFAULT 0 COMMENT '工作流id',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_workflow_id`(`workflow_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of workflow_workflowadmin
-- ----------------------------
INSERT INTO `workflow_workflowadmin` VALUES (1, '', '2021-02-25 14:42:07', '2021-02-25 06:54:18', 1, 'teacherB', 3);
INSERT INTO `workflow_workflowadmin` VALUES (2, '', '2021-02-25 14:42:07', '2021-02-25 06:54:18', 1, 'teacherA', 3);

-- ----------------------------
-- Table structure for workflow_workflowscript
-- ----------------------------
DROP TABLE IF EXISTS `workflow_workflowscript`;
CREATE TABLE `workflow_workflowscript`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '主键id',
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称',
  `saved_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '保存的文件名',
  `description` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '描述',
  `is_active` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否可用',
  `creator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'admin' COMMENT '创建人',
  `gmt_created` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `gmt_modified` datetime(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '已删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
