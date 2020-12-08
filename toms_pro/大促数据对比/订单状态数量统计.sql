select ORDER_STATUS,ERP_SHOP_CODE,COUNT(1) from t_td_sales_order a where  a.CREATE_TIME >= '2020-10-21 00:00:00' 
group BY ORDER_STATUS,ERP_SHOP_CODE;


select ORDER_STATUS,COUNT(1) from t_td_sales_order a where a.CREATE_TIME >= '2020-10-21 00:00:00'
group BY ORDER_STATUS;

SELECT count(1) from t_td_sales_order t 
LEFT JOIN t_ma_tb_shop_info i on i.id = t.ERP_SHOP_CODE
where t.CREATE_TIME > '2020-10-21' and t.ORDER_STATUS = 19 and t.IS_BUNDLE = 0;

SELECT count(1) from t_td_sales_order t 
LEFT JOIN t_ma_tb_shop_info i on i.id = t.ERP_SHOP_CODE
where t.CREATE_TIME > '2020-10-21' and t.ORDER_STATUS = 17 and t.IS_BUNDLE = 0;

SELECT count(1) from t_td_sales_order t 
where t.CREATE_TIME > '2020-10-21' and t.ERP_SHOP_CODE in (2042,101664,11247,2516);


SELECT t.ERP_SHOP_CODE, count(1) from t_td_sales_order t where t.IS_DIRECT_WMS_ORDER = 0 and t.SPECIAL_TYPE in (11,12)
and t.CREATE_TIME > '2020-10-21' GROUP BY t.ERP_SHOP_CODE;

SELECT * from t_mq_so_log  t where t.`status` = 5 and t.create_time > '2020-10-21' 
and t.error_msg = '创建订单出错：订单状态不对' limit 10;

SELECT t.platform_order_type, platform_order_status, i.shop_id,i.id, COUNT(1) c from t_mq_so_log  t 
LEFT JOIN t_ma_tb_shop_info i on i.id = t.shop_id
where t.`status` = 5 and t.create_time > '2020-10-21' 
and t.error_msg = '创建订单出错：订单状态不对' and t.total_actual >100 GROUP BY t.platform_order_type, platform_order_status, i.shop_id
, i.id ORDER BY c DESC;
-- skechers运动旗舰店,skechers童鞋旗舰店  10593,41665


SELECT * from t_mq_so_log t where t.`status` = 5 and shop_id in (10593,41665) and error_msg = '创建订单出错：订单状态不对' 
and platform_order_status = 'TRADE_FINISHED' and t.total_actual > 20 and t.create_time > '2020-10-21' ORDER BY t.create_time DESC
limit 10;

SELECT * from t_mq_so_log  t where t.`status` = 5 and t.create_time > '2020-10-21' and  limit 10;
GROUP BY error_msg;

SELECT t.STEP_TRADE_STATUS, count(1) from t_mq_so_log  t where t.`status` = 5 and t.create_time > '2020-10-21' 
GROUP BY STEP_TRADE_STATUS;
