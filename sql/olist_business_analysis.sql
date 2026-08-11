-- ============================================================
-- OLIST E-COMMERCE BUSINESS ANALYSIS
-- SQL BUSINESS ANALYSIS FOR PORTFOLIO
-- ============================================================


-- ============================================================
-- 01. OVERALL BUSINESS PERFORMANCE
-- Business Question:
-- What is the overall business performance?
-- ============================================================

SELECT
    SUM(oi.price) AS total_sales,
    COUNT(DISTINCT o.order_id) AS total_orders,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id;


-- ============================================================
-- 02. MONTHLY SALES TREND
-- Business Question:
-- How did sales performance change over time?
-- ============================================================

SELECT
    DATE_TRUNC('month', o.order_purchase_timestamp) AS month,
    SUM(oi.price) AS total_sales,
    COUNT(DISTINCT o.order_id) AS total_orders,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT o.order_id),
        2
    ) AS average_order_value
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY 1
ORDER BY 1;


-- ============================================================
-- 03. PRODUCT CATEGORY PERFORMANCE
-- Business Question:
-- Which product categories generate the most revenue?
-- ============================================================

SELECT
    COALESCE(
        p.product_category_name,
        'Unknown'
    ) AS product_category,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.price) AS total_sales,
    ROUND(
        AVG(oi.price),
        2
    ) AS average_item_price
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY 1
ORDER BY total_sales DESC;


-- ============================================================
-- 04. TOP PRODUCTS BY SALES
-- Business Question:
-- Which individual products generate the highest sales?
-- ============================================================

SELECT
    oi.product_id,
    p.product_category_name,
    COUNT(*) AS units_sold,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    SUM(oi.price) AS total_sales
FROM order_items oi
JOIN products p
    ON oi.product_id = p.product_id
GROUP BY
    oi.product_id,
    p.product_category_name
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================
-- 05. CUSTOMER GEOGRAPHIC DISTRIBUTION
-- Business Question:
-- Which states have the largest customer base and sales?
-- ============================================================

SELECT
    c.customer_state,
    COUNT(DISTINCT c.customer_unique_id) AS total_customers,
    COUNT(DISTINCT o.order_id) AS total_orders,
    SUM(oi.price) AS total_sales
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_state
ORDER BY total_sales DESC;


-- ============================================================
-- 06A. DELIVERY PERFORMANCE
-- Business Question:
-- How well does the company meet estimated delivery dates?
-- ============================================================

SELECT
    CASE
        WHEN order_delivered_customer_date IS NULL
            THEN 'Not Delivered'

        WHEN order_delivered_customer_date
             <= order_estimated_delivery_date
            THEN 'On Time'

        ELSE 'Late'
    END AS delivery_status,
    COUNT(*) AS total_orders
FROM orders
GROUP BY 1
ORDER BY total_orders DESC;


-- ============================================================
-- 06B. DELIVERY PERFORMANCE PERCENTAGE
-- ============================================================

SELECT
    ROUND(
        100.0 * SUM(
            CASE
                WHEN order_delivered_customer_date
                     <= order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS on_time_delivery_percentage,

    ROUND(
        100.0 * SUM(
            CASE
                WHEN order_delivered_customer_date
                     > order_estimated_delivery_date
                THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS late_delivery_percentage

FROM orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_estimated_delivery_date IS NOT NULL;


-- ============================================================
-- 07. PAYMENT METHOD ANALYSIS
-- Business Question:
-- Which payment methods are most commonly used?
-- ============================================================

SELECT
    payment_type,
    COUNT(DISTINCT order_id) AS total_orders,
    SUM(payment_value) AS total_payment_value,
    ROUND(
        AVG(payment_value),
        2
    ) AS average_payment_value
FROM payments
GROUP BY payment_type
ORDER BY total_payment_value DESC;


-- ============================================================
-- 08. SELLER PERFORMANCE
-- Business Question:
-- Which sellers generate the highest sales?
-- ============================================================

SELECT
    oi.seller_id,
    s.seller_state,
    COUNT(DISTINCT oi.order_id) AS total_orders,
    COUNT(*) AS units_sold,
    SUM(oi.price) AS total_sales,
    ROUND(
        SUM(oi.price) / COUNT(DISTINCT oi.order_id),
        2
    ) AS average_order_value
FROM order_items oi
JOIN sellers s
    ON oi.seller_id = s.seller_id
GROUP BY
    oi.seller_id,
    s.seller_state
ORDER BY total_sales DESC
LIMIT 10;


-- ============================================================
-- 09A. CUSTOMER SATISFACTION DISTRIBUTION
-- Business Question:
-- How satisfied are customers based on review scores?
-- ============================================================

SELECT
    review_score,
    COUNT(*) AS total_reviews,
    ROUND(
        100.0 * COUNT(*)
        / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_reviews
FROM reviews
GROUP BY review_score
ORDER BY review_score;


-- ============================================================
-- 09B. AVERAGE CUSTOMER REVIEW SCORE
-- ============================================================

SELECT
    ROUND(
        AVG(review_score),
        2
    ) AS average_review_score
FROM reviews;


-- ============================================================
-- 10. CATEGORY SALES VS CUSTOMER SATISFACTION
-- Business Question:
-- Do high-sales categories also have good customer satisfaction?
-- ============================================================

SELECT
    p.product_category_name,

    SUM(oi.price) AS total_sales,

    COUNT(DISTINCT oi.order_id) AS total_orders,

    COUNT(r.review_id) AS total_reviews,

    ROUND(
        AVG(r.review_score),
        2
    ) AS average_review_score

FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

JOIN reviews r
    ON oi.order_id = r.order_id

GROUP BY
    p.product_category_name

HAVING COUNT(r.review_id) >= 50

ORDER BY total_sales DESC;