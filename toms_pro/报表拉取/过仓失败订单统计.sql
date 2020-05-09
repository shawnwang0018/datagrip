SELECT shop.SHOP_ID                          '店铺名称',
       CONCAT(s.PLATFORM_ORDER_CODE, '\t')   '平台订单oms号',
       CONCAT(s.PLATFORM_ORDER_CODE_N, '\t') 'oms订单号',
       CASE s.ORDER_STATUS
           WHEN 6 THEN '在途'
           WHEN 10 THEN '取消'
           WHEN 12 THEN '关闭'
           WHEN 0 THEN '作废'
           WHEN 1 THEN '已提交'
           WHEN 4 THEN '库房准备中'
           END                               '订单状态',
       s.ORDER_STATUS                        '订单状态',
       t.ID                                  TASK_ID,
       s.WAREHOUSE_CODE                      '仓库编码',
       s.STOCK_OUT_TIME                      '出库时间',
       (SELECT log.TRANSITION_TIME
        FROM t_wf_workflow_task_log log
        WHERE log.TASK_ID = t.ID
          AND log.FROM_NODE_NO = 19
        ORDER BY log.TRANSITION_TIME ASC
        LIMIT 1
       )                                     '过仓时间',
       s.CANCEL_TIME                         '取消时间',
       CASE s.IS_CYCLE
           WHEN 11 THEN '缺货取消'
           WHEN 12 THEN '买家意愿'
           WHEN 13 THEN '拆单'
           WHEN 14 THEN '复制新单'
           WHEN 15 THEN '交易关闭取消（预售）'
           END                               '取消原因',
       s.IS_CYCLE,
       (SELECT log.MEMO
        FROM t_wf_workflow_task_log log
        WHERE log.TASK_ID = t.ID
          AND log.TO_NODE_NO = 19
        ORDER BY log.TRANSITION_TIME ASC
        LIMIT 1
       )                                     '过仓失败原因'

FROM t_wf_workflow_task t,
     t_td_sales_order s,
     t_ma_tb_shop_info shop
WHERE s.OMS_ORDER_CODE = t.REF_SLIP_CODE
  --  AND t.REF_SLIP_CODE = '914729184854761966'
  AND shop.ID = s.ERP_SHOP_CODE
  AND s.ERP_SHOP_CODE IN (
                          171714, 201708, 201709, 171712, 206707, 206708, 206709, 206710, 276716, 336707, 481758,
                          506759, 506758
    )
  AND s.CREATE_TIME >= '2020-3-24 00:00:00'
  AND s.CREATE_TIME <= '2020-3-27 00:00:00'
  AND EXISTS(
        SELECT log.TO_NODE_NO
        FROM t_wf_workflow_task_log log
        WHERE log.TASK_ID = t.ID
          AND log.TO_NODE_NO = 19
        ORDER BY log.TRANSITION_TIME ASC
    );


SELECT *
FROM t_wf_workflow_task_log t
WHERE t.TASK_ID = 1468899465
ORDER BY t.TRANSITION_TIME ASC;