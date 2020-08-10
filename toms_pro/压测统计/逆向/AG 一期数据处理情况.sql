# 根据店铺ID查看最近1000条处理情况
SELECT
	*
FROM
	t_ag_ship_cancel_detail t
WHERE
	t.SHOP_ID = 11498
ORDER BY
	t.CREATE_TIME DESC
LIMIT 1000;





-- 一期
-- 待解析数据数量：
SELECT
	*
FROM
	t_receive_ag_log t

WHERE
	t.msg_type = 'qimen.taobao.rdc.aligenius.order.abort'
AND t.SHOP_ID = 11498
AND t.CREATE_TIME >= '2018-8-29 00:00:00' AND `STATUS` = 0;



SELECT
	*
FROM
	t_receive_ag_log t

WHERE
	t.msg_type = 'qimen.taobao.rdc.aligenius.order.abort'
 AND t.SHOP_ID = 11498
AND t.CREATE_TIME >= '2018-8-29 00:00:00'
ORDER BY t.CREATE_TIME DESC LIMIT 1000 ;

-- 已完成处理数量：
SELECT count(1) FROM t_ag_ship_cancel_detail t WHERE t.`STATUS` = 10;


-- 按分钟查看解析数量：
SELECT
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理时间,
	COUNT(1)
FROM
	t_receive_ag_log t
WHERE
	t.CREATE_TIME >= '2018-6-3 00:00:00'
AND t.msg_type = 'qimen.taobao.rdc.aligenius.order.abort'
AND t.`STATUS` = 10
GROUP BY
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	)
ORDER BY
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d %H:%i'
	);



-- 按分钟查看数量：
SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理效率,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t
WHERE
	t.CREATE_TIME >= '2020-6-16 00:00:00'
AND t.`STATUS` = 10
GROUP BY
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	)
ORDER BY
DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	);
