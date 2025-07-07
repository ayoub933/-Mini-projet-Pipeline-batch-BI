SELECT
    c.customer_id,
    c.customer_unique_id,
    c.customer_city,
    c.customer_state,
    COUNT(DISTINCT o.order_id) AS total_orders,
    MIN(o.order_date) AS first_order_date,
    MAX(o.order_date) AS last_order_date
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_orders') }} o ON c.customer_id = o.customer_id
GROUP BY 1, 2, 3, 4
