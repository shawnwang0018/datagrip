SELECT sum(d.REFUND_FEE) '退款总金额',
       count(1) '发生退款数量',
       d.SHOP_ID
FROM t_td_sales_order so
         LEFT JOIN t_td_return_application re ON so.ID = re.SALES_ORDER_ID
         LEFT JOIN t_td_sales_order_line l ON so.ID = l.SALES_ORDER_ID
         LEFT JOIN t_td_refund_direct d ON so.PLATFORM_ORDER_CODE = d.TID
    AND l.PLATFORM_ORDER_LINE_CODE = d.OID
WHERE so.ERP_SHOP_CODE NOT IN (
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
  AND so.ORDER_STATUS = 6
  AND l.TOTAL_AMOUNT_AFTER_DISCOUNT = d.REFUND_FEE
  AND so.SPECIAL_TYPE = 0
  AND re.ID IS NULL
  AND d.RD_STATUS = 0
  AND so.CREATE_TIME < '2020-06-01'
  AND so.CREATE_TIME > '2020-01-01'
GROUP BY d.SHOP_ID;