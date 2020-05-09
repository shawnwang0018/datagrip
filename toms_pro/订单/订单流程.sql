SELECT s.ORDER_STATUS,
       s.ID,
       s.ERP_SHOP_CODE,
       t.ID TASK_ID,
       n.`NAME`,
       s.IS_DIRECT_WMS_ORDER,
       s.WAREHOUSE_CODE,
       s.ERP_SHOP_CODE
FROM t_wf_workflow_task t,
     t_wf_workflow_node n,
     t_td_sales_order s
WHERE t.CURRENT_NODE_NO = n.NODE_NO
  AND s.OMS_ORDER_CODE = t.REF_SLIP_CODE
  AND t.REF_SLIP_CODE = '985221731744627427';



SELECT *
FROM t_td_sales_order_line t
WHERE t.SALES_ORDER_ID = 1400043118;

SELECT t.id,
       enter_time,
       expensetime,
       from_node_no,
       fn.NAME,
       memo,
       operaterstatus,
       task_id,
       to_node_no,
       tn.NAME,
       transition_code,
       transition_time,
       user_id,
       shop_id
FROM t_wf_workflow_task_log t,
     t_wf_workflow_node tn,
     t_wf_workflow_node fn
WHERE t.TASK_ID = 1484864379
  AND t.FROM_NODE_NO = fn.NODE_NO
  AND t.TO_NODE_NO = tn.NODE_NO
  AND fn.WORKFLOW_ID = 1
  AND tn.WORKFLOW_ID = 1
ORDER BY t.TRANSITION_TIME ASC;

SELECT *
FROM t_wf_workflow_task_log log
WHERE log.task_id = 1484272693;


SELECT *
FROM t_wms_order_status t
WHERE t.ORDER_CODE = '804040576229098907';



