/*
Navicat MySQL Data Transfer

Source Server         : gm58river
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : eventszim

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-02-19 16:49:20
*/

SET FOREIGN_KEY_CHECKS=0;

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
  `event_mobile_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `event_card_img` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
INSERT INTO `event_infos` VALUES ('1', '1', null, null, null, null, null, null, 'The countdown begins to the 2020 PPC Marathon on April 4. It is set to be another memorable experience in one of Zimbabwe\'s magical wonders.\r\n\r\nThe race starts at the centre of the Matopos National Park and takes a gruelling 53km course ending at the Bulawayo Athletic Club and incorporates a 21,1km half marathon, 10km and 5km fun runs on the same route  Are you ready Zimbabwe? #PPCMarathon2020 #StrengthBeyond', null, '1', 'img/slide/ppc_marathon.jpg', 'img/slide/mobile/ppc_marathon_mobile.jpg', 'img/slide/card-image/ppc_marathon_card.jpg', null, 'https://www.facebook.com/ppczimbabwe/', 'https://twitter.com/ppczimbabwe', null, null, 'https://ppc.africa/zimbabwe', null, null);
INSERT INTO `event_infos` VALUES ('2', '2', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om.jpg', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('3', '3', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om1.jpg', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('4', '4', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om.jpg', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('5', '5', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om.jpg', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('6', '6', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om1.jpg', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `event_infos` VALUES ('7', '7', null, null, null, null, null, null, 'COMING SOON', null, '1', 'img/slide/om.jpg', null, null, null, 'https://www.instagram.com/', 'https://www.twitter.com/', null, null, null, null, null);
