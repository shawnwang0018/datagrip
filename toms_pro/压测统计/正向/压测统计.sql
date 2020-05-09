-- 创单
select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 创单,COUNT(1) from t_td_sales_order a where a.ERP_SHOP_CODE in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2019-10-17'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;




-- 过路由
select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 过路由,COUNT(1) from t_send_wms a where a.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2019-10-15'
and a.MSG_TYPE = 'soRoute'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;

-- 路由反馈
SELECT DATE_FORMAT(t.PROCESS_TIME, '%Y-%c-%d %H' ) dd,COUNT(*) from t_split_order_head t where t.INPUT_TIME >'2019-10-15' and ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707

) or t.SHOP_ID is null) and t GROUP BY dd; 


-- 过仓
select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 过仓wms4,COUNT(1) from t_send_wms a,t_td_sales_order o where a.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2019-10-15'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
and o.IS_DIRECT_WMS_ORDER = 1
and a.MSG_TYPE = 'SO'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;


select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 过仓wms3,COUNT(1) from t_send_wms a,t_td_sales_order o where a.SHOP_ID in (
176705
) and a.CREATE_TIME >= '2019-10-15'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
and o.IS_DIRECT_WMS_ORDER = 6
and a.MSG_TYPE = 'SO'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;

select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) UA过仓,COUNT(1) from t_send_wms a,t_td_sales_order o where a.SHOP_ID = 176701
 and a.CREATE_TIME >= '2019-10-15'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
and o.IS_DIRECT_WMS_ORDER = 6
and a.MSG_TYPE = 'DELIVERY'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;

select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) skxLF,COUNT(1) from t_send_wms a,t_td_sales_order o where a.SHOP_ID = 176701
 and a.CREATE_TIME >= '2019-10-11'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
and o.IS_DIRECT_WMS_ORDER = 6
and a.MSG_TYPE = 'SO'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;

select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) skxQH,COUNT(1) from t_send_wms a,t_td_sales_order o where a.SHOP_ID = 176701
 and a.CREATE_TIME >= '2019-10-11'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
and o.IS_DIRECT_WMS_ORDER = 16
and a.MSG_TYPE = 'SO'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;


select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 刷尾款,COUNT(1) from t_so_step_payment_log a where a.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726
) and a.CREATE_TIME > '2019-08-31'
and a.PROCESS_STATUS = 10
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) desc ;


select DATE_FORMAT(t.input_time, '%Y-%c-%d %H' ),count(1) from t_split_order_head t where t.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726
) and t.INPUT_TIME >= '2019-10-15'  group by DATE_FORMAT(t.input_time, '%Y-%c-%d %H' );

SELECT DATE_FORMAT(t., '%Y-%c-%d %H' ) 外包仓在途反馈,COUNT(*) from t_wms_order_status t where t.INPUT_TIME >'2019-10-11'  and ( t.SHOP_ID in
(
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) or t.SHOP_ID is null) GROUP BY DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H' );


select t.AMOUNT_AFTER_DISCOUNT,t.* from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555550126810001';


select t.shop_id,t.* from t_mq_so_log t where t.`code` = '5555550126810001';


select * from t_wf_workflow_task  t where t.REF_SLIP_CODE = '5555550126810001';

SELECT * FROM t_receive_ag_log t WHERE MSG_TYPE = 'qimen.taobao.rdc.aligenius.order.abort' AND CONTENT LIKE '%5555550126810001%' AND CREATE_TIME >= '2019-08-29' ORDER BY ID DESC LIMIT 100;



SELECT * FROM t_ag_ship_cancel_detail t where TID = '5555550126810001' ORDER BY ID DESC LIMIT 100;




select * from  t_ag_ship_cancel_detail t where t.`STATUS` = 0 limit 10;

SELECT * FROM t_sys_task_config t WHERE t.CLASS_NAME = 'com.jumbo.tmalloms.manager.taobao.ag.ParseCancelCommandTaskManager';


SELECT * FROM t_sys_task_config t WHERE t.CLASS_NAME = 'com.jumbo.tmalloms.manager.taobao.ag.ParseCancelCommandTaskManager';


SELECT * FROM t_sys_task_config t WHERE t.CLASS_NAME like '%AgCancelDeliveryToMqTaskManager%';


select 

update t_ag_ship_cancel_detail set `STATUS` = 0 where ID = 9453318 and TID = '5555550126810001';

select * from t_td_refund_application t where t.SO_ID = 906072273;





INSERT INTO `t_td_rf_autotask_info` (`RF_ID`, `TASK_ID`, `SYNC_TO_PACS_TIME`, `SHOP_ID`, `PROCESS_STATUS`, `RETRY_DATE`, `RETRY_COUNT`, `ERR_MSG`) VALUES ('29137155', '194122800', '2019-07-13 15:14:31', '10896', '10', '2019-07-13 15:44:31', '1', NULL);






select * from t_ma_ag_shop_sys s where s.SHOP_ID in( 2042,11498)

select * from t_ma_ag_shop_sys  t where t.SHOP_ID = 11498;

DELETE from t_ma_ag_shop_sys where ID = 334001

select t.OPEN_AG_REFUND,t.* from t_ma_tb_shop_info t where t.ID = 11498;

SELECT * FROM t_ag_ship_cancel_detail t where TID = '5555550126810001' ORDER BY ID DESC LIMIT 100;


select * from t_receive_ag_log t where t.SHOP_ID = 11498 and t.`STATUS` = 0 ;


-- update t_sys_task_config set IS_AVAILABLE = 1 where ID in (210283,244240,244276) and CLASS_NAME like '%AgCancelDeliveryToMqTaskManager%'
 

-- INSERT INTO `t_ma_ag_shop_sys` (`SHOP_ID`, `TRANS_FEE_PAYMENT_TYPE`, `INV_SKU_STATUS`, `IS_INCLUDES_FREEBIES`, `OUTBOUND_WH_CODE`, `CONFIG_TYPE`, `MAX_REFUND_AMOUNT`, `RETURN_DESC`) VALUES ('11498', NULL, NULL, '0', NULL, '2', '50000.00', NULL);

