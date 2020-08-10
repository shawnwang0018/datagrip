SELECT *
FROM t_sys_shop_db;


SELECT t.shop_id, t.*
FROM t_ma_tb_shop_info t
WHERE ID = 176705;

SELECT count(1)
FROM t_td_return_exchange_direct t
WHERE t.RAS_ID IS NOT NULL
  AND t.CREATE_TIME >= '2019-3-01'
  AND t.OMS_STATUS = 2;

SELECT *
FROM t_td_return_exchange_direct direct
   , t_td_return_application_summary summry
WHERE direct.RAS_ID = summry.ID
  AND direct.RAS_ID IS NOT NULL
  AND direct.CREATE_TIME >= '2019-3-01'
  AND direct.OMS_STATUS = 2
AND summry.RAS_STATUS = 20 LIMIT  20;


SELECT rf.*
FROM t_td_return_exchange_direct direct
   , t_td_return_application_summary summry,
     t_td_refund_direct rf

WHERE direct.RAS_ID = summry.ID
  AND direct.RAS_ID IS NOT NULL
  and rf.OID = direct.BIZ_ORDER_ID
  AND direct.CREATE_TIME >= '2019-3-01'
  AND direct.OMS_STATUS = 2
AND summry.RAS_STATUS = 20
AND rf.rd_status != 1
-- AND rf.STATUS = "SUCCESS"
ORDER BY direct.id
    LIMIT  200;
SELECT * FROM t_td_refund_application t WHERE t.ID = 22216710;

SELECT count(1)
FROM t_td_return_exchange_direct direct
   , t_td_return_application_summary summry,
     t_td_refund_direct rf
WHERE direct.RAS_ID = summry.ID
  AND direct.RAS_ID IS NOT NULL
  and rf.OID = direct.BIZ_ORDER_ID
  AND direct.CREATE_TIME >= '2019-3-01'
  AND direct.OMS_STATUS = 2
AND summry.RAS_STATUS = 20
AND rf.rd_status != 1
AND rf.STATUS = "SUCCESS"
ORDER BY direct.id
    LIMIT  200;

SELECT t.ID,t.SHOP_ID,t.* FROM t_ma_tb_shop_info t WHERE t.SHOP_ID LIKE '%%';


