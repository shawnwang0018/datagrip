SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H-%i'
	) dd,
	COUNT(*)
FROM
	t_td_so_appointment_to_wh_task t
WHERE
	 t.process_status = 10
AND t.CREATE_TIME > '2020-11-1 00:00:00'
GROUP BY
	dd
ORDER BY
	dd DESC;