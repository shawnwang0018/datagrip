select * from t_receive_pacs_mq_msg_line where ORDER_CODE in (
'1009032640459173314',
'1009714947125185115',
'602016940528942403'
 ) and CREATE_TIME > '2020-05-15' ;



SELECT
				l.ID id,
				l.ORDER_CODE orderCode,
				l.CONTENT content,
				l.OP_TYPE opType,
				l.MSG_TYPE msgType,
				l.SHOP_ID shopId,
				l.CREATE_TIME createTime,
				t.CURRENT_NODE_NO currentNodeNo,
				t.ID taskId,
				t.TASK_NO taskNo
			FROM
				t_receive_pacs_mq_msg_line l,
				t_wf_workflow_task t
			WHERE
			l.ORDER_CODE = t.REF_SLIP_CODE
AND l.order_code IN  ('1009032640459173314',
'1009714947125185115',
'602016940528942403');
