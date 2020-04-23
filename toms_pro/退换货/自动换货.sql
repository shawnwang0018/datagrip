-- 已完成处理数量：
SELECT
	count(1)
FROM
	t_td_return_exchange_direct t
WHERE
	t.`AUTO_CREATE_STATUS` = 1;


-- 待执行数量
SELECT
	count(1)
FROM
	t_td_return_exchange_direct t
WHERE
	t.`AUTO_CREATE_STATUS` = 0 AND t.`OMS_STATUS` = 0;


-- 按分钟查看解析效率：
SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理时间,
	COUNT(1)
FROM
	t_td_return_exchange_direct t
WHERE
	t.CREATE_TIME >= '2018-8-31 15:30:00'
AND t.AUTO_CREATE_STATUS = 1
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



