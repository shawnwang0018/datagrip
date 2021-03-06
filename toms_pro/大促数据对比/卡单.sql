SELECT
COUNT(s.PLATFORM_ORDER_CODE_N) count ,
n.`NAME`,wh.SYSTEM_CODE,
case when IS_DIRECT_WMS_ORDER=0 then '非直连' else '直连' end as 'DIRECT',s.SPECIAL_TYPE,
t.CURRENT_NODE_NO ,
t.REF_SLIP_SHOP_ID
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
AND date_add(t.enter_time,INTERVAL 30 MINUTE ) < SYSDATE()
-- AND t.enter_time<='2019-10-28 20:00'
AND s.TB_PAYMENT_TIME >= '2020-10-02'
AND s.CREATE_TIME >= '2020-10-02' -- AND S.PLATFORM_ORDER_CODE_N='635602339135704753'
AND t.CURRENT_NODE_NO IN (2, 3, 8, 11, 12, 22, 24, 114) -- AND t.CURRENT_NODE_NO IN (114) -- 路由反馈
AND info.ID NOT IN (11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,
176701,176700,176702,11500,11494,11493,326725,326726,176707,4062 ) 
AND n.WORKFLOW_ID = 1 -- AND s.TB_PAYMENT_TIME > DATE_SUB(SYSDATE(),INTERVAL 2 DAY)
GROUP BY n.`NAME`,wh.SYSTEM_CODE,DIRECT,s.SPECIAL_TYPE,t.REF_SLIP_SHOP_ID
order by count desc;

SELECT * from t_send_wms t where t.KEY_CODE = '1262566729395386216' and t.CREATE_TIME > '2020-09-22';
SELECT * from t_td_sales_order t where t.ERP_SHOP_CODE = 2042 and t.CREATE_TIME > '2020-09-22'
and ORDER_STATUS = 20 ORDER BY CREATE_TIME desc limit 100;

SELECT * from t_wms_order_status t where t.ORDER_CODE = '1280309583306692035';
SELECT * from t_wms_confirm_order limit 1;

SELECT * from t_receive_wms_log t WHERE t.CREATE_TIME > '2020-10-02 13:50:00' 
and t.CREATE_TIME <  '2020-10-02 13:55:00'  and t.CONTENT like '%1280309583306692035%';