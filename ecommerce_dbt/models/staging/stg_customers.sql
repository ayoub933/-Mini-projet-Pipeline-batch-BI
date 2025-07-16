SELECT
    DISTINCT customer_id,
    country
FROM {{ ref('orders') }}
