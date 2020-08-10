-- wms3.0 订单核对
SELECT count(1)
FROM t_td_sales_order so
WHERE so.ORDER_STATUS IN (20, 4, 6, 12, 15)
  AND so.CREATE_TIME >= '2020-06-16 00:00:00'
  AND so.TB_PAYMENT_TIME >= '2020-06-16 00:00:00'
  AND so.CREATE_TIME <= '2020-06-16 04:30:00'
  AND so.TB_PAYMENT_TIME <= '2020-06-16 04:30:00'
  AND so.IS_DIRECT_WMS_ORDER = 1;

-- wms4.0 订单核对
SELECT count(1)
FROM t_td_sales_order so
WHERE so.ORDER_STATUS IN (20, 4, 6, 12, 15)
  AND so.CREATE_TIME >= '2020-06-16 00:00:00'
  AND so.TB_PAYMENT_TIME >= '2020-06-16 00:00:00'
  AND so.CREATE_TIME <= '2020-06-16 04:30:00'
  AND so.TB_PAYMENT_TIME <= '2020-06-16 04:30:00'
  AND so.IS_DIRECT_WMS_ORDER = 1;


SELECT count(1)
FROM t_ag_ship_cancel_detail t
WHERE t.STATUS IN (0, 1, 3)
  AND t.CREATE_TIME >= '2020-06-16 00:00:00';

UPDATE t_ag_ship_cancel_detail
SET LAST_EXECUTE_TIME = now()
WHERE STATUS IN (0, 1, 3)
 AND CREATE_TIME >= '2020-06-16 00:00:00'
LIMIT 10000;


SELECT  t.IS_AUTO_COMMIT FROM t_ma_tb_shop_info t WHERE t.SHOP_ID = 2516;

SELECT * FROM  t_wf_workflow_transition t WHERE t.CODE = 'ORDER_TO_WMS';

SELECT * FROM t_td_sales_order t WHERE t.PLATFORM_ORDER_CODE_N = '605432655059597403-2';

SELECT * FROM t_td_so_appointment_to_wh_task t WHERE t.SALES_ORDER_ID = 1607367901;
SELECT * FROM t_td_so_appointment_to_wh_task t WHERE t.TO_WH_TIME <= now()

