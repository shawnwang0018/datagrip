-- TOMS 订单卡单汇总

SELECT
COUNT(s.PLATFORM_ORDER_CODE_N) count ,
n.`NAME`,wh.SYSTEM_CODE,
case when IS_DIRECT_WMS_ORDER=0 then '非直连' else '直连' end as 'DIRECT',s.SPECIAL_TYPE
FROM
t_td_sales_order s FORCE INDEX(IDX_CREATE_TIME),
t_wf_workflow_task t,
t_wf_workflow_node n,
t_ma_tb_shop_info info,
t_ma_shop_wh wh
WHERE
s.OMS_ORDER_CODE = t.REF_SLIP_CODE
AND t.CURRENT_NODE_NO = n.NODE_NO
AND s.erp_shop_code = info.id
AND wh.WH_CODE = S.WAREHOUSE_CODE
AND wh.shop_id = s.erp_shop_code
-- AND date_add(t.enter_time,INTERVAL 30 MINUTE ) < SYSDATE()
AND t.enter_time<='2019-10-28 20:00'
AND s.TB_PAYMENT_TIME >= '2019-10-25'
AND s.CREATE_TIME >= '2019-10-25' -- AND S.PLATFORM_ORDER_CODE_N='635602339135704753'
AND t.CURRENT_NODE_NO IN (2, 3, 8, 11, 12, 22, 24, 114) -- AND t.CURRENT_NODE_NO IN (114) -- 路由反馈
AND info.ID NOT IN (
'11494',
'11495',
'11496',
'11497',
'11498',
'11499',
'11500',
'11501',
'11502',
'176700',
'176701',
'176702',
'176703',
'176704',
'176705',
'176706',
'176707',
'326725',
'326726',
'326728',
'4062' )
AND n.WORKFLOW_ID = 1 -- AND s.TB_PAYMENT_TIME > DATE_SUB(SYSDATE(),INTERVAL 2 DAY)
GROUP BY n.`NAME`,wh.SYSTEM_CODE,DIRECT,s.SPECIAL_TYPE
order by count desc

-- TOMS 订单卡单明细 

SELECT
s.PLATFORM_ORDER_CODE_N,
info.shop_id,
s.IS_DIRECT_WMS_ORDER,
s.TB_PAYMENT_TIME,
t.ENTER_TIME,
n.`NAME`,
wh.WH_NAME,
wh.SYSTEM_CODE
FROM
t_td_sales_order s force index (IDX_CREATE_TIME) ,
t_wf_workflow_task t,
t_wf_workflow_node n,
t_ma_tb_shop_info info,
t_ma_shop_wh wh
WHERE
s.OMS_ORDER_CODE = t.REF_SLIP_CODE
AND t.CURRENT_NODE_NO = n.NODE_NO
AND s.erp_shop_code = info.id
AND wh.WH_CODE = S.WAREHOUSE_CODE
AND wh.shop_id = s.erp_shop_code
-- AND s.order_status=1
AND n.WORKFLOW_ID = 1 -- AND s.TB_PAYMENT_TIME > DATE_SUB(SYSDATE(),INTERVAL 2 DAY)
-- AND s.CREATE_TIME > DATE_SUB(SYSDATE(),INTERVAL 2 DAY)
AND s.TB_PAYMENT_TIME >='2019-10-12'
AND s.CREATE_TIME >= '2019-10-12' -- AND S.PLATFORM_ORDER_CODE_N='635602339135704753'
-- AND t.enter_time>='2019-10-11'
-- and t.enter_time<'2019-10-13'
AND date_add(
t.enter_time 
INTERVAL 30 MINUTE
)< SYSDATE()
AND t.CURRENT_NODE_NO in (2, 3, 8, 11, 12, 22, 24, 114) -- AND t.CURRENT_NODE_NO IN (114) -- 路由反馈 13 zbz
AND info.ID NOT IN (
'11494',
'11495',
'11496',
'11497',
'11498',
'11499',
'11500',
'11501',
'11502',
'176700',
'176701',
'176702',
'176703',
'176704',
'176705',
'176706',
'176707',
'326725',
'326726',
'326728',
'4062' )
-- and wh.SYSTEM_CODE='BZ_NEW_WMS'
ORDER BY
n.`NAME`,
info.shop_id,
TB_PAYMENT_TIME;