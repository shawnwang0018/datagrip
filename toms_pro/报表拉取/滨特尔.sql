SELECT *
FROM toms_db03.t_td_sales_order t
WHERE t.ERP_SHOP_CODE = 306718
  AND t.ORDER_STATUS != 0
  AND t.ORDER_STATUS != 10
AND t.CREATE_TIME >= date_add(now(),INTERVAL -3 MONTH )
AND ;

SELECT date_add(now(),INTERVAL -3 MONTH ) FROM t_ma_tb_shop_info t WHERE t.id =2042;
