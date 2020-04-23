SELECT
count(1)
FROM t_wf_workflow_task t,
     t_td_sales_order s,
     t_ma_tb_shop_info shop,
     t_wf_workflow_task_log log
WHERE s.OMS_ORDER_CODE = t.REF_SLIP_CODE
  --  AND t.REF_SLIP_CODE = '914729184854761966'
  AND shop.ID = s.ERP_SHOP_CODE
  AND log.TASK_ID = t.ID
  AND log.TO_NODE_NO = 19
  AND s.ERP_SHOP_CODE IN (
                          171714, 201708, 201709, 171712, 206707, 206708, 206709, 206710, 276716, 336707, 481758,
                          506759, 506758
    )
  AND s.CREATE_TIME >= '2020-3-24 00:00:00'
  AND s.CREATE_TIME <= '2020-3-27 00:00:00';



SELECT *
FROM t_wf_workflow_task_log t
WHERE t.TASK_ID = 1468899465
ORDER BY t.TRANSITION_TIME ASC;