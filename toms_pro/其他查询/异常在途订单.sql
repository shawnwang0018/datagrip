SELECT concat(t.order_code,'\t'),t.*
FROM t_wms_order_status t
WHERE t.RETRY_COUNT > 1
  AND t.PROCESS_STATUS = 0
  AND t.PROCESS_TIME >= '2020-4-1'
  AND ORDER_TYPE = 21;


