SELECT
	t_s.RAS_CODE,t.*,t_s.*,d.RAS_ID
FROM
	t_td_return_application t,
	t_td_return_application_summary t_s,
	t_td_return_exchange_direct d
	
WHERE
	t.RAS_ID = t_s.ID
AND d.RAS_ID = t_s.ID
 AND t.RETURN_SKU_AMOUNT IS NULL
AND t_s.RAS_CODE LIKE "%EAS%"
AND t_s.RAS_TYPE = 1
-- AND t_s.CREATE_TIME >= '2018-8-14'
AND d.AUTO_CREATE_STATUS = 1;


SELECT
	*
FROM
	t_td_return_application t,
	t_td_return_application_summary t_s,
	t_td_return_exchange_direct d
WHERE
	t.RAS_ID = t_s.ID
AND d.RAS_ID = t_s.ID
-- AND t.RETURN_SKU_AMOUNT IS NULL
AND t_s.RAS_CODE LIKE "%EAS17097825"
AND t_s.RAS_TYPE = 1
AND t_s.CREATE_TIME >= '2018-8-14';