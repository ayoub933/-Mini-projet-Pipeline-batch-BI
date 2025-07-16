SELECT DISTINCT
    product_id,
    product_name
FROM {{ ref('orders') }}
WHERE product_id IS NOT NULL
