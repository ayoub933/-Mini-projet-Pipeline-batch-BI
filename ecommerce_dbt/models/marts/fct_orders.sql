SELECT
    o.order_id,
    o.customer_id,
    o.order_status,
    o.order_date,
    o.order_approved_at,
    o.order_delivered_carrier_date,
    o.order_delivered_customer_date,
    o.order_estimated_delivery_date,
    -- ✅ Correction ici : différence en jours avec le cast
    (o.order_delivered_customer_date::date - o.order_date::date) AS delivery_delay,
    
    -- ✅ Cette ligne est correcte
    MIN(o.order_date) OVER (PARTITION BY o.customer_id) AS first_order
FROM {{ ref('stg_orders') }} o
