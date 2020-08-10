SELECT
-- 	sum(d.REFUND_FEE)

/*concat(so.PLATFORM_ORDER_CODE, '\t')   '平台订单号',
concat(so.PLATFORM_ORDER_CODE_N, '\t') 'oms订单号',
so.CREATE_TIME                         'oms订单创建时间',
so.TB_CREATE_TIME                      '平台订单创建时间',
so.TB_PAYMENT_TIME                     '平台订单支付时间',
so.STOCK_OUT_TIME                      '订单出库时间',
concat(d.REFUND_CODE, '\t')            'oms订单号',
d.REFUND_FEE                           '退款指令金额',
d.STATUS                               '退款指令状态',
d.CREATE_TIME                          'oms退款指令创建时间',
d.GOOD_STATUS                          '平台退款指令商品状态',
d.SHOP_ID                              '店铺id',
d.DESCRIPTION                          '退款说明',
d.ORDER_STATUS                         '平台退款指令订单状态',
l.TOTAL_AMOUNT_AFTER_DISCOUNT          '订单行金额',
l.QUANTITY                             '订单行数量',
l.ORDER_LINE_TYPE                      '订单行类型',
l.IS_COMBO_SKU                         '是否combo 行',
l.SKU_NAME                             '商品名称',
l.SKU_CODE                             '商品编码',
shop.SHOP_ID                           '店铺名称',
shop.OPEN_AG_REFUND                    '是否开启自动取消',
shop.IS_AUTO_APPOINTMENT               '是否hold单',
shop.APPOINTMENT_TIME                  'hold单时间'
*/
count(1)
FROM t_td_refund_direct d,
     t_td_sales_order so,
     t_td_sales_order_line l,
     t_ma_tb_shop_info shop
WHERE so.ID = l.SALES_ORDER_ID
  AND so.PLATFORM_ORDER_CODE = d.TID
  AND shop.ID = so.ERP_SHOP_CODE
  AND l.PLATFORM_ORDER_LINE_CODE = d.OID
  AND so.ERP_SHOP_CODE NOT IN (
                               11502,
                               11501,
                               11499,
                               176706,
                               176704,
                               176707,
                               11498,
                               11497,
                               176705,
                               176703,
                               11495,
                               11496,
                               176701,
                               176700,
                               176702,
                               11500,
                               11494,
                               11493,
                               326725,
                               326726
    )
  AND d.`STATUS` = 'SUCCESS'
  AND d.HAS_GOOD_RETURN = 0
  AND l.TOTAL_AMOUNT_AFTER_DISCOUNT = d.REFUND_FEE
  AND l.ORDER_LINE_TYPE != 5
  AND so.SPECIAL_TYPE = 0
  AND d.RD_STATUS = 0
  AND so.CREATE_TIME
    >= '2020-06-01'
AND (shop.AG_SECOND = 0 OR shop.OPEN_AG_REFUND =0);
