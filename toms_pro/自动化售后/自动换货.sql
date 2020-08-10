SELECT * FROM t_td_return_exchange_direct t WHERE t.DISPUTE_ID = '61190755872805362';


select ras.* from t_td_return_application_line ral
                    JOIN t_td_return_application ra on ral.RA_ID = ra.ID
                    JOIN t_td_return_application_summary ras on ra.RAS_ID = ras.ID
                    where ras.ID = 33956799 ;