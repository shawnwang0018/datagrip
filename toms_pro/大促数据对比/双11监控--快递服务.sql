SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_send_wms a,
	t_td_sales_order o
WHERE
	 a.CREATE_TIME >= '2020-11-01 00:00:00'
AND o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
AND a.MSG_TYPE = 'DELIVERY'
GROUP BY
	dd
ORDER BY
	dd DESC;