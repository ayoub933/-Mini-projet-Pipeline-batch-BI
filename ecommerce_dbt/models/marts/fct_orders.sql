SELECT
    o.order_id,
    MIN(o.order_date) AS order_date,
    COUNT(oi.product_id) AS nb_products,
    SUM(oi.quantity) AS total_quantity,
    SUM(oi.total_price) AS total_price,
    o.customer_id,
    o.country
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_order_items') }} oi ON o.order_id = oi.order_id
GROUP BY o.order_id, o.customer_id, o.country
