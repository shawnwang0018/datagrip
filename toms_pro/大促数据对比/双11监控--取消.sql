SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理效率,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t
WHERE
	t.CREATE_TIME >= '2020-11-1 00:00:00'
AND t.`STATUS` = 10 GROUP BY DATE_FORMAT (
	t.UPDATE_TIME,
	'%Y-%c-%d %H:%i'
)
ORDER BY
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) DESC;

SELECT count(1) from t_ag_ship_cancel_detail  t where t.CREATE_TIME > '2020-11-01 08:00:00' and t.`STATUS` = 10  ;

SELECT count(1) from t_ag_ship_cancel_detail  t where t.CREATE_TIME > '2020-11-01 08:00:00' and t.`STATUS` != 10  ;


SELECT * from t_ag_ship_cancel_detail t where t.status = 3 limit 1;


SELECT m.SHOP_ID, count(1) dd from t_ag_ship_cancel_detail t
LEFT JOIN t_ma_tb_shop_info m on m.ID = t.SHOP_ID
 where t.CREATE_TIME > '2020-11-01' 
  and t.`STATUS` != 10
GROUP BY m.SHOP_ID ORDER BY dd desc;

SELECT i.SHOP_ID, count(1) cc from t_td_sales_order t 
LEFT JOIN t_ma_tb_shop_info i on i.id = t.ERP_SHOP_CODE
where t.CREATE_TIME > '2020-11-1' and t.TO_WH_REMARK = '快递服务获取物流推荐超时，启动熔断'
GROUP BY i.SHOP_ID ORDER BY cc desc;

SELECT * from t_sys_task_config;

SELECT * from t_td_sales_order t whe;
SELECT * from t_qimen_wmsinfo_relation;
SELECT * from t_td_sales_order t 
LEFT JOIN t_;


SELECT count(1) from t_td_sales_order t where t.CREATE_TIME > '2020-11-01' and t.ORDER_STATUS != 0;


SELECT i.SHOP_ID, count(1) cc from t_td_sales_order t LEFT JOIN t_wf_workflow_task w on w.REF_SLIP_ID = t.ID
LEFT JOIN t_ma_tb_shop_info i on i.ID = t.ERP_SHOP_CODE
where t.CREATE_TIME > '2020-11-1' and w.CURRENT_NODE_NO = 19 and t.TO_WH_REMARK = '快递服务获取物流推荐超时，启动熔断' GROUP BY i.SHOP_ID ORDER BY  cc DESC;

in (2516) ORDER BY t.CREATE_TIME limit 100 ;
 

SELECT t.* from t_ma_tb_shop_info t where t.IS_RETRY_TO_WARE = 1;

SELECT * from t_ma_shop_wh t where t.SHOP_ID = 2516;