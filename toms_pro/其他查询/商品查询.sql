SELECT sku.id                                                   AS id,
       sku.`CODE`                                               AS code,
       sku.bar_code                                             AS barCode,
       sku.jm_code                                              AS jmCode,
       sku.supplier_code                                        AS supplierCode,
       sku.key_properties                                       AS keyProperties,
       sku.`NAME`                                               AS name,
       sku.color_name                                           AS colorName,
       sku.sku_size                                             AS skuSize,
       sku.EXT_CODE1                                               extensionCode1,
       sku.EXT_CODE2                                               extensionCode2,
       product.BRAND_NAME                                          brandName,
       product.SUPPLIER_NAME                                       supplierName,
       CASE product.IS_GIFT WHEN 0 THEN '否' WHEN 1 THEN '是' END AS isGift
FROM t_ma_inv_sku sku
         INNER JOIN t_ma_sku product ON product.id = sku.product_id
INNER JOIN t_ma_tb_shop_info shop ON shop.BUSINESS_REGION_TYPE = product.BUSINESS_REGION_TYPE AND shop.WH_CUSTOMER_CODE = product.WH_CUSTOMER_CODE
WHERE 1 = 1
--   AND sku.CODE LIKE '%5379219-650-7%'
AND shop.ID = 2042
ORDER BY id DESC
LIMIT 50;