-- 统计库存同步效率
SELECT DATE_FORMAT(t.CREATE_TIME, '%Y-%c-%d %H:%i' ) ,COUNT(*) from t_ma_tb_inv_update_log t where t.create_time>'2020-01-14 04:00'
and t.create_time<'2020-01-14 06:59' and t.UPDATE_TYPE = 10  GROUP BY DATE_FORMAT(t.CREATE_TIME, '%Y-%c-%d %H:%i') ;

SELECT t.shop_id,COUNT(*) from t_ma_tb_inv_update_log t where t.create_time>'2019-07-05 06:20' and t.UPDATE_TYPE = 10 GROUP BY t.shop_id;
-----------------------------------

---库存接收效率
SELECT DATE_FORMAT(t.CREATE_TIME, '%Y-%c-%d %H:%i') ,COUNT(*) from t_ma_o2o_inventory t where 
t.CREATE_TIME > '2020-01-14 04:00' and t.UPDATE_TYPE = 10 and t.SHOP_ID=2042 GROUP BY DATE_FORMAT(t.CREATE_TIME, '%Y-%c-%d %H:%i');

--同步监控
SELECT t.SHOP_ID orgCode from t_ma_o2o_inventory t where t.SYNC_STATUS = 9 and t.create_time > date(now()) GROUP BY t.SHOP_ID;