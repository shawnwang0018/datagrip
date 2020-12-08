-- 创单
SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H-%i'
	) dd,
	COUNT(1)
FROM
	t_td_sales_order a
WHERE
	 a.CREATE_TIME >= '2020-10-21 00:00'
GROUP BY
	dd
ORDER BY
	dd DESC;


-- 状态流转

SELECT
	DATE_FORMAT(
		t.PROCESS_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	count(1)
FROM
	t_td_so_wf_task t
WHERE
	 t.CREATE_TIME > '2020-10-21 00:00:00'
AND t.PROCESS_STATUS = 10
GROUP BY
	dd
ORDER BY
	dd DESC;


-- 过路由

SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(1)
FROM
	t_send_wms a
WHERE
	 a.CREATE_TIME >= '2020-10-21 00:00:00'
AND a.MSG_TYPE = 'soRoute'
GROUP BY
	dd
ORDER BY
	dd DESC;

-- 路由反馈

SELECT
	DATE_FORMAT(
		t.PROCESS_TIME,
		'%Y-%c-%d %H:%i'
	) dd,
	COUNT(*)
FROM
	t_split_order_head t
WHERE
	t.INPUT_TIME > '2020-10-21 00:00:00'
AND t.PROCESS_STATUS = 10
GROUP BY
	dd
ORDER BY
	dd desc;

--  过仓
SELECT
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H%i'
	) 过仓,
	COUNT(1)
FROM
	t_send_wms a
WHERE
	 a.CREATE_TIME > '2020-10-21 00:00:00'
AND a.MSG_TYPE = 'SO'
GROUP BY
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H%i'
	)
ORDER BY
	DATE_FORMAT(
		a.CREATE_TIME,
		'%Y-%c-%d %H%i'
	) DESC;


-- hold单

SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H-%i'
	) dd,
	COUNT(*)
FROM
	t_td_so_appointment_to_wh_task t
WHERE
 t.process_status = 10
AND t.CREATE_TIME > '2020-10-21 00:00:00'
GROUP BY
	dd
ORDER BY
	dd DESC;

-- 非直连订单同步PAC

SELECT
	DATE_FORMAT(
		t.SYNC_TIME,
		'%Y-%c-%d %H:%i'
	) 非直连过单,
	COUNT(*)
FROM
	t_send_so_msg t
WHERE
	t.SYNC_TIME > '2020-10-21 00:00:00'
AND t.sync_status = 1
GROUP BY
	DATE_FORMAT(
		t.SYNC_TIME,
		'%Y-%c-%d %H:%i'
	)
ORDER BY
	DATE_FORMAT(
		t.SYNC_TIME,
		'%Y-%c-%d %H:%i'
	) DESC;

-- 创单反馈

SELECT
	DATE_FORMAT(t.input_time, '%Y-%c-%d %H-%i') wms创单反馈,
	COUNT(*)
FROM
	t_wms_confirm_order t
WHERE
	t.INPUT_TIME >= '2020-10-21 00:00:00'
AND t.process_status = 10
GROUP BY
	DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H-%i')
ORDER BY
	DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H-%i') DESC;

-- 非直连指令流转

SELECT
	DATE_FORMAT(
		a.BZ_OPER_TIME,
		'%Y-%c-%d %H-%i'
	) dd,
	COUNT(1)
FROM
	t_receive_pacs_mq_msg_line a
WHERE
	 a.CREATE_TIME >= '2020-10-21 00:00:00'
AND a. STATUS = 1
AND MSG_TYPE IN ('O1-1', 'R1-1', 'F1-1')
GROUP BY
	dd
ORDER BY
	dd DESC;