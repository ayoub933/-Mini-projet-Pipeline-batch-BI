-- models/staging/stg_products.sql

SELECT
    product_id,
    product_category_name,
    product_name_lenght,               -- 🟢 CORRECT (mal orthographié mais c'est comme ça dans la DB)
    product_description_lenght,        -- 🟢 CORRECT (pareil)
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM public.products
