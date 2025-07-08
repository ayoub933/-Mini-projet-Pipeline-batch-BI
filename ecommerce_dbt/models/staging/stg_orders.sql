SELECT
    DISTINCT order_id,
    customer_id,
    order_date::date AS order_date,
    country
FROM {{ source('raw', 'raw_orders') }}

