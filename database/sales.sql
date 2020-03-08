DROP VIEW IF EXISTS `sales`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost`  VIEW `sales` AS SELECT
	count(*),psc.description
FROM
	`payments`
INNER JOIN orders ON orders.reference = payments.order_ref
INNER JOIN price_sub_categories psc on psc.id = orders.category_id WHERE payments.`status`=1 GROUP BY psc.description;