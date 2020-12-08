--  AG取消
--  检查订单是否都在库房准备中
SELECT count(1)
FROM t_td_sales_order t
WHERE t.PLATFORM_ORDER_CODE >= '5555550657840001' AND t.PLATFORM_ORDER_CODE <= '5555550657940000'
  AND t.ORDER_STATUS = 4;
-- 查看指令是否都接入

SELECT count(1) from t_tb_automated_after_sale t where t.REFUND_ID > '2622620001600000' and t.REFUND_ID< '2622620500600999';

SELECT count(1) from t_td_sales_order where ERP_SHOP_CODE in (11500) and PLATFORM_ORDER_CODE > '5555551219650974' and PLATFORM_ORDER_CODE < '5555551229171376';
show create table t_tb_automated_after_sale;
SELECT min(tid) from t_tb_automated_after_sale where SHOP_ID in (11500) and CREATE_TIME > '2020-05-22';
select * from t_sys_shop_db;
SELECT t.SHOP_ID, count(1) from t_tb_automated_after_sale t where t.shop_id in 
(11502, 11500)
 and t.CREATED > '2020-05-22 17:30:00' GROUP BY t.SHOP_ID;

SELECT count(1) from t_tb_automated_after_sale t where t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) 
and t.CREATED > '2020-09-07 17:30:00';

update t_tb_automated_after_sale set PROCESS_STATUS=99 where SHOP_ID in (11500) and CREATED > '2020-05-22 17:30:00' ;

SELECT * from t_tb_automated_after_sale t where t.CREATE_TIME > '2020-09-07' limit 10;

SELECT PROCESS_STATUS, count(1) from t_tb_automated_after_sale t 
where t.CREATE_TIME > '2020-09-07' and SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
 GROUP BY PROCESS_STATUS ORDER BY PROCESS_STATUS;

SELECT
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_tb_automated_after_sale t 
WHERE
	t.CREATE_TIME >= '2020-08-25 00:00:00' 
AND (t.`STATUS` = 10 )
 AND t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
GROUP BY
	dd
ORDER BY
	dd DESC;

SELECT DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd, count(1) from t_tb_automated_after_sale t where t.SHOP_ID in (11500,11502) and
 t.CREATE_TIME > '2020-08-25' and t.PROCESS_STATUS = 10
 GROUP BY dd ORDER BY dd desc;

SELECT * from t_tb_automated_after_sale t where t.TID = '2502500500600064';

SELECT COUNT(1)
FROM t_receive_ag_log t
WHERE t.msg_type = 'qimen.taobao.rdc.aligenius.order.abort'
  AND t.CREATE_TIME >= '2019-10-10 10:00:00'
  AND t.status = 0
  AND t.shop_id IN (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);

SELECT * from t_ag_ship_cancel_detail t where t.CREATE_TIME > '2020-08-25 13:00:00' and t.SHOP_ID in 
(11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);

SELECT count(1) from t_ag_ship_cancel_detail t where t.SHOP_ID in (11500,11502) t.CREATE_TIME > '2020-05-22';

-- 打开定时任务 处理数据
-- 处理成功的效率 -- 时间修改为打开定时任务的时间
-- 按分钟查看数量：
SELECT
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t LEFT JOIN t_td_sales_order so ON t.TID = so.PLATFORM_ORDER_CODE
WHERE
 t.SHOP_ID in (11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707)
	AND t.CREATE_TIME >= '2020-08-25 18:00:00'
AND (t.`STATUS` = 10 )
--  and so.IS_DIRECT_WMS_ORDER = 1

GROUP BY
	dd
ORDER BY
	dd;

SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理效率,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t LEFT JOIN t_td_sales_order so ON t.TID = so.PLATFORM_ORDER_CODE
WHERE
	t.UPDATE_TIME >= '2020-05-22 18:00:00'
AND (t.`STATUS` = 10 ) and so.IS_DIRECT_WMS_ORDER in (1,3)
 AND t.SHOP_ID in (11502,11500)
GROUP BY
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	)
ORDER BY
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	);




SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理效率,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t LEFT JOIN t_td_sales_order so ON t.TID = so.PLATFORM_ORDER_CODE
WHERE
	t.UPDATE_TIME >= '2020-05-22 18:00:00' and t.SHOP_ID in (11502,11500)
AND (t.`STATUS` = 10 ) and so.IS_DIRECT_WMS_ORDER in (1,3)
 AND t.SHOP_ID in (11502,11500)
GROUP BY
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	)
ORDER BY
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) DESC;

SELECT * from t_ag_ship_cancel_detail t where t.SHOP_ID in (11497) and t.CREATE_TIME > '2020-05-23'; 

SELECT * from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555551248643512';

SELECT t.`STATUS`, count(1) FROM t_ag_ship_cancel_detail t where t.CREATE_TIME > '2020-05-21'
 and t.SHOP_ID in (11500,11502) GROUP BY t.`STATUS` ;

SELECT t.ORDER_STATUS , count(1) from t_td_sales_order t where t.ERP_SHOP_CODE in (11500,11502)
 and t.CREATE_TIME > '2020-05-09 15:00:00' GROUP BY t.order_status ;

SELECT count(1) from t_td_sales_order t where t.ERP_SHOP_CODE in (11500,11502)
 and t.CREATE_TIME > '2020-05-09 15:00:00';

	SELECT count(1) from t_ag_ship_cancel_detail t where t.SHOP_ID in 
	(11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,
	11496,176701,176700,176702,11500,11494,11493,326725,326726);
SELECT count(1) from t_send_so_msg t where t.SYNC_STATUS = 0;
SELECT count(1) from t_ag_refund_notify_pacs t where t.`STATUS` = 0;
SELECT count(1) from t_td_rf_autotask_info t where t.PROCESS_STATUS = 0;

SELECT * from t_ma_shop_wh t where t.SHOP_ID in (
11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,
	11496,176701,176700,176702,11500,11494,11493,326725,326726
);

SELECT * from t_ag_ship_cancel_detail t where t.SHOP_ID in (11497) and t.CREATE_TIME > '2020-05-22' limit 10;

SELECT * from t_td_refund_direct t where t.SHOP_ID in (11497) and t.CREATE_TIME > '2020-05-23';
update t_ma_tb_shop_info SET IS_AUTO_APPOINTMENT = 1 , APPOINTMENT_TIME = 6 where id in (11502,11495,11497);
SELECT * from t_ma_tb_shop_info where id in (11502,11495,11497);
update t_ma_tb_shop_info SET IS_AUTO_APPOINTMENT = 1 , APPOINTMENT_TIME = 6 where id in (11502,11495,11497);
SELECT * from t_tb_automated_after_sale t where t.SHOP_ID in (11497) and t.CREATED > '2020-05-23 11:00:00' LIMIT 10;

SELECT * from t_td_refund_application t where t.COMPANY_SHOP_ID in (11497) and  t.PLATFORM_REFUND_CODE in (2682680001600000);

select * from t_td_rf_autotask_info t where t.SHOP_ID in (11497);

SELECT
	t.`STATUS` ,
	COUNT(1)
FROM
	t_td_create_refund_task t 
WHERE
	t.create_time >= '2020-08-25 18:00:00'
-- AND (t.`STATUS` = 10 )
 AND t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
GROUP BY
	STATUS
ORDER BY
	STATUS DESC;

SELECT * from t_td_create_refund_task t where t.create_time >= '2020-08-25 18:00:00' and t.`STATUS` = 1 ORDER BY t.CREATE_TIME desc limit 100;