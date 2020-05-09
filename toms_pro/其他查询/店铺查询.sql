SELECT shop.SHOP_ID,
       shop.ID,
       shop.INNER_SHOP_CODE,
       shop.INTERFACE_SHOP_CODE,
       shop.IS_DIRECT_OMS ,
       shop.code,
       shop.*
FROM t_ma_tb_shop_info shop

WHERE shop.SHOP_ID LIKE  '%b+ab天猫旗舰店%';

SELECT *
FROM t_ma_shop_wh t
WHERE t.SHOP_ID = 521760;

SELECT * FROM t_sys_shop_db t WHERE  t.shops LIKE '%150000041%';

# 171714,201708,201709,171712,206707,206708,206709,206710,276716,336707,481758,506759,506758
# izzue天猫官方旗舰店 171714
# Camper天猫旗舰店 201708
# 5cm天猫旗舰店 201709
# aape微信小程序旗舰店
# it鞋品天猫旗舰店 171712
# 新chocoolate天猫官方旗舰店 206707
# 新fingercroxx天猫旗舰店 206708
# 新it天猫官方旗舰店 206709
# 新Aape天猫官方旗舰店 206710
# UNDER GARDEN天猫旗舰店 276716
# bab天猫旗舰店
# IT天猫店 336707
# carharttwip天猫旗舰店 481758
# aape微信小程序旗舰店
# BAPE天猫旗舰店 506759
# Undefeated天猫旗舰店 506758


5cm天猫旗舰店
izzue天猫官方旗舰店
b+ab天猫旗舰店
新chocoolate天猫官方旗舰店
UNDER GARDEN天猫旗舰店
新it天猫官方旗舰店
Camper天猫旗舰店
it鞋品天猫旗舰店
IT天猫店
新Aape天猫官方旗舰店
新fingercroxx天猫旗舰店
carharttwip天猫旗舰店
BAPE天猫旗舰店
Undefeated天猫旗舰店



