-- 定时任务
SELECT *
FROM t_sys_task_config t
WHERE t.DESCRIPTION LIKE '%AG%';


SELECT *
FROM t_sys_task_config t
WHERE t.class_name LIKE '%OrderToWmsByDbManager%';


SELECT t.IS_DIRECT_WMS_ORDER,t.ERP_SHOP_CODE,t.* FROM  t_td_sales_order t WHERE  t.OMS_ORDER_CODE = '985036577217804765';

SELECT * FROM t_ma_shop_wh t WHERE t.SHOP_ID = 311723;

-- DUPONT_WMS
SELECT * FROM t_qimen_wmsinfo_relation t WHERE t.SYS_NAME = 'DUPONT_WMS';
