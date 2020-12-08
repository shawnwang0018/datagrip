SELECT CASE t.order_status
           WHEN 0 THEN
               '作废'
           WHEN 2 THEN
               '新建'
           WHEN 5 THEN
               '待促销处理'
           WHEN 1 THEN
               '已提交'
           WHEN 17 THEN
               '待过路由'
           WHEN 18 THEN
               '已过路由'
           WHEN 19 THEN
               '待过仓'
           WHEN 20 THEN
               '已过仓'
           WHEN 4 THEN
               '库房准备中'
           WHEN 6 THEN
               '在途'
           WHEN 7 THEN
               '已同步过仓指令至ERP'
           WHEN 10 THEN
               '已取消'
           WHEN 12 THEN
               '关闭'
           WHEN 16 THEN
               '挂起待确认'
           WHEN 15 THEN
               '完成'
           END                        '订单状态',
       shop.SHOP_ID                   '店铺名称',
       concat(t.OMS_ORDER_CODE, "\t") 'oms订单号'

FROM t_so_step_wh_queue s
         LEFT JOIN t_td_sales_order t ON t.id = s.SO_ID
         LEFT JOIN t_ma_tb_shop_info shop ON s.SHOP_ID = shop.ID
WHERE t.IS_DIRECT_WMS_ORDER IN (6, 21)
  AND s.CREATE_TIME >= '2020-11-11 00:00:00'
  AND s.id > 86680000
  AND s.PROCESS_STATUS = 10;

