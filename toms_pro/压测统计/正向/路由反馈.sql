SELECT DATE_FORMAT(t.PROCESS_TIME, '%Y-%c-%d %H') dd, COUNT(*)
FROM t_split_order_head t
WHERE t.INPUT_TIME > '2019-10-09'
  AND (t.SHOP_ID IN
       (
        11498, 11497, 176700, 176702, 11500, 11494, 176704, 326725, 176705, 176706, 176707, 11496, 11499, 176703, 11495,
        11493, 176701, 11501, 11502, 326726
           ) OR t.SHOP_ID IS NULL)
GROUP BY dd;

