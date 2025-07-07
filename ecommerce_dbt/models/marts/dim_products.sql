-- models/marts/dim_products.sql

{{ config(materialized='view') }}

SELECT
    product_id not_null,
    product_category_name,
    product_name_lenght,
    product_description_lenght,
    product_photos_qty,
    product_weight_g,
    product_length_cm,
    product_height_cm,
    product_width_cm
FROM {{ ref('stg_products') }}
