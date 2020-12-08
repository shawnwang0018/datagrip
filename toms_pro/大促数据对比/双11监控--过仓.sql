SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H%i'
	) dd,
	COUNT(1)
FROM
	t_send_wms a
WHERE
	 a.CREATE_TIME > '2020-11-1 00:00:00'
AND a.MSG_TYPE = 'SO'
GROUP BY
	dd
ORDER BY
	dd;

SELECT * from t_send_wms t where t.CREATE_TIME > '2020-11-01'
and t.MSG_ID = 'c7f7834a-a80b-465b-845d-e51a04402c7e';


SELECT t.IS_DIRECT_WMS_ORDER, t.* from t_td_sales_order t where t.PLATFORM_ORDER_CODE in ('1205983000028646740','1219185581136745485' )
and t.CREATE_TIME > '2020-11-01';