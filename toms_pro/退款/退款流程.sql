

SELECT task.id, refund.IS_SUSPEND,refund.REFUND_REASON_TYPE, task.CURRENT_NODE_NO, refund.*, task.*
FROM t_td_refund_application refund,
     t_wf_workflow_task task
WHERE refund.CODE = task.REF_SLIP_CODE
  AND refund.SO_ID = 1397639165;
  -- AND refund.CODE = 'RFH100615529';

SELECT log.ID,
       log.TASK_ID,
       log.FROM_NODE_NO,
       fn.NAME,
       log.TO_NODE_NO,
       tn.NAME,
       tn.TYPE,
       tn.FORK_CLASS,
       log.TRANSITION_TIME,
       log.TRANSITION_CODE,
       log.USER_ID
FROM t_wf_workflow_task_log log,
     t_wf_workflow_node fn,
     t_wf_workflow_node tn
WHERE log.TASK_ID = 1469819347
  AND log.FROM_NODE_NO = fn.NODE_NO
  AND log.TO_NODE_NO = tn.NODE_NO
ORDER BY TRANSITION_TIME;

