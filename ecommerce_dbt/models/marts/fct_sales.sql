{{ config(materialized='table') }}

SELECT
    oi.order_id,
    oi.product_id,
    p.product_name,
    o.customer_id,
    o.country,
    o.order_date,
    FORMAT_DATE('%A', o.order_date) AS jour_semaine,
    oi.quantity,
    oi.unit_price,
    (oi.quantity * oi.unit_price) AS total_price,
    oi.quantity AS total_quantity
FROM {{ ref('stg_order_items') }} oi
JOIN {{ ref('stg_orders') }} o ON oi.order_id = o.order_id
JOIN {{ ref('stg_products') }} p ON oi.product_id = p.product_id
