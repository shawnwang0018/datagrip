
SELECT
        CONCAT(
                'UPDATE t_ma_tb_shop_info set IS_AUTO_APPOINTMENT = ',
                t.IS_AUTO_APPOINTMENT,
                ', APPOINTMENT_TIME = ',
                t.APPOINTMENT_TIME,
                ' WHERE id =',
                t.ID,
                ';'
        ) 脚本,
        t.id,
        t.IS_AUTO_APPOINTMENT,
        t.APPOINTMENT_TIME,
        t.SHOP_ID
FROM
        t_ma_tb_shop_info t
WHERE
        IS_AUTO_APPOINTMENT = 1
AND APPOINTMENT_TIME IS NOT NULL;


SELECT * from t_au_user limit 1;

SHOW CREATE TABLE t_au_user;