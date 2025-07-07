SELECT
    so.order_id,
    so.product_id,
    so.total_price,
    so.quantity,
    so.price,
    o.order_date,
    o.customer_id
FROM {{ ref('stg_order_items') }} so
LEFT JOIN {{ ref('stg_orders') }} o ON o.order_id = so.order_id
