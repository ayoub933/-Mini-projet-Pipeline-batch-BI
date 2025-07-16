WITH products_ranked AS (
    SELECT
        product_id,
        product_name,
        ROW_NUMBER() OVER (PARTITION BY product_id ORDER BY product_name) AS rn
    FROM {{ ref('stg_order_items') }}
    WHERE product_id IS NOT NULL
)

SELECT
    product_id,
    product_name
FROM products_ranked
WHERE rn = 1
