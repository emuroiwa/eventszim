/*
Navicat MySQL Data Transfer

Source Server         : gm58river
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : eventszim

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-01-25 08:06:16
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
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
INSERT INTO `event_infos` VALUES ('1', '1', null, null, null, null, null, null, 'Old Mutual continued to focus on creating affordable housing by investing in Nkulumane and Pumula South housing projects. In 2018, Old Mutual developed 596 stands in Pumula South under phase 1 of the projects which were sold out by the first half of the year.\r\n\r\nOld Mutual invested in the Eastgate Market complex which is expected to boast a massive 11,823 square metres of prime retail space configured to accommodate a diverse range of SME business models all under one roof. The strategic location of the Eastgate SME in the CBD of Harare will not only bring added convenience to traders and but also enable them to access new markets critical for their growth.\r\n\r\nTo add to this Old Mutual is also involved in a number of activities that uplift the livelihoods of many within the Zimbabwean communities. These include:', null, '1', 'img/slide/event.jpg', null, 'https://www.instagram.com/', null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('2', '2', null, null, null, null, null, null, 'Al jou gunsteling kunstenaars met al hulle grootse treffers. Kom kuier saam met Afrikaans is Groot tydens ons heel eerste Somerfees in Mosselbaai op Saterdag, 28 Desember 2019, by die Van Riebeeck Stadion. Laat ons makietie hou en die somer behoorlik vier saam met Steve Hofmeyr, Theuns Jordaan, Bok van Blerk, Demi Lee Moore, Riana Nel, Bobby van Jaarsveld, Karlien van Jaarsveld, Ricus Nel, Snotkop, Corlea, Jay, Dewald Wasserfall, Elvis Blue en vele meer...\r\n\r\nSteve Hofmeyr, Riana Nel, Demi-lee Moore, Theuns Jordaan, Bok van Blerk, Snotkop, Elvis Blue, Jay, Bobby van Jaarsveld, Karlien van Jaarsveld, Corlea Botha, Tarryn Lamb, Ruhan du Toit, Dewald Wasserfall', null, '1', 'img/slide/default.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('3', '3', null, null, null, null, null, null, 'Al jou gunsteling kunstenaars met al hulle grootse treffers. Kom kuier saam met Afrikaans is Groot tydens ons heel eerste Somerfees in Mosselbaai op Saterdag, 28 Desember 2019, by die Van Riebeeck Stadion. Laat ons makietie hou en die somer behoorlik vier saam met Steve Hofmeyr, Theuns Jordaan, Bok van Blerk, Demi Lee Moore, Riana Nel, Bobby van Jaarsveld, Karlien van Jaarsveld, Ricus Nel, Snotkop, Corlea, Jay, Dewald Wasserfall, Elvis Blue en vele meer...\r\n\r\nSteve Hofmeyr, Riana Nel, Demi-lee Moore, Theuns Jordaan, Bok van Blerk, Snotkop, Elvis Blue, Jay, Bobby van Jaarsveld, Karlien van Jaarsveld, Corlea Botha, Tarryn Lamb, Ruhan du Toit, Dewald Wasserfall', null, '1', 'img/slide/jah.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('4', '4', null, null, null, null, null, null, 'Al jou gunsteling kunstenaars met al hulle grootse treffers. Kom kuier saam met Afrikaans is Groot tydens ons heel eerste Somerfees in Mosselbaai op Saterdag, 28 Desember 2019, by die Van Riebeeck Stadion. Laat ons makietie hou en die somer behoorlik vier saam met Steve Hofmeyr, Theuns Jordaan, Bok van Blerk, Demi Lee Moore, Riana Nel, Bobby van Jaarsveld, Karlien van Jaarsveld, Ricus Nel, Snotkop, Corlea, Jay, Dewald Wasserfall, Elvis Blue en vele meer...\r\n\r\nSteve Hofmeyr, Riana Nel, Demi-lee Moore, Theuns Jordaan, Bok van Blerk, Snotkop, Elvis Blue, Jay, Bobby van Jaarsveld, Karlien van Jaarsveld, Corlea Botha, Tarryn Lamb, Ruhan du Toit, Dewald Wasserfall', null, '1', 'img/slide/winky.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('5', '5', null, null, null, null, null, null, 'Al jou gunsteling kunstenaars met al hulle grootse treffers. Kom kuier saam met Afrikaans is Groot tydens ons heel eerste Somerfees in Mosselbaai op Saterdag, 28 Desember 2019, by die Van Riebeeck Stadion. Laat ons makietie hou en die somer behoorlik vier saam met Steve Hofmeyr, Theuns Jordaan, Bok van Blerk, Demi Lee Moore, Riana Nel, Bobby van Jaarsveld, Karlien van Jaarsveld, Ricus Nel, Snotkop, Corlea, Jay, Dewald Wasserfall, Elvis Blue en vele meer...\r\n\r\nSteve Hofmeyr, Riana Nel, Demi-lee Moore, Theuns Jordaan, Bok van Blerk, Snotkop, Elvis Blue, Jay, Bobby van Jaarsveld, Karlien van Jaarsveld, Corlea Botha, Tarryn Lamb, Ruhan du Toit, Dewald Wasserfall', null, '1', 'img/slide/event.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('6', '6', null, null, null, null, null, null, 'Al jou gunsteling kunstenaars met al hulle grootse treffers. Kom kuier saam met Afrikaans is Groot tydens ons heel eerste Somerfees in Mosselbaai op Saterdag, 28 Desember 2019, by die Van Riebeeck Stadion. Laat ons makietie hou en die somer behoorlik vier saam met Steve Hofmeyr, Theuns Jordaan, Bok van Blerk, Demi Lee Moore, Riana Nel, Bobby van Jaarsveld, Karlien van Jaarsveld, Ricus Nel, Snotkop, Corlea, Jay, Dewald Wasserfall, Elvis Blue en vele meer...\r\n\r\nSteve Hofmeyr, Riana Nel, Demi-lee Moore, Theuns Jordaan, Bok van Blerk, Snotkop, Elvis Blue, Jay, Bobby van Jaarsveld, Karlien van Jaarsveld, Corlea Botha, Tarryn Lamb, Ruhan du Toit, Dewald Wasserfall', null, '1', 'img/slide/event.jpg', null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('7', '7', null, null, null, null, null, null, 'Al jou gunsteling kunstenaars met al hulle grootse treffers. Kom kuier saam met Afrikaans is Groot tydens ons heel eerste Somerfees in Mosselbaai op Saterdag, 28 Desember 2019, by die Van Riebeeck Stadion. Laat ons makietie hou en die somer behoorlik vier saam met Steve Hofmeyr, Theuns Jordaan, Bok van Blerk, Demi Lee Moore, Riana Nel, Bobby van Jaarsveld, Karlien van Jaarsveld, Ricus Nel, Snotkop, Corlea, Jay, Dewald Wasserfall, Elvis Blue en vele meer...\r\n\r\nSteve Hofmeyr, Riana Nel, Demi-lee Moore, Theuns Jordaan, Bok van Blerk, Snotkop, Elvis Blue, Jay, Bobby van Jaarsveld, Karlien van Jaarsveld, Corlea Botha, Tarryn Lamb, Ruhan du Toit, Dewald Wasserfall', null, '1', 'img/slide/default.jpg', null, 'https://www.instagram.com/', 'https://www.twitter.com/', null, null, null, null, null);

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
INSERT INTO `event_locations` VALUES ('1', '1', 'Old Mutual', null, 'Harare', null, null, null, null, null);

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
INSERT INTO `price_sub_categories` VALUES ('1', '1', '1', '5km Race', '1.0000', '1.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('2', '1', '1', '10km Race', '1000.0000', '100.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('3', '2', '1', 'VIP 1000', '1000.0000', '100.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('4', '2', '1', 'General 500', '500.0000', '50.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('5', '3', '1', 'General 500', '500.0000', '50.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('6', '4', '1', 'General 500', '500.0000', '50.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('7', '51', '1', 'General 500', '500.0000', '50.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('8', '6', '1', 'General 500', '500.0000', '50.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('9', '7', '1', 'General 500', '500.0000', '50.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('10', '7', '1', 'Older runner', '1.0000', '150.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('11', '1', '1', '21km Race', '1.0000', '1.0000', '5', '1000', 'sale', null, null);
INSERT INTO `price_sub_categories` VALUES ('12', '1', '1', '42km Race', '1.0000', '1.0000', '5', '1000', 'sale', null, null);

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
INSERT INTO `zim_events` VALUES ('1', '1', '1', 'Old Mutual Harare Marathon', '2019-02-09 06:00:00', '2019-02-10 06:00:00', '1.0000', null, null);
INSERT INTO `zim_events` VALUES ('2', null, '1', 'Madirirano', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('3', null, '1', 'Jah Prayza', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('4', null, '1', 'Winky D', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('5', null, '1', 'Zifm Judgement', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('6', null, '1', 'Star Fm Awards', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '2.0000', null, null);
INSERT INTO `zim_events` VALUES ('7', '1', '1', 'Econet Marathon', '2019-12-25 00:00:00', '2019-12-26 00:00:00', '1.0000', null, null);
