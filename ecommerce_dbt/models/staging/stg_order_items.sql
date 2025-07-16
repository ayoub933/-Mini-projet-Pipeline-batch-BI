SELECT
    order_id,
    product_id,
    product_name,
    quantity,
    unit_price,
    quantity * unit_price AS total_price,
    CAST(order_date AS DATE) AS order_date
FROM {{ ref('orders') }}
