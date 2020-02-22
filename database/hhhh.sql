INSERT INTO `eventszim`.`zim_events` (
	`id`
	`event_type_id`,
	`catergory_id`,
	`event_name`,
	`start_date`,
	`end_date`,
	`popular_rank`,
	`created_at`,
	`updated_at`
)
VALUES
	(
		'8',
		NULL,
		'1',
		'Star Fm Awards',
		'2020-03-03 00:00:00',
		'2020-03-03 00:00:00',
		'2.0000',
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`zim_events` (
	`id`
	`event_type_id`,
	`catergory_id`,
	`event_name`,
	`start_date`,
	`end_date`,
	`popular_rank`,
	`created_at`,
	`updated_at`
)
VALUES
	(
		'9',
		NULL,
		'1',
		'xxx marathon',
		'2020-03-03 00:00:00',
		'2020-03-03 00:00:00',
		'2.0000',
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`price_sub_categories` (
	`id`,
	`event_id`,
	`category_id`,
	`description`,
	`price_zwl`,
	`price_usd`,
	`max_tickets`,
	`quantity`,
	`status`,
	`created_at`,
	`updated_at`
)
VALUES
	(
		'13',
		'8',
		'1',
		'General Access',
		'0.1000',
		'0.0000',
		'5',
		'1400',
		'sale',
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`price_sub_categories` (
	`event_id`,
	`category_id`,
	`description`,
	`price_zwl`,
	`price_usd`,
	`max_tickets`,
	`quantity`,
	`status`,
	`created_at`,
	`updated_at`
)
VALUES
	(
		'8',
		'1',
		'VIP',
		'0.1000',
		'0.0000',
		'5',
		'1400',
		'sale',
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`price_sub_categories` (
	`event_id`,
	`category_id`,
	`description`,
	`price_zwl`,
	`price_usd`,
	`max_tickets`,
	`quantity`,
	`status`,
	`created_at`,
	`updated_at`
)
VALUES
	(
		'9',
		'1',
		'5km Race',
		'0.1000',
		'0.0000',
		'5',
		'215',
		'sale',
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`price_sub_categories` (
	`event_id`,
	`category_id`,
	`description`,
	`price_zwl`,
	`price_usd`,
	`max_tickets`,
	`quantity`,
	`status`,
	`created_at`,
	`updated_at`
)
VALUES
	(
		'9',
		'1',
		'10km Race',
		'1.0000',
		'0.0000',
		'5',
		'675',
		'sale',
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`event_types` (

	`event_id`,
	`event_type`,
	`description`,
	`created_at`,
	`updated_at`
)
VALUES
	(
	
		'8',
		'event',
		'event',
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`event_types` (

	`event_id`,
	`event_type`,
	`description`,
	`created_at`,
	`updated_at`
)
VALUES
	(
	
		'9',
		'marathon',
		'marathon',
		NULL,
		NULL
	);
