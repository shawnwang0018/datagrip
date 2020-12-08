SELECT count (1) FROM t_so_step_wh_queue s
LEFT JOIN t_td_sales_order t ON t.id = s.SO_ID
 WHERE t.IS_DIRECT_WMS_ORDER = 1
AND s.CREATE_TIME >= '2020-11-01 00:00:00'
AND s.id > 81903001
AND s.PROCESS_STATUS = 10;