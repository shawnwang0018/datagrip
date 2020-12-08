SELECT
	` ` COUNT `` (*) ``
FROM
	` ` t_td_sales_order t ``
WHERE
	` ` t.CREATE_TIME > `` '2020-10-21' ` `
AND ` ` t.SPECIAL_TYPE `` IN ` ` (11, 12) ``
AND ` ` t.FINANCE_STATUS = 2 ``
AND `` t.ORDER_STATUS `` NOT ` ` IN ` ` (10, 0);