-- 定时任务
SELECT *
FROM t_sys_task_config t
WHERE t.DESCRIPTION LIKE '%%';