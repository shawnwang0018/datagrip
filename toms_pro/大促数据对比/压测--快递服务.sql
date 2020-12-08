select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H:%i' ) skxLF,COUNT(1) from t_send_wms a,t_td_sales_order o where a.SHOP_ID not in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
 and a.CREATE_TIME >= '2020-10-21 00:00:00'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
and a.MSG_TYPE = 'DELIVERY'
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H:%i' ) 
order BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H:%i' ) desc ;

select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) dd,COUNT(1) from t_send_wms a,
t_td_sales_order o where a.SHOP_ID = 176701
 and a.CREATE_TIME >= '2020-10-10 10:00:00'
and o.PLATFORM_ORDER_CODE_N = a.KEY_CODE
-- and o.IS_DIRECT_WMS_ORDER = 6
and a.MSG_TYPE = 'DELIVERY'
GROUP BY dd 
order BY dd desc ;

SELECT order_status, count(1) from t_td_sales_order t where t.ERP_SHOP_CODE in (176701) 
and t.CREATE_TIME > '2020-09-19' GROUP BY ORDER_STATUS;


SELECT
						m.ID,
						m.shop_id shopId,
						m.msg_type systemNum,
						m.ORDER_ID soId,
						m.OMS_ORDER_CODE omsOrderCode,
						s.IS_OPEN_QIMEN isOpenQiMen,
						s.INTERFACE_SHOP_CODE interfaceShopCode,
            m.PROCESS_STATUS
					FROM
					t_ma_handle_middle m,
					t_ma_tb_shop_info s
					WHERE
						s.id = m.SHOP_ID
					AND m.SHOP_ID in (11502, 11501, 11499, 176706, 176704, 176707, 11498, 11497, 176705,
                    176703, 11495, 11496, 176701, 176700, 176702, 11500, 11494, 11493, 326725, 326726)
					-- AND m.PROCESS_STATUS = 0
					AND (m.SEND_TIME IS NULL OR m.SEND_TIME < NOW())
					LIMIT 100;


SELECT * from t_td_sales_order t where t.PLATFORM_ORDER_CODE = '5555552067246287';