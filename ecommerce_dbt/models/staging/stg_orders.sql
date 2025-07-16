SELECT
    DISTINCT order_id,
    customer_id,
    CAST(order_date AS DATE) AS order_date,
    country
FROM {{ ref('orders') }}
