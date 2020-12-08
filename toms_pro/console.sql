SELECT * FROM t_td_return_application_summary t WHERE  t.RAS_STATUS = 20 AND  t.RAS_TYPE = 2 ORDER BY  t.CREATE_TIME DESC  LIMIT 100;

SELECT * FROM  t_ma_tb_shop_info;

SELECT * FROM t_sys_shop_db;

SELECT * FROM t_td_sales_order t WHERE ERP_SHOP_CODE IN  (2042,101664
) LIMIT  100;


SELECT * FROM t_ma_inv_release t WHERE  t.ORDER_ID = '1612211111';


select t.IS_ORDER_ROUTE,t.ORDER_ROUTE_STATUS,t.* from t_td_sales_order t where t.PLATFORM_ORDER_CODE_N = '1151524002694905224';



SELECT t.IS_ORDER_ROUTE, t.ORDER_ROUTE_STATUS, t.IS_DIRECT_WMS_ORDER,t.*
FROM t_td_sales_order t
WHERE t.erp_shop_code = '531787'
ORDER BY id DESC
LIMIT 100;

