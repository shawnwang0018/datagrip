SELECT * FROM t_td_return_exchange_direct t WHERE t.DISPUTE_ID = '61190755872805362';


select ras.* from t_td_return_application_line ral
                    JOIN t_td_return_application ra on ral.RA_ID = ra.ID
                    JOIN t_td_return_application_summary ras on ra.RAS_ID = ras.ID
                    where ras.ID = 33956799 ;


SELECT * FROM t_td_return_exchange_direct t ORDER BY  t.ID DESC  LIMIT  100;


select * from t_td_return_exchange_direct a
where a.biz_order_id in ('202009182046173436','202009151810046699','202009141345451405')



 SELECT
                t.ID, t.DISPUTE_ID, t.SHOP_ID, t.CREATE_TIME,t.BIZ_ORDER_ID,t.NEXT_EXEC_TIME,sysdate()
                FROM t_td_return_exchange_direct t
                WHERE
                t.OMS_STATUS = 0
                AND (t.STATUS = '换货待处理' OR t.STATUS = '待买家退货' OR t.STATUS = '买家已退货，待收货')
                AND (
                    (
                      t.AUTO_CREATE_STATUS = 0
                      AND (t.NEXT_EXEC_TIME <= SYSDATE() OR t.NEXT_EXEC_TIME IS NULL)
                    )
                    OR
                    ( t.AUTO_CREATE_STATUS = 2 AND t.ERROR_COUNT < 3 AND t.NEXT_EXEC_TIME <= SYSDATE())
                )
                ORDER BY t.CREATE_TIME LIMIT 1000;

