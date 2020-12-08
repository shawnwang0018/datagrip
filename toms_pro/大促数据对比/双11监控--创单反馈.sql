SELECT
	DATE_FORMAT(t.input_time, '%Y-%c-%d %H-%i') dd,
	COUNT(*)
FROM
	t_wms_confirm_order t
WHERE
	t.INPUT_TIME >= '2020-11-1 00:00:00'
AND t.process_status = 10
GROUP BY
	dd
ORDER BY
	dd DESC;