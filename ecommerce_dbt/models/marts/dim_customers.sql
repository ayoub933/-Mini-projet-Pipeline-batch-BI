SELECT
    c.customer_id,
    c.country,
    ROUND(COUNT(o.order_id) * 1.0 / COUNT(DISTINCT FORMAT_DATE('%A', o.order_date)), 2) AS moy_commandes_par_jour_semaine
FROM {{ ref('stg_customers') }} c
LEFT JOIN {{ ref('stg_orders') }} o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.country
