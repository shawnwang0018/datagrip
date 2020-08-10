SELECT concat(rf.TID, "\t")            '平台订单号',
       concat(rf.OID, "\t")            '平台订单行号',
       rf.STATUS                       '平台退款指令状态',
       concat(rf.REFUND_CODE, '\t')    '平台退款指令编号',
       summry.RAS_CODE                 'oms换货编号',
       concat(direct.DISPUTE_ID, '\t') '换货编号',
       concat(direct.shop_id, '\t')    '店铺id',
       shop.shop_id                    '店铺名称',
       rf.REFUND_FEE                   '退款金额',
       rf.CREATE_TIME                  '退款时间',
       direct.id                       '换货指令id',
       direct.OMS_STATUS               'oms换货指令状态',
       direct.STATUS                   '平台换货指令状态',
       summry.RAS_STATUS               '换货单状态',
       td.PROCESS_STATUS               '换转退处理状态',
       td.ED_STATUS                    '换转退状态',
       td.ERR_MSG                      '换转退处理情况',
       rf.CREATE_TIME                  '退款指令创建时间',
       rf.EXIST_TIMEOUT                '退款指令是否存在超时',
       rf.TIMEOUT                      '退款指令超时时间',
       direct.CREATE_TIME              '换货指令创建时间',
       direct.MODIFIED                 '换货指令关闭时间',
       summry.CREATE_TIME              'oms换货单创建时间',
       (SELECT log.TRANSITION_TIME
        FROM t_wf_workflow_task_log log
        WHERE log.TRANSITION_CODE = 'INBOUND'
          AND log.TASK_ID = task.id
        LIMIT 1)                       'oms换货单入库时间',
       (SELECT log.TRANSITION_TIME
        FROM t_wf_workflow_task_log log
        WHERE log.TRANSITION_CODE = 'CHANGE_FINISHED'
          AND log.TASK_ID = task.id
        LIMIT 1)                       'oms换货单出库时间'

FROM t_td_return_exchange_direct direct
         LEFT JOIN t_top_exchange_direct td ON direct.DISPUTE_ID = td.DISPUTE_ID,
     t_td_sales_order so,
     t_td_return_application_summary summry,
     t_td_return_application ra,
     t_td_refund_direct rf,
     t_td_sales_order_line l,
     t_wf_workflow_task task,
     t_ma_tb_shop_info shop


WHERE direct.RAS_ID = summry.ID
  AND shop.ID = summry.ERP_SHOP_CODE
  AND direct.RAS_ID IS NOT NULL
  AND task.REF_SLIP_CODE = ra.RAS_CODE
  AND summry.ID = ra.RAS_ID
  AND rf.OID = direct.BIZ_ORDER_ID
  AND direct.CREATE_TIME >= '2020-1-01'
  AND direct.OMS_STATUS = 2
  AND summry.RAS_STATUS = 20
  AND summry.RAS_TYPE = 2
  AND so.ID = l.SALES_ORDER_ID
  AND l.PLATFORM_ORDER_LINE_CODE = direct.BIZ_ORDER_ID
  AND rf.rd_status != 1
  AND l.ORDER_LINE_TYPE != 5
  AND rf.STATUS = "SUCCESS"
  AND l.TOTAL_AMOUNT_AFTER_DISCOUNT = rf.REFUND_FEE
  AND so.ORDER_STATUS IN (6, 12, 15);


