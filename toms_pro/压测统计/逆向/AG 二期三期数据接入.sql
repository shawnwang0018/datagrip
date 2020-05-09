-- 二期三期
-- 待解析数据数量：
SELECT
	COUNT(1)
FROM
	t_receive_ag_log t
WHERE
	t.msg_type = 'qimen.taobao.rdc.aligenius.order.returngoods'
AND t.CREATE_TIME >= '2018-5-31 00:00:00'
AND `STATUS` = 0;

-- 已完成处理数量：
SELECT
	count(1)
FROM
	t_ag_return_summary t
WHERE
	t.`STATUS` = 1;

-- 待处理数量
SELECT
	count(1)
FROM
	t_ag_return_summary t
WHERE
	t.`STATUS` = 0;

-- 按分钟查看执行效率
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
AND t.msg_type = 'qimen.taobao.rdc.aligenius.order.returngoods'
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

-- 查看最近1000条处理情况
SELECT
	*
FROM
	t_ag_return_summary t
ORDER BY
	t.CREATE_TIME DESC
LIMIT 1000;

-- 查看店铺所有处理情况
SELECT
	t_temp_result.SHOP_ID,
	t_temp_result.SHOP_NAME,
	MAX(
		CASE P_STATUS
		WHEN 1 THEN
			COUNT_NUMBER
		END
	) '已处理成功',
	MAX(
		CASE P_STATUS
		WHEN 3 THEN
			COUNT_NUMBER
		END
	) '待重试',
	MAX(
		CASE P_STATUS
		WHEN 2 THEN
			COUNT_NUMBER
		END
	) '已通知MQ执行',
	MAX(
		CASE P_STATUS
		WHEN 5 THEN
			COUNT_NUMBER
		END
	) '指令重复'
FROM
	(
		SELECT
			count(1) COUNT_NUMBER,
			t.`STATUS` `P_STATUS`,
			s.SHOP_ID SHOP_NAME,
			s.ID SHOP_ID
		FROM
			t_ag_return_summary t,
			t_ma_tb_shop_info s
		WHERE
			t.SHOP_ID = s.ID -- AND t.`STATUS` IN (5)
			-- AND s.ID IN (10896, 2042)
		AND t.CREATE_TIME >= '2018-11-11'
		GROUP BY
			`P_STATUS`,
			SHOP_NAME
	) t_temp_result
GROUP BY
	t_temp_result.SHOP_ID;

-- 根据状态查看处理总和
SELECT
	SUM(t_result.`已处理成功`) 已处理成功,
	SUM(
		t_result.`已通知MQ执行` 
	) 已通知MQ执行,
	IFNULL(
		SUM(
			t_result.`待重试`
		),
		0
	) 待重试,
	IFNULL(
		SUM(t_result.`指令重复`),
		0
	) 指令重复
FROM
	(
		SELECT
			t_temp_result.SHOP_ID,
			t_temp_result.SHOP_NAME,
			MAX(
				CASE P_STATUS
				WHEN 1 THEN
					COUNT_NUMBER
				END
			) '已处理成功',
			MAX(
				CASE P_STATUS
				WHEN 3 THEN
					COUNT_NUMBER
				END
			) '待重试',
			MAX(
				CASE P_STATUS
				WHEN 2 THEN
					COUNT_NUMBER
				END
			) '已通知MQ执行',
			MAX(
				CASE P_STATUS
				WHEN 5 THEN
					COUNT_NUMBER
				END
			) '指令重复'
		FROM
			(
				SELECT
					count(1) COUNT_NUMBER,
					t.`STATUS` `P_STATUS`,
					s.SHOP_ID SHOP_NAME,
					s.ID SHOP_ID
				FROM
					t_ag_return_summary t,
					t_ma_tb_shop_info s
				WHERE
					t.SHOP_ID = s.ID -- AND t.`STATUS` IN (5)
					-- AND s.ID IN (10896, 2042)
				AND t.CREATE_TIME >= '2018-11-11'
				GROUP BY
					`P_STATUS`,
					SHOP_NAME
			) t_temp_result
		GROUP BY
			t_temp_result.SHOP_ID
) t_result;


-- 创建成功的数量

SELECT
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d'
	) 处理效率,
	COUNT(1)
FROM
	 t_ag_return_details t
WHERE
	t.CREATE_TIME >= '2018-11-11 00:00:00'
AND (t.IS_SECOND_CREATE = 1 OR t.IS_THIRD_CREATE = 1)
 GROUP BY
	DATE_FORMAT(
		t.CREATE_TIME,
		'%Y-%c-%d'
	);



