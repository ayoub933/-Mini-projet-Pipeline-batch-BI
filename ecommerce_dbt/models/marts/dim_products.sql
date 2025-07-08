SELECT
    DISTINCT product_id,
    product_name
FROM {{ ref('stg_order_items') }}
