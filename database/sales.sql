DROP VIEW IF EXISTS `runners`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `runners` AS SELECT
	psc.description,customers.*
FROM
	`payments`
INNER JOIN orders ON orders.reference = payments.order_ref
INNER JOIN price_sub_categories psc on psc.id = orders.category_id
INNER JOIN customers on customers.order_id = payments.order_ref

WHERE payments.`status`=1 ;