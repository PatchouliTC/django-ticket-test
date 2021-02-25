/*
 Navicat Premium Data Transfer

 Source Server         : Dev_MySql
 Source Server Type    : MySQL
 Source Server Version : 80023
 Source Host           : 172.29.112.172:10087
 Source Schema         : shutongflow

 Target Server Type    : MySQL
 Target Server Version : 80023
 File Encoding         : 65001

 Date: 25/02/2021 16:02:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account_shutongdept
-- ----------------------------
DROP TABLE IF EXISTS `account_shutongdept`;
CREATE TABLE `account_shutongdept`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `parent` int(0) NOT NULL,
  `leader` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account_shutongdept
-- ----------------------------
INSERT INTO `account_shutongdept` VALUES (1, '2018-05-28 17:53:53.131890', '2018-05-28 17:53:53.131923', 0, '集团总部', 0, 'admin');
INSERT INTO `account_shutongdept` VALUES (2, '2018-05-28 17:54:09.064969', '2018-05-28 17:54:29.089651', 0, '运维', 0, 'ops');
INSERT INTO `account_shutongdept` VALUES (3, '2018-05-28 17:54:41.602794', '2018-05-28 17:54:41.602823', 0, '人事', 0, 'hr');
INSERT INTO `account_shutongdept` VALUES (4, '2018-05-28 17:54:51.438660', '2018-05-28 17:54:51.438693', 0, '配置管理', 0, 'scm');

-- ----------------------------
-- Table structure for account_shutonguserrole
-- ----------------------------
DROP TABLE IF EXISTS `account_shutonguserrole`;
CREATE TABLE `account_shutonguserrole`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `user` int(0) NOT NULL,
  `role` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO `auth_permission` VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO `auth_permission` VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO `auth_permission` VALUES (4, 'Can add group', 2, 'add_group');
INSERT INTO `auth_permission` VALUES (5, 'Can change group', 2, 'change_group');
INSERT INTO `auth_permission` VALUES (6, 'Can delete group', 2, 'delete_group');
INSERT INTO `auth_permission` VALUES (7, 'Can add permission', 3, 'add_permission');
INSERT INTO `auth_permission` VALUES (8, 'Can change permission', 3, 'change_permission');
INSERT INTO `auth_permission` VALUES (9, 'Can delete permission', 3, 'delete_permission');
INSERT INTO `auth_permission` VALUES (10, 'Can add content type', 4, 'add_contenttype');
INSERT INTO `auth_permission` VALUES (11, 'Can change content type', 4, 'change_contenttype');
INSERT INTO `auth_permission` VALUES (12, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO `auth_permission` VALUES (13, 'Can add session', 5, 'add_session');
INSERT INTO `auth_permission` VALUES (14, 'Can change session', 5, 'change_session');
INSERT INTO `auth_permission` VALUES (15, 'Can delete session', 5, 'delete_session');
INSERT INTO `auth_permission` VALUES (16, 'Can add shutong user', 6, 'add_shutonguser');
INSERT INTO `auth_permission` VALUES (17, 'Can change shutong user', 6, 'change_shutonguser');
INSERT INTO `auth_permission` VALUES (18, 'Can delete shutong user', 6, 'delete_shutonguser');
INSERT INTO `auth_permission` VALUES (19, 'Can add shutong role', 7, 'add_shutongrole');
INSERT INTO `auth_permission` VALUES (20, 'Can change shutong role', 7, 'change_shutongrole');
INSERT INTO `auth_permission` VALUES (21, 'Can delete shutong role', 7, 'delete_shutongrole');
INSERT INTO `auth_permission` VALUES (22, 'Can add shutong dept', 8, 'add_shutongdept');
INSERT INTO `auth_permission` VALUES (23, 'Can change shutong dept', 8, 'change_shutongdept');
INSERT INTO `auth_permission` VALUES (24, 'Can delete shutong dept', 8, 'delete_shutongdept');
INSERT INTO `auth_permission` VALUES (25, 'Can add shutong user role', 9, 'add_shutonguserrole');
INSERT INTO `auth_permission` VALUES (26, 'Can change shutong user role', 9, 'change_shutonguserrole');
INSERT INTO `auth_permission` VALUES (27, 'Can delete shutong user role', 9, 'delete_shutonguserrole');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `object_repr` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `action_flag` smallint(0) UNSIGNED NOT NULL,
  `change_message` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `content_type_id` int(0) NULL DEFAULT NULL,
  `user_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `django_admin_log_content_type_id_c4bce8eb_fk_django_co`(`content_type_id`) USING BTREE,
  INDEX `django_admin_log_user_id_c564eba6_fk_user_id`(`user_id`) USING BTREE,
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------
INSERT INTO `django_admin_log` VALUES (1, '2018-05-28 17:50:49.535522', '2', 'ops', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (2, '2018-05-28 17:51:13.318917', '3', 'hr', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (3, '2018-05-28 17:51:32.317495', '4', 'scm', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (4, '2018-05-28 17:52:18.165487', '5', 'wangjun', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (5, '2018-05-28 17:52:49.958805', '6', 'lilian', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (6, '2018-05-28 17:53:22.155813', '7', 'david', 1, '[{\"added\": {}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (7, '2018-05-28 17:53:32.787333', '5', 'webb', 2, '[{\"changed\": {\"fields\": [\"username\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (8, '2018-05-28 17:53:53.132840', '1', '集团总部', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (9, '2018-05-28 17:54:09.065962', '2', '运维', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (10, '2018-05-28 17:54:29.091771', '2', '运维', 2, '[{\"changed\": {\"fields\": [\"leader\"]}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (11, '2018-05-28 17:54:41.603467', '3', '人事', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (12, '2018-05-28 17:54:51.440344', '4', '配置管理', 1, '[{\"added\": {}}]', 8, 1);
INSERT INTO `django_admin_log` VALUES (13, '2018-05-30 21:50:03.279097', '1', 'admin', 2, '[{\"changed\": {\"fields\": [\"dept\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (14, '2018-05-30 21:51:29.539414', '2', 'ops', 2, '[{\"changed\": {\"fields\": [\"dept\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (15, '2018-05-30 21:51:38.279047', '3', 'hr', 2, '[{\"changed\": {\"fields\": [\"dept\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (16, '2018-05-30 21:51:46.775370', '4', 'scm', 2, '[{\"changed\": {\"fields\": [\"dept\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (17, '2018-05-30 21:51:58.332230', '5', 'webb', 2, '[{\"changed\": {\"fields\": [\"dept\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (18, '2018-05-30 21:52:08.310101', '6', 'lilian', 2, '[{\"changed\": {\"fields\": [\"dept\"]}}]', 6, 1);
INSERT INTO `django_admin_log` VALUES (19, '2018-05-30 21:52:27.650345', '7', 'david', 2, '[{\"changed\": {\"fields\": [\"dept\"]}}]', 6, 1);

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES (8, 'account', 'shutongdept');
INSERT INTO `django_content_type` VALUES (7, 'account', 'shutongrole');
INSERT INTO `django_content_type` VALUES (6, 'account', 'shutonguser');
INSERT INTO `django_content_type` VALUES (9, 'account', 'shutonguserrole');
INSERT INTO `django_content_type` VALUES (1, 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES (2, 'auth', 'group');
INSERT INTO `django_content_type` VALUES (3, 'auth', 'permission');
INSERT INTO `django_content_type` VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES (5, 'sessions', 'session');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES (1, 'contenttypes', '0001_initial', '2018-05-28 17:28:58.257449');
INSERT INTO `django_migrations` VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2018-05-28 17:28:58.306817');
INSERT INTO `django_migrations` VALUES (3, 'auth', '0001_initial', '2018-05-28 17:28:58.431886');
INSERT INTO `django_migrations` VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2018-05-28 17:28:58.451873');
INSERT INTO `django_migrations` VALUES (5, 'auth', '0003_alter_user_email_max_length', '2018-05-28 17:28:58.461113');
INSERT INTO `django_migrations` VALUES (6, 'auth', '0004_alter_user_username_opts', '2018-05-28 17:28:58.472840');
INSERT INTO `django_migrations` VALUES (7, 'auth', '0005_alter_user_last_login_null', '2018-05-28 17:28:58.483443');
INSERT INTO `django_migrations` VALUES (8, 'auth', '0006_require_contenttypes_0002', '2018-05-28 17:28:58.485580');
INSERT INTO `django_migrations` VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2018-05-28 17:28:58.496731');
INSERT INTO `django_migrations` VALUES (10, 'auth', '0008_alter_user_username_max_length', '2018-05-28 17:28:58.507006');
INSERT INTO `django_migrations` VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2018-05-28 17:28:58.517957');
INSERT INTO `django_migrations` VALUES (12, 'account', '0001_initial', '2018-05-28 17:28:58.726428');
INSERT INTO `django_migrations` VALUES (13, 'admin', '0001_initial', '2018-05-28 17:28:58.791593');
INSERT INTO `django_migrations` VALUES (14, 'admin', '0002_logentry_remove_auto_add', '2018-05-28 17:28:58.808985');
INSERT INTO `django_migrations` VALUES (15, 'sessions', '0001_initial', '2018-05-28 17:28:58.846171');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session`  (
  `session_key` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `session_data` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`) USING BTREE,
  INDEX `django_session_expire_date_a5c62663`(`expire_date`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('6chmsusan4a4s75wqv7r1vw0q51njoig', 'MWY2MDc4MDMxYjA0MjUzOWU3MmFhODYwYjRlZTgwMjg2YjExNWI5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNzVkNTIwNjFmNTlmZDczZWM1MTU3ZjYzMDE3NjBmYzI5MWM5NzMyIn0=', '2018-06-11 17:48:52.145222');
INSERT INTO `django_session` VALUES ('t82u5qdtumsbgcyb2682fykshu95ypcl', 'MWY2MDc4MDMxYjA0MjUzOWU3MmFhODYwYjRlZTgwMjg2YjExNWI5OTp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6IjEiLCJfYXV0aF91c2VyX2hhc2giOiJmNzVkNTIwNjFmNTlmZDczZWM1MTU3ZjYzMDE3NjBmYzI5MWM5NzMyIn0=', '2018-06-13 21:44:45.625058');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  `name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_login` datetime(6) NULL DEFAULT NULL,
  `first_name` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `alias` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` int(0) NULL DEFAULT NULL,
  `dept` int(0) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `modified` datetime(6) NOT NULL,
  `deleted` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'pbkdf2_sha256$100000$CeyRxwfai2ph$+1vDkt2SkvcYkVMIE3QrMjF2xYbRu1jDjy/DymXhcrM=', '2021-02-25 15:55:16.869150', '', '', '2018-05-28 17:29:58.000000', 'admin', '超级管理员', 'admin@admin.com', NULL, 1, 1, 1, 1, '2018-05-28 17:29:59.008564', '2021-02-25 15:55:16.869314', 0);
INSERT INTO `user` VALUES (2, 'pbkdf2_sha256$100000$ZVNTI0GmVAPy$yc1Enn2FAtJdg5YlYUDVVNxqcj37NrkcPqQQrOU5QEg=', '2021-02-25 15:23:05.969375', '', '', '2018-05-28 17:49:05.000000', 'teacherA', 'Mr.A', 'A@teacher.com', NULL, 9, 1, 0, 0, '2018-05-28 17:50:49.527729', '2021-02-25 15:23:05.969601', 0);
INSERT INTO `user` VALUES (3, 'pbkdf2_sha256$100000$S4VRDuZhNyX3$jPFezoftBvRboitvJGQMxjMbI/nP8GVPEi6MKkpms8Q=', NULL, '', '', '2018-05-28 17:50:55.000000', 'teacherB', 'Mr.A', 'B@teacher.com', NULL, 9, 1, 0, 0, '2018-05-28 17:51:13.312809', '2018-05-31 20:05:32.300067', 0);
INSERT INTO `user` VALUES (4, 'pbkdf2_sha256$100000$poLwmMEL6uxG$vNc+kvE+nGzsF2LymGU/pagXQGUeQfHVrs4KBS1gw6M=', '2021-02-25 15:33:40.125802', '', '', '2018-05-28 17:51:16.000000', 'student001', 'Stu.1', 'stu1@student.com', NULL, 10, 1, 0, 0, '2018-05-28 17:51:32.312111', '2021-02-25 15:33:40.126187', 0);
INSERT INTO `user` VALUES (5, 'pbkdf2_sha256$100000$wDNSxcKnAcKu$TpR2/0MdnhNTan7CSfd5s3mtlrC8jDJw6J0zR8qLy1w=', '2021-02-25 15:17:51.333381', '', '', '2018-05-28 17:51:38.000000', 'student002', 'Stu.2', 'stu2@student.com', NULL, 10, 1, 0, 0, '2018-05-28 17:52:18.160496', '2021-02-25 15:17:51.333801', 0);
INSERT INTO `user` VALUES (6, 'pbkdf2_sha256$100000$DXWsA4qxxRhO$Op9uCWwCeYgYCR8Rer8ymGEUKrDVmvgvGhqlPOE0UFI=', NULL, '', '', '2018-05-28 17:52:22.000000', 'student003', 'Stu.3', 'stu3@student.com', NULL, 11, 1, 0, 0, '2018-05-28 17:52:49.951892', '2018-05-30 21:52:08.303406', 0);

-- ----------------------------
-- Table structure for user_groups
-- ----------------------------
DROP TABLE IF EXISTS `user_groups`;
CREATE TABLE `user_groups`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `shutonguser_id` int(0) NOT NULL,
  `group_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_groups_shutonguser_id_group_id_4d07131e_uniq`(`shutonguser_id`, `group_id`) USING BTREE,
  INDEX `user_groups_group_id_b76f8aba_fk_auth_group_id`(`group_id`) USING BTREE,
  CONSTRAINT `user_groups_group_id_b76f8aba_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_groups_shutonguser_id_5fcf9f19_fk_user_id` FOREIGN KEY (`shutonguser_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `user_user_permissions`;
CREATE TABLE `user_user_permissions`  (
  `id` int(0) NOT NULL AUTO_INCREMENT,
  `shutonguser_id` int(0) NOT NULL,
  `permission_id` int(0) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_user_permissions_shutonguser_id_permission_id_c8fa6812_uniq`(`shutonguser_id`, `permission_id`) USING BTREE,
  INDEX `user_user_permission_permission_id_9deb68a3_fk_auth_perm`(`permission_id`) USING BTREE,
  CONSTRAINT `user_user_permission_permission_id_9deb68a3_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `user_user_permissions_shutonguser_id_260a7f99_fk_user_id` FOREIGN KEY (`shutonguser_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
