SELECT
	shop.ID '店铺id',
	shop.SESSION_KEY 'sessionKey',
	shop.SHOP_ID '店铺名称',
	concat(so.PLATFORM_ORDER_CODE, '\t') '平台订单号',
	concat(
		so.PLATFORM_ORDER_CODE_N,
		'\t'
	) 'oms订单号',
	concat(d.REFUND_CODE, '\t') '退款编码',
	d. STATUS '平台退款状态',
	CASE so.order_status
        WHEN 0 THEN
            '作废'
        WHEN 2 THEN
            '新建'
        WHEN 5 THEN
            '待促销处理'
        WHEN 1 THEN
            '已提交'
        WHEN 17 THEN
            '待过路由'
        WHEN 18 THEN
            '已过路由'
        WHEN 19 THEN
            '待过仓'
        WHEN 20 THEN
            '已过仓'
        WHEN 4 THEN
            '库房准备中'
        WHEN 6 THEN
            '在途'
        WHEN 7 THEN
            '已同步过仓指令至ERP'
        WHEN 10 THEN
            '已取消'
        WHEN 12 THEN
            '关闭'
        WHEN 16 THEN
            '挂起待确认'
        WHEN 15 THEN
            '完成'
        END  '订单状态',
	so.IS_DIRECT_WMS_ORDER '仓储系统',
	so.WAREHOUSE_CODE '仓库编码',
	delivery.ACTUAL_TRANS_NAME '物流商',
	delivery.TRANS_NUMBER '物流单号',
	delivery.ADDRESS '地址',
	d.REFUND_FEE '退款指令金额',
	l.TOTAL_AMOUNT_AFTER_DISCOUNT '订单行金额',
	l.QUANTITY '订单行数量',
	shop.OPEN_AG_REFUND '是否开启自动取消',
	shop.IS_AUTO_APPOINTMENT '是否hold单',
	shop.APPOINTMENT_TIME 'hold单时间',
	delivery.CONTACT_PERSON '收件人',
	delivery.RECEIVER_MOBILE '电话号码'
FROM
	t_td_refund_direct d,
	t_td_sales_order so,
	t_td_sales_order_line l,
	t_ma_tb_shop_info shop,
	t_td_so_delivery_info delivery
WHERE
	so.ID = l.SALES_ORDER_ID
AND so.PLATFORM_ORDER_CODE = d.TID
AND shop.ID = so.ERP_SHOP_CODE
AND l.PLATFORM_ORDER_LINE_CODE = d.OID
AND delivery.SALES_ORDER_ID = so.ID
AND d.`STATUS` = 'SUCCESS'
AND d.HAS_GOOD_RETURN = 0
AND so.ORDER_STATUS NOT IN (0, 10, 6)
AND l.TOTAL_AMOUNT_AFTER_DISCOUNT = d.REFUND_FEE
AND l.ORDER_LINE_TYPE != 5
AND d.RD_STATUS = 0
AND so.TB_PAYMENT_TIME >= '2020-10-29'
AND d.CREATE_TIME >= '2020-11-6 10:00:00'
and d.CREATE_TIME < '2020-11-6 18:00:00';