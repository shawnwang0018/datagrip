SELECT
	DATE_FORMAT(
		t.PROCESS_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	count(1)
FROM
	t_td_so_wf_task t
WHERE
	 t.CREATE_TIME > '2020-11-1 00:00:00'
AND t.PROCESS_STATUS = 10
GROUP BY
	dd
ORDER BY
	dd DESC;