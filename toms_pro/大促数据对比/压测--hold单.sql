-- 预约过仓  t_td_so_appointment_to_wh_task

select * from t_td_so_appointment_to_wh_task t where t.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and t.CREATE_TIME > '2020-10-04 10:00:00' and t.PROCESS_STATUS = 2 limit 100;
11497,11495,
SELECT * from t_td_sales_order t where t.ERP_SHOP_CODE in (
11502

) and t.CREATE_TIME > '2020-10-03' and t.ORDER_STATUS = 20 ORDER BY t.CREATE_TIME desc limit 100;

select count(1) from t_td_so_appointment_to_wh_task t where t.SHOP_ID in (
11502,11495
) and t.CREATE_TIME > '2020-09-25 20:00:00' and t.PROCESS_STATUS = 2 and t.TO_WH_TIME > NOW();

update t_td_so_appointment_to_wh_task set TO_WH_TIME = now() where SHOP_ID in (11502)
 and PROCESS_STATUS = 2 and CREATE_TIME > '2020-09-25 21:00:00';

select t.SHOP_ID, count(1) from t_td_so_appointment_to_wh_task t where t.SHOP_ID in (
11495,11501,11497
) and t.CREATE_TIME > '2020-05-14' and t.PROCESS_STATUS = 2 and IS_AUTO_TO = 1 GROUP BY t.SHOP_ID;

select * from t_send_wms t where t.create_time > '2020-09-15' and t.key_code in ('5555551839950022');

SELECT t.SHOP_ID, COUNT(*) from t_split_order_head t where t.INPUT_TIME >'2020-05-14' and ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) or t.SHOP_ID is null) and t.PROCESS_STATUS = 10 GROUP BY t.SHOP_ID desc; 

SELECT t.ORDER_STATUS, count(1) from t_td_sales_order t where t.ERP_SHOP_CODE in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and t.CREATE_TIME > '2020-05-14 14:00:00' GROUP BY ORDER_STATUS;

select count(1) from t_td_so_appointment_to_wh_task t where t.SHOP_ID in (
11495,11502,11497
) and t.CREATE_TIME > '2020-09-17 11:00' and t.PROCESS_STATUS = 2 and IS_AUTO_TO = 1 GROUP BY t.SHOP_ID;

select * from t_sys_task_config t where t.class_name like '%finalOrderPacNewManager%';

SELECT * from t_td_so_appointment_to_wh_task t where ;

SELECT DATE_FORMAT(t.UPDATE_TIME, '%Y-%c-%d %H' ) dd,COUNT(*) from t_td_so_appointment_to_wh_task t where ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) or t.SHOP_ID is null) and t.UPDATE_TIME >'2020-10-05 10:00:00' GROUP BY dd ORDER BY dd desc;

SELECT DATE_FORMAT(t.UPDATE_TIME, '%Y-%c-%d %H-%i' ) dd,COUNT(*) from t_td_so_appointment_to_wh_task t where ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) or t.SHOP_ID is null) and t.UPDATE_TIME >'2020-10-10 13:00:00' GROUP BY dd ORDER BY dd desc;


SELECT DATE_FORMAT(t.UPDATE_TIME, '%Y-%c-%d %H' ) dd,COUNT(*) from t_td_so_appointment_to_wh_task t where ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) or t.SHOP_ID is null) and t.UPDATE_TIME >'2020-10-10 11:00:00' GROUP BY dd ORDER BY dd desc;

SELECT * from t_td_so_appointment_to_wh_task t where t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
);

SELECT count(1) from  t_td_so_appointment_to_wh_task t where t.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and t.CREATE_TIME > '2020-09-17' limit 100;

SELECT DATE_FORMAT(t.TO_WH_TIME, '%Y-%c-%d %H-%i' ) dd,COUNT(*) from t_td_so_appointment_to_wh_task t where ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and t.SHOP_ID = 11502) and t.process_status = 2 and t.TO_WH_TIME >'2020-09-19 19:00:00' GROUP BY dd ORDER BY dd desc;

SELECT * from t_td_sales_order t where t.CREATE_TIME > '2020-09-17 16:30:00' and SPECIAL_TYPE not in (11,12) and t.ERP_SHOP_CODE in (11502) ORDER BY t.CREATE_TIME limit 10;