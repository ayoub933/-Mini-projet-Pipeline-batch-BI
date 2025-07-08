SELECT
    order_id,
    product_id,
    SUM(quantity) AS total_quantity,
    SUM(total_price) AS total_price,
    MIN(order_date) AS order_date
FROM {{ ref('stg_order_items') }}
GROUP BY order_id, product_id
