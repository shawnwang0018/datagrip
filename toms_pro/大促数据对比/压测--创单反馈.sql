SELECT DATE_FORMAT(t.input_time, '%Y-%c-%d %H:%i' ) dd,COUNT(*) from t_wms_confirm_order t where
 t.INPUT_TIME > '2020-10-05 10:00:00'  and ( t.SHOP_ID in
(
11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707,11502
) or t.SHOP_ID is null) and t.process_status = 10 GROUP BY dd
 order by dd desc;



SELECT DATE_FORMAT(t.input_time, '%Y-%c-%d %H' ) dd,COUNT(*) from t_wms_confirm_order t where
 t.INPUT_TIME > '2020-10-10 13:30:00'  and ( t.SHOP_ID in
(
11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707,11502
) or t.SHOP_ID is null) and t.process_status = 10 GROUP BY dd
 order by dd desc;

SELECT * from t_wms_confirm_order t where t.INPUT_TIME > '2020-10-04 13:32:00' and t.INPUT_TIME < '2020-10-04 13:33:00' 
ORDER BY t.INPUT_TIME desc limit 1000;

SELECT DATE_FORMAT(t.input_time, '%Y-%c-%d %H' ) dd,COUNT(*) from t_wms_confirm_order t where
 t.INPUT_TIME > '2020-10-02 13:00:00'  and ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) or t.SHOP_ID is null) and t.process_status = 10 GROUP BY dd
 order by dd desc;

SELECT * from t_wms_confirm_order t where t.PLATFORM_ORDER_CODE_N = '1280309583306692035' and t.INPUT_TIME > '2020-10-02';
update t_wms_confirm_order set WMS_STATUS = 10 , STATUS = 0, RETRY_DATE = NOW() where id = 823160795;

SELECT * from t_wms_shipping t limit 1;

SELECT DATE_FORMAT(t.PROCESS_TIME, '%Y-%c-%d %H:%i' ) dd,COUNT(*) from t_wms_confirm_order t where
 t.INPUT_TIME > '2020-09-22 14:30:00'  and ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) or t.SHOP_ID is null) and t.process_status = 10 GROUP BY dd
 order by dd desc;
-- 70350680  69991407 69537387 68220165
SELECT count(1) from t_wms_confirm_order t where t.INPUT_TIME > '2020-08-01';
-- 65552644 , 65552756
SELECT count(1) from t_wms_confirm_order t where t.INPUT_TIME > '2020-08-01';

SELECT * from t_sys_shop_db;

SELECT * from t_sys_task_config t where t.CLASS_NAME like '%sysOrderOperateLogTaskManager%';

SELECT * from (SELECT SALES_ORDER_ID, count(1) c from t_td_sales_order t 
LEFT JOIN t_td_sales_order_line sol on sol.SALES_ORDER_ID = t.ID

where t.ERP_SHOP_CODE in (101664,2042) and t.CREATE_TIME > '2020-09-25 16:18:35' and sol.QUANTITY > 1 and sol.ORDER_LINE_TYPE = 1
GROUP BY SALES_ORDER_ID) ss where ss.c > 2;


          select * from t_wms_confirm_order t where (t.SHOP_ID is null or t.SHOP_ID in (11502,11501,11499,176706,176704,11498,11497,176705,176703,
11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707))
            and t.INPUT_TIME > '2020-08-01' and t.INPUT_TIME < DATE_SUB(CURDATE(),INTERVAL -1 DAY)
            and t.PLATFORM_ORDER_CODE_N like '555555%' limit 5000;


select id from t_wms_confirm_order t where (t.SHOP_ID is null or t.SHOP_ID in (11502,11501,11499,176706,176704,11498,11497,176705,176703,
11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707)) and t.PLATFORM_ORDER_CODE_N like '555555%' limit 5000;

SELECT * from t_wms_confirm_order;
SELECT DATE_FORMAT(t.input_time, '%Y-%c-%d %H:%i' ) 创单反馈,COUNT(*) from t_wms_confirm_order t where
 t.INPUT_TIME > '2020-10-04 10:00:00'  and ( t.SHOP_ID is null or t.SHOP_ID in
(
1497,176703,11495
)) and t.process_status = 10 GROUP BY DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i' )
 order by DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i') desc;

SELECT * from t_wms_confirm_order where INPUT_TIME > '2020-10-04 10:00:00' and ORDER_TYPE = 21
and SHOP_ID is not null
and PLATFORM_ORDER_CODE_N like '555555%' ORDER BY INPUT_TIME desc
limit 100;
