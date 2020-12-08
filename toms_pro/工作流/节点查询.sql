SELECT
       t.id,
	n_f.ID '开始节点ID',
	n_f.NODE_NO '开始节点值',
	n_f.`NAME` '开始节点名称',
	t.`CODE`,
  t.`NAME`,
	n_t.ID '结束节点ID',
	n_t.NODE_NO '结束节点值',
	n_t.`NAME` '结束节点名称'
FROM
	t_wf_workflow_node n_f,
	t_wf_workflow_transition t,
	t_wf_workflow_node n_t
WHERE
	t.FROM_NODE_ID = n_f.ID
AND t.TO_NODE_ID = n_t.ID
AND n_f.WORKFLOW_ID = 2
-- AND t.CODE in ('CANCEL','CANCEL_TO_CONFIRM');
AND t.CODE in ('REVOKE');
 --  AND n_t.NODE_NO = 15;
--   AND t.ID IN (53,58,77);
 -- AND t.`CODE` = 'TO_WH';


SELECT * FROM t_wf_workflow_node t WHERE t.WORKFLOW_ID = 1
AND t.NODE_NO = 114;

SELECT t.*
FROM t_wf_workflow_action_reg t
 WHERE t.ACTION_CLASS_NAME LIKE  '%SoResponse1006Action%';


SELECT * FROM t_wf_workflow_transition  t WHERE t.CODE = 'TO_WH_FAILED_STA';


SELECT * FROM t_wf_workflow_action_reg t WHERE t.WORKFLOW_TRANSITION_ID IN (114);

SELECT * FROM t_wf_workflow_action_param t WHERE t.ACTION_ID = 11;

SELECT * FROM t_wf_workflow_action_param t WHERE  t.ACTION_ID = 2548;


SELECT * FROM  t_td_return_exchange_direct t WHERE  t.BIZ_ORDER_ID = '1216008528348102005';

SELECT * FROM t_send_hub_msg t WHERE  t.TID = '43314890952044';


SELECT * FROM  t_td_return_exchange_direct t WHERE  t.DISPUTE_ID = 1216008528348102005;


