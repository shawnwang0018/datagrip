SELECT t.shop_id,t.* FROM t_mq_so_log t WHERE t.code = '606213314868969808';
SELECT  * FROM t_mq_so_line_log t WHERE t.so_log_id = 250784994;


SELECT t.IS_AUTO_SPLIT_ORDER,t.* FROM t_ma_tb_shop_info t WHERE t.ID = 1;

UPDATE t_ma_tb_shop_info SET IS_AUTO_SPLIT_ORDER = 0 WHERE ID = 1;

SELECT * FROM t_td_sales_order t WHERE  t.PLATFORM_ORDER_CODE = '606213314868969808';

SELECT * FROM t_ma_inventory_correction t WHERE t.REF_ID = 4706634;

SELECT * FROM t_ag_pacs_refund_oms; -- pac-oms--top
SELECT * FROM t_ag_refund_notify_pacs;  -- top - oms - pacs

