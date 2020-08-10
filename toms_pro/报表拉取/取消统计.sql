SELECT so.id,
       so.PLATFORM_ORDER_CODE,
       PLATFORM_ORDER_CODE_N,
       is_cycle,
       sku_code,
        (SELECT log.USER_ID
        FROM t_wf_workflow_task_log log
        WHERE log.TASK_ID = task.ID
          AND log.TO_NODE_NO = 20
        ORDER BY log.TRANSITION_TIME ASC
        LIMIT 1 ) '取消人id',
       (SELECT user.LOGIN_NAME
        FROM t_wf_workflow_task_log log,t_au_user user
        WHERE log.TASK_ID = task.ID
          AND log.USER_ID =  user.ID
          AND log.TO_NODE_NO = 20
        ORDER BY log.TRANSITION_TIME ASC
        LIMIT 1 ) '取消人'
FROM t_td_sales_order so,
     t_td_sales_order_line soi,
     t_wf_workflow_task task
WHERE (so.CANCEL_TIME BETWEEN '2020-07-08 09:00:00' AND '2020-07-08 15:00:00')
  AND so.id = soi.sales_order_id
  AND task.REF_SLIP_CODE = so.PLATFORM_ORDER_CODE_N
  AND soi.sku_id IN (
                     16393789,
                     16401399,
                     16401179,
                     16401364,
                     16401081,
                     16397125,
                     16401118,
                     16394093,
                     16393949,
                     16394054,
                     16400345
    )
  AND so.order_status = 10
  AND SO.ERP_SHOP_CODE = '11247';