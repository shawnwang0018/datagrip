-- 一期
-- 待解析数据数量：
SELECT
	COUNT(1)
FROM
	t_receive_ag_log t
WHERE
	t.msg_type = 'qimen.taobao.rdc.aligenius.order.abort'
AND t.CREATE_TIME >= '2018-5-31 00:00:00' AND `STATUS` = 0;

-- 已完成处理数量：
SELECT count(1) FROM t_ag_ship_cancel_detail t WHERE t.`STATUS` = 10;

-- 待处理数量
SELECT count(1) FROM t_ag_ship_cancel_detail t WHERE t.`STATUS` IN (0,3);



-- 按分钟查看执行效率：
SELECT
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	) 处理效率,
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t
WHERE
	t.CREATE_TIME >= '2018-5-31 00:00:00'
AND t.`STATUS` = 10
GROUP BY
	DATE_FORMAT(
		t.UPDATE_TIME,
		'%Y-%c-%d %H:%i'
	);


-- 查看最近1000条处理情况
SELECT
	*
FROM
	t_ag_ship_cancel_detail t
ORDER BY
	t.CREATE_TIME DESC
LIMIT 1000;

-- 查看所有条数
SELECT
	COUNT(1)
FROM
	t_ag_ship_cancel_detail t
WHERE t.CREATE_TIME >= '2018-11-11'
AND t.`STATUS` = 10;

-- 查看店铺所有处理情况

SELECT
	t_temp_result.SHOP_ID,
	t_temp_result.SHOP_NAME,
	MAX(CASE P_STATUS WHEN 10 THEN COUNT_NUMBER END) '取消成功',
	MAX(CASE P_STATUS WHEN 3 THEN COUNT_NUMBER END) '取消失败，待重试',
	MAX(CASE P_STATUS WHEN 0 THEN COUNT_NUMBER END) '待发往MQ',
	MAX(CASE P_STATUS WHEN 1 THEN COUNT_NUMBER END) '已发往MQ处理',
	MAX(CASE P_STATUS WHEN 5 THEN COUNT_NUMBER END) '处理失败',
	MAX(CASE P_STATUS WHEN 8 THEN COUNT_NUMBER END) '指令重复'
FROM
	(
		SELECT
			count(1) COUNT_NUMBER,
			t.`STATUS` `P_STATUS`,
			s.SHOP_ID SHOP_NAME,
			s.ID SHOP_ID
		FROM
			t_ag_ship_cancel_detail t,
			t_ma_tb_shop_info s
		WHERE
			t.SHOP_ID = s.ID -- AND t.`STATUS` IN (5)
		-- AND s.ID IN (10896, 2042)
		AND t.CREATE_TIME >= '2018-11-11'
		GROUP BY
			`P_STATUS`,
			SHOP_NAME
	) t_temp_result
GROUP BY t_temp_result.SHOP_ID;

-- 根据状态查看处理总和
SELECT
	SUM(t_result.`取消成功`) 取消成功,
	SUM(t_result.`取消失败，待重试` )  取消失败待重试,
	IFNULL(SUM(t_result.`已发往MQ处理`),0) 已发往MQ处理,
	IFNULL(SUM(t_result.`待发往MQ`),0) 待发往MQ,
	SUM(t_result.`处理失败`) 处理失败,
	SUM(t_result.`指令重复`) 指令重复
FROM
	(
		SELECT
			t_temp_result.SHOP_ID,
			t_temp_result.SHOP_NAME,
			MAX(
				CASE P_STATUS
				WHEN 10 THEN
					COUNT_NUMBER
				END
			) '取消成功',
			MAX(
				CASE P_STATUS
				WHEN 3 THEN
					COUNT_NUMBER
				END
			) '取消失败，待重试',
			MAX(
				CASE P_STATUS
				WHEN 0 THEN
					COUNT_NUMBER
				END
			) '待发往MQ',
			MAX(
				CASE P_STATUS
				WHEN 5 THEN
					COUNT_NUMBER
				END
			) '处理失败',
			MAX(
				CASE P_STATUS
				WHEN 1 THEN
					COUNT_NUMBER
				END
			) '已发往MQ处理',
			MAX(
				CASE P_STATUS
				WHEN 8 THEN
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
					t_ag_ship_cancel_detail t,
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





