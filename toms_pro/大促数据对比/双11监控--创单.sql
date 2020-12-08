SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H%i'
	) dd,
	COUNT(1)
FROM
	t_td_sales_order a
WHERE
	a.CREATE_TIME >= '2020-11-1 00:00'
GROUP BY
	dd
ORDER BY
	dd DESC;

SELECT count(1) from t_td_sales_order t where t.ERP_SHOP_CODE = '2042' 
and t.CREATE_TIME > '2020-10-21';