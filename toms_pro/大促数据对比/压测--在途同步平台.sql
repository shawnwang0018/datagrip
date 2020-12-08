select * from t_send_hub_msg limit 1;

select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H-%i' ) dd,COUNT(1) from t_send_hub_msg a where a.shop_id in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-15 18:00:00' 
GROUP BY dd 
order BY dd desc;



select count(1) from t_send_hub_msg t where t.shop_id in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and t.CREATE_TIME >= '2020-10-15 18:00:00' and t.create_time >= '2020-10-15 19:00:00';

select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) dd,COUNT(1) from t_send_hub_msg a where a.shop_id in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-15 18:00:00' 
GROUP BY dd 
order BY dd desc;
 

select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H' ) dd,COUNT(1) from t_send_hub_msg a where a.shop_id in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-14 19:40:00' and a.CREATE_TIME <= '2020-10-14 20:40:00'
GROUP BY dd 
order BY dd desc;

select COUNT(1) from t_send_hub_msg a where a.shop_id in (
11502,11501,11499,176706,176704,11498,11497,176705,176703,11495,11496,176701,176700,176702,11500,11494,11493,326725,326726,176707
) and a.CREATE_TIME >= '2020-10-14 19:00:00' 
GROUP BY dd 
order BY dd desc;


select DATE_FORMAT(a.CREATE_TIME, '%Y-%c-%d %H-%i' ) dd,COUNT(1) from t_send_hub_msg a where a.shop_id in (
11497,11495
) and a.CREATE_TIME >= '2020-10-14 19:00:00' 
GROUP BY dd 
order BY dd desc;

SELECT
  s.ID,
  s.ATI,
  s.LOGIN_FROM as loginFrom,
  s.LOGIN_NAME as loginName,
  s.LOGIN_STATUS as loginStatus,
  s.LOGIN_TIME as loginTime,
  s.REMOTE_ADDR as remoteAddress,
  s.`STATUS`,
  s.TID,
  s.TIME,
  s.USER_AGENT as userAgent
FROM
  t_sys_login_log s
WHERE
  s.`STATUS` = 0
  and s.ATI IS NOT NULL
  and s.LOGIN_STATUS IS NOT NULL
  -- AND date_format(s.LOGIN_TIME, '%Y-%m-%d') = date_format(now(), '%Y-%m-%d')
  and  s.LOGIN_TIME between date_format(now(), '%Y-%m-%d 00:00:00') and 
   date_format(now(), '%Y-%m-%d 23:59:59')
LIMIT
  500;