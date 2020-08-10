#外包仓创单反馈
SELECT DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i'), COUNT(*)
FROM t_wms_confirm_order t
WHERE t.INPUT_TIME > '2020-6-13 15:00:00'
  AND (t.SHOP_ID IN
       (
        11498, 11497, 176700, 176702, 11500, 11494, 176704, 326725, 176705, 176706, 176707, 11496, 11499, 176703, 11495,
        11493, 176701, 11501, 11502, 326726
           ) OR t.SHOP_ID IS NULL)
GROUP BY DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H:%i');

#外包仓在途反馈

SELECT DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H'), COUNT(*)
FROM t_wms_order_status t
WHERE t.INPUT_TIME > '2019-05-24 15:00'
  AND t.INPUT_TIME < '2019-05-24 22:00'
  AND (t.SHOP_ID IN
       (
        176700,
        176701,
        176702,
        176705
           ) OR t.SHOP_ID IS NULL)
GROUP BY DATE_FORMAT(t.INPUT_TIME, '%Y-%c-%d %H');


SELECT  * from t_wms_confirm_order where shop_id in(
11498, 11497, 176700, 176702, 11500, 11494, 176704, 326725, 176705, 176706, 176707, 11496, 11499, 176703, 11495,
        11493, 176701, 11501, 11502, 326726
    ) order by id DESC ;



SELECT
	DATE_FORMAT(
		t.ENTER_TIME,
		'%Y-%c-%d %H:%i'
	) 取消处理时间,
	COUNT(1)
FROM
     t_wf_workflow_task t,t_td_sales_order so

WHERE
      so.CREATE_TIME >= '2020-6-13 15:00:00'
  AND so.PLATFORM_ORDER_CODE_N = t.REF_SLIP_CODE
  AND t.CURRENT_NODE_NO =  13
GROUP BY
	DATE_FORMAT(
		t.ENTER_TIME,
		'%Y-%c-%d %H:%i'
	)
ORDER BY
DATE_FORMAT(
		t.ENTER_TIME,
		'%Y-%c-%d %H:%i'
	) desc;






SELECT
COUNT(s.PLATFORM_ORDER_CODE_N) count ,
n.`NAME`,n.NODE_NO,wh.SYSTEM_CODE,
case when IS_DIRECT_WMS_ORDER=0 then '非直连' else '直连' end as 'DIRECT',s.SPECIAL_TYPE
FROM
t_td_sales_order s FORCE INDEX(IDX_CREATE_TIME),
t_wf_workflow_task t,
t_wf_workflow_node n,
t_ma_tb_shop_info info,
t_ma_shop_wh wh
WHERE
s.OMS_ORDER_CODE = t.REF_SLIP_CODE
AND t.CURRENT_NODE_NO = n.NODE_NO
AND s.erp_shop_code = info.id
AND wh.WH_CODE = S.WAREHOUSE_CODE
AND wh.shop_id = s.erp_shop_code
AND date_add(t.enter_time,INTERVAL 30 MINUTE ) < SYSDATE()
-- AND t.enter_time<='2020-02-27 21:20'
AND s.CREATE_TIME >= '2020-06-13' -- AND S.PLATFORM_ORDER_CODE_N='635602339135704753'
AND t.CURRENT_NODE_NO IN (2, 3, 8, 15, 11, 12,13, 22, 24, 114) -- AND t.CURRENT_NODE_NO IN (114) -- 路由反馈
AND info.ID  IN (
'11494',
'11495',
'11496',
'11497',
'11498',
'11499',
'11500',
'11501',
'11502',
'176700',
'176701',
'176702',
'176703',
'176704',
'176705',
'176706',
'176707',
'326725',
'326726',
'326728',
'4062' )
AND n.WORKFLOW_ID = 1 -- AND s.TB_PAYMENT_TIME > DATE_SUB(SYSDATE(),INTERVAL 2 DAY)
GROUP BY n.`NAME`,wh.SYSTEM_CODE,DIRECT,s.SPECIAL_TYPE
order by count desc;


SELECT
	DATE_FORMAT(
		log.TRANSITION_TIME,
		'%Y-%c-%d %H'
	) 取消处理时间,
	COUNT(1)
FROM
     t_wf_workflow_task t,t_td_sales_order so,t_wf_workflow_task_log log

WHERE
      so.CREATE_TIME >= '2020-6-1 00:00:00'
    AND so.CREATE_TIME <= '2020-6-1 06:00:00'
  AND so.PLATFORM_ORDER_CODE_N = t.REF_SLIP_CODE
  AND log.TO_NODE_NO =  13
AND  log.TASK_ID = t.ID

GROUP BY
	DATE_FORMAT(
		log.TRANSITION_TIME,
		'%Y-%c-%d %H'
	)
ORDER BY
DATE_FORMAT(
		log.TRANSITION_TIME,
		'%Y-%c-%d %H'
	) desc;