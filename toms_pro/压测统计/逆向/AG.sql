SELECT
	so.CREATE_TIME,
	so.PLATFORM_ORDER_CODE,
	so.PLATFORM_ORDER_CODE_N,
	so.OMS_ORDER_CODE,
	so.ID,
	so.VIRTUAL_AMOUNT,
	so.AMOUNT_AFTER_DISCOUNT,
	so.INSTALL_FEE,
	so.HOME_DELIVERY_FEE,
	so.TRANS_FEE,
	so.ERP_SHOP_CODE,
	so.ORDER_STATUS,
	t_wf.CURRENT_NODE_NO
FROM
	t_td_sales_order so,
	t_wf_workflow_task t_wf
WHERE
	so.PLATFORM_ORDER_CODE_N = t_wf.REF_SLIP_CODE
AND so.ERP_SHOP_CODE = 11247
-- AND t_wf.CURRENT_NODE_NO NOT IN (91, 20)
AND so.ID IN (
	205437928 ,205440125,
	205676601
);


SELECT * FROM t_td_sales_order t ,t_td_sales_order_line t_l WHERE t.ID = t_l.SALES_ORDER_ID AND t_l.PLATFORM_ORDER_LINE_CODE = '169269007409574506' AND t.ORDER_STATUS = 10;



SELECT * FROM t_wf_workflow_task t WHERE t.REF_SLIP_CODE = '169269007407574506-7';


SELECT * FROM t_wf_workflow_task_log t WHERE t.TASK_ID = 225573790;