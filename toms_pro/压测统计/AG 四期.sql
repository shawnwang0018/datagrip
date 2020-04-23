-- 待同步AG数量
SELECT COUNT(1) FROM t_ag_pacs_refund_oms t WHERE t.`STATUS` = 0;
-- 已同步AG数量
SELECT COUNT(1) FROM t_ag_pacs_refund_oms t WHERE t.`STATUS` = 1;

-- 待同步PAC数量
SELECT COUNT(1) FROM t_ag_refund_notify_pacs t WHERE t.`STATUS` = 0;
-- 已同步PAC数量
SELECT COUNT(1) FROM t_ag_refund_notify_pacs t WHERE t.`STATUS` = 1;



SELECT * FROM t_ag_pacs_refund_oms ORDER BY CREATE_TIME DESC LIMIT 100;

SELECT * FROM t_ag_refund_notify_pacs ORDER BY CREATE_TIME DESC LIMIT 100;


