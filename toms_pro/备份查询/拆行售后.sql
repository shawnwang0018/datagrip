SELECT
	so.ID soId,
	so.PLATFORM_ORDER_CODE platformOrderCode,
	so.OMS_ORDER_CODE omsOrderCode,
	so.ERP_SHOP_CODE erpShopCode,
	so.ORDER_STATUS orderStatus,
	sol.ID lineId,
	sol.PLATFORM_ORDER_LINE_CODE platformOrderLineCode,
	sol.IS_COMBO_SKU isComboSku,
	sol.IS_SPLIT_SOLINE isSplitSoline,
	so.IS_SPLIT_SOLINE isSplitSo,
	so.AMOUNT_AFTER_DISCOUNT amountAfterDiscount,
	sol.TOTAL_AMOUNT_AFTER_DISCOUNT totalAmountAfterDiscount,
	so.IS_DIRECT_WMS_ORDER isDirectWmsOrder
FROM
	t_td_sales_order so,
	t_td_sales_order_line sol
WHERE
	so.ID = sol.SALES_ORDER_ID
AND so.PLATFORM_ORDER_CODE = : tid
AND so.ERP_SHOP_CODE = : shopId
AND sol.PLATFORM_ORDER_LINE_CODE = : oid
AND so.ORDER_STATUS != 10
AND so.ORDER_STATUS != 10
AND so.ORDER_STATUS != 0;

SELECT
	t.PROCESS_STATUS,
	t.ERROR_MSG,
	t.*
FROM
	t_tb_automated_after_sale t
WHERE
	t.TID = '202004071457380924';