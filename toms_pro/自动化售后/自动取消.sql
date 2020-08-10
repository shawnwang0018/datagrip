SELECT
	t.PROCESS_STATUS,
	t.ERROR_MSG,
	t.*,
    now()
FROM
	t_tb_automated_after_sale t
WHERE
	t.TID = '799492931922895508';

SELECT
    t.PROCESS_STATUS,
    t.ERROR_MSG,
    t.*
FROM
    t_tb_automated_after_sale t
WHERE t.tid = '1018935651028422130'
AND t.oid = '1018935651028422130'
ORDER BY t.CREATE_TIME DESC  LIMIT  100;
SELECT *
FROM t_ag_ship_cancel_detail t
WHERE t.TID = '1018935651023422130';

SELECT *
FROM t_ag_ship_cancel_detail t
WHERE t.STATUS = 10
ORDER BY UPDATE_TIME DESC LIMIT 100;

SELECT * FROM t_td_refund_direct t WHERE t.TID = '202004291433281468';

SELECT * FROM t_td_refund_application t WHERE t.SO_ID = 4705348;


 SELECT * FROM t_ag_pacs_refund_oms t where t.RF_CODE = 'RFH70060597' ORDER BY CREATE_TIME DESC LIMIT 100 ;

 SELECT * FROM t_ag_pacs_refund_oms t where t.RF_CODE = 'RFH70060616' ORDER BY CREATE_TIME DESC LIMIT 100 ;



SELECT
						r.id,r.CREATE_TIME,date_sub(sysdate(), INTERVAL 3 DAY )
					FROM
						t_td_refund_application r FORCE INDEX (IDX_SO_RF_CT),t_ma_tb_shop_info i
					WHERE r.COMPANY_SHOP_ID = i.ID
					AND r.COMPANY_SHOP_ID IN (2042)
					AND i.IS_REFUND_DIRECT = 1
					AND r.create_time > date_sub(sysdate(), INTERVAL 3 DAY )
					AND r. STATUS = 2
					AND r.type = 1
					AND (r.CREATOR_ID != 36434881 OR r.CREATOR_ID is null OR r.REFUND_REASON_TYPE != 14)
					ORDER BY r.id DESC LIMIT 1000


SELECT * FROM t_ag_ship_cancel_detail ORDER BY CREATE_TIME DESC  LIMIT  100;

t_wms_order