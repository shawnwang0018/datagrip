SELECT concat(t.PLATFORM_ORDER_CODE, '\t') '平台订单号',
       CASE t.ERP_SHOP_CODE
           WHEN 2042 THEN 'nike官方旗舰店'
           WHEN 2516 THEN 'converse官方旗舰店'
           WHEN 11247 THEN 'JORDAN天猫官方旗舰店'
           WHEN 101664 THEN 'nike儿童官方旗舰店'
           END                             '店铺名称'

FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-11-04 00:00:00'
  AND t.TB_PAYMENT_TIME >= '2020-11-11 00:00:00'
  AND t.RA_OMS_ORDER_CODE IS NULL
  AND t.COPY_SOURCE_OMS_ORDER_CODE IS NULL
  AND t.SPLIT_SOURCE_OMS_ORDER_CODE IS NULL
  AND t.erp_shop_code IN (2042, 2516, 11247, 101664);