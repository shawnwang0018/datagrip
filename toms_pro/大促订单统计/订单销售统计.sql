# by店铺统计销售情况脚步
SELECT
	i.SHOP_ID 店铺,
	tab.c 订单量,
	tab.sum 金额
FROM
	(
		SELECT
			s.ERP_SHOP_CODE shopId,
			count(1) c,
			SUM(s.AMOUNT_AFTER_DISCOUNT) sum
		FROM
			t_td_sales_order s
		WHERE
			s.CREATE_TIME >= '2018-11-11'
		AND s.RA_OMS_ORDER_CODE IS NULL
		AND s.COPY_SOURCE_OMS_ORDER_CODE IS NULL
		AND s.SPLIT_SOURCE_OMS_ORDER_CODE IS NULL
		GROUP BY
			s.ERP_SHOP_CODE
	) tab,
	t_ma_tb_shop_info i
WHERE
	tab.shopId = i.ID
ORDER BY
	tab.c DESC;

# 统计所有单量
SELECT
	COUNT(1)
FROM
	t_td_sales_order s
WHERE
	s.CREATE_TIME > '2018-11-11'
AND s.RA_OMS_ORDER_CODE IS NULL
AND s.COPY_SOURCE_OMS_ORDER_CODE IS NULL
AND s.SPLIT_SOURCE_OMS_ORDER_CODE IS NULL;

# by店铺统计销售情况脚步
SELECT
	SUM(sc.c)
FROM
	(
		SELECT
			i.SHOP_ID 店铺,
			tab.c c,
			tab.sum 金额
		FROM
			(
				SELECT
					s.ERP_SHOP_CODE shopId,
					count(1) c,
					SUM(s.AMOUNT_AFTER_DISCOUNT) sum
				FROM
					t_td_sales_order s
				WHERE
					s.CREATE_TIME > '2018-06-01'
				AND s.RA_OMS_ORDER_CODE IS NULL
				AND s.COPY_SOURCE_OMS_ORDER_CODE IS NULL
				AND s.SPLIT_SOURCE_OMS_ORDER_CODE IS NULL
				GROUP BY
					s.ERP_SHOP_CODE
			) tab,
			t_ma_tb_shop_info i
		WHERE
			tab.shopId = i.ID
	) sc;