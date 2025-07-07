WITH order_items AS (
    SELECT
        order_id,
        product_id,
        price,
        quantity,
        price * quantity AS total_price
    FROM {{ ref('order_items') }}
),

orders AS (
    SELECT
        order_id,
        customer_id,
        order_date
    FROM {{ ref('stg_orders') }}
)

SELECT
    oi.order_id,
    o.customer_id,
    o.order_date,
    oi.product_id,
    oi.price,
    oi.quantity,
    oi.total_price
FROM order_items oi
LEFT JOIN orders o ON o.order_id = oi.order_id
