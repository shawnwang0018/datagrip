SELECT
	DATE_FORMAT(
		t.PROCESS_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(*)
FROM
	t_split_order_head t
WHERE
	t.PROCESS_TIME > '2020-11-1 00:00:00'
AND t.PROCESS_STATUS = 10
GROUP BY
	dd
ORDER BY
	dd DESC;