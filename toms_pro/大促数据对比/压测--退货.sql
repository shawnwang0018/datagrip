-- 退货
--  检查订单是否在途

-- 查看指令是否都接入
SELECT `STATUS`, count(1) from t_tb_automated_after_sale where SHOP_ID in (
11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726
)
 and  CREATE_TIME > '2020-05-21' GROUP BY `STATUS` ;

SELECT COUNT(1)
FROM t_receive_ag_log t
WHERE t.msg_type = 'qimen.taobao.rdc.aligenius.order.returngoods.notify'
  AND t.CREATE_TIME >= '2019-10-11 10:00:00'
  AND t.shop_id = 11495
AND status = 0;
SELECT count(1) from t_ag_return_summary t where t.CREATE_TIME > '2020-09-27' and t.SHOP_ID in (
11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726
) and IS_AUTO_SUBMIT = 1;
SELECT * from t_ag_return_summary t where t.CREATE_TIME > '2020-05-21' and t.SHOP_ID in (11500) limit 100;
-- 打开定时任务 处理数据
-- 处理成功的效率 -- 时间修改为打开定时任务的时间  AND t.STATUS = 5 
SELECT DATE_FORMAT(
               t.UPDATE_TIME,
               '%Y-%c-%d %H:%i'
           )    dd,
       COUNT(1) 处理数量
FROM t_ag_return_summary t
WHERE t.UPDATE_TIME >= '2020-10-15 11:00:00'
and t.`STATUS` in (1)
 and t.SHOP_ID in (
11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726
)
GROUP BY dd
ORDER BY dd desc;

SELECT RAS_STATUS, count(1) from t_td_return_application_summary t where t.CREATE_TIME > '2020-10-15' and t.ERP_SHOP_CODE in (11502) 
GROUP BY RAS_STATUS;

SELECT DATE_FORMAT(
               t.UPDATE_TIME,
               '%Y-%c-%d %H'
           )    dd,
       COUNT(1) 处理数量
FROM t_ag_return_summary t
WHERE t.UPDATE_TIME >= '2020-10-15 11:00:00'
and t.`STATUS` in (1)
 and t.SHOP_ID in (
11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726
)
GROUP BY dd
ORDER BY dd desc;

SELECT RAS_STATUS, count(1) from t_td_return_application_summary t where t.RAS_TYPE = 1 and t.ERP_SHOP_CODE in (
11502,11501,11499,176706,176704,176707,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726
) and t.CREATE_TIME > '2020-10-15' GROUP BY RAS_STATUS;

SELECT * from t_td_return_application_summary t where t.CREATE_TIME > '2020-10-15' and t.ERP_SHOP_CODE in (11502)
and t.RAS_STATUS = 2 limit 10;


SELECT * from t_ag_return_line t where t.SHOP_ID = 11500 and t.CREATE_TIME > '2020-05-21' and t.`STATUS` != 1 limit 100;
select * from t_td_return_application t where t.PLATFORM_ORDER_CODE = '5555551179228187';
SELECT
                           *
                       FROM
                            t_ag_return_summary
                       WHERE
                            1 = 1
                        AND `STATUS` in (0,2,3)
                       --  AND ( LAST_EXECUTE_TIME IS NULL OR NOW() >= LAST_EXECUTE_TIME )
                        AND SHOP_ID in (11497,11495)
                        ORDER BY  CREATE_TIME
                        LIMIT 10000;

SELECT * from t_td_ras_directwms_autotask_info t where t.SHOP_ID in (11502) 
and SYNC_STATUS = 10
and t.CREATE_TIME > '2020-10-15';
SELECT MAX(CREATE_TIME) from t_send_wms t where t.MSG_TYPE = 'RA' and t.CREATE_TIME > '2020-10-15'
and t.SHOP_ID in (11502) limit 10;


