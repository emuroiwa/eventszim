/*
Navicat MySQL Data Transfer

Source Server         : gm58river
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : eventszim

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-02-26 13:30:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for paynow
-- ----------------------------
DROP TABLE IF EXISTS `paynow`;
CREATE TABLE `paynow` (
  `Status` varchar(255) DEFAULT NULL,
  `Reference` varchar(255) DEFAULT NULL,
  `Created` varchar(255) DEFAULT NULL,
  `PaymentType` varchar(255) DEFAULT NULL,
  `IntegrationID` varchar(255) DEFAULT NULL,
  `MerchantRef` varchar(255) DEFAULT NULL,
  `FinalAmount` varchar(255) DEFAULT NULL,
  `SettlementAmount` varchar(255) DEFAULT NULL,
  `Channel` varchar(255) DEFAULT NULL,
  `PaymentMethodName` varchar(255) DEFAULT NULL,
  `CustomerEmail` varchar(255) DEFAULT NULL,
  `CustomerName` varchar(255) DEFAULT NULL,
  `CustomerPhone` varchar(255) DEFAULT NULL,
  `Completed` varchar(255) DEFAULT NULL,
  `SettlementRef` varchar(255) DEFAULT NULL,
  `SettlementDate` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of paynow
-- ----------------------------
INSERT INTO `paynow` VALUES ('Delivered', '6775985', '26/02/2020 12:51:16 PM', 'TicketBook', '8915', '1582714277', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'nokuthula@byo.glenrandmib.co.zw', null, null, '26/02/2020 1:08:50 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6775635', '26/02/2020 12:32:46 PM', 'TicketBook', '8915', '1582713168', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mutarangani@gmail.com', null, null, '26/02/2020 1:08:25 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6773640', '26/02/2020 10:51:46 AM', 'TicketBook', '8915', '1582707107', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'dkanyenda@gmail.com', null, null, '26/02/2020 11:47:19 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6772623', '26/02/2020 10:03:58 AM', 'TicketBook', '8915', '1582704239', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'walterchimuka@gmail.com', 'Harare Athletic Club', '263773303470', '26/02/2020 11:47:52 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6767463', '25/02/2020 10:12:59 PM', 'TicketBook', '8915', '1582661580', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'obviousmu@gmail.com', null, null, '26/02/2020 6:47:56 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6766391', '25/02/2020 9:25:59 PM', 'TicketBook', '8915', '1582658759', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'Josiahmchiwawa@gmail.com', null, null, '26/02/2020 6:48:14 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6765550', '25/02/2020 8:50:13 PM', 'TicketBook', '8915', '1582656614', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mkhulisig@gmail.com', null, null, '26/02/2020 6:47:15 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6760671', '25/02/2020 5:24:31 PM', 'TicketBook', '8915', '1582644270', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'leeshokks@gmail.com', null, null, '25/02/2020 5:29:41 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6760571', '25/02/2020 5:20:01 PM', 'TicketBook', '8915', '1582644000', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'angferguson3@gmail.com', null, null, '25/02/2020 10:14:00 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6760484', '25/02/2020 5:16:12 PM', 'TicketBook', '8915', '1582643772', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'aplonia.makombe@firstcapitalbank.co.zw', null, null, '25/02/2020 5:19:57 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6758836', '25/02/2020 4:09:24 PM', 'TicketBook', '8915', '1582639763', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'washingtonshamba@gmail.com', null, null, '25/02/2020 4:31:27 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6753258', '25/02/2020 12:15:23 PM', 'TicketBook', '8915', '1582625725', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'marunyam@astra.co.zw', null, null, '25/02/2020 12:42:04 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6750840', '25/02/2020 10:31:00 AM', 'TicketBook', '8915', '1582619460', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'sales@mctana.co.zw', null, null, '25/02/2020 12:42:54 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6749277', '25/02/2020 9:26:03 AM', 'TicketBook', '8915', '1582615564', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'dmaniwa@gmail.com', null, null, '25/02/2020 12:43:20 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6749179', '25/02/2020 9:21:56 AM', 'TicketBook', '8915', '1582615316', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'evans.paradzai@gmail.com', null, null, '25/02/2020 12:43:37 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6748424', '25/02/2020 8:48:52 AM', 'TicketBook', '8915', '1582613333', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'belncube@gmail.com', null, null, '25/02/2020 12:43:59 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6747883', '25/02/2020 8:16:40 AM', 'TicketBook', '8915', '1582611401', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'lchereni@gmail.com', null, null, '25/02/2020 12:44:17 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6747648', '25/02/2020 8:00:24 AM', 'TicketBook', '8915', '1582610424', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'dadirainguwo@gmail.com', null, null, '25/02/2020 12:44:34 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6747566', '25/02/2020 7:52:30 AM', 'TicketBook', '8915', '1582609950', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'stenzo4eva263@gmail.com', null, null, '25/02/2020 12:44:48 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6743515', '24/02/2020 8:49:00 PM', 'TicketBook', '8915', '1582570140', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'drptmurambi@gmail.com', null, null, '25/02/2020 12:45:03 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6742873', '24/02/2020 8:16:31 PM', 'TicketBook', '8915', '1582568192', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'ndaedzo.mbedzi@gmail.com', null, null, '25/02/2020 12:45:19 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6742724', '24/02/2020 8:08:33 PM', 'TicketBook', '8915', '1582567714', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'clintburt75@gmail.com', null, null, '25/02/2020 12:45:47 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6742484', '24/02/2020 7:56:31 PM', 'TicketBook', '8915', '1582566991', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'katewestcar@gmail.com', null, null, '25/02/2020 12:45:59 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6741979', '24/02/2020 7:30:39 PM', 'TicketBook', '8915', '1582565439', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'morrishove@yahoo.com', null, null, '25/02/2020 12:46:11 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6741527', '24/02/2020 7:07:09 PM', 'TicketBook', '8915', '1582564029', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'baldwin.guchu@gmail.com', null, null, '25/02/2020 12:46:30 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6739499', '24/02/2020 5:12:39 PM', 'TicketBook', '8915', '1582557159', '203.5500', '200.0000', 'OneMoney', 'OneMoney', 'ropabanhwa@gmail.com', null, null, '25/02/2020 12:46:46 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6739132', '24/02/2020 4:54:43 PM', 'TicketBook', '8915', '1582556083', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'shumbamorry@gmail.com', null, null, '25/02/2020 12:47:32 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6738987', '24/02/2020 4:48:18 PM', 'TicketBook', '8915', '1582555698', '406.6000', '400.0000', 'EcoCash', 'EcoCash', 'simangot@gmail.com', null, null, '25/02/2020 12:47:46 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6738291', '24/02/2020 4:17:07 PM', 'TicketBook', '8915', '1582553827', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'tinashelmmakoni@yahoo.com', null, null, '25/02/2020 12:48:03 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6737867', '24/02/2020 3:58:39 PM', 'TicketBook', '8915', '1582552718', '406.6000', '400.0000', 'EcoCash', 'EcoCash', 'mapfumo@unfpa.org', null, null, '25/02/2020 12:48:17 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6737224', '24/02/2020 3:29:10 PM', 'TicketBook', '8915', '1582550952', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mlondolozin22@gmail.com', null, null, '25/02/2020 12:48:29 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6735807', '24/02/2020 2:19:25 PM', 'TicketBook', '8915', '1582546767', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'kpasipanodya@chloride.co.zw', null, null, '25/02/2020 12:48:42 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6735198', '24/02/2020 1:47:14 PM', 'TicketBook', '8915', '1582544835', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mufudzenokuthula@gmail.com', null, null, '25/02/2020 12:49:02 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6735097', '24/02/2020 1:41:19 PM', 'TicketBook', '8915', '1582544480', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'ttazvivinga@gmail.com', null, null, '25/02/2020 12:49:15 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6734652', '24/02/2020 1:19:48 PM', 'TicketBook', '8915', '1582543190', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'hondoh72@gmail.com', null, null, '25/02/2020 12:49:28 PM', null, null);
INSERT INTO `paynow` VALUES ('Settled', '6734442', '24/02/2020 1:08:34 PM', 'TicketBook', '8915', '1582542516', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'garikaijohns@gmail.com', null, null, '24/02/2020 1:13:11 PM', '61606', '25/02/2020 9:09:31 PM');
INSERT INTO `paynow` VALUES ('Delivered', '6734283', '24/02/2020 1:01:05 PM', 'TicketBook', '8915', '1582542066', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'traebanda@gmail.com', null, null, '25/02/2020 12:49:40 PM', null, null);
INSERT INTO `paynow` VALUES ('Settled', '6703253', '22/02/2020 3:58:37 PM', 'TicketBook', '8915', '1582379916', '2.5400', '2.0000', 'EcoCash', 'EcoCash', 'emuroiwa@gmail.com', 'Ernest Muroiwa', '263774002797', '22/02/2020 3:59:07 PM', '61606', '25/02/2020 9:09:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6693904', '22/02/2020 7:46:29 AM', 'TicketBook', '8915', '1582350391', '1.6200', '1.1000', 'EcoCash', 'EcoCash', 'emuroiwa@gmail.com', 'Ernest Muroiwa', '263774002797', '22/02/2020 7:47:02 AM', '61606', '25/02/2020 9:09:31 PM');
