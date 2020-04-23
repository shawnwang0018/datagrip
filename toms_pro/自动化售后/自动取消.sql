SELECT
	t.PROCESS_STATUS,
	t.ERROR_MSG,
	t.*
FROM
	t_tb_automated_after_sale t
WHERE
	t.TID = '950958881895247283';

SELECT *
FROM t_ag_ship_cancel_detail t
WHERE t.TID = '949308736029712614';

SELECT *
FROM t_ag_ship_cancel_detail t
WHERE t.STATUS = 10
ORDER BY UPDATE_TIME DESC LIMIT 100;


