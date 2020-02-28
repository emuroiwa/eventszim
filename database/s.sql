INSERT INTO `eventszim`.`event_infos` (

	`event_id`,
	`discounts`,
	`ticket_collection`,
	`refund_cancel`,
	`exchange_upgrade`,
	`duration`,
	`gps`,
	`event_details`,
	`search_query`,
	`is_slider`,
	`event_img`,
	`event_mobile_img`,
	`event_card_img`,
	`event_ticket_img`,
	`youtube`,
	`instagram`,
	`twitter`,
	`email`,
	`whatsapp`,
	`website`,
	`created_at`,
	`updated_at`
)
VALUES
	(

		'8',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		NULL,
		'The 25th April is set as thee frivolous day of high tea, games, fashion show and wonderful prizes to be won as the Jewelry Auction takes off. Hosted at the Meikles Hotel you know the service is exceptional.  So, all you need to bring along is your finesse, elegance and exceptionally good company, for a relaxing afternoon of delicacies. The event begins at 2:00 pm, in the Palm court and parking is included in the ticket.',
		NULL,
		'1',
		'img/slide/high_tea.png',
		NULL,
		'img/slide/card-image/high_tea.png',
		'img/slide/ticket-img/high_tea_ticket.png',
		NULL,
		NULL,
		NULL,
		NULL,
		'0774361648',
		NULL,
		NULL,
		NULL
	);

INSERT INTO `eventszim`.`event_locations` (

	`event_id`,
	`venue`,
	`address1`,
	`town`,
	`province`,
	`country`,
	`image`,
	`created_at`,
	`updated_at`
)
VALUES
	(

		'8',
		'Meikles Hotel',
		NULL,
		'Harare',
		NULL,
		NULL,
		NULL,
		NULL,
		NULL
	);

