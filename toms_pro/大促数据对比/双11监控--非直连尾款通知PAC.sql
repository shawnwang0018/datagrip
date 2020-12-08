SELECT
	DATE_FORMAT(
		spmm.SYNC_TIME,
		'%Y-%c-%d %H%i'
	) dd,
	COUNT(1)
FROM
	t_send_pacs_mq_msg spmm
WHERE
	 spmm.SYNC_TIME >= '2020-10-21 00:00'
AND (
	spmm.SYNC_STATUS = 1
	OR spmm.SYNC_STATUS = 4
)
AND spmm.MSG_TYPE = 'O2-15'
GROUP BY
	dd
ORDER BY
	dd DESC;