{{ config(materialized='table') }}

-- Total par commande
WITH order_totals AS (
    SELECT
        o.order_id,
        o.customer_id,
        SUM(oi.quantity * oi.unit_price) AS total_price
    FROM {{ ref('stg_orders') }} o
    JOIN {{ ref('stg_order_items') }} oi ON o.order_id = oi.order_id
    GROUP BY o.order_id, o.customer_id
),

-- Total par client
customer_totals AS (
    SELECT
        customer_id,
        SUM(total_price) AS client_total
    FROM order_totals
    GROUP BY customer_id
)

-- KPI globaux
SELECT
    ROUND(SUM(order_totals.total_price) / COUNT(*), 2) AS ca_moyen_par_commande,
    ROUND(SUM(customer_totals.client_total) / COUNT(*), 2) AS ca_moyen_par_client
FROM order_totals
JOIN customer_totals ON order_totals.customer_id = customer_totals.customer_id
LIMIT 1
