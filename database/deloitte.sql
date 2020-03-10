INSERT INTO `eventszim`.`orders`(`user_id`, `category_id`, `quantity`, `reference`, `status`, `created_at`, `updated_at`) VALUES ('1583835471324', '1', 9, '1583839257', '2', '2020-03-10 11:03:33', '2020-03-10 11:31:20');
INSERT INTO `eventszim`.`orders`(`user_id`, `category_id`, `quantity`, `reference`, `status`, `created_at`, `updated_at`) VALUES ('1583835471324', '2', 12, '1583839257', '2', '2020-03-10 11:03:36', '2020-03-10 11:31:20');
INSERT INTO `eventszim`.`orders`(`user_id`, `category_id`, `quantity`, `reference`, `status`, `created_at`, `updated_at`) VALUES ('1583835471324', '11', 3, '1583839257', '2', '2020-03-10 11:03:36', '2020-03-10 11:31:20');
INSERT INTO `eventszim`.`payments`(`pollURL`, `order_ref`, `amount`, `currency`, `paygate`, `status`, `created_at`, `updated_at`) VALUES ('https://www.paynow.co.zw/Interface/CheckPayment/?guid=660b2a15-f882-4bcd-9c1e-a7e7300bdba9', '1583839257', '3900', 'ZWL', 'paynow', '1', '2020-03-10 11:21:20', '2020-03-10 11:31:20');

INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
	
		'1583835471324',
		2,
		1583839257,
		'Philippa Chiradza',
		'712917654',
		NULL,
		'Female',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		2,
		1583839257,
		'Sichelesile Ndlovu',
		'778351296',
		NULL,
		'Female',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
	
		'1583835471324',
		2,
		1583839257,
		'Cephekhulu Fuyane',
		'772340416',
		NULL,
		'Female',
		NULL,
		NULL,
		'Grandmaster (60 and above)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		2,
		1583839257,
		'Courage Rwizi',
		'775667954',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		2,
		1583839257,
		'Timoti Phiri',
		'774606978',
		NULL,
		'Male',
		NULL,
		NULL,
		'Veteran (40 - 49)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
	
		'1583835471324',
		2,
		1583839257,
		'Chengetai Mashavave',
		'772382632',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		2,
		1583839257,
		'Rumbidzayi Ndebele',
		'717217398',
		NULL,
		'Female',
		NULL,
		NULL,
		'Veteran (40 - 49)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		2,
		1583839257,
		'Laureen Tshuma',
		'712865063',
		NULL,
		'Female',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		2,
		1583839257,
		'Lovemore Nyakambangwe',
		'772389298',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
	
		'1583835471324',
		1,
		1583839257,
		'Nozipho Sayi',
		'772222794',
		NULL,
		'Female',
		NULL,
		NULL,
		'Veteran (40 - 49)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
	
		'1583835471324',
		1,
		1583839257,
		'Tendayi Muramba',
		'772254230',
		NULL,
		'Female',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Marilyn Ncube',
		'773738074',
		NULL,
		'Female',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Nomsa Nyandoro',
		'782089747',
		NULL,
		'Female',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Sithandazile Soganile',
		'772364967',
		NULL,
		'Female',
		NULL,
		NULL,
		'Veteran (40 - 49)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Mkhokeli Nkomo',
		'772340007',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Musa Thabela',
		'775196720',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Tapson Nkomo',
		'771032320',
		NULL,
		'Male',
		NULL,
		NULL,
		'Master (50 - 59)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Thabo Ndlovu',
		'775619504',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Ngonidzashe Madembo',
		'782852880',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Tariro Chikomo',
		'772952702',
		NULL,
		'Female',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		1,
		1583839257,
		'Sipho Nxumalo',
		'772950842',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:17:20',
		'2020-03-10 11:21:19' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		11,
		1583839257,
		'Isaac Mparutsa',
		'773001759',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:23:56',
		'2020-03-10 13:23:56' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
		
		'1583835471324',
		11,
		1583839257,
		'Kudakwashe Mudzanire',
		'772916982',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:23:56',
		'2020-03-10 13:23:56' 
	);
INSERT INTO `eventszim`.`customers` (

	`user_id`,
	`event_id`,
	`order_id`,
	`fullname`,
	`contact`,
	`email`,
	`gender`,
	`tshirtsize`,
	`marathon_tshirt`,
	`marathon_type`,
	`marathon_pickup`,
	`payment_type`,
	`created_at`,
	`updated_at` 
)
VALUES
	(
	
		'1583835471324',
		11,
		1583839257,
		'Takudzwa Shadaya',
		'773769056',
		NULL,
		'Male',
		NULL,
		NULL,
		'Open (18 - 39)',
		'PPC Harare office',
		NULL,
		'2020-03-10 13:23:56',
	'2020-03-10 13:23:56' 
	);