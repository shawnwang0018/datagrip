select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H-%i' ) 创单,COUNT(1) from t_td_sales_order a where a.ERP_SHOP_CODE not in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-09-09' 
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H-%i' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H-%i' ) desc ;

SELECT t.SHOP_ID, t.* from t_ma_tb_shop_info t where t.SHOP_ID like '%sk%';

select ORDER_STATUS, ERP_SHOP_CODE,COUNT(1) from t_td_sales_order a where a.ERP_SHOP_CODE in (
41665,41672
) and a.CREATE_TIME >= '2020-09-09'
GROUP BY ORDER_STATUS , ERP_SHOP_CODE
order BY ORDER_STATUS desc ;
SELECT * from t_td_sales_order t where t.CREATE_TIME > '2020-09-09' and t.ERP_SHOP_CODE in (41665,41672)
and t.ORDER_STATUS in (18) limit 100;

SELECT * from t_ma_shop_wh t where t.SHOP_ID in (41665);

-- 过路由
select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H%i' ) 过路由,COUNT(1) from t_send_wms a where a.SHOP_ID  in (
41665) and a.CREATE_TIME >= '2020-09-09'
and a.MSG_TYPE = 'soRoute'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H%i' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H%i' ) desc ;
-- 41665   41672
-- 路由反馈
SELECT DATE_FORMAT(t.process_time, '%Y-%c-%d %H-%i' ) dd,COUNT(*) from t_split_order_head t where t.process_time >'2020-09-09' 
and ( t.SHOP_ID not in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
)) and t.process_status = 10  GROUP BY dd ORDER BY dd desc;

-- 过仓
select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H:%i' ) 过仓,COUNT(1) from t_send_wms a,t_td_sales_order o where a.SHOP_ID not in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-09-09'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
and a.MSG_TYPE = 'SO'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H:%i' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H:%i' ) desc ;




SELECT DATE_FORMAT(t.input_time, '%Y-%c-%d %H:%i' ) 创单反馈,COUNT(*) from t_wms_confirm_order t where
 t.INPUT_TIME > '2020-09-09'  and ( t.SHOP_ID not in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
)) and t.process_status = 10 GROUP BY DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i' )
 order by DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i') desc;

-- 取消
SELECT
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t 
WHERE
  t.CREATE_TIME >= '2020-09-09'
AND (t.`STATUS` in (10,3) )
GROUP BY
	dd
ORDER BY
	dd desc;
-- t_td_create_refund_task

SELECT
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_td_create_refund_task t 
WHERE
  t.CREATE_TIME >= '2020-09-09'
AND (t.`STATUS` in (10) )
GROUP BY
	dd
ORDER BY
	dd desc;-- 57733  57838  5802
SELECT * from t_ag_ship_cancel_detail t where t.status in (3,5) and t.CREATE_TIME > '2020-09-09' ORDER BY t.CREATE_TIME limit 100;
32618410
ORDER BY t.create_time desc limit 10;SELECT * from t_ag_ship_cancel_detail t where t.status in (3,5) and t.CREATE_TIME > '2020-09-09' ORDER BY t.CREATE_TIME limit 100;
SELECT memo, count(1) from t_ag_ship_cancel_detail t where t.status in (3,5) and t.CREATE_TIME > '2020-09-09' ORDER BY t.memo;

SELECT count(1) from t_td_refund_application t where t.CREATE_TIME > '2020-09-09';
SELECT count(1) from t_td_sales_order t where t.CREATE_TIME > '2020-09-09' and t.ORDER_STATUS = 10;
SELECT count(1) from t_td_create_refund_task t where t.CREATE_TIME > '2020-09-09';
SELECT * from t_td_sales_order t where t.CREATE_TIME > '2020-09-09' and 
SELECT * from t_sys_task_config t where t.CLASS_NAME like '%OrderToRouteByDbManager%';