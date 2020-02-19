/*
Navicat MySQL Data Transfer

Source Server         : gm58river
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : eventszim

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-02-19 10:24:54
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for audits
-- ----------------------------
DROP TABLE IF EXISTS `audits`;
CREATE TABLE `audits` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `event` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auditable_id` bigint(20) unsigned NOT NULL,
  `old_values` text COLLATE utf8mb4_unicode_ci,
  `new_values` text COLLATE utf8mb4_unicode_ci,
  `url` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` varchar(1023) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tags` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audits_auditable_type_auditable_id_index` (`auditable_type`,`auditable_id`),
  KEY `audits_user_id_user_type_index` (`user_id`,`user_type`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of audits
-- ----------------------------
INSERT INTO `audits` VALUES ('1', null, null, 'deleted', 'App\\Orders', '1', '{\"id\":1,\"user_id\":\"1579611855757\",\"category_id\":\"1\",\"quantity\":1,\"reference\":null,\"status\":\"0\"}', '[]', 'http://127.0.0.1:9092/api/orders/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:13:25', '2020-01-24 19:13:25');
INSERT INTO `audits` VALUES ('2', null, null, 'created', 'App\\Orders', '3', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":3}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:17:14', '2020-01-24 19:17:14');
INSERT INTO `audits` VALUES ('3', null, null, 'created', 'App\\Orders', '4', '[]', '{\"category_id\":\"10\",\"quantity\":\"2\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":4}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:31:56', '2020-01-24 19:31:56');
INSERT INTO `audits` VALUES ('4', null, null, 'created', 'App\\Customer', '4', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"yyyyyyyyy\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":4}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:40:05', '2020-01-24 19:40:05');
INSERT INTO `audits` VALUES ('5', null, null, 'created', 'App\\Customer', '5', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"ttttttttttt\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"10\",\"id\":5}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:40:05', '2020-01-24 19:40:05');
INSERT INTO `audits` VALUES ('6', null, null, 'created', 'App\\Customer', '6', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"hhhhhhhhhhhhhh\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"10\",\"id\":6}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:40:05', '2020-01-24 19:40:05');
INSERT INTO `audits` VALUES ('7', null, null, 'created', 'App\\PaymentDetails', '1', '[]', '{\"user_id\":\"1579611855757\",\"order_id\":1579894845,\"contact\":null,\"email\":null,\"id\":1}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:40:47', '2020-01-24 19:40:47');
INSERT INTO `audits` VALUES ('8', null, null, 'created', 'App\\Payments', '1', '[]', '{\"order_ref\":1579894845,\"amount\":2003,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=ae0a08a7-e2ad-43fc-888c-c0424daefa32\",\"id\":1}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:40:47', '2020-01-24 19:40:47');
INSERT INTO `audits` VALUES ('9', null, null, 'created', 'App\\Orders', '5', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":5}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 19:49:59', '2020-01-24 19:49:59');
INSERT INTO `audits` VALUES ('10', null, null, 'created', 'App\\PaymentDetails', '2', '[]', '{\"user_id\":\"1579611855757\",\"order_id\":1579896157,\"contact\":\"88882222222222\",\"email\":\"emuroiwa@gmail.com\",\"id\":2}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:02:40', '2020-01-24 20:02:40');
INSERT INTO `audits` VALUES ('11', null, null, 'created', 'App\\Payments', '2', '[]', '{\"order_ref\":1579896157,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=13a08843-ef38-4c37-bbda-0296d5f6d1a6\",\"id\":2}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:02:41', '2020-01-24 20:02:41');
INSERT INTO `audits` VALUES ('12', null, null, 'created', 'App\\Orders', '6', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":6}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:03:32', '2020-01-24 20:03:32');
INSERT INTO `audits` VALUES ('13', null, null, 'created', 'App\\Orders', '1', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":1}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:31:08', '2020-01-24 20:31:08');
INSERT INTO `audits` VALUES ('14', null, null, 'created', 'App\\Customer', '1', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Ernest Muroiwa\",\"contact\":\"32323323\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":1}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:33:14', '2020-01-24 20:33:14');
INSERT INTO `audits` VALUES ('15', null, null, 'created', 'App\\PaymentDetails', '1', '[]', '{\"user_id\":\"1579611855757\",\"order_id\":1579898002,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":1}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:33:28', '2020-01-24 20:33:28');
INSERT INTO `audits` VALUES ('16', null, null, 'created', 'App\\Payments', '1', '[]', '{\"order_ref\":1579898002,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=42c0b3c3-7f3d-4201-84ef-58a071182c43\",\"id\":1}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:33:28', '2020-01-24 20:33:28');
INSERT INTO `audits` VALUES ('17', null, null, 'created', 'App\\Orders', '2', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":2}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:38:02', '2020-01-24 20:38:02');
INSERT INTO `audits` VALUES ('18', null, null, 'created', 'App\\Orders', '3', '[]', '{\"category_id\":\"2\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":3}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:39:23', '2020-01-24 20:39:23');
INSERT INTO `audits` VALUES ('19', null, null, 'created', 'App\\Customer', '2', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Ernest Muroiwa\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":2}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:41:09', '2020-01-24 20:41:09');
INSERT INTO `audits` VALUES ('20', null, null, 'created', 'App\\Customer', '3', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"3671564731\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"2\",\"id\":3}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:41:09', '2020-01-24 20:41:09');
INSERT INTO `audits` VALUES ('21', null, null, 'created', 'App\\Orders', '4', '[]', '{\"category_id\":\"12\",\"quantity\":\"2\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":4}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-24 20:41:59', '2020-01-24 20:41:59');
INSERT INTO `audits` VALUES ('22', null, null, 'created', 'App\\Orders', '5', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":5}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 04:57:35', '2020-01-25 04:57:35');
INSERT INTO `audits` VALUES ('23', null, null, 'created', 'App\\Orders', '6', '[]', '{\"category_id\":\"6\",\"quantity\":\"2\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":6}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:00:55', '2020-01-25 05:00:55');
INSERT INTO `audits` VALUES ('24', null, null, 'created', 'App\\Orders', '7', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":7}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:08:03', '2020-01-25 05:08:03');
INSERT INTO `audits` VALUES ('25', null, null, 'created', 'App\\Orders', '8', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":8}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:09:17', '2020-01-25 05:09:17');
INSERT INTO `audits` VALUES ('26', null, null, 'created', 'App\\Orders', '9', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":9}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:11:55', '2020-01-25 05:11:55');
INSERT INTO `audits` VALUES ('27', null, null, 'created', 'App\\Orders', '10', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":10}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:24:05', '2020-01-25 05:24:05');
INSERT INTO `audits` VALUES ('28', null, null, 'deleted', 'App\\Orders', '10', '{\"id\":10,\"user_id\":\"1579611855757\",\"category_id\":\"1\",\"quantity\":1,\"reference\":null,\"status\":\"0\"}', '[]', 'http://127.0.0.1:9092/api/orders/10', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:26:48', '2020-01-25 05:26:48');
INSERT INTO `audits` VALUES ('29', null, null, 'created', 'App\\Orders', '1', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":1}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:28:54', '2020-01-25 05:28:54');
INSERT INTO `audits` VALUES ('30', null, null, 'created', 'App\\Customer', '1', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Ernest Muroiwa\",\"contact\":\"892398932\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":1}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:29:19', '2020-01-25 05:29:19');
INSERT INTO `audits` VALUES ('31', null, null, 'deleted', 'App\\Orders', '1', '{\"id\":1,\"user_id\":\"1579611855757\",\"category_id\":\"1\",\"quantity\":1,\"reference\":null,\"status\":\"0\"}', '[]', 'http://127.0.0.1:9092/api/orders/1', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:29:31', '2020-01-25 05:29:31');
INSERT INTO `audits` VALUES ('32', null, null, 'created', 'App\\Orders', '2', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":2}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:30:23', '2020-01-25 05:30:23');
INSERT INTO `audits` VALUES ('33', null, null, 'created', 'App\\Orders', '3', '[]', '{\"category_id\":\"2\",\"quantity\":\"2\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":3}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:30:28', '2020-01-25 05:30:28');
INSERT INTO `audits` VALUES ('34', null, null, 'created', 'App\\Customer', '2', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Ernest Muroiwa\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":2}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:32:58', '2020-01-25 05:32:58');
INSERT INTO `audits` VALUES ('35', null, null, 'created', 'App\\Customer', '3', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"3671564731\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"2\",\"id\":3}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:32:58', '2020-01-25 05:32:58');
INSERT INTO `audits` VALUES ('36', null, null, 'created', 'App\\Customer', '4', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"selectedEvent\",\"contact\":\"88939983\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"2\",\"id\":4}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:32:58', '2020-01-25 05:32:58');
INSERT INTO `audits` VALUES ('37', null, null, 'created', 'App\\Orders', '4', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":4}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:37:27', '2020-01-25 05:37:27');
INSERT INTO `audits` VALUES ('38', null, null, 'created', 'App\\Customer', '5', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Ernest Muroiwa\",\"contact\":\"0774002797\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":5}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 05:57:02', '2020-01-25 05:57:02');
INSERT INTO `audits` VALUES ('39', null, null, 'created', 'App\\Orders', '1', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":1}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:24:06', '2020-01-25 07:24:06');
INSERT INTO `audits` VALUES ('40', null, null, 'created', 'App\\Customer', '1', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"Liam Muroiwa\",\"contact\":\"099999\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":1}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:24:27', '2020-01-25 07:24:27');
INSERT INTO `audits` VALUES ('41', null, null, 'created', 'App\\PaymentDetails', '1', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1579937076,\"contact\":\"3671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":1}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:24:37', '2020-01-25 07:24:37');
INSERT INTO `audits` VALUES ('42', null, null, 'created', 'App\\Payments', '1', '[]', '{\"order_ref\":1579937076,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=5440501e-3432-46b9-b33d-0e250426519a\",\"id\":1}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:24:37', '2020-01-25 07:24:37');
INSERT INTO `audits` VALUES ('43', null, null, 'created', 'App\\Orders', '2', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":2}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:26:14', '2020-01-25 07:26:14');
INSERT INTO `audits` VALUES ('44', null, null, 'created', 'App\\Orders', '3', '[]', '{\"category_id\":\"11\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":3}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:26:26', '2020-01-25 07:26:26');
INSERT INTO `audits` VALUES ('45', null, null, 'created', 'App\\Customer', '2', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"Ernest Muroiwa\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":2}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:27:03', '2020-01-25 07:27:03');
INSERT INTO `audits` VALUES ('46', null, null, 'created', 'App\\Customer', '3', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"3671564731\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Veteran (40 - 49)\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"11\",\"id\":3}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:27:03', '2020-01-25 07:27:03');
INSERT INTO `audits` VALUES ('47', null, null, 'created', 'App\\PaymentDetails', '2', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1579937291,\"contact\":\"3671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":2}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:28:12', '2020-01-25 07:28:12');
INSERT INTO `audits` VALUES ('48', null, null, 'created', 'App\\Payments', '2', '[]', '{\"order_ref\":1579937291,\"amount\":2,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=f22885f1-03ec-4c15-9960-e8ff39628897\",\"id\":2}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:28:12', '2020-01-25 07:28:12');
INSERT INTO `audits` VALUES ('49', null, null, 'created', 'App\\Orders', '4', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":4}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:29:31', '2020-01-25 07:29:31');
INSERT INTO `audits` VALUES ('50', null, null, 'created', 'App\\Orders', '5', '[]', '{\"category_id\":\"11\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":5}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:29:37', '2020-01-25 07:29:37');
INSERT INTO `audits` VALUES ('51', null, null, 'created', 'App\\Customer', '4', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"Ernest Muroiwa\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":4}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:30:11', '2020-01-25 07:30:11');
INSERT INTO `audits` VALUES ('52', null, null, 'created', 'App\\Customer', '5', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"3671564731\",\"contact\":\"3671564731\",\"order_id\":\"11111\",\"marathon_type\":\"Veteran (40 - 49)\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"female\",\"event_id\":\"11\",\"id\":5}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:30:11', '2020-01-25 07:30:11');
INSERT INTO `audits` VALUES ('53', null, null, 'created', 'App\\PaymentDetails', '3', '[]', '{\"user_id\":\"1579514044177\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1579937419,\"contact\":\"3671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":3}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:30:20', '2020-01-25 07:30:20');
INSERT INTO `audits` VALUES ('54', null, null, 'created', 'App\\Payments', '3', '[]', '{\"order_ref\":1579937419,\"amount\":2,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=df6e8494-d5f9-410a-869b-0826cd08c9da\",\"id\":3}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 07:30:20', '2020-01-25 07:30:20');
INSERT INTO `audits` VALUES ('55', null, null, 'created', 'App\\Orders', '6', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":6}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 19:03:59', '2020-01-25 19:03:59');
INSERT INTO `audits` VALUES ('56', null, null, 'created', 'App\\Orders', '7', '[]', '{\"category_id\":\"2\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":7}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 19:19:26', '2020-01-25 19:19:26');
INSERT INTO `audits` VALUES ('57', null, null, 'created', 'App\\Orders', '8', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579514044177\",\"status\":0,\"id\":8}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36 Edg/79.0.309.71', null, '2020-01-25 19:19:48', '2020-01-25 19:19:48');
INSERT INTO `audits` VALUES ('58', null, null, 'created', 'App\\Orders', '9', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":9}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-25 20:30:10', '2020-01-25 20:30:10');
INSERT INTO `audits` VALUES ('59', null, null, 'created', 'App\\Orders', '10', '[]', '{\"category_id\":\"8\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":10}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Mobile Safari/537.36', null, '2020-01-26 05:32:27', '2020-01-26 05:32:27');
INSERT INTO `audits` VALUES ('60', null, null, 'created', 'App\\Orders', '11', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":11}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-26 18:39:08', '2020-01-26 18:39:08');
INSERT INTO `audits` VALUES ('61', null, null, 'created', 'App\\Orders', '12', '[]', '{\"category_id\":\"8\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":12}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-27 13:52:25', '2020-01-27 13:52:25');
INSERT INTO `audits` VALUES ('62', null, null, 'created', 'App\\PaymentDetails', '4', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1580133153,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":4}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-27 13:52:35', '2020-01-27 13:52:35');
INSERT INTO `audits` VALUES ('63', null, null, 'created', 'App\\Payments', '4', '[]', '{\"order_ref\":1580133153,\"amount\":500,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=d5c04aad-fa37-4b31-8d7e-b45c7e2124d4\",\"id\":4}', 'http://127.0.0.1:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-27 13:52:35', '2020-01-27 13:52:35');
INSERT INTO `audits` VALUES ('64', null, null, 'created', 'App\\Orders', '13', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":13}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-27 14:59:28', '2020-01-27 14:59:28');
INSERT INTO `audits` VALUES ('65', null, null, 'created', 'App\\Orders', '14', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":14}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-27 15:06:53', '2020-01-27 15:06:53');
INSERT INTO `audits` VALUES ('66', null, null, 'created', 'App\\Orders', '15', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":15}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-01-27 16:17:15', '2020-01-27 16:17:15');
INSERT INTO `audits` VALUES ('67', null, null, 'created', 'App\\Orders', '16', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":16}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.130 Safari/537.36', null, '2020-02-03 07:48:25', '2020-02-03 07:48:25');
INSERT INTO `audits` VALUES ('68', null, null, 'created', 'App\\Orders', '17', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":17}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:29:59', '2020-02-15 16:29:59');
INSERT INTO `audits` VALUES ('69', null, null, 'created', 'App\\Customer', '6', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"hdhg\",\"contact\":\"3983298\",\"order_id\":\"11111\",\"marathon_type\":\"Veteran (40 - 49)\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":6}', 'http://localhost:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:30:20', '2020-02-15 16:30:20');
INSERT INTO `audits` VALUES ('70', null, null, 'created', 'App\\PaymentDetails', '5', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581784230,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":5}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:30:35', '2020-02-15 16:30:35');
INSERT INTO `audits` VALUES ('71', null, null, 'created', 'App\\Payments', '5', '[]', '{\"order_ref\":1581784230,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=3ac4200a-21a2-4030-83df-a36e5ed9f30e\",\"id\":5}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:30:35', '2020-02-15 16:30:35');
INSERT INTO `audits` VALUES ('72', null, null, 'created', 'App\\Orders', '18', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":18}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:33:02', '2020-02-15 16:33:02');
INSERT INTO `audits` VALUES ('73', null, null, 'created', 'App\\Customer', '7', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Liam Muroiwa\",\"contact\":\"383931\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":7}', 'http://localhost:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:33:26', '2020-02-15 16:33:26');
INSERT INTO `audits` VALUES ('74', null, null, 'created', 'App\\PaymentDetails', '6', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581784419,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":6}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:33:41', '2020-02-15 16:33:41');
INSERT INTO `audits` VALUES ('75', null, null, 'created', 'App\\Payments', '6', '[]', '{\"order_ref\":1581784419,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=42a96c3b-bdb8-462f-93d3-a64ca1529252\",\"id\":6}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:33:41', '2020-02-15 16:33:41');
INSERT INTO `audits` VALUES ('76', null, null, 'created', 'App\\Orders', '19', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":19}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:37:32', '2020-02-15 16:37:32');
INSERT INTO `audits` VALUES ('77', null, null, 'created', 'App\\PaymentDetails', '7', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581784685,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":7}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:38:07', '2020-02-15 16:38:07');
INSERT INTO `audits` VALUES ('78', null, null, 'created', 'App\\Payments', '7', '[]', '{\"order_ref\":1581784685,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=360af1c6-32b4-4df2-9503-5b3b260c13c1\",\"id\":7}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:38:07', '2020-02-15 16:38:07');
INSERT INTO `audits` VALUES ('79', null, null, 'created', 'App\\PaymentDetails', '8', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581784950,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":8}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:42:31', '2020-02-15 16:42:31');
INSERT INTO `audits` VALUES ('80', null, null, 'created', 'App\\Payments', '8', '[]', '{\"order_ref\":1581784950,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=74c75593-fdf9-4f02-b9c5-f6e49579724d\",\"id\":8}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:42:31', '2020-02-15 16:42:31');
INSERT INTO `audits` VALUES ('81', null, null, 'created', 'App\\PaymentDetails', '9', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581784994,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":9}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:43:17', '2020-02-15 16:43:17');
INSERT INTO `audits` VALUES ('82', null, null, 'created', 'App\\Payments', '9', '[]', '{\"order_ref\":1581784994,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=36f3098a-3e4d-4219-80e9-ee86e9c9b6a5\",\"id\":9}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:43:17', '2020-02-15 16:43:17');
INSERT INTO `audits` VALUES ('83', null, null, 'created', 'App\\PaymentDetails', '10', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581785020,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":10}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:43:41', '2020-02-15 16:43:41');
INSERT INTO `audits` VALUES ('84', null, null, 'created', 'App\\Payments', '10', '[]', '{\"order_ref\":1581785020,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=ea6e7a14-d439-4ea5-b66b-69845ee3beee\",\"id\":10}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:43:41', '2020-02-15 16:43:41');
INSERT INTO `audits` VALUES ('85', null, null, 'created', 'App\\Orders', '20', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":20}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:45:36', '2020-02-15 16:45:36');
INSERT INTO `audits` VALUES ('86', null, null, 'created', 'App\\PaymentDetails', '11', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581785151,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":11}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:45:53', '2020-02-15 16:45:53');
INSERT INTO `audits` VALUES ('87', null, null, 'created', 'App\\Payments', '11', '[]', '{\"order_ref\":1581785151,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=060d87dd-fe01-4020-be73-9d1afa31bb4b\",\"id\":11}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:45:53', '2020-02-15 16:45:53');
INSERT INTO `audits` VALUES ('88', null, null, 'created', 'App\\Orders', '21', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":21}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:46:48', '2020-02-15 16:46:48');
INSERT INTO `audits` VALUES ('89', null, null, 'created', 'App\\PaymentDetails', '12', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581785219,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":12}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:47:00', '2020-02-15 16:47:00');
INSERT INTO `audits` VALUES ('90', null, null, 'created', 'App\\Payments', '12', '[]', '{\"order_ref\":1581785219,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=4e900c61-b96e-489f-9864-aa5e74a46b14\",\"id\":12}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:47:00', '2020-02-15 16:47:00');
INSERT INTO `audits` VALUES ('91', null, null, 'created', 'App\\Orders', '22', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":22}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:53:20', '2020-02-15 16:53:20');
INSERT INTO `audits` VALUES ('92', null, null, 'created', 'App\\PaymentDetails', '13', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581785612,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":13}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:53:32', '2020-02-15 16:53:32');
INSERT INTO `audits` VALUES ('93', null, null, 'created', 'App\\Payments', '13', '[]', '{\"order_ref\":1581785612,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=53e4714e-de01-4c94-a9ab-7c503db3ecab\",\"id\":13}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:53:32', '2020-02-15 16:53:32');
INSERT INTO `audits` VALUES ('94', null, null, 'created', 'App\\Orders', '23', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":23}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:56:28', '2020-02-15 16:56:28');
INSERT INTO `audits` VALUES ('95', null, null, 'created', 'App\\PaymentDetails', '14', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581785807,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":14}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:56:49', '2020-02-15 16:56:49');
INSERT INTO `audits` VALUES ('96', null, null, 'created', 'App\\Payments', '14', '[]', '{\"order_ref\":1581785807,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=17ae4bad-931d-4b91-8802-fa7b63edb32b\",\"id\":14}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:56:49', '2020-02-15 16:56:49');
INSERT INTO `audits` VALUES ('97', null, null, 'created', 'App\\Orders', '24', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":24}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:58:22', '2020-02-15 16:58:22');
INSERT INTO `audits` VALUES ('98', null, null, 'created', 'App\\PaymentDetails', '15', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581785917,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":15}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:58:38', '2020-02-15 16:58:38');
INSERT INTO `audits` VALUES ('99', null, null, 'created', 'App\\Payments', '15', '[]', '{\"order_ref\":1581785917,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=4653e2a3-7281-401b-98ea-5fae361735b7\",\"id\":15}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 16:58:38', '2020-02-15 16:58:38');
INSERT INTO `audits` VALUES ('100', null, null, 'created', 'App\\Orders', '25', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":25}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:00:47', '2020-02-15 17:00:47');
INSERT INTO `audits` VALUES ('101', null, null, 'created', 'App\\PaymentDetails', '16', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581786061,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":16}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:01:01', '2020-02-15 17:01:01');
INSERT INTO `audits` VALUES ('102', null, null, 'created', 'App\\Payments', '16', '[]', '{\"order_ref\":1581786061,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=eacef5f4-2b87-4760-86f8-497cd718a4bc\",\"id\":16}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:01:01', '2020-02-15 17:01:01');
INSERT INTO `audits` VALUES ('103', null, null, 'created', 'App\\Orders', '26', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":26}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:02:26', '2020-02-15 17:02:26');
INSERT INTO `audits` VALUES ('104', null, null, 'created', 'App\\PaymentDetails', '17', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581786156,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":17}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:02:37', '2020-02-15 17:02:37');
INSERT INTO `audits` VALUES ('105', null, null, 'created', 'App\\Payments', '17', '[]', '{\"order_ref\":1581786156,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=2a1b493a-c3a8-4d0d-9d62-b48b44f56ea9\",\"id\":17}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:02:37', '2020-02-15 17:02:37');
INSERT INTO `audits` VALUES ('106', null, null, 'created', 'App\\Orders', '27', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":27}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:03:30', '2020-02-15 17:03:30');
INSERT INTO `audits` VALUES ('107', null, null, 'created', 'App\\PaymentDetails', '18', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581786226,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":18}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:03:51', '2020-02-15 17:03:51');
INSERT INTO `audits` VALUES ('108', null, null, 'created', 'App\\Payments', '18', '[]', '{\"order_ref\":1581786226,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=272863c6-d3b4-4264-baea-42c2ebfa9a32\",\"id\":18}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:03:51', '2020-02-15 17:03:51');
INSERT INTO `audits` VALUES ('109', null, null, 'created', 'App\\Orders', '28', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":28}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:05:10', '2020-02-15 17:05:10');
INSERT INTO `audits` VALUES ('110', null, null, 'created', 'App\\PaymentDetails', '19', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581786319,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":19}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:05:20', '2020-02-15 17:05:20');
INSERT INTO `audits` VALUES ('111', null, null, 'created', 'App\\Payments', '19', '[]', '{\"order_ref\":1581786319,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=07efb1d9-3755-4ee1-bd09-9267f9ec67c7\",\"id\":19}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:05:20', '2020-02-15 17:05:20');
INSERT INTO `audits` VALUES ('112', null, null, 'created', 'App\\Orders', '29', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":29}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:06:00', '2020-02-15 17:06:00');
INSERT INTO `audits` VALUES ('113', null, null, 'created', 'App\\PaymentDetails', '20', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581786372,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":20}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:06:15', '2020-02-15 17:06:15');
INSERT INTO `audits` VALUES ('114', null, null, 'created', 'App\\Payments', '20', '[]', '{\"order_ref\":1581786372,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=92aae9b7-ecdb-4938-92b2-2ec1294abcc0\",\"id\":20}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:06:15', '2020-02-15 17:06:15');
INSERT INTO `audits` VALUES ('115', null, null, 'created', 'App\\Orders', '30', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":30}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:12:16', '2020-02-15 17:12:16');
INSERT INTO `audits` VALUES ('116', null, null, 'created', 'App\\PaymentDetails', '21', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581786787,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":21}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:13:12', '2020-02-15 17:13:12');
INSERT INTO `audits` VALUES ('117', null, null, 'created', 'App\\Payments', '21', '[]', '{\"order_ref\":1581786787,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=e7978964-1c33-493c-8fc5-08f9c2d57a0c\",\"id\":21}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:13:12', '2020-02-15 17:13:12');
INSERT INTO `audits` VALUES ('118', null, null, 'created', 'App\\Orders', '31', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":31}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:15:24', '2020-02-15 17:15:24');
INSERT INTO `audits` VALUES ('119', null, null, 'created', 'App\\PaymentDetails', '22', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581786936,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":22}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:15:38', '2020-02-15 17:15:38');
INSERT INTO `audits` VALUES ('120', null, null, 'created', 'App\\Payments', '22', '[]', '{\"order_ref\":1581786936,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=61fa548d-0e3a-434e-a005-0bddeef8975e\",\"id\":22}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:15:38', '2020-02-15 17:15:38');
INSERT INTO `audits` VALUES ('121', null, null, 'created', 'App\\Orders', '32', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":32}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:17:41', '2020-02-15 17:17:41');
INSERT INTO `audits` VALUES ('122', null, null, 'created', 'App\\PaymentDetails', '23', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581787078,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":23}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:17:59', '2020-02-15 17:17:59');
INSERT INTO `audits` VALUES ('123', null, null, 'created', 'App\\Payments', '23', '[]', '{\"order_ref\":1581787078,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=ae4d66ae-4099-49ed-a894-d18eb9fb74f6\",\"id\":23}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:17:59', '2020-02-15 17:17:59');
INSERT INTO `audits` VALUES ('124', null, null, 'created', 'App\\Orders', '33', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":33}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:19:58', '2020-02-15 17:19:58');
INSERT INTO `audits` VALUES ('125', null, null, 'created', 'App\\PaymentDetails', '24', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581787211,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":24}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:20:15', '2020-02-15 17:20:15');
INSERT INTO `audits` VALUES ('126', null, null, 'created', 'App\\Payments', '24', '[]', '{\"order_ref\":1581787211,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=47d8918a-ffef-427c-bbcf-c1da96962b42\",\"id\":24}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:20:15', '2020-02-15 17:20:15');
INSERT INTO `audits` VALUES ('127', null, null, 'created', 'App\\Orders', '34', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":34}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:20:51', '2020-02-15 17:20:51');
INSERT INTO `audits` VALUES ('128', null, null, 'created', 'App\\PaymentDetails', '25', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581787263,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":25}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:21:04', '2020-02-15 17:21:04');
INSERT INTO `audits` VALUES ('129', null, null, 'created', 'App\\Payments', '25', '[]', '{\"order_ref\":1581787263,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=aa644a6d-e9e0-48dc-bf93-d9b421165df7\",\"id\":25}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:21:04', '2020-02-15 17:21:04');
INSERT INTO `audits` VALUES ('130', null, null, 'created', 'App\\Orders', '35', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":35}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:23:46', '2020-02-15 17:23:46');
INSERT INTO `audits` VALUES ('131', null, null, 'created', 'App\\PaymentDetails', '26', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581787446,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":26}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:24:08', '2020-02-15 17:24:08');
INSERT INTO `audits` VALUES ('132', null, null, 'created', 'App\\Payments', '26', '[]', '{\"order_ref\":1581787446,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=6fc1748a-2f29-49b3-b8dd-f0fa61b860eb\",\"id\":26}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:24:08', '2020-02-15 17:24:08');
INSERT INTO `audits` VALUES ('133', null, null, 'created', 'App\\Orders', '36', '[]', '{\"category_id\":\"5\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":36}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:24:34', '2020-02-15 17:24:34');
INSERT INTO `audits` VALUES ('134', null, null, 'created', 'App\\PaymentDetails', '27', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581787489,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":27}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:24:56', '2020-02-15 17:24:56');
INSERT INTO `audits` VALUES ('135', null, null, 'created', 'App\\Payments', '27', '[]', '{\"order_ref\":1581787489,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=89229287-6454-48a6-93a7-f1d0a2be312c\",\"id\":27}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:24:56', '2020-02-15 17:24:56');
INSERT INTO `audits` VALUES ('136', null, null, 'created', 'App\\Orders', '37', '[]', '{\"category_id\":\"5\",\"quantity\":\"2\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":37}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:25:52', '2020-02-15 17:25:52');
INSERT INTO `audits` VALUES ('137', null, null, 'created', 'App\\PaymentDetails', '28', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581787651,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":28}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:27:33', '2020-02-15 17:27:33');
INSERT INTO `audits` VALUES ('138', null, null, 'created', 'App\\Payments', '28', '[]', '{\"order_ref\":1581787651,\"amount\":2,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=fe64332a-7e82-417e-897e-dcc52d1b90c3\",\"id\":28}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:27:33', '2020-02-15 17:27:33');
INSERT INTO `audits` VALUES ('139', null, null, 'created', 'App\\Orders', '38', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1581783289543\",\"status\":0,\"id\":38}', 'http://localhost:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:58:01', '2020-02-15 17:58:01');
INSERT INTO `audits` VALUES ('140', null, null, 'created', 'App\\Customer', '8', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Liam Muroiwa\",\"contact\":\"90210\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":8}', 'http://localhost:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:58:23', '2020-02-15 17:58:23');
INSERT INTO `audits` VALUES ('141', null, null, 'created', 'App\\PaymentDetails', '29', '[]', '{\"user_id\":\"1581783289543\",\"fullname\":\"Ernest Muroiwa\",\"order_id\":1581789515,\"contact\":\"0671564731\",\"email\":\"emuroiwa@gmail.com\",\"id\":29}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:58:38', '2020-02-15 17:58:38');
INSERT INTO `audits` VALUES ('142', null, null, 'created', 'App\\Payments', '29', '[]', '{\"order_ref\":1581789515,\"amount\":1,\"currency\":\"ZWL\",\"paygate\":\"paynow\",\"status\":0,\"pollURL\":\"https:\\/\\/www.paynow.co.zw\\/Interface\\/CheckPayment\\/?guid=3d84e557-c2ce-4dcb-a119-4a2c4a620969\",\"id\":29}', 'http://localhost:9092/api/paynow', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-15 17:58:38', '2020-02-15 17:58:38');
INSERT INTO `audits` VALUES ('143', null, null, 'created', 'App\\Orders', '39', '[]', '{\"category_id\":\"1\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":39}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-16 15:08:13', '2020-02-16 15:08:13');
INSERT INTO `audits` VALUES ('144', null, null, 'created', 'App\\Customer', '9', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Liam Muroiwa\",\"contact\":\"222\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Westgate Shopping Centre\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":9}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-16 15:08:32', '2020-02-16 15:08:32');
INSERT INTO `audits` VALUES ('145', null, null, 'created', 'App\\Orders', '40', '[]', '{\"category_id\":\"6\",\"quantity\":\"1\",\"user_id\":\"1579611855757\",\"status\":0,\"id\":40}', 'http://127.0.0.1:9092/api/orders', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.106 Safari/537.36', null, '2020-02-16 15:19:08', '2020-02-16 15:19:08');
INSERT INTO `audits` VALUES ('146', null, null, 'created', 'App\\Customer', '10', '[]', '{\"user_id\":\"1579611855757\",\"fullname\":\"Liam Muroiwa\",\"contact\":\"23424\",\"order_id\":\"11111\",\"marathon_type\":\"Junior Under 18\",\"marathon_pickup\":\"Bulawayo City Hall Car park\",\"tshirtsize\":null,\"gender\":\"male\",\"event_id\":\"1\",\"id\":10}', 'http://127.0.0.1:9092/api/customers', '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/80.0.3987.116 Safari/537.36', null, '2020-02-19 08:15:43', '2020-02-19 08:15:43');

-- ----------------------------
-- Table structure for customers
-- ----------------------------
DROP TABLE IF EXISTS `customers`;
CREATE TABLE `customers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` longtext COLLATE utf8mb4_unicode_ci,
  `event_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  `fullname` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tshirtsize` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marathon_tshirt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marathon_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `marathon_pickup` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of customers
-- ----------------------------

-- ----------------------------
-- Table structure for event_infos
-- ----------------------------
DROP TABLE IF EXISTS `event_infos`;
CREATE TABLE `event_infos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `discounts` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ticket_collection` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `refund_cancel` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `exchange_upgrade` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `duration` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `gps` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_details` longtext COLLATE utf8mb4_unicode_ci,
  `search_query` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_slider` int(11) DEFAULT '0',
  `event_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `youtube` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `instagram` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `twitter` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `website` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of event_infos
-- ----------------------------
INSERT INTO `event_infos` VALUES ('1', '1', null, null, null, null, null, null, 'The countdown begins to the 2020 PPC Marathon on April 4. It is set to be another memorable experience in one of Zimbabwe\'s magical wonders.\r\n\r\nThe race starts at the centre of the Matopos National Park and takes a gruelling 53km course ending at the Bulawayo Athletic Club and incorporates a 21,1km half marathon, 10km and 5km fun runs on the same route <br> Are you ready Zimbabwe? #PPCMarathon2020 #StrengthBeyond', null, '1', 'img/slide/ppc_marathon.jpg', null, 'https://www.facebook.com/ppczimbabwe/', 'https://twitter.com/ppczimbabwe', null, null, 'https://ppc.africa/zimbabwe', null, null);
INSERT INTO `event_infos` VALUES ('2', '2', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('3', '3', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om1.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('4', '4', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/event.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('5', '5', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/event.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('6', '6', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om1.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('7', '7', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om.jpg', null, 'https://www.instagram.com/', 'https://www.twitter.com/', null, null, null, null, null);

-- ----------------------------
-- Table structure for event_locations
-- ----------------------------
DROP TABLE IF EXISTS `event_locations`;
CREATE TABLE `event_locations` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) NOT NULL,
  `venue` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address1` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `town` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `province` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`,`event_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of event_locations
-- ----------------------------
INSERT INTO `event_locations` VALUES ('1', '1', 'Matopos ', null, 'Bulawayo', null, null, null, null, null);

-- ----------------------------
-- Table structure for event_types
-- ----------------------------
DROP TABLE IF EXISTS `event_types`;
CREATE TABLE `event_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `event_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of event_types
-- ----------------------------
INSERT INTO `event_types` VALUES ('1', '1', 'marathon', 'marathon', null, null);

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1');
INSERT INTO `migrations` VALUES ('2', '2019_08_20_112705_create_audits_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_20_112705_create_customers_table', '1');
INSERT INTO `migrations` VALUES ('4', '2019_08_20_112705_create_event_infos_table', '1');
INSERT INTO `migrations` VALUES ('5', '2019_08_20_112705_create_event_locations_table', '1');
INSERT INTO `migrations` VALUES ('6', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('7', '2019_08_20_112705_create_orders_table', '1');
INSERT INTO `migrations` VALUES ('8', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('9', '2019_08_20_112705_create_payments_table', '1');
INSERT INTO `migrations` VALUES ('10', '2019_08_20_112705_create_price_categories_table', '1');
INSERT INTO `migrations` VALUES ('11', '2019_08_20_112705_create_price_sub_categories_table', '1');
INSERT INTO `migrations` VALUES ('12', '2019_12_25_150209_create_zim_events_table', '1');
INSERT INTO `migrations` VALUES ('13', '2019_12_26_152501_create_event_infos_table', '1');
INSERT INTO `migrations` VALUES ('14', '2019_12_26_154523_create_event_locations_table', '1');
INSERT INTO `migrations` VALUES ('15', '2019_12_26_154827_create_price_categories_table', '1');
INSERT INTO `migrations` VALUES ('16', '2019_12_26_161230_create_price_sub_categories_table', '1');
INSERT INTO `migrations` VALUES ('17', '2019_12_28_072548_create_orders_table', '1');
INSERT INTO `migrations` VALUES ('18', '2019_12_28_073356_create_payments_table', '1');
INSERT INTO `migrations` VALUES ('19', '2019_12_28_094213_create_audits_table', '1');
INSERT INTO `migrations` VALUES ('20', '2019_12_30_090620_create_customers_table', '1');
INSERT INTO `migrations` VALUES ('21', '2020_01_13_092330_create_event_types_table', '2');
INSERT INTO `migrations` VALUES ('23', '2020_01_19_103958_create_payment_details_table', '3');

-- ----------------------------
-- Table structure for oauth_auth_codes
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of oauth_auth_codes
-- ----------------------------

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` longtext COLLATE utf8mb4_unicode_ci,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `reference` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of orders
-- ----------------------------

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for payments
-- ----------------------------
DROP TABLE IF EXISTS `payments`;
CREATE TABLE `payments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `pollURL` mediumtext COLLATE utf8mb4_unicode_ci,
  `order_ref` longtext COLLATE utf8mb4_unicode_ci,
  `amount` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `currency` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paygate` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payments
-- ----------------------------

-- ----------------------------
-- Table structure for payment_details
-- ----------------------------
DROP TABLE IF EXISTS `payment_details`;
CREATE TABLE `payment_details` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `fullname` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` longtext COLLATE utf8mb4_unicode_ci,
  `order_id` longtext COLLATE utf8mb4_unicode_ci,
  `contact` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of payment_details
-- ----------------------------

-- ----------------------------
-- Table structure for price_categories
-- ----------------------------
DROP TABLE IF EXISTS `price_categories`;
CREATE TABLE `price_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `category` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` double(11,4) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of price_categories
-- ----------------------------
INSERT INTO `price_categories` VALUES ('1', '1', 'Price1', '1000 to 1500', '1000.0000', '1000', 'sale', null, null);

-- ----------------------------
-- Table structure for price_sub_categories
-- ----------------------------
DROP TABLE IF EXISTS `price_sub_categories`;
CREATE TABLE `price_sub_categories` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_id` int(11) DEFAULT NULL,
  `category_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price_zwl` double(11,4) DEFAULT NULL,
  `price_usd` double(11,4) DEFAULT NULL,
  `max_tickets` int(11) DEFAULT '5',
  `quantity` int(11) DEFAULT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of price_sub_categories
-- ----------------------------
INSERT INTO `price_sub_categories` VALUES ('1', '1', '1', '5km Race', '125.0000', '0.0000', '5', '215', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('2', '1', '1', '10km Race', '125.0000', '0.0000', '5', '675', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('11', '1', '1', '21km Race', '200.0000', '0.0000', '5', '750', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('12', '1', '1', '53km Race', '200.0000', '0.0000', '5', '1400', 'sale', null, null);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('1', 'Ernest Muroiwa', 'admin@admin.com', null, '$2y$10$MkkYFK8x7XbOvXPlXoJwKeozKdPhEh/zPtBftAteGkcCA8IerzYy2', '3cncWsBXlh8MmmTjN4vS9bV8ZOCbPPAlF0sERXfhvgSEjEJCJYfXulRFRjSL', '2019-12-24 10:41:59', '2019-12-24 10:41:59');

-- ----------------------------
-- Table structure for zim_events
-- ----------------------------
DROP TABLE IF EXISTS `zim_events`;
CREATE TABLE `zim_events` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `event_type_id` int(11) DEFAULT NULL,
  `catergory_id` int(11) DEFAULT NULL,
  `event_name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `popular_rank` double(11,4) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of zim_events
-- ----------------------------
INSERT INTO `zim_events` VALUES ('1', '1', '1', 'PPC Marathon', '2020-04-04 06:00:00', '2020-04-04 06:00:00', '1.0000', null, null);
INSERT INTO `zim_events` VALUES ('2', null, '1', 'Old Mutual Nkulumane', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('3', null, '1', 'Old Mutual Westgate', '2020-03-21 00:00:00', '2020-03-21 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('4', null, '1', 'Old Mutual Vumba', '2020-03-21 00:00:00', '2020-03-21 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('5', null, '1', 'Zifm Judgement', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('6', null, '1', 'Star Fm Awards', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('7', '1', '1', 'Old Mutual Nkulumane', '2020-03-21 00:00:00', '2020-03-21 00:00:00', '1.0000', null, null);
