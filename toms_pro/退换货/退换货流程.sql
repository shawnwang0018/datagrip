-- 节点流程
SELECT s.ID,
       s.CREATE_TIME,
       s.ERP_SHOP_CODE,
       s.IS_ONLINE_RETURN,
       s.IS_DIRECT_WMS_ORDER,
       s.CREATOR,
       s.CREATOR_ID,
       ra.OMS_ORDER_CODE,
       ra.ID,
       line.PLATFORM_ORDER_LINE_CODE,
       wf.*
FROM t_td_return_application_summary s,
     t_td_return_application ra,
     t_td_return_application_line line,
     t_wf_workflow_task wf
WHERE s.ID = ra.RAS_ID
  AND wf.REF_SLIP_CODE = ra.RAS_CODE
  AND ra.ID = line.RA_ID
  AND s.RAS_CODE IN (
    "RAS38233548"
    );

-- 流转日志


SELECT *
FROM t_wf_workflow_task_log t
WHERE t.TASK_ID = 1471727028;

SELECT t.IS_OPEN_QIMEN, t.SHOP_ID, t.INTERFACE_SHOP_CODE
FROM t_ma_tb_shop_info t
WHERE t.ID = 471755;

--
SELECT * FROM t_td_refund_direct t WHERE t.TID = '916578624285512135' AND t.OID = '916578624285512135';
 -- 2020-04-13 17:31:11
 -- 2020-04-13 17:18:26

SELECT * FROM  t_ra_create_direct t WHERE  t.PLATFORM_CODE = '916578624285512135';
