SELECT * from t_search_return_trans_info t where t.RAS_ID in (44516075,44516190,44572235,44575388,44640061);

SELECT * from t_send_return_trans_info t where t.RAS_ID in (44516075,44516190,44572235,44575388,44640061);

SELECT count(1) from t_td_sales_order t where t.CREATE_TIME > '2020-10-21'
and t.SPECIAL_TYPE in (11,12) and t.ORDER_STATUS not in (10,0);



SELECT t.SPECIAL_TYPE, count(1) from t_td_sales_order t where t.CREATE_TIME > '2020-10-21'
and t.SPECIAL_TYPE in (11,12) and t.ORDER_STATUS not in (10,0) GROUP BY t.SPECIAL_TYPE;
