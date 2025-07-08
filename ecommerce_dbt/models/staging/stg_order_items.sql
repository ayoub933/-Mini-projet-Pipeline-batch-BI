SELECT
    order_id,
    product_id,
    product_name,
    quantity,
    unit_price,
    quantity * unit_price AS total_price,
    order_date::date AS order_date
FROM {{ source('raw', 'raw_orders') }}

