SELECT *
FROM t_receive_cainiao_delivery_log dl
ORDER BY dl.id DESC  LIMIT  100;
-- WHERE dl.OUT_BIZ_CODE IN ('771486494811044108', '771486494811044109');

select * from t_wms_order_status os where os.ORDER_CODE = '306213314868968884';
SELECT *
FROM t_wms_order_status t
ORDER BY ID DESC
LIMIT 100;
select * from t_receive_cainiao_delivery_log dl where dl.OUT_BIZ_CODE in ('306213314868968884','');

-- DELETE  FROM t_wms_order_status WHERE ID = 367049;
-- DELETE  FROM t_receive_cainiao_delivery_log WHERE ID = 48098;

select * from t_wms_order_status os where os.ORDER_CODE = '306213314868968883';
SELECT os.ORDER_CODE         AS orderCode,
       os.SHIPPING_CODE      AS shippingCode,
       os.WMS_STATUS         AS wmsStatus,
       os.ORDER_TYPE         AS orderType,
       trans.TRANS_CODE      AS transCode,
       trans.TRANS_NO        AS transNo,
       trans.TRANS_TIME_TYPE AS transTimeType,
       os.SHOP_ID               shopId,
       os.OUT_BOUND_TIME     AS outboundTime,
       os.IN_BOUND_TIME      AS inboundTime,
       os.RETRY_COUNT           retryCount,
       os.RETRY_DATE            retryDate,
       os.TARGET_CODE           targetCode,
       os.ACTUAL_TARGET_CODE,
       os.BATCH_NO              batchNo
FROM t_wms_order_status os
         LEFT JOIN t_wms_trans_info trans ON os.ID = trans.WMS_ORDER_STATUS_ID
WHERE os.ID = 367049;


SELECT inv.ID               AS wmsInvLogId,
       inv.SKU              AS sku,
       inv.QTY              AS qty,
       inv.BTACH_CODE       AS btachCode,
       inv.BARCH_NO         AS barchNo,
       inv.INV_STATUS       AS invStatus,
       inv.WAREHOUCE_CODE   AS warehouceCode,
       inv.TRANSACTION_TIME AS transactionTime,
       inv.INV_OWNER        AS invOwner,
       sn.SN                AS sn,
       inv.MARKET_ABILITY   AS marketAbility,
       sn.IS_CUT_WATCH_BAND AS isCutWatchband,
       sn.CUT_NUM           AS cutNum,
       inv.LINE_ID          AS lineId
FROM t_wms_inv_log inv
         LEFT JOIN t_wms_sku_sn sn ON inv.ID = sn.WMS_INV_LOG_ID
WHERE inv.WMS_ORDER_STATUS_ID = 367049;