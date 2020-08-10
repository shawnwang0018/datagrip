-- 节点流程
SELECT s.ID,
       s.CREATE_TIME,
       s.ERP_SHOP_CODE,
       s.IS_ONLINE_RETURN,
       s.IS_DIRECT_WMS_ORDER,
       s.CREATOR,
       s.CREATOR_ID,
       ra.OMS_ORDER_CODE,
       ra.ID,
       line.PLATFORM_ORDER_LINE_CODE,
       wf.id task_id,
       wf.*
FROM t_td_return_application_summary s,
     t_td_return_application ra,
     t_td_return_application_line line,
     t_wf_workflow_task wf
WHERE s.ID = ra.RAS_ID
  AND wf.REF_SLIP_CODE = ra.RAS_CODE
  AND ra.ID = line.RA_ID
  AND s.RAS_CODE IN (
    "EAS36081392"
    );

-- 流转日志

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
WHERE t.TASK_ID = 1554938200
  AND t.FROM_NODE_NO = fn.NODE_NO
  AND t.TO_NODE_NO = tn.NODE_NO
  AND fn.WORKFLOW_ID = 2
  AND tn.WORKFLOW_ID = 2
ORDER BY t.TRANSITION_TIME ASC;


SELECT *
FROM t_wf_workflow_task_log t
WHERE t.TASK_ID = 1559708569;

SELECT t.IS_OPEN_QIMEN, t.SHOP_ID, t.INTERFACE_SHOP_CODE
FROM t_ma_tb_shop_info t
WHERE t.ID = 471755;

--
SELECT *
FROM t_td_refund_direct t
WHERE t.TID = '916578624285512135'
  AND t.OID = '916578624285512135';
-- 2020-04-13 17:31:11
-- 2020-04-13 17:18:26

SELECT *
FROM t_ra_create_direct t
WHERE t.PLATFORM_CODE = '916578624285512135';


SELECT *
FROM t_send_exchange_message_to_taobao t;


