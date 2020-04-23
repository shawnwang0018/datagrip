SELECT shop.SHOP_ID                          '店铺名称',
       s.ID                                  '订单ID',
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
       log.TRANSITION_TIME                   '过仓时间',
       s.CANCEL_TIME                         '取消时间',
       CASE s.IS_CYCLE
           WHEN 11 THEN '缺货取消'
           WHEN 12 THEN '买家意愿'
           WHEN 13 THEN '拆单'
           WHEN 14 THEN '复制新单'
           WHEN 15 THEN '交易关闭取消（预售）'
           END                               '取消原因',
       s.IS_CYCLE,
       log.MEMO                              '过仓失败原因'
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
    -- 171714, 201708, 201709, 171712, 206707, 206708, 206709, 206710, 276716, 336707, 481758,
    -- 506759, 506758
    201707
    )
  AND s.CREATE_TIME >= '2020-3-24 00:00:00'
  AND s.CREATE_TIME <= '2020-3-27 00:00:00'
ORDER BY shop.SHOP_ID, s.PLATFORM_ORDER_CODE, log.TRANSITION_TIME ASC;

SELECT concat(so.PLATFORM_ORDER_CODE,'\t')   '平台订单号',
       concat(so.PLATFORM_ORDER_CODE_N,'\t') 'OMS 订单号',
       line.SKU_NAME            'sku名称',
       line.SKU_CODE            'sku code',
       line.QUANTITY            '数量',
       line.EXTENTION_CODE      '平台sku code'
FROM t_td_sales_order so,
     t_td_sales_order_line line
WHERE so.ID = line.SALES_ORDER_ID
  AND so.ID IN (
                1397019331,
                1396949063,
                1396949063,
                1396949063,
                1396463977,
                1396878520,
                1396975822,
                1396975822,
                1396975822,
                1397140128,
                1397140130,
                1397140130,
                1397140128,
                1397140130,
                1397140128,
                1397140128,
                1397140130,
                1397140130,
                1397140128
    );



SELECT *
FROM t_wf_workflow_task_log t
WHERE t.TASK_ID = 1468899465
ORDER BY t.TRANSITION_TIME ASC;