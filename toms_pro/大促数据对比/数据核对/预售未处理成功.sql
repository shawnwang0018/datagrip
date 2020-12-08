SELECT
        shop.SHOP_NAME,
CASE t.order_status
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
        END  '订单状态'
,l.*
FROM
         t_td_sales_order t
LEFT JOIN t_so_step_payment_log l on l.TID = t.PLATFORM_ORDER_CODE
LEFT JOIN t_ma_tb_shop_info shop on (t.ERP_SHOP_CODE = shop.ID)
WHERE
 t.CREATE_TIME > '2020-10-21'
and t.CREATE_TIME < '2020-11-01'
AND t.SPECIAL_TYPE IN (11, 12)
AND t.FINANCE_STATUS = 2
AND t.ORDER_STATUS NOT IN (10, 0)
and l.id is not null;