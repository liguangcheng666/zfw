/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 80016
 Source Host           : localhost:3306
 Source Schema         : zfw

 Target Server Type    : MySQL
 Target Server Version : 80016
 File Encoding         : 65001

 Date: 27/05/2020 14:17:07
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for zfw_articles
-- ----------------------------
DROP TABLE IF EXISTS `zfw_articles`;
CREATE TABLE `zfw_articles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章标题',
  `desn` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文章摘要',
  `pic` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '文章封面',
  `body` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '文章内容',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zfw_articles
-- ----------------------------
INSERT INTO `zfw_articles` VALUES (1, 'aaaaa', 'bbbbb', '/uploads/article/zmsHkRRPxnCDQwV1CXt2ZXmUhU3YXRjDVoLGexxk.jpeg', '<p>ccccc</p>', '2020-05-27 06:14:22', '2020-05-27 06:14:22', NULL);

-- ----------------------------
-- Table structure for zfw_migrations
-- ----------------------------
DROP TABLE IF EXISTS `zfw_migrations`;
CREATE TABLE `zfw_migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zfw_migrations
-- ----------------------------
INSERT INTO `zfw_migrations` VALUES (14, '2020_04_23_074044_create_users_table', 1);
INSERT INTO `zfw_migrations` VALUES (15, '2020_04_27_042031_create_roles_table', 1);
INSERT INTO `zfw_migrations` VALUES (16, '2020_04_27_042214_create_nodes_table', 1);
INSERT INTO `zfw_migrations` VALUES (17, '2020_04_27_042744_role_node', 1);
INSERT INTO `zfw_migrations` VALUES (18, '2020_05_09_035733_create_articles_table', 2);

-- ----------------------------
-- Table structure for zfw_nodes
-- ----------------------------
DROP TABLE IF EXISTS `zfw_nodes`;
CREATE TABLE `zfw_nodes`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '节点名称',
  `router_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '路由别名，权限认证标识',
  `pid` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '上级ID',
  `is_menu` enum('0','1') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0' COMMENT '是否为菜单，0否，1是',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zfw_nodes
-- ----------------------------
INSERT INTO `zfw_nodes` VALUES (1, '后台管理', '', 0, '1', '2020-04-30 07:53:58', '2020-04-30 07:53:58', NULL);
INSERT INTO `zfw_nodes` VALUES (2, '用户列表', 'admin.user.index', 1, '1', '2020-04-30 08:16:39', '2020-04-30 08:16:39', NULL);
INSERT INTO `zfw_nodes` VALUES (3, '角色列表', 'admin.role.index', 1, '1', '2020-04-30 08:21:08', '2020-04-30 08:21:08', NULL);
INSERT INTO `zfw_nodes` VALUES (4, '权限列表', 'admin.node.index', 1, '1', '2020-05-07 06:12:24', '2020-05-07 06:12:24', NULL);
INSERT INTO `zfw_nodes` VALUES (5, '添加用户', 'admin.user.create', 1, '1', '2020-04-30 09:00:24', '2020-04-30 09:00:24', NULL);
INSERT INTO `zfw_nodes` VALUES (6, '文章管理', '', 0, '1', '2020-04-30 09:59:38', '2020-04-30 09:59:38', NULL);
INSERT INTO `zfw_nodes` VALUES (7, '添加用户处理', 'admin.user.store', 1, '1', '2020-04-30 10:00:31', '2020-04-30 10:00:31', NULL);
INSERT INTO `zfw_nodes` VALUES (8, '添加权限', 'admin.node.create', 1, '1', '2020-05-03 13:53:00', '2020-05-03 13:53:00', NULL);
INSERT INTO `zfw_nodes` VALUES (9, '添加节点', 'admin.node.create', 1, '1', '2020-05-05 02:22:17', '2020-05-05 02:22:17', NULL);
INSERT INTO `zfw_nodes` VALUES (89, '文章列表', 'admin.article.index', 6, '1', '2020-05-12 00:17:36', '2020-05-12 00:17:36', NULL);

-- ----------------------------
-- Table structure for zfw_role_node
-- ----------------------------
DROP TABLE IF EXISTS `zfw_role_node`;
CREATE TABLE `zfw_role_node`  (
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `node_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '节点ID'
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zfw_role_node
-- ----------------------------
INSERT INTO `zfw_role_node` VALUES (1, 1);
INSERT INTO `zfw_role_node` VALUES (1, 2);
INSERT INTO `zfw_role_node` VALUES (1, 3);
INSERT INTO `zfw_role_node` VALUES (1, 4);
INSERT INTO `zfw_role_node` VALUES (1, 5);
INSERT INTO `zfw_role_node` VALUES (1, 7);
INSERT INTO `zfw_role_node` VALUES (1, 8);
INSERT INTO `zfw_role_node` VALUES (1, 9);

-- ----------------------------
-- Table structure for zfw_roles
-- ----------------------------
DROP TABLE IF EXISTS `zfw_roles`;
CREATE TABLE `zfw_roles`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zfw_roles
-- ----------------------------
INSERT INTO `zfw_roles` VALUES (1, '研发组长', '2020-04-29 04:26:48', '2020-04-29 09:18:18', NULL);
INSERT INTO `zfw_roles` VALUES (2, '客服组长', '2020-04-29 04:27:34', '2020-04-29 09:18:07', NULL);
INSERT INTO `zfw_roles` VALUES (3, 'a', '2020-04-29 07:27:44', '2020-04-29 09:21:56', NULL);
INSERT INTO `zfw_roles` VALUES (4, 'ab', '2020-04-29 07:33:23', '2020-04-29 09:13:42', NULL);

-- ----------------------------
-- Table structure for zfw_users
-- ----------------------------
DROP TABLE IF EXISTS `zfw_users`;
CREATE TABLE `zfw_users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) UNSIGNED NOT NULL DEFAULT 0 COMMENT '角色ID',
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '账号',
  `truename` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '未知' COMMENT '真实姓名',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '密码',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `phone` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '手机号码',
  `sex` enum('先生','女士') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '先生' COMMENT '性别',
  `last_ip` char(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '登录IP',
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `deleted_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of zfw_users
-- ----------------------------
INSERT INTO `zfw_users` VALUES (1, 1, 'admin', '蓝正诚', '$2y$10$tHBsDnsL2Vh4zkSEI3sicuil35jPPSmnXvCXOViStvFB99cyx9fjq', 'dicta67@163.com', '18718654990', '女士', '114.249.150.32', '2020-04-27 08:25:37', '2020-05-03 08:13:02', NULL);
INSERT INTO `zfw_users` VALUES (2, 2, 'dolorem17', '廉洋', '$2y$10$UxlbaZLvx2EbiamVUkLjGuYxDLkmnhDUjmySk5jQ4DadKIjW8XUWO', 'optio_et@hotmail.com', '18287572534', '先生', '193.209.193.190', '2020-04-27 08:25:37', '2020-05-03 08:27:01', NULL);
INSERT INTO `zfw_users` VALUES (3, 1, 'eos_optio', '郎雪', '$2y$10$rWeKcNH6vrls9lOdlphrAuzlZKl08W4wFFQMnpyWhCuVlmDMditjm', 'animi.a@sina.com', '13816176133', '先生', '56.163.20.210', '2020-04-27 08:25:37', '2020-05-08 05:05:08', NULL);
INSERT INTO `zfw_users` VALUES (4, 1, 'praesentium67', '吉欢', '$2y$10$JXf3AWbqLPcT0uxBFpUyUurEW5gcguYFRs7YnwJRuRrn/iZEt9eWq', 'est_esse@sohu.com', '15017871692', '先生', '82.204.50.150', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (5, 1, 'sequi_harum', '王瑶', '$2y$10$CdPqQAlCujAK7uvi6E6WAOhrONxqKXCb6b4NVcxSeldBkEVN9Bqaa', 'uexplicabo@126.com', '17059751672', '先生', '120.217.153.98', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (6, 1, 'et65', '丘帆', '$2y$10$cumJXp9./luURK9qQK/ATuPsesIGKrWTxeOqZV7LXJ0Z5MbwQ2O4C', 'dolorum.vero@sina.com', '17153460964', '先生', '110.215.144.38', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (7, 1, 'iquo', '贺瑞', '$2y$10$USuNT1h.tvdkpXkHnwrbyu.JbSzI6V3N4ZuTVvB4eOS9.OdawPEE6', 'ealiquid@sohu.com', '17605303297', '先生', '132.228.123.15', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (8, 1, 'magnam57', '滕晧', '$2y$10$kudeJThhLaeivCZj24sZ3O4mTVswiUfbUxm23OfaJlBUMl82SUUxC', 'eaque_earum@126.com', '17082655575', '先生', '97.92.64.214', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (9, 1, 'zdolorum', '路建', '$2y$10$HqvwTTdrLyIfmzV.DcjIq.tiyeiOhxLktme8Yo3.SC2CguJtFsc5m', 'nostrum93@sina.com', '18365550400', '先生', '187.37.6.156', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (10, 1, 'sid', '毕华', '$2y$10$LzLNdD18Z6gVIrAHAygalu/rsXEnF2pLlLBX.6YiRqed45j3M.bC.', 'aut.nobis@126.com', '13343296211', '女士', '5.178.125.254', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (11, 1, 'aut_beatae', '巫桂香', '$2y$10$zInb3ObYkZzfRj05HZtxRuJyrqf/UPnutvdsPx55VoqoQfCkbovya', 'wassumenda@qq.com', '15342518434', '先生', '161.124.41.224', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (12, 1, 'mollitia10', '庞明', '$2y$10$R.7AigmLMlV4rnBi9UDU9eFSxuafZBDKd6OGHoOCTpXhB3pWRKxra', 'qui.eius@163.com', '17083510758', '先生', '239.67.142.73', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (13, 1, 'qui31', '尹文', '$2y$10$KSBA8BsaUg4ZJixEG11AiOd/diI5nSOL3fe6bbJ7ArGs4GpzeMiSG', 'saut@hotmail.com', '18327217793', '先生', '60.111.166.140', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (14, 1, 'eos_repudiandae', '商荣', '$2y$10$vPxCe28sqQ9OYSVGwqCUkuUG6gD0yT6yrd4Y.nVe.Y9QwVR8gsska', 'quibusdam_voluptates@hotmail.com', '18815519382', '先生', '64.232.89.98', '2020-04-27 08:25:37', '2020-04-27 08:25:37', NULL);
INSERT INTO `zfw_users` VALUES (15, 1, 'accusamus07', '倪淑兰', '$2y$10$2TDtTrXXQlQafAPi1HzgY.q4DSALX.0HZtmKoWpMWYtIxKEby7HUC', 'gvoluptatibus@sina.com', '17056897572', '女士', '43.234.48.3', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (16, 1, 'sut', '艾超', '$2y$10$3B3MFdmyBqhQaKDAEWZ7yeI8tUSjtjuYqojAQKp.qVW7cPurDfznu', 'thic@yahoo.com', '13452354767', '女士', '133.171.30.16', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (17, 1, 'non_rerum', '龚楠', '$2y$10$tWHN8pE4qqFtKZZQcY91q.FQ4vG4cfLCZNjlaG61difrMR0Y2617i', 'jut@126.com', '18093259281', '先生', '186.191.120.58', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (18, 1, 'aut.nihil', '焦晧', '$2y$10$LyqcbrnxMkG60Mg1s1.emOP3XXDFv8Z/3P.Ksezjr3vzQIKu2maJ6', 'laboriosam.vitae@gmail.com', '17007575566', '先生', '156.64.75.201', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (19, 1, 'voluptas.sequi', '冯钟', '$2y$10$pyorqlphplNvJXkeSt6SRO./yrjn6uPnH4GPbXZH8QO/p7v3URhoO', 'sed92@sohu.com', '13996672677', '女士', '229.89.103.38', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (20, 1, 'perspiciatis.harum', '梅丽华', '$2y$10$yswcWPHeZ/s.z9WBRyJqnu4a2F5MTsTePkR7P8uJnNqiUYPq0UVci', 'modi85@hotmail.com', '13508020164', '先生', '239.191.153.168', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (21, 1, 'animi.quisquam', '成秀珍', '$2y$10$nNu500jcppXrit/bd4L39uvzQyfh.b7MHFB3YJSRN78ODsTEviuja', 'molestias_officia@sina.com', '18871672305', '先生', '252.230.1.12', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (22, 1, 'voluptas72', '饶钟', '$2y$10$p8wOmNlYm/cn70Asn1dLeugaktMIuIb02m7g84oOfxzYBbX/4l00a', 'tempora_sed@sina.com', '18985862435', '女士', '220.162.48.22', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (23, 1, 'uesse', '姜林', '$2y$10$437yIBeF0CwWaq9vbTM68.4RClq/fXKGlNSIf/me5eR3K4B45z9JW', 'praesentium43@sohu.com', '13067564976', '先生', '33.109.204.38', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (24, 1, 'quia55', '廉芬', '$2y$10$0D5f6jIz92b6/1.m0LKys.4GiqKkIosd1M/SdhJ/2HsblUc6bX71e', 'totam90@yahoo.com', '14524271538', '女士', '164.89.163.52', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (25, 1, 'qui_sequi', '钟兵', '$2y$10$bpr15Oq9F90CtMxH7e2IquD3cZTift3LjUVY56rh2sh6mBJXV3732', 'niusto@gmail.com', '15798454012', '先生', '90.157.83.161', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (26, 1, 'ut_modi', '武丹', '$2y$10$B5G3Sbb8uypu1qs8lBVJZu5Gci/G30JjCpDn0ECTbKR1.tXyFPUuS', 'dolor.nesciunt@sina.com', '13975517497', '先生', '64.5.178.74', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (27, 1, 'xeaque', '竺文彬', '$2y$10$XUCLr/yWfU63EwiiGzHEte7xHaVqGj3KIUjchW3/mCpVulswSl0oe', 'debitis.sunt@sohu.com', '15903428987', '先生', '161.186.104.253', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (28, 1, 'consequatur.suscipit', '许瑶', '$2y$10$v0.UA8Zr/AMnGntqWEBZqu3ucm5rOroEOq1x4FESX0DS2kTsMvY26', 'mlaborum@gmail.com', '14590601232', '女士', '9.40.132.19', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (29, 1, 'quis92', '巩兵', '$2y$10$8xlrFa88eVLyMWl2ELuQY.c78AUU/tEffrxjRVx.zxowIKw2hNGiW', 'htenetur@163.com', '18482365492', '女士', '67.87.217.147', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (30, 1, 'in.nihil', '黄芳', '$2y$10$/r7at1jnmVoWDBejmWXudu7R0zgXtQpGZ5Ov3afeJyjpKoYgj.pvG', 'ut.suscipit@qq.com', '18602740170', '女士', '90.92.204.124', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (31, 1, 'sequi68', '林秀兰', '$2y$10$wT.BP4n0Kwt1y6VeeXw5bOf4g6NymMWFpsfz3.lh9VaxXJVR4byl6', 'nenim@126.com', '13464196785', '先生', '193.30.46.230', '2020-04-27 08:25:38', '2020-04-27 08:25:38', NULL);
INSERT INTO `zfw_users` VALUES (32, 1, 'haliquid', '殷雪', '$2y$10$Cbgqyih7j5Dd0TgLTLHWL.LxONcGN1jGM7hNuTIw58FN2I2uZrKqa', 'voluptatum.perspiciatis@126.com', '13413657415', '先生', '219.44.205.0', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (33, 1, 'fugiat_esse', '辛毅', '$2y$10$1fNhhC6GtmPlD5qXSGqJru56IpM.mqFoz4PR.XQyRt2By1zEPuW/m', 'deleniti25@qq.com', '15050368133', '女士', '165.128.247.61', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (34, 1, 'omnis63', '植学明', '$2y$10$puM4uDlv1KdO7wRpgoFBVOT4Vwt.A37zfoZ8qWQTrjGVu54HO5I6e', 'ut.recusandae@yahoo.com', '13928672784', '女士', '136.19.106.81', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (35, 1, 'debitis_est', '叶琳', '$2y$10$OIBwiuzWJ9ddIWTPCWuQce24M176Ed6exYmmhohiW.tgPXbgAZJ0K', 'npraesentium@gmail.com', '15604718856', '先生', '8.95.189.209', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (36, 1, 'eveniet38', '鲁桂荣', '$2y$10$lz5K4i1uNQWfpHldQF6ccuHJ3KygRtwCWAQYqn.mlQ64UwJv8aHu.', 'tnon@qq.com', '18479432819', '女士', '179.51.156.125', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (37, 1, 'voluptas81', '覃岩', '$2y$10$sECJ/V2irqCQ1QD.Eq6g9.Gg7k3z0vdjuig4IJLY.Q2/EEelCc03G', 'reiciendis_voluptatem@qq.com', '14727574419', '女士', '70.179.81.227', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (38, 1, 'voluptatum.ducimus', '宁明', '$2y$10$Ab49oAKDePeU9X9cZ.JDC.NbcbVuxKYe1RlvqKKAJBh7.rdDgjkvG', 'sequi_eaque@gmail.com', '13157970579', '先生', '62.224.217.164', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (39, 1, 'delectus88', '糜依琳', '$2y$10$mM3mdhId48PMB2Uia8buteAfbbD8cnsdP3Kqi6o2JhNQQXrO2AfGm', 'iusto_atque@gmail.com', '18496621103', '女士', '6.203.5.211', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (40, 1, 'est77', '晋昱然', '$2y$10$njo/5LBaK7jTC/hPaG6WbO01LWXWfftVp/XukTLlhNTz5DJWnbPci', 'sint.itaque@163.com', '18679657762', '女士', '215.238.203.76', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (41, 1, 'quam_tempore', '邓建国', '$2y$10$n54BLO/6S0ikTM77au.fAOT6J8Ix6sExi2zd9Gjc1SQvdG.36BOua', 'nesciunt98@yahoo.com', '18506448937', '女士', '206.198.161.239', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (42, 1, 'eveniet65', '辜君', '$2y$10$2y4oCU3RFt3kVi4FWza2/edKqeSi6fdvGhrHEHgu2Y7LpIA76K9fu', 'net@126.com', '18365496647', '女士', '156.230.248.9', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (43, 1, 'amet_officiis', '段飞', '$2y$10$8e7uWajXzdi07LCT/SCAPutoTOlKo2MPOwdgG7BQVVspzxXlBMUNm', 'tmaxime@126.com', '17070055976', '女士', '25.231.181.237', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (44, 1, 'oea', '苑智渊', '$2y$10$1q3wV37qUtdcM.eN30AbmO56GGi8y4aGwFZgY9hoMElbZZjwdC3Ci', 'perspiciatis_molestiae@sina.com', '15826852549', '女士', '102.164.222.224', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (45, 1, 'suscipit.dolor', '明明', '$2y$10$q./2M2SyI.VWRc6Z.ELVAOlJ0EdZPobKCcNhckLAwo/wYgqWNUns.', 'a.rem@hotmail.com', '18571906218', '女士', '225.33.67.138', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (46, 1, 'deserunt07', '竺勇', '$2y$10$iDkKJDNzIRG4.H3Rr38yZu8iAWX0JW3R1L7auZ/t8Of5JHxpDYq0O', 'est51@qq.com', '18861405898', '先生', '189.46.169.162', '2020-04-27 08:25:39', '2020-04-27 08:25:39', NULL);
INSERT INTO `zfw_users` VALUES (47, 1, 'sit_ipsam', '程智勇', '$2y$10$F1XwSBA2Z94MS1iHtjE7lOpIZeswqEka9isTbrP3prMLVYHahbr0y', 'zest@163.com', '17070867091', '先生', '57.220.121.56', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (48, 1, 'ddolores', '武丹丹', '$2y$10$vaSRYswd8wG/gWPXBXRX5O0uQiq/2XZMzNM4Zse3cvf4qtUyzB.4K', 'reprehenderit_odit@qq.com', '18070605082', '先生', '218.176.252.84', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (49, 1, 'hfacilis', '席桂芬', '$2y$10$s5IvPOmTVCxPQjk08l2AmuJUfumJehtwWo9pN1wwCfCxtxEXhs5.2', 'magni71@yahoo.com', '18660998944', '先生', '104.221.3.90', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (50, 1, 'uunde', '许建华', '$2y$10$EO7sXkMWI2NwZHkW3GrOfeqiMvYjg.ARciYJI1we6AxLkBrGXz74m', 'tex@yahoo.com', '17193345025', '女士', '84.85.247.250', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (51, 1, 'vel_officiis', '颜慧', '$2y$10$3Xw1M1Tg3a2hQWrsdcgzA.Rxahrt4/PUACsGsWtkgCEWGw.TSFhse', 'reprehenderit_consequatur@sohu.com', '13809687413', '女士', '190.119.59.122', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (52, 1, 'id12', '邹桂花', '$2y$10$Lixdhd1DpJ9xFOw01H5JleGd1NoDtTqeR5ugXCeIzDw6IgJ5dePnG', 'possimus_corrupti@hotmail.com', '17011083697', '先生', '19.134.117.243', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (53, 1, 'sid', '范正豪', '$2y$10$RIIQACYd.igiT8VZm/WWRe3RINmp8jgiFw3mWPC4DnPQTAnlhoVdm', 'yveniam@gmail.com', '17054832376', '先生', '41.9.159.111', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (54, 1, 'culpa.ab', '司楼', '$2y$10$eayLrCqZ98n0cfArMlXF/urCJdav.hlPMx9v2m4JN2NtapuK92XGC', 'veniam.qui@126.com', '17051049485', '女士', '128.195.38.172', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (55, 1, 'mvoluptatem', '都正诚', '$2y$10$0SW4nGYBskDa8gYdh1Pdhe74JG0lOpJEcy6Zh7uL5exX/KiVIswqi', 'dolorem75@yahoo.com', '13337392898', '女士', '240.137.7.147', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (56, 1, 'dolor_perspiciatis', '邵冬梅', '$2y$10$WayxbYPSeuHR.//hgaaCK.V7e9HX.90OFYA3Gaqvg4xWiBn64/nBy', 'ydoloribus@163.com', '15724547460', '先生', '51.114.253.45', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (57, 1, 'wdelectus', '梁秀华', '$2y$10$bK9H8KyBcN84dn1F8wWYZOr9Og7hzBLge51UE11GnVHFZSlQZBJoy', 'amolestiae@126.com', '15095805525', '女士', '48.169.22.118', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (58, 1, 'omnis.velit', '季君', '$2y$10$pKdh1meKa1mgH/V7Wt6n0eDqglIHhG3mwjTrGrBpmBn0Y0ngJ1nPG', 'gquia@hotmail.com', '17647494229', '女士', '124.126.92.134', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (59, 1, 'sed.dolor', '冼毅', '$2y$10$naZHiKR9Jb4b8mOeEjzRje44wtyJhCPngADmx8ehw0ZNgGoWFUjpu', 'qui_voluptatem@163.com', '18651309209', '先生', '127.69.8.101', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (60, 1, 'hvoluptatem', '顾桂芳', '$2y$10$5ArCOSWt/Y5o5ZixO48WRuVOJiB9qfpH128nXEIFTNpA4sngqG7te', 'aut90@163.com', '13703361296', '先生', '207.150.237.78', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (61, 1, 'ipsum.ea', '曹磊', '$2y$10$FiMwSKn3Y6XAFyWhNtC9DehNUSUBmgFD3rVOD25EXUHs8qOstSygm', 'repellat33@gmail.com', '17078745914', '先生', '166.139.62.165', '2020-04-27 08:25:40', '2020-04-27 08:25:40', NULL);
INSERT INTO `zfw_users` VALUES (62, 1, 'explicabo89', '沿帅', '$2y$10$WiqlGh9D7nuBZktfNxLKeOmyUIOL76EEesicZc6umU9Gi3U37m8pK', 'nisi98@hotmail.com', '17077117777', '女士', '179.205.159.16', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (63, 1, 'doloribus50', '毕春梅', '$2y$10$mNsSsYqQr94UaO9TR3c8kOGH4iaBx1ghoP1CI9TjlNoCrArwoR2pC', 'soluta.enim@126.com', '17630040092', '先生', '57.214.97.31', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (64, 1, 'accusantium.asperiores', '秦霞', '$2y$10$0ZCaGWrXh.coOEmRG.4FJOsHGq4NCM94veZZ3eA2dQ5ubnIYCMePC', 'bquis@gmail.com', '17094992353', '女士', '37.233.45.237', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (65, 1, 'est_ea', '卓桂花', '$2y$10$TeXi/JgTy3ySVzpgFqTwTeVhCnGDlVArrR8Px8bW2bRywGxuTdRzC', 'assumenda.corrupti@gmail.com', '14591436745', '先生', '204.141.216.25', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (66, 1, 'harum42', '陶淑珍', '$2y$10$7LtwH69kBYE9//XD9opzwe0DB20ile4fbGIfiVeoEygoEBwnFIjPi', 'accusantium_fugiat@qq.com', '17051848767', '女士', '12.215.82.155', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (67, 1, 'crerum', '卜志新', '$2y$10$xFCDRVZRuMCQHCHT23oYY.xMtVMV/4yFbGWvbZr6dzl0Kd1ni.bZG', 'pab@gmail.com', '15160027629', '先生', '199.118.203.152', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (68, 1, 'aut.ipsa', '盛建', '$2y$10$1adWnUuJ6GC9pI/SHIRkHerXV7yNC4i7HyhzHSK8NPlrU/NHvYaa6', 'velit_non@gmail.com', '13707516888', '女士', '170.8.99.151', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (69, 1, 'quia_enim', '薛磊', '$2y$10$IOboJOhu79D7ATyb5c9x1.My/KkDfaRn925MGP9.9/7/gdLjLdHdC', 'distinctio.adipisci@gmail.com', '15260388171', '女士', '184.17.178.222', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (70, 1, 'wearum', '向丽华', '$2y$10$EywTwZQFZbKiLoX1DQPUHu/ekbkzT7DNTPIOFDSM4rdjcDZASdRxq', 'zunde@yahoo.com', '13976380983', '先生', '23.200.79.83', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (71, 1, 'odio67', '覃涛', '$2y$10$mzpBR1MXGpltCnpAI6/8F.dmAHIasx.GwznDgoQhy/DiLp67eR4Y.', 'voluptas_mollitia@sohu.com', '13114186808', '女士', '125.96.10.22', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (72, 1, 'qui.consequatur', '苟雪', '$2y$10$ylh9mPtBNTlkE6wAyXy4luD7L3edVB3q8ee/jQ743oBqR6b3vIOY2', 'quia.sint@qq.com', '18837502233', '先生', '74.165.107.30', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (73, 1, 'quis_commodi', '原桂英', '$2y$10$p3cTE.NGVeLdLKB0EA80Ou.c4IzhWI3UbEMJrY3hCGYctnw1MTx1i', 'voluptatem99@yahoo.com', '13391874377', '先生', '195.143.120.14', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (74, 1, 'sit64', '廉兵', '$2y$10$jpwTX7gDNvOemuT.omxELOL5BM7oCB8Q5VpplmhdBKDTUlmVzl2xW', 'voluptate.asperiores@163.com', '13916168019', '女士', '92.192.0.111', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (75, 1, 'quisquam77', '聂雪梅', '$2y$10$UlERf4Gfr/aedEUHhtBftOCBf/N3JJnNH8Z3uGickX4eyT1a0l3QG', 'eveniet.enim@qq.com', '18956319054', '先生', '56.213.46.94', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (76, 1, 'doloribus.accusantium', '高利', '$2y$10$4brp8V8gAEUXy3ay77NTo.K.JwvfZvbgZ5CLHOXt2SZ/zXvE1VE5.', 'sint89@yahoo.com', '13984924451', '女士', '44.21.41.60', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (77, 1, 'sunt75', '常伟', '$2y$10$e/D5zO9k01x8g5x9Z2QaDuJOal3/oSmV6z7ITg18/McVcyaDzA.Wy', 'sdicta@sohu.com', '15940266568', '先生', '224.172.117.35', '2020-04-27 08:25:41', '2020-04-27 08:25:41', NULL);
INSERT INTO `zfw_users` VALUES (78, 1, 'non02', '章晨', '$2y$10$SSy5wvslOaEK/Y/O6p4INOdRj/OBNYCXthnxidqlvvyMsmm63lNwi', 'enim.laudantium@126.com', '15193641248', '先生', '234.74.137.36', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (79, 1, 'set', '芦浩', '$2y$10$Jw7M1S6s21JFaDHmrS95R.q1C74SZrMq7RxpXtaoqdWiHSZz4baF2', 'veritatis_provident@163.com', '15821151380', '先生', '162.73.213.112', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (80, 1, 'perspiciatis_maiores', '安建明', '$2y$10$g7fk3nzrrXMcTg3mQP.AZuI/bbRDPr4SiQWDv.jTt18VQpJPKOkBa', 'perspiciatis.voluptatum@gmail.com', '17749469036', '先生', '173.15.66.7', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (81, 1, 'gharum', '莫志勇', '$2y$10$TgKilKhYRcCtwX.KDNtEJ.9wAPxbWK7ADgw3qGmu9EhBgc3okxRtu', 'ex04@hotmail.com', '15863013717', '先生', '148.36.65.18', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (82, 1, 'eum.ex', '方辉', '$2y$10$9L0aZN.v9UmP4v24csZILOTWgIHPZYoHOA0IfGpOXq9cALkSAEQKO', 'mmagnam@sina.com', '14506452884', '先生', '253.103.180.161', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (83, 1, 'minima.qui', '戚正豪', '$2y$10$x2t0bU8CLoHtl6uR2QQqlOxJncM22b.it0uMCZatFKpPshT7NKL4S', 'praesentium_esse@gmail.com', '17052663403', '女士', '45.132.152.245', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (84, 1, 'eligendi_doloribus', '吕华', '$2y$10$PECEEybJ.vuNb.eczFB9mua3WPgda2W2LEwkTLGpS8yyPvFQK/jsi', 'aut_quis@sohu.com', '15116101063', '先生', '252.44.222.159', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (85, 1, 'mquod', '丁宁', '$2y$10$cJENw9nh.Dq37Q6V3w1c2O/u0Afi8KOyhld4WxxJT4MvjMyRFZbvq', 'minima47@sina.com', '18180770896', '先生', '114.148.42.21', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (86, 1, 'voluptas.impedit', '彭淑珍', '$2y$10$V3OAP2FckgFbkkN4.RYwQ.L.8GOAqg7QcuFwvVcQVQdR8wPGDHoLG', 'et00@126.com', '18160953047', '先生', '120.119.234.118', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (87, 1, 'autem.impedit', '边学明', '$2y$10$n/Lhe0FCt8TsYWNUIHo0wuGhnqhsuMTZTgMcYefw3BV80lTQFSnX6', 'in.hic@yahoo.com', '13954873480', '先生', '70.241.38.198', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (88, 1, 'vvoluptas', '颜丽', '$2y$10$e9Rf7MHCwg3LFmQSU0yyiOGXZ7JDdHHhRHOGTuCdEdYjSug21LzDa', 'itaque_nulla@hotmail.com', '13933989665', '女士', '2.65.15.8', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (89, 1, 'eos.quia', '祁致远', '$2y$10$aVWyIwV1HJ8ZNTaCi7ZcBOgLGtTYa/hIqgXL9EesAA6eBFAVyt6fe', 'dolorum_aperiam@gmail.com', '13612135673', '先生', '159.251.9.215', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (90, 1, 'ket', '吴鑫', '$2y$10$IcoNKWQC2xGNIlvOOOtesusExHpzZrIXQk2CwlmqdxrAiqlQ5Xneu', 'rerum.quibusdam@163.com', '13975178114', '先生', '54.127.109.63', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (91, 1, 'est_sit', '竺军', '$2y$10$kEIdTlttIFqVR/fRYqFtJO7vRxVHcSrVlDawFcApboLRcdQ7Vb7iq', 'aut.enim@hotmail.com', '17094391398', '先生', '179.22.151.77', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (92, 1, 'bquidem', '赵志明', '$2y$10$ZYx/dhwtLERqjB5hHNbm9eBWBMgQ14VRayXMKXQY6ZN62bShP.YK2', 'omnis_velit@gmail.com', '18461456714', '女士', '151.201.103.164', '2020-04-27 08:25:42', '2020-04-27 08:25:42', NULL);
INSERT INTO `zfw_users` VALUES (93, 1, 'recusandae21', '宫帅', '$2y$10$abgoLUzpQN1V3g5wW6CYgOOjks.P0pJge3txCXj9zy8hPQFrTZV/i', 'rcumque@qq.com', '18424356679', '女士', '1.104.187.244', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);
INSERT INTO `zfw_users` VALUES (94, 1, 'paut', '涂文君', '$2y$10$WPIdLJsWuOgHvqrNdwftLuOxxugOKKpIor2L7U89G2rrgaczLY2H6', 'iusto_deleniti@gmail.com', '15239290566', '先生', '95.193.219.247', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);
INSERT INTO `zfw_users` VALUES (95, 1, 'sunt.reiciendis', '鞠明', '$2y$10$HdXXKL.dUe8bhvmBYQdXuujWzScqO5LpXLkGYcoBd9apS/86lcQYu', 'ydolor@126.com', '18304297325', '先生', '91.45.53.35', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);
INSERT INTO `zfw_users` VALUES (96, 1, 'illum_rem', '路嘉俊', '$2y$10$Cu9RM8FgSW6AzCRDsAEtgukbAj.tPw6kg6SEm02cWi8lJdrEup3lm', 'get@gmail.com', '17878729919', '女士', '95.212.41.29', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);
INSERT INTO `zfw_users` VALUES (97, 1, 'xlibero', '季致远', '$2y$10$kNq2.8ze3C2IiXCiEBo3yO.4capPZK5zi/at0V8rI36AA5WjvPs1m', 'esse72@qq.com', '18068956105', '女士', '106.157.136.193', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);
INSERT INTO `zfw_users` VALUES (98, 1, 'incidunt.modi', '姬玉', '$2y$10$dXx7cJcc78gAeCo3.IwgkO0dE6/O5ImWWc0HtXznweTIe6kMiFaQ.', 'id_veniam@126.com', '17094765128', '先生', '4.29.227.65', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);
INSERT INTO `zfw_users` VALUES (99, 1, 'adipisci.reprehenderit', '童秀华', '$2y$10$/TvJdw1QU6UhqCKTZ1fCfO.JwSY/x3YnsRfY9t9cS5UHPSIHL1IBi', 'molestias.nemo@gmail.com', '13639331201', '女士', '231.145.201.8', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);
INSERT INTO `zfw_users` VALUES (100, 1, 'rem07', '畅雪', '$2y$10$w3mHv2.KW1qKr3eacTYax.olcoKlB7IOMQUIumFC7GIRVOFDIZgFe', 'asperiores_quod@hotmail.com', '13800175497', '先生', '246.31.164.152', '2020-04-27 08:25:43', '2020-04-27 08:25:43', NULL);

SET FOREIGN_KEY_CHECKS = 1;
