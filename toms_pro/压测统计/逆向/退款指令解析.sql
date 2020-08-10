SELECT DATE_FORMAT(
               t.UPDATE_TIME,
               '%Y-%c-%d %H:%i'
           ) dd,
       count(1)
FROM t_tb_automated_after_sale t
WHERE t.SHOP_ID NOT IN
       (
        11502, 11501, 11499, 176706, 176704, 11498, 11497, 176705, 176703, 11495, 11496, 176701, 176700, 176702, 11500,
        11494, 11493, 326725, 326726, 176707
           )
  AND t.CREATE_TIME > '2020-06-16 00:00:00'
  AND t.PROCESS_STATUS = 10
GROUP BY dd
ORDER BY dd DESC;