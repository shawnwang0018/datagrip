SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t 
WHERE
	t.create_time >= '2020-10-10 13:30:00'
 AND (t.`STATUS` in (10) )
 AND t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
GROUP BY
	dd
ORDER BY
	dd DESC;

update t_ag_ship_cancel_detail set `STATUS` = 66,  where SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) and CREATE_TIME < '2020-10-05';

SELECT * from ;

SELECT * from t_ag_ship_cancel_detail t where t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
and t.CREATE_TIME > '2020-10-01 10:00:00' ORDER BY UPDATE_TIME desc limit 100;


SELECT
                           c.*
                       FROM
                            t_ag_ship_cancel_detail c
                       WHERE
                            1 = 1
                        AND c.SHOP_ID in (176703)
                        AND c.`STATUS` in (0,1,3)
                        AND ( c.LAST_EXECUTE_TIME IS NULL OR NOW() >= c.LAST_EXECUTE_TIME )
                        LIMIT 1000;
SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H'
	) dd,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t 
WHERE
	t.create_time >= '2020-10-10 13:00:00'
 AND (t.`STATUS` in (10) )
 AND t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
GROUP BY
	dd
ORDER BY
	dd DESC;

SELECT count(1) from t_ag_ship_cancel_detail t where t.CREATE_TIME > '2020-09-19 19:00:00' and t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) 
and t.`STATUS` in (0,1,3) ORDER BY UPDATE_TIME desc LIMIT 10;

SELECT count(1) from t_wms_order_status where SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726
) and INPUT_TIME > '2020-09-22' limit 10;

SELECT * from t_wms_inv_log t where t.WMS_ORDER_STATUS_ID in (358575366);



SELECT * from t_wms_trans_info t where t.WMS_ORDER_STATUS_ID in (358575366);

SELECT * from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555551865211995';

SELECT count(1) from t_td_refund_application t where t.COMPANY_SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) and t.CREATE_TIME > '2020-09-19';

select count(1) from t_ag_ship_cancel_detail t where t.create_time >= '2020-09-12 18:00:00' and t.status in (10);

SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_td_create_refund_task t 
WHERE
	t.create_time >= '2020-10-02 13:30:00'
-- AND (t.`STATUS` in (10) )
 AND t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
GROUP BY
	dd
ORDER BY
	dd DESC;

SELECT * from t_td_create_refund_task t where t.CREATE_TIME > '2020-10-02 13:30:00' 
and t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
ORDER BY UPDATE_TIME desc limit 1000;

SELECT count(1) from t_td_rf_autotask_info where SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) ;

SELECT DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
		) dd, count(1) from t_tb_automated_after_sale t where t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) and
 t.CREATE_TIME > '2020-09-29' and t.PROCESS_STATUS = 10
 GROUP BY dd ORDER BY dd desc;

SELECT * from t_send_wms t where t.KEY_CODE in ('1253707669760404531') and t.CREATE_TIME > '2020-09-17 22:00:00';

SELECT count(1) from t_ag_ship_cancel_detail t where t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) 
and t.`STATUS` in (0,1,3) and t.CREATE_TIME > '2020-09-11 9:00:00';


SELECT count(1) from t_ag_refund_notify_pacs t where t.`STATUS` in (0)
and t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);
select count(1) from t_ag_refund_notify_pacs where SHOP_ID in (11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,
	11496,176701,176700,176702,11500,11494,11493,326725,326726) and `STATUS` not in (10,66);
select count(1) from t_td_rf_autotask_info where SHOP_ID in (11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,
	11496,176701,176700,176702,11500,11494,11493,326725,326726) and PROCESS_STATUS not in  (10,66);

SELECT count(1) from t_ag_refund_notify_pacs t where t.status in (0) and shop_id in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);

SELECT count(1) from t_ag_ship_cancel_detail t where t.status in (0,1,3) and shop_id in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);
SELECT count(1) from t_td_rf_autotask_info t where PROCESS_STATUS in (0,1,3) and shop_id in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);

select count(1) from t_ag_ship_cancel_detail where SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726) and STATUS not in (10,66);

SELECT * from t_receive_pacs_mq_msg_line t where t.CREATE_TIME > '2020-09-17' and t.OP_TYPE = '1008'
and KEY_CODE in ('RFH116401024') limit 100;
 SELECT * from t_td_sales_order where PLATFORM_ORDER_CODE = '5555551929310001' and CREATE_TIME > '2020-09-22';
update t_ma_tb_shop_info set is_update_address = 1 where id in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);
SELECT t.is_update_address,t.PLATFORM_SHOP_CODE,t.* from t_ma_tb_shop_info t where id in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);

SELECT t.IS_WH_REAL_TIME_CANCEL, t.* from t_ma_shop_wh t where t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);

update t_ma_shop_wh set IS_WH_REAL_TIME_CANCEL = 1 where SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
											176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726);


SELECT
						t.id id,
						t.SHOP_ID  shopId,
						t.REFUND_ID  refundId,
						t.TID tid,
						t.RETRY_COUNT retryCount, 
t.RETRY_DATE
					FROM
						t_tb_automated_after_sale t
					WHERE
						t.PROCESS_STATUS = 0
					AND (RETRY_DATE IS NULL OR RETRY_DATE <=now())
					AND t.SHOP_ID IN (11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
)
					ORDER BY
						t.id
					LIMIT 1000;

SELECT * from t_tb_automated_after_sale t where t.SHOP_ID in (11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) limit 100;


SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H'
	) dd,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t 
WHERE
	t.create_time >= '2020-09-29 18:00:00'
 AND (t.`STATUS` in (10) )
 AND t.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
GROUP BY
	dd
ORDER BY
	dd DESC;