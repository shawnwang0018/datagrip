SELECT DATE_FORMAT(t.input_time, '%Y-%c-%d %H:%i') 在途反馈, COUNT(*)
FROM t_wms_order_status t
WHERE t.INPUT_TIME > '2020-06-16 00:00:00'
  AND (t.SHOP_ID not IN
       (
        11502, 11501, 11499, 176706, 176704, 11498, 11497, 176705, 176703, 11495, 11496, 176701, 176700, 176702, 11500,
        11494, 11493, 326725, 326726, 176707
           ) OR t.SHOP_ID IS NULL)
  AND t.process_status = 10
GROUP BY DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i')
ORDER BY DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i') DESC;