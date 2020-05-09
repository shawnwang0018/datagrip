SELECT DATE_FORMAT(t.CREATE_TIME, '%Y-%c-%d %H:%i') 结算数据发送PAC,
       COUNT(*)
FROM t_send_pacs_final_msg t
WHERE t.CREATE_TIME > '2019-05-25 15:00'
  AND t.CREATE_TIME < '2019-05-25 24:00'
  AND (
            t.SHOP_ID IN
            (
             11498, 11497, 11500, 11494, 176704, 326725, 176706, 176707, 11496, 11499, 176703, 11495, 11493, 11501,
             11502, 326726
                ) OR t.SHOP_ID IS NULL)
GROUP BY 结算数据发送PAC;