SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_send_wms a
WHERE
	 a.CREATE_TIME >= '2020-11-1 00:00:00'
AND a.MSG_TYPE = 'soRoute'
GROUP BY
	dd
ORDER BY
	dd ;