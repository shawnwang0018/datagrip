SELECT * from t_td_so_update_address where SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and CREATE_TIME > '2020-10-10 20:00:00' ORDER by LAST_MODIFY_TIME desc  limit 100;


select DATE_FORMAT(a.LAST_MODIFY_TIME, '%Y-%c-%d %H-%i' ) dd,COUNT(1) from t_td_so_update_address a where a.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-12 13:00:00' 
GROUP BY dd 
order BY dd desc;

select ORDER_STATUS,ERP_SHOP_CODE,COUNT(1) from t_td_sales_order a where a.ERP_SHOP_CODE in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-12 18:00:00' 
group BY ORDER_STATUS,ERP_SHOP_CODE;

select * from t_td_sales_order a where a.ERP_SHOP_CODE in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-12 18:00:00' 
;

SELECT * from t_send_wms t where t.KEY_CODE = '5555552158088262';


select a.SHOP_ID dd,COUNT(1) from t_td_so_update_address a where a.SHOP_ID in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-12 10:00:00' 
GROUP BY dd 
order BY dd desc;

select COUNT(1) from t_td_so_update_address a where a.SHOP_ID in (
176700
) and a.CREATE_TIME >= '2020-10-12 10:00:00';

SELECT * from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555552145969688' and t.CREATE_TIME > '2020-10-10';

SELECT * from t_top_round_timer;
SELECT t.ORDER_STATUS, t.CREATE_TIME,t.* from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555552149100301';
SELECT * from t_sys_shop_db;