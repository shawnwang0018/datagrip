# 开关查询
SELECT
	t.ID,
	t.SHOP_ID,
	t.OPEN_AG_REFUND '一期(取消发货，生成退款单)',
	t.AG_SECOND '二期三期(自动创建退货单)',
	t.AG_OPEN_AUTO_REFUND '四期(自动退款)'
FROM
	t_ma_tb_shop_info t
WHERE
      t.ID = 586764;
	t.SHOP_NAME LIKE '%测试%';

SELECT * FROM t_sys_shop_db t WHERE t.SHOPS LIKE '%521760%';

SELECT * FROM  t_tb_automated_after_sale t WHERE  t.TID = '1149320707040885267';

