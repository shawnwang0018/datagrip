-- 验证直连过仓
-- 执行完sql 需看到 IS_DIRECT_WMS_ORDER 中有6 和13的值
SELECT
	so.IS_DIRECT_WMS_ORDER,
	COUNT(1)
FROM
	t_wf_workflow_task t,
	t_td_sales_order so
WHERE
	t.REF_SLIP_CODE = so.PLATFORM_ORDER_CODE_N
AND t.ENTER_TIME > date_add(
	SYSDATE(),
	INTERVAL - 20 MINUTE
)
AND t.WORKFLOW_ID = 1
AND t.CURRENT_NODE_NO = 12
GROUP BY
	so.IS_DIRECT_WMS_ORDER;

-- 验证仓库库房准备中
-- 执行完IS_DIRECT_WMS_ORDER中必须有1,6,13的值
SELECT
	so.IS_DIRECT_WMS_ORDER,
	COUNT(1)
FROM
	t_wf_workflow_task t,
	t_td_sales_order so
WHERE
	t.REF_SLIP_CODE = so.PLATFORM_ORDER_CODE_N
AND t.ENTER_TIME > date_add(
	SYSDATE(),
	INTERVAL - 20 MINUTE
)
AND t.WORKFLOW_ID = 1
AND t.CURRENT_NODE_NO = 13
GROUP BY
	so.IS_DIRECT_WMS_ORDER;

-- 验证仓库发货
-- 执行完看到能查出值即可
SELECT
	so.IS_DIRECT_WMS_ORDER,
	COUNT(1)
FROM
	t_wf_workflow_task t,
	t_td_sales_order so
WHERE
	t.REF_SLIP_CODE = so.PLATFORM_ORDER_CODE_N
AND t.ENTER_TIME > date_add(
	SYSDATE(),
	INTERVAL - 30 MINUTE
)
AND t.WORKFLOW_ID = 1
AND t.CURRENT_NODE_NO = 14
GROUP BY
	so.IS_DIRECT_WMS_ORDER;

-- 验证退换货过仓
SELECT
	s.IS_DIRECT_WMS_ORDER,
	COUNT(1)
FROM
	t_wf_workflow_task t
JOIN t_td_return_application r ON r.RAS_CODE = t.REF_SLIP_CODE
JOIN t_td_return_application_summary s ON s.ID = r.RAS_ID
WHERE
	t.ENTER_TIME > date_add(
		SYSDATE(),
		INTERVAL - 20 MINUTE
	)
AND t.CURRENT_NODE_NO = 34
GROUP BY
	s.IS_DIRECT_WMS_ORDER;

-- 验证退款
SELECT
	r.ID,
	t.REF_SLIP_CODE,
	t.CURRENT_NODE_NO,
	r.CREATE_TIME,
	t.REF_SLIP_SHOP_ID,
	r.CREATE_TIME
FROM
	t_wf_workflow_task t
JOIN t_td_refund_application r ON r. CODE = t.REF_SLIP_CODE
WHERE
	t.WORKFLOW_ID = 3
AND t.ENTER_TIME > date_add(
	SYSDATE(),
	INTERVAL - 20 MINUTE
)
AND t.CURRENT_NODE_NO = 57
LIMIT 100;