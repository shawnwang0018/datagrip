SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H-%i'
	) 刷尾款,
	COUNT(1)
FROM
	t_so_step_payment_log a
WHERE
	 a.CREATE_TIME >= '2020-11-1 00:00:00'
AND a.CREATE_TIME <= '2020-11-1 05:00:00'
AND a.PROCESS_STATUS = 10
GROUP BY
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H-%i'
	)
ORDER BY
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H-%i'
	) DESC;