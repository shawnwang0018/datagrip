-- 换货
--  检查订单是否都在在途
SELECT count(1)
FROM t_td_sales_order t
WHERE t.PLATFORM_ORDER_CODE >= '5555550661200001'
  AND t.PLATFORM_ORDER_CODE <= '5555550661300000'
  AND t.ORDER_STATUS = 6
  AND t.SPECIAL_TYPE = 0;
-- 查看指令是否都接入

-- 待执行数量
SELECT count(1)
FROM t_td_return_exchange_direct t
WHERE t.`AUTO_CREATE_STATUS` = 0
  AND t.`OMS_STATUS` = 0
  AND SHOP_ID = 11495;
-- 打开定时任务 处理数据
-- 处理成功的效率 -- 时间修改为打开定时任务的时间
-- 按分钟查看数量：
-- 按分钟查看解析效率：
SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1) 处理数量
FROM
	t_td_return_exchange_direct t
WHERE
	t.UPDATE_TIME >= '2020-09-27 21:00:00'
 AND t.AUTO_CREATE_STATUS = 1
AND t.SHOP_ID in (11497,11502)
GROUP BY
	dd
ORDER BY
	dd desc;
show CREATE table t_message_consumer;
SELECT count(1) from t_receive_pacs_mq_msg_line t where CREATE_TIME > '';

SELECT count(1) from t_td_sales_order t where  t.CREATE_TIME > '2020-08-01' and t.FINANCE_STATUS = 2;
SELECT count(1) from t_wms_confirm_order t where t.SHOP_ID in (11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,
176702,11500,11494,11493,326725,326726,176707) and t.INPUT_TIME > '2020-08-01';

SELECT * from t_message_consumer t where
 t.msg_id = '1272764701889514295_6e4e5be5-f980-4144-b762-8902efd105af-fb6c38a2-5b4e-4556-b6eb-7ae6285d2589';

SELECT * from t_sys_task_config where CLASS_NAME like '%logisticsTopTaskManager%';

SELECT t.WAREHOUSE_CODE, count(1) from t_td_sales_order t 
where t.CREATE_TIME > '2020-09-28 14:30:00' and t.ORDER_STATUS = 20
and t.ERP_SHOP_CODE in (11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,
176702,11500,11494,11493,326725,326726,176707)
 GROUP BY t.WAREHOUSE_CODE ;

SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H-%i'
	) dd,
	COUNT(1)
FROM
	t_td_return_exchange_direct t
WHERE
	t.UPDATE_TIME >= '2020-09-27 21:00:00'
 AND t.AUTO_CREATE_STATUS = 1
AND t.SHOP_ID in (11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,
176702,11500,11494,11493,326725,326726,176707)
GROUP BY
	dd
ORDER BY
	dd;

SELECT count(1) from t_td_return_exchange_direct t where t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) and t.CREATE_TIME > '2020-09-15'
 limit 10;
SELECT * from t_top_round_timer;
SELECT * from t_ma_shop_wh t where t.SHOP_ID in (2042);
show CREATE TABLE t_wms_inv_log;

SELECT * from t_td_sales_order t where t.ERP_SHOP_CODE in (2042) and t.WAREHOUSE_CODE in 
('SHWH453','SHWH333') and t.CREATE_TIME > '2020-01-01' 
limit 100;

SELECT BARCH_NO from t_wms_inv_log t GROUP BY BARCH_NO where ;

SELECT NEXT_EXEC_TIME from t_td_return_exchange_direct where CREATE_TIME > '2020-05-09' and SHOP_ID = 11500 and OMS_STATUS != 1;

update t_td_return_exchange_direct set NEXT_EXEC_TIME = NOW() where CREATE_TIME > '2020-05-09' and SHOP_ID = 11500 and OMS_STATUS != 1;

SELECT * from t_td_return_exchange_direct t where t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
 and t.CREATE_TIME > '2020-09-15';
select t.WAREHOUSE_CODE, t.* from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555551788652001' and t.CREATE_TIME > '2020-09-07' LIMIT 100;
SELECT OMS_STATUS, count(1) FROM t_td_return_exchange_direct where 
CREATE_TIME > '2020-05-09' and SHOP_ID = 11500 GROUP BY OMS_STATUS;

SELECT count(1) from t_td_return_application_summary t where t.ERP_SHOP_CODE in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) and t.CREATE_TIME > '2020-09-08';
SELECT * from t_top_round_timer; 


SELECT * from t_td_return_exchange_direct t where t.CREATE_TIME > '2020-09-27 19:00:00' and 
t.SHOP_ID in(
11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726
);


SELECT
                t.*
                FROM t_td_return_exchange_direct t
                WHERE t.SHOP_ID IN (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
                AND t.OMS_STATUS = 0
                AND (t.STATUS = '换货待处理' OR t.STATUS = '待买家退货' OR t.STATUS = '买家已退货，待收货')
                AND (
                    (
                      t.AUTO_CREATE_STATUS = 0
                      AND (t.NEXT_EXEC_TIME <= SYSDATE() OR t.NEXT_EXEC_TIME IS NULL)
                    )
                    OR
                    ( t.AUTO_CREATE_STATUS = 2 AND t.ERROR_COUNT < 3 AND t.NEXT_EXEC_TIME <= SYSDATE())
                )
                ORDER BY t.CREATE_TIME LIMIT 5000;

SELECT * from t_td_return_exchange_direct t where t.UPDATE_TIME > '2020-09-27 21:20:00' 
and t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) ORDER BY update_time desc limit 1000;

SELECT * from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555551947204712';

SELECT * from t_td_return_application t where t.PLATFORM_ORDER_CODE = '5555551947204712';

sh