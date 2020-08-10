SELECT DATE_FORMAT(
               t.CREATE_TIME,
               '%Y-%c-%d %H:%i'
           ) 处理时间,
       COUNT(1)
FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-6-12 16:00:00'
  AND t.CREATE_TIME >= '2020-6-12 18:00:00'
  AND t.ERP_SHOP_CODE IN (
                          11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705, 176703, 11495, 11496,
                          176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726
    )
GROUP BY DATE_FORMAT(
                 t.CREATE_TIME,
                 '%Y-%c-%d %H:%i'
             )
ORDER BY DATE_FORMAT(
                 t.CREATE_TIME,
                 '%Y-%c-%d %H:%i'
             );


SELECT COUNT(1)
FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-6-1 00:00:00';

SELECT COUNT(1)
FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-6-1 00:00:00'
  AND t.ERP_SHOP_CODE IN (2042);

SELECT COUNT(1)
FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-6-1 00:00:00'
  AND t.ERP_SHOP_CODE IN
      (
       10896, 10895, 10593, 41665, 41672, 76663, 521760
          )
  AND t.IS_ORDER_ROUTE = 1;


SELECT COUNT(1)
FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-6-1 00:00:00'
  AND t.ERP_SHOP_CODE IN (
                          10896, 10895, 10593, 41665, 41672, 76663, 521760
    );

SELECT COUNT(1)
FROM t_td_sales_order t
WHERE t.CREATE_TIME >= '2020-6-1 00:00:00'
  AND t.ERP_SHOP_CODE IN (
                          10896, 10895, 10593, 41665, 41672, 76663, 521760
    );


SELECT count(1)
FROM t_td_sales_order t
WHERE t.OMS_ORDER_CODE >= '5555551378920132'
  AND t.OMS_ORDER_CODE <= '5555551379210000';

SELECT * FROM t_td_refund_direct ORDER BY ID DESC LIMIT  100 ;

SELECT * FROM  t_td_sales_order_line t WHERE t.ORDER_LINE_TYPE !=5;