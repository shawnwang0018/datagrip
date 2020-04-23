SELECT
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理时间,
	COUNT(1)
FROM
	t_td_sales_order t
WHERE
	t.CREATE_TIME >= '2020-3-5 00:00:00'
GROUP BY
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	)
ORDER BY
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	);


SELECT COUNT(1) FROM t_td_sales_order t WHERE t.CREATE_TIME >= '2020-3-5 00:00:00';