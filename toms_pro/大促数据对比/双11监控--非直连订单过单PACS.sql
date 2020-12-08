SELECT
	DATE_FORMAT(
		t.SYNC_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(*)
FROM
	t_send_so_msg t
WHERE
	t.SYNC_TIME > '2020-11-1 00:00:00'
AND t.sync_status = 1
GROUP BY
	dd
ORDER BY
	dd DESC;