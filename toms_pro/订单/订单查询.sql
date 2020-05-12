SELECT * FROM t_td_sales_order t WHERE t.PLATFORM_ORDER_CODE = '264934273734163230';

SELECT * FROM t_td_sales_order t WHERE t.ID = 760375654;

SELECT * FROM t_td_sales_order so ,t_td_sales_order_line l
WHERE so.ID = l.SALES_ORDER_ID
  AND so.order_status != 0
  AND so.order_status != 10
AND so.PLATFORM_ORDER_CODE = "368461762695264713";

SELECT * FROM t_td_order_member t WHERE t.SALES_ORDER_ID = 1392079609;

SELECT t.SHOP_ID,t.* FROM t_ma_tb_shop_info t WHERE  t.ID = 150000041;


Tid 368461762695264713 oid 368461762697264713 refund_id : 21646178990261347 1UA天猫店铺

