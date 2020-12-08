SELECT DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H') 刷尾款, COUNT(1)
FROM t_so_step_wh_queue a
WHERE a.SHOP_ID NOT IN (
                    11498, 11497, 176700, 176702, 11500, 11494, 176704, 326725, 176705, 176706, 176707, 11496, 11499,
                    176703, 11495, 11493, 176701, 11501, 11502, 326726
    )
  AND a.CREATE_TIME >= '2020-06-1 00:00:00'
  AND a.CREATE_TIME <= '2020-06-1 05:00:00'
  AND a.PROCESS_STATUS = 10
GROUP BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H')
ORDER BY DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H') DESC;


