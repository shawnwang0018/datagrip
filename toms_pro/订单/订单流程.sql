SELECT s.ORDER_STATUS,
       s.ID,
       s.ERP_SHOP_CODE,
       t.ID TASK_ID,
       n.`NAME`,
       s.IS_DIRECT_WMS_ORDER,
       s.WAREHOUSE_CODE,
       s.ERP_SHOP_CODE,
       s.CANCEL_TIME,
       s.IS_ORDER_ROUTE,
       s.ORDER_ROUTE_STATUS
FROM t_wf_workflow_task t,
     t_wf_workflow_node n,
     t_td_sales_order s
WHERE t.CURRENT_NODE_NO = n.NODE_NO
  AND s.OMS_ORDER_CODE = t.REF_SLIP_CODE
  AND t.REF_SLIP_CODE = '202007021128261744-3';

SELECT 'x';

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
WHERE t.TASK_ID = 4441098
  AND t.FROM_NODE_NO = fn.NODE_NO
  AND t.TO_NODE_NO = tn.NODE_NO
  AND fn.WORKFLOW_ID = 1
  AND tn.WORKFLOW_ID = 1
ORDER BY t.TRANSITION_TIME ASC;

SELECT *
FROM t_wf_workflow_task_log log
WHERE log.task_id = 4710638;


SELECT *
FROM t_wms_order_status t
WHERE t.ORDER_CODE = '804040576229098907';

SELECT count(1)
FROM t_wf_workflow_task t
WHERE t.ENTER_TIME >= '2020-5-26'
  AND CURRENT_NODE_NO = 114
  AND REF_SLIP_SHOP_ID NOT IN (
                               11498, 11497, 176700, 176702, 11500, 11494, 176704, 326725, 176705, 176706, 176707,
                               11496, 11499, 176703, 11495,
                               11493, 176701, 11501, 11502, 326726
    );


SELECT t.CURRENT_NODE_NO, t.REF_SLIP_SHOP_ID, so.ORDER_STATUS, t.ENTER_TIME, so.CREATE_TIME
FROM t_wf_workflow_task t,
     t_td_sales_order so
WHERE t.REF_SLIP_ID = so.ID
  AND t.ENTER_TIME >= '2020-5-26'
  AND CURRENT_NODE_NO = 114
  AND REF_SLIP_SHOP_ID NOT IN (
                               11498, 11497, 176700, 176702, 11500, 11494, 176704, 326725, 176705, 176706, 176707,
                               11496, 11499, 176703, 11495,
                               11493, 176701, 11501, 11502, 326726
    )
  AND t.ENTER_TIME <= '2020-5-26 00:00:00'
  AND so.ORDER_STATUS = 18
ORDER BY t.ENTER_TIME DESC
LIMIT 10000
;



SELECT *
FROM t_td_sales_order_line t
WHERE t.SALES_ORDER_ID = 1554531062;

SELECT *
FROM t_ag_ship_cancel_detail t
WHERE t.TID = '1033672439250379446';


SELECT *
FROM t_split_order_head t
WHERE t.PLATFORM_ORDER_CODE_N = '1033672439250379446';

SELECT *
FROM t_split_order_middle_line t
WHERE t.PLATFORM_LINE_NO = 801856022;

SELECT *
FROM t_split_order_middle_head t
WHERE t.WMS_CONFIRM_ORDER_ID = 801856022;


SELECT *
FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-6-1 2:03:00'
  AND t.CREATE_TIME <= '2020-6-1 2:04:00';

SELECT *
FROM t_split_order_head t
WHERE t.PLATFORM_ORDER_CODE_N = '1032213780247382645-2';



SELECT *
FROM t_td_sales_order_line t
WHERE t.SALES_ORDER_ID = 1400043118
AND  SHOP_ID IN (1,2042);

SELECT * FROM  t_so_invoice_encrypt_temp a WHERE ERP_SHOP_CODE IN (2042) LIMIT 1;


SELECT COUNT(1)
from
        t_td_sales_order r
	inner JOIN t_td_sales_order_linex l on
        r.id = l.SALES_ORDER_ID
       ;
