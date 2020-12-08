SELECT
	l. STATUS,
	l. CODE,
	l.error_msg,
	l.error_count,
	l.platform_order_type,
	l.platform_order_status,
	l.CUSTOMIZATION_MEMO,
	l.special_type,
  
	l.*
FROM
	t_mq_so_log l
WHERE
	l. CODE IN ('1307891016134642231');


-- 1890994344

SELECT t.extention_code, t.* from t_mq_so_line_log t where t.so_log_id = 1890994344;


SELECT t.SHOP_ID, t.* from t_ma_tb_shop_info t where t.ID = 506762;

SELECT t.* from t_ma_combo_sku t where code in ('6915324688862',
'6915324813042',
'COMB054854',
'COMB055481',
'NIVEA0128',
'6915324888132',
'NIVEA0581',
'NIVEA0125');
-- 1124271,1121413

SELECT * from t_mq_so_log t where t.id = 1890994344;

SELECT * from t_ma_combo_sku_line t where t.COMBO_SKU_ID in (1124271,1121413);
SELECT t.IS_BOUND,t.* from t_ma_tb_shop_info t where id = 2042;
SELECT count(1) from t_ma_combo_sku_line t where t.PRICE = 0.00 and t.COMBO_SKU_ID > 0;

SELECT * from t_top_tb_trade t where t.TID = 1307891016134642231;

SELECT * from t_mq_so_log t where ;



SELECT
	a.error_msg dd,
	COUNT(1)
FROM
	t_mq_so_log a
WHERE
	a.CREATE_TIME >= '2020-10-21 00:00:00'
AND a.`status` = 5
GROUP BY
	dd
ORDER BY
	dd DESC;


SELECT * from t_td_sales_order t LEFT JOIN t_wf_workflow_task w
on w.REF_SLIP_CODE = t.PLATFORM_ORDER_CODE_N 
where w.CURRENT_NODE_NO = 19 and t.CREATE_TIME > '2020-10-21';

SELECT t.ERP_SHOP_CODE,t.TRACKING_NO, t.TRANSPORTATOR_CODE, t.* from t_td_return_application_summary t where t.RAS_CODE = 'RAS48784888';
SELECT t.IS_RAS_TRANS, t.* from t_ma_tb_shop_info t where t.ID = 10593;
SELECT * from t_send_return_trans_info t where t.RAS_ID = 44625692;

SELECT * from t_search_return_trans_info t where t.RAS_ID = 44625692;

update t_search_return_trans_info set NEXT_RETRY_TIME = NOW() where ID = 9744373;

SELECT * from t_td_refund_direct t where t.SHOP_ID in (10593) and t.CREATE_TIME > '2020-10-19' and t.RD_STATUS = 2;


update t_td_refund_direct set TID = -TID where RD_STATUS = 2 and SHOP_ID in (10593,,,,,);

SELECT * from t_td_refund_direct t where t.tid = '1323786278163273322';

SELECT * FROM t_receive_wms_log l WHERE l.CONTENT like '%1329231997826678124%' AND l.CREATE_TIME>'2020-10-26' AND ID in(713988354,714015818);

SELECT * from t_wf_workflow_task t where t.REF_SLIP_CODE = '1329231997826678124';

SELECT * from t_wf_workflow_task_log t where t.TASK_ID = 1987544036;

SELECT * from t_wf_workflow_transition where FROM_NODE_ID = 13;

SELECT * from t_sys_task_config;



SELECT
	count(1)
FROM
	t_so_step_wh_queue s
LEFT JOIN t_td_sales_order t ON t.id = s.SO_ID
WHERE
	t.IS_DIRECT_WMS_ORDER = 1
AND s.CREATE_TIME > '2020-11-01'
AND s.PROCESS_STATUS IN (0, 2);

SELECT MAX(id) from t_wms_order_status;

SELECT count(1) from t_td_sales_order t where t.ERP_SHOP_CODE in  (4062) and t.CREATE_TIME > '2020-10-16';

SELECT * from t_apple_auto_re_retry t where t.CREATE_TIME > '2020-10-28 10' and t.CREATE_TIME < '2020-10-29';

SELECT * from t_apple_auto_return t where t.CREATE_TIME > '2020-10-28 10' and t.CREATE_TIME < '2020-10-29';


