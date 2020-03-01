/*
Navicat MySQL Data Transfer

Source Server         : gm58river
Source Server Version : 50505
Source Host           : 127.0.0.1:3306
Source Database       : eventszim

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2020-03-01 09:43:14
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
INSERT INTO `paynow` VALUES ('Delivered', '6856986', '29/02/2020 9:53:55 PM', 'TicketBook', '8915', '1583006036', '330.4600', '325.0000', 'EcoCash', 'EcoCash', 'langathiwen@gmail.com', null, null, '01/03/2020 8:44:35 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6856620', '29/02/2020 9:34:09 PM', 'TicketBook', '8915', '1583004849', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'ronald.mujakachi@outlook.com', null, null, '01/03/2020 8:44:04 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6856099', '29/02/2020 9:05:47 PM', 'TicketBook', '8915', '1583003148', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'clementzw67@gmail.com', null, null, '01/03/2020 8:43:18 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6856044', '29/02/2020 9:02:56 PM', 'TicketBook', '8915', '1583002976', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'cdube6@gmail.com', null, null, '01/03/2020 8:43:03 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6854543', '29/02/2020 7:57:34 PM', 'TicketBook', '8915', '1582999055', '254.3100', '250.0000', 'EcoCash', 'EcoCash', 'skrinadube@gmail.com', null, null, '01/03/2020 8:42:20 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6854389', '29/02/2020 7:51:02 PM', 'TicketBook', '8915', '1582998663', '254.3100', '250.0000', 'EcoCash', 'EcoCash', 'skrinadube@gmail.com', null, null, '01/03/2020 8:41:56 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6849319', '29/02/2020 4:23:12 PM', 'TicketBook', '8915', '1582986192', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'tapiwe.moyo@gmail.com', null, null, '01/03/2020 8:41:30 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6847011', '29/02/2020 2:47:12 PM', 'TicketBook', '8915', '1582980431', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'carolnyiker@gmail.com', null, null, '01/03/2020 8:41:00 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6846078', '29/02/2020 2:08:33 PM', 'TicketBook', '8915', '1582978112', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'allenmagwere@68.com', null, null, '01/03/2020 8:40:14 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6845354', '29/02/2020 1:43:28 PM', 'TicketBook', '8915', '1582976607', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'magutat@stanbic.com', null, null, '01/03/2020 8:39:36 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6845139', '29/02/2020 1:17:18 PM', 'TicketBook', '8915', '1582975039', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'courage.mucheche@handinhand.co.zw', null, null, '01/03/2020 8:39:22 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6844840', '29/02/2020 1:03:09 PM', 'TicketBook', '8915', '1582974190', '330.4600', '325.0000', 'EcoCash', 'EcoCash', 'lindmkandla@yahoo.co.uk', null, null, '01/03/2020 8:39:08 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6840250', '29/02/2020 9:23:35 AM', 'TicketBook', '8915', '1582961015', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'rmuguti@gmail.com', null, null, '01/03/2020 8:38:53 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6838209', '29/02/2020 7:18:11 AM', 'TicketBook', '8915', '1582953491', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'ncubetapiwa@gmail.com', null, null, '01/03/2020 8:38:35 AM', null, null);
INSERT INTO `paynow` VALUES ('Paid', '6837989', '29/02/2020 6:59:34 AM', 'TicketBook', '8915', '1582952374', '1.6200', '1.1000', 'EcoCash', 'EcoCash', 'emuroiwa@gmail.com', null, '263774002797', '29/02/2020 6:59:46 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6837297', '29/02/2020 4:35:23 AM', 'TicketBook', '8915', '1582943722', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mightyphirim@gmail.com', null, null, '29/02/2020 6:53:18 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6835023', '28/02/2020 10:25:43 PM', 'TicketBook', '8915', '1582921544', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'sdamasane@gmail.com', null, null, '29/02/2020 4:37:50 AM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6832462', '28/02/2020 8:37:00 PM', 'TicketBook', '8915', '1582915020', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'marosa.williams@gmail.com', null, null, '28/02/2020 9:25:10 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6831462', '28/02/2020 7:54:30 PM', 'TicketBook', '8915', '1582912470', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'mbohwaeben@gmail.com', null, null, '28/02/2020 9:24:38 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6831222', '28/02/2020 7:43:41 PM', 'TicketBook', '8915', '1582911821', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'annemariencube@gmail.com', null, null, '28/02/2020 9:24:01 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6830477', '28/02/2020 7:11:50 PM', 'TicketBook', '8915', '1582909910', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'mufarosachinda@gmail.com', null, null, '28/02/2020 9:23:27 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6830293', '28/02/2020 7:03:53 PM', 'TicketBook', '8915', '1582909433', '127.4100', '125.0000', 'OneMoney', 'OneMoney', 'clappc@live.com', null, null, '28/02/2020 9:22:58 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6830122', '28/02/2020 6:55:58 PM', 'TicketBook', '8915', '1582908958', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'bobwabill@gmail.com', null, null, '28/02/2020 9:19:05 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6830101', '28/02/2020 6:55:07 PM', 'TicketBook', '8915', '1582908907', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'simutandi@gmail.com', null, null, '28/02/2020 9:17:34 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6829730', '28/02/2020 6:35:51 PM', 'TicketBook', '8915', '1582907751', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'anthen94@hotmail.co.uk', null, null, '28/02/2020 9:17:00 PM', null, null);
INSERT INTO `paynow` VALUES ('Delivered', '6828836', '28/02/2020 5:50:11 PM', 'TicketBook', '8915', '1582905011', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'fhassin701@gmail.com', null, null, '28/02/2020 9:16:40 PM', null, null);
INSERT INTO `paynow` VALUES ('Settled', '6828549', '28/02/2020 5:36:17 PM', 'TicketBook', '8915', '1582904177', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'fhassin701@gmail.com', null, null, '28/02/2020 8:51:45 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6828057', '28/02/2020 5:14:11 PM', 'TicketBook', '8915', '1582902851', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'tariroushe60@gmail.com', null, null, '28/02/2020 5:18:58 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6826591', '28/02/2020 4:11:20 PM', 'TicketBook', '8915', '1582899079', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'lsibanda@gmail.com', null, null, '28/02/2020 5:21:05 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6825749', '28/02/2020 3:37:23 PM', 'TicketBook', '8915', '1582897045', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'astawodzera@gmail.com', null, null, '28/02/2020 3:52:13 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6825553', '28/02/2020 3:28:48 PM', 'TicketBook', '8915', '1582896530', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'tariroushe60@gmail.com', null, null, '28/02/2020 5:22:51 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6825396', '28/02/2020 3:21:11 PM', 'TicketBook', '8915', '1582896073', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'asuliwa@gmail.com', null, null, '28/02/2020 3:52:26 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6825360', '28/02/2020 3:19:55 PM', 'TicketBook', '8915', '1582895997', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'madzivanyikadavison@gmail.com', null, null, '28/02/2020 3:52:39 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6824480', '28/02/2020 2:41:49 PM', 'TicketBook', '8915', '1582893711', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'stansibanda@gmail.com', null, null, '28/02/2020 3:52:51 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6824118', '28/02/2020 2:26:19 PM', 'TicketBook', '8915', '1582892780', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'rashailameck@gmail.com', null, null, '28/02/2020 2:36:18 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6821662', '28/02/2020 12:40:08 PM', 'TicketBook', '8915', '1582886408', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'njogwe@satib.co.zw', null, null, '28/02/2020 1:45:28 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6820152', '28/02/2020 11:36:45 AM', 'TicketBook', '8915', '1582882606', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mercywestgate68@gmail.com', null, null, '28/02/2020 12:09:12 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6815230', '28/02/2020 7:16:32 AM', 'TicketBook', '8915', '1582866992', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'boerunanga@gmail.com', null, null, '28/02/2020 12:09:35 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6812105', '27/02/2020 10:02:25 PM', 'TicketBook', '8915', '1582833745', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'dkdzikiti@outlook.com', null, null, '28/02/2020 6:58:37 AM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6810333', '27/02/2020 9:06:37 PM', 'TicketBook', '8915', '1582830397', '1.6200', '1.1000', 'EcoCash', 'EcoCash', 'emuroiwa@gmail.com', 'Ernest Muroiwa', '263774002797', '27/02/2020 9:07:21 PM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6809497', '27/02/2020 8:38:37 PM', 'TicketBook', '8915', '1582828717', '1.5200', '1.0000', 'EcoCash', 'EcoCash', 'emuroiwa@gmail.com', 'Ernest Muroiwa', '263774002797', '27/02/2020 8:39:17 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6803462', '27/02/2020 4:43:02 PM', 'TicketBook', '8915', '1582814582', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'gugu.mlala@gmail.com', null, null, '28/02/2020 6:58:19 AM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6801468', '27/02/2020 3:19:54 PM', 'TicketBook', '8915', '1582809596', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'wessie@kingscitychurch.com', 'Wessie van der Westhuizen', '0775581661', '28/02/2020 6:57:58 AM', '61831', '29/02/2020 9:04:45 PM');
INSERT INTO `paynow` VALUES ('Settled', '6799328', '27/02/2020 1:43:28 PM', 'TicketBook', '8915', '1582803809', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'hillary.kubvoruno@gmail.com', null, null, '27/02/2020 1:58:11 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6799076', '27/02/2020 1:33:08 PM', 'TicketBook', '8915', '1582803189', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'hillary.kubvoruno@gmail.com', null, null, '27/02/2020 1:58:25 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6799048', '27/02/2020 1:32:08 PM', 'TicketBook', '8915', '1582803120', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'chiefmash@gmail.com', null, null, '27/02/2020 1:58:39 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6795944', '27/02/2020 11:09:49 AM', 'TicketBook', '8915', '1582794590', '457.3600', '450.0000', 'EcoCash', 'EcoCash', 'tadiasmazhindu@gmail.com', null, null, '27/02/2020 1:10:03 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6795271', '27/02/2020 10:35:43 AM', 'TicketBook', '8915', '1582792544', '330.4600', '325.0000', 'EcoCash', 'EcoCash', 'jvianoh@gmail.com', null, null, '27/02/2020 1:09:40 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6795226', '27/02/2020 10:33:13 AM', 'TicketBook', '8915', '1582792391', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'lchereni@gmail.com', null, null, '27/02/2020 1:10:17 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6794623', '27/02/2020 10:06:37 AM', 'TicketBook', '8915', '1582790798', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'lchibikira@gmail.com', null, null, '27/02/2020 1:10:31 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6792507', '27/02/2020 8:03:30 AM', 'TicketBook', '8915', '1582783410', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'rjclyyde@gmail.com', null, null, '27/02/2020 1:10:49 PM', '61782', '28/02/2020 9:04:05 PM');
INSERT INTO `paynow` VALUES ('Settled', '6784795', '26/02/2020 7:48:27 PM', 'TicketBook', '8915', '1582739308', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'bshumba@me.com', null, null, '26/02/2020 8:26:29 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6782750', '26/02/2020 6:14:42 PM', 'TicketBook', '8915', '1582733682', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'lchibikira@gmail.com', null, null, '26/02/2020 8:26:04 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6781871', '26/02/2020 5:30:42 PM', 'TicketBook', '8915', '1582731042', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'farai.my@gmail.com', null, null, '26/02/2020 5:47:07 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6781714', '26/02/2020 5:23:57 PM', 'TicketBook', '8915', '1582730637', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'farai.my@gmail.com', null, null, '26/02/2020 5:47:46 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6780507', '26/02/2020 4:27:35 PM', 'TicketBook', '8915', '1582727255', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'lchibikira@gmail.com', null, null, '26/02/2020 5:16:16 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6779094', '26/02/2020 3:27:12 PM', 'TicketBook', '8915', '1582723629', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'tonde.mapfunde@gmail.com', null, null, '26/02/2020 4:16:06 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6778899', '26/02/2020 3:18:20 PM', 'TicketBook', '8915', '1582723102', '127.4100', '125.0000', 'OneMoney', 'OneMoney', 'tonde.mapfunde@gmail.com', null, null, '26/02/2020 4:16:19 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6778808', '26/02/2020 3:14:53 PM', 'TicketBook', '8915', '1582722895', '254.3100', '250.0000', 'EcoCash', 'EcoCash', 'tawmug@gmail.com', null, null, '26/02/2020 4:16:43 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6776718', '26/02/2020 1:30:37 PM', 'TicketBook', '8915', '1582716638', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'morgan.chisiri@gmail.com', null, null, '26/02/2020 4:15:53 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6775985', '26/02/2020 12:51:16 PM', 'TicketBook', '8915', '1582714277', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'nokuthula@byo.glenrandmib.co.zw', null, null, '26/02/2020 1:08:50 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6775635', '26/02/2020 12:32:46 PM', 'TicketBook', '8915', '1582713168', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mutarangani@gmail.com', null, null, '26/02/2020 1:08:25 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6773640', '26/02/2020 10:51:46 AM', 'TicketBook', '8915', '1582707107', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'dkanyenda@gmail.com', null, null, '26/02/2020 11:47:19 AM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6772623', '26/02/2020 10:03:58 AM', 'TicketBook', '8915', '1582704239', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'walterchimuka@gmail.com', 'Harare Athletic Club', '263773303470', '26/02/2020 11:47:52 AM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6767463', '25/02/2020 10:12:59 PM', 'TicketBook', '8915', '1582661580', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'obviousmu@gmail.com', null, null, '26/02/2020 6:47:56 AM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6766391', '25/02/2020 9:25:59 PM', 'TicketBook', '8915', '1582658759', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'Josiahmchiwawa@gmail.com', null, null, '26/02/2020 6:48:14 AM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6765550', '25/02/2020 8:50:13 PM', 'TicketBook', '8915', '1582656614', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mkhulisig@gmail.com', null, null, '26/02/2020 6:47:15 AM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6760671', '25/02/2020 5:24:31 PM', 'TicketBook', '8915', '1582644270', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'leeshokks@gmail.com', null, null, '25/02/2020 5:29:41 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6760571', '25/02/2020 5:20:01 PM', 'TicketBook', '8915', '1582644000', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'angferguson3@gmail.com', null, null, '25/02/2020 10:14:00 PM', '61721', '27/02/2020 9:06:51 PM');
INSERT INTO `paynow` VALUES ('Settled', '6760484', '25/02/2020 5:16:12 PM', 'TicketBook', '8915', '1582643772', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'aplonia.makombe@firstcapitalbank.co.zw', null, null, '25/02/2020 5:19:57 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6758836', '25/02/2020 4:09:24 PM', 'TicketBook', '8915', '1582639763', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'washingtonshamba@gmail.com', null, null, '25/02/2020 4:31:27 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6753258', '25/02/2020 12:15:23 PM', 'TicketBook', '8915', '1582625725', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'marunyam@astra.co.zw', null, null, '25/02/2020 12:42:04 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6750840', '25/02/2020 10:31:00 AM', 'TicketBook', '8915', '1582619460', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'sales@mctana.co.zw', null, null, '25/02/2020 12:42:54 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6749277', '25/02/2020 9:26:03 AM', 'TicketBook', '8915', '1582615564', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'dmaniwa@gmail.com', null, null, '25/02/2020 12:43:20 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6749179', '25/02/2020 9:21:56 AM', 'TicketBook', '8915', '1582615316', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'evans.paradzai@gmail.com', null, null, '25/02/2020 12:43:37 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6748424', '25/02/2020 8:48:52 AM', 'TicketBook', '8915', '1582613333', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'belncube@gmail.com', null, null, '25/02/2020 12:43:59 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6747883', '25/02/2020 8:16:40 AM', 'TicketBook', '8915', '1582611401', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'lchereni@gmail.com', null, null, '25/02/2020 12:44:17 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6747648', '25/02/2020 8:00:24 AM', 'TicketBook', '8915', '1582610424', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'dadirainguwo@gmail.com', null, null, '25/02/2020 12:44:34 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6747566', '25/02/2020 7:52:30 AM', 'TicketBook', '8915', '1582609950', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'stenzo4eva263@gmail.com', null, null, '25/02/2020 12:44:48 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6743515', '24/02/2020 8:49:00 PM', 'TicketBook', '8915', '1582570140', '127.4100', '125.0000', 'EcoCash', 'EcoCash', 'drptmurambi@gmail.com', null, null, '25/02/2020 12:45:03 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6742873', '24/02/2020 8:16:31 PM', 'TicketBook', '8915', '1582568192', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'ndaedzo.mbedzi@gmail.com', null, null, '25/02/2020 12:45:19 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6742724', '24/02/2020 8:08:33 PM', 'TicketBook', '8915', '1582567714', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'clintburt75@gmail.com', null, null, '25/02/2020 12:45:47 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6742484', '24/02/2020 7:56:31 PM', 'TicketBook', '8915', '1582566991', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'katewestcar@gmail.com', null, null, '25/02/2020 12:45:59 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6741979', '24/02/2020 7:30:39 PM', 'TicketBook', '8915', '1582565439', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'morrishove@yahoo.com', null, null, '25/02/2020 12:46:11 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6741527', '24/02/2020 7:07:09 PM', 'TicketBook', '8915', '1582564029', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'baldwin.guchu@gmail.com', null, null, '25/02/2020 12:46:30 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6739499', '24/02/2020 5:12:39 PM', 'TicketBook', '8915', '1582557159', '203.5500', '200.0000', 'OneMoney', 'OneMoney', 'ropabanhwa@gmail.com', null, null, '25/02/2020 12:46:46 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6739132', '24/02/2020 4:54:43 PM', 'TicketBook', '8915', '1582556083', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'shumbamorry@gmail.com', null, null, '25/02/2020 12:47:32 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6738987', '24/02/2020 4:48:18 PM', 'TicketBook', '8915', '1582555698', '406.6000', '400.0000', 'EcoCash', 'EcoCash', 'simangot@gmail.com', null, null, '25/02/2020 12:47:46 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6738291', '24/02/2020 4:17:07 PM', 'TicketBook', '8915', '1582553827', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'tinashelmmakoni@yahoo.com', null, null, '25/02/2020 12:48:03 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6737867', '24/02/2020 3:58:39 PM', 'TicketBook', '8915', '1582552718', '406.6000', '400.0000', 'EcoCash', 'EcoCash', 'mapfumo@unfpa.org', null, null, '25/02/2020 12:48:17 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6737224', '24/02/2020 3:29:10 PM', 'TicketBook', '8915', '1582550952', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mlondolozin22@gmail.com', null, null, '25/02/2020 12:48:29 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6735807', '24/02/2020 2:19:25 PM', 'TicketBook', '8915', '1582546767', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'kpasipanodya@chloride.co.zw', null, null, '25/02/2020 12:48:42 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6735198', '24/02/2020 1:47:14 PM', 'TicketBook', '8915', '1582544835', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'mufudzenokuthula@gmail.com', null, null, '25/02/2020 12:49:02 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6735097', '24/02/2020 1:41:19 PM', 'TicketBook', '8915', '1582544480', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'ttazvivinga@gmail.com', null, null, '25/02/2020 12:49:15 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6734652', '24/02/2020 1:19:48 PM', 'TicketBook', '8915', '1582543190', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'hondoh72@gmail.com', null, null, '25/02/2020 12:49:28 PM', '61665', '26/02/2020 9:08:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6734442', '24/02/2020 1:08:34 PM', 'TicketBook', '8915', '1582542516', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'garikaijohns@gmail.com', null, null, '24/02/2020 1:13:11 PM', '61606', '25/02/2020 9:09:31 PM');
INSERT INTO `paynow` VALUES ('Settled', '6734283', '24/02/2020 1:01:05 PM', 'TicketBook', '8915', '1582542066', '203.5500', '200.0000', 'EcoCash', 'EcoCash', 'traebanda@gmail.com', null, null, '25/02/2020 12:49:40 PM', '61665', '26/02/2020 9:08:31 PM');
