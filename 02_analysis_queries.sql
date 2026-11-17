-- 1. Executive KPI summary
SELECT
    ROUND(SUM(sales), 2) AS total_revenue,
    ROUND(SUM(profit), 2) AS total_profit,
    ROUND(100.0 * SUM(profit) / NULLIF(SUM(sales), 0), 2) AS profit_margin_pct,
    COUNT(DISTINCT order_id) AS total_orders,
    COUNT(DISTINCT customer_id) AS unique_customers,
    ROUND(SUM(sales) / NULLIF(COUNT(DISTINCT order_id), 0), 2) AS average_order_value
FROM public.sales;

-- 2. Monthly sales and profit trend
SELECT DATE_TRUNC('month', order_date)::date AS month,
       ROUND(SUM(sales),2) AS revenue,
       ROUND(SUM(profit),2) AS profit
FROM public.sales
GROUP BY 1 ORDER BY 1;

-- 3. Top 10 products by revenue
SELECT product_name, category,
       ROUND(SUM(sales),2) AS revenue,
       ROUND(SUM(profit),2) AS profit,
       SUM(quantity) AS units_sold
FROM public.sales
GROUP BY product_name, category
ORDER BY revenue DESC
LIMIT 10;

-- 4. Lowest-margin products (inspect volume before making decisions)
SELECT product_name, category,
       ROUND(SUM(sales),2) AS revenue,
       ROUND(SUM(profit),2) AS profit,
       ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM public.sales
GROUP BY product_name, category
HAVING SUM(sales) > 0
ORDER BY margin_pct ASC
LIMIT 10;

-- 5. Regional performance
SELECT region, state,
       ROUND(SUM(sales),2) AS revenue,
       ROUND(SUM(profit),2) AS profit,
       ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) AS margin_pct,
       COUNT(DISTINCT order_id) AS orders
FROM public.sales
GROUP BY region, state
ORDER BY revenue DESC;

-- 6. Category contribution
SELECT category,
       ROUND(SUM(sales),2) AS revenue,
       ROUND(100.0*SUM(sales)/SUM(SUM(sales)) OVER (),2) AS revenue_share_pct,
       ROUND(SUM(profit),2) AS profit
FROM public.sales
GROUP BY category ORDER BY revenue DESC;

-- 7. Discount bands and profitability
SELECT CASE
         WHEN discount_pct = 0 THEN 'No discount'
         WHEN discount_pct <= 0.10 THEN '1-10%'
         WHEN discount_pct <= 0.20 THEN '11-20%'
         ELSE 'Above 20%'
       END AS discount_band,
       COUNT(*) AS transaction_rows,
       ROUND(SUM(sales),2) AS revenue,
       ROUND(SUM(profit),2) AS profit,
       ROUND(100.0*SUM(profit)/NULLIF(SUM(sales),0),2) AS margin_pct
FROM public.sales
GROUP BY 1
ORDER BY MIN(discount_pct);

-- 8. Customer repeat rate
WITH customer_orders AS (
    SELECT customer_id, COUNT(DISTINCT order_id) AS order_count
    FROM public.sales GROUP BY customer_id
)
SELECT COUNT(*) AS customers,
       COUNT(*) FILTER (WHERE order_count > 1) AS repeat_customers,
       ROUND(100.0 * COUNT(*) FILTER (WHERE order_count > 1) / NULLIF(COUNT(*),0),2)
           AS repeat_customer_rate_pct
FROM customer_orders;

-- 9. Year-over-year revenue growth
WITH yearly AS (
    SELECT EXTRACT(YEAR FROM order_date)::int AS year, SUM(sales) AS revenue
    FROM public.sales GROUP BY 1
)
SELECT year, ROUND(revenue,2) AS revenue,
       ROUND(100.0*(revenue-LAG(revenue) OVER (ORDER BY year))
             / NULLIF(LAG(revenue) OVER (ORDER BY year),0),2) AS yoy_growth_pct
FROM yearly ORDER BY year;

-- 10. Data quality checks
SELECT
    COUNT(*) AS row_count,
    COUNT(*) FILTER (WHERE order_date IS NULL) AS missing_order_dates,
    COUNT(*) FILTER (WHERE sales < 0) AS negative_sales_rows,
    COUNT(*) FILTER (WHERE quantity <= 0) AS invalid_quantity_rows,
    COUNT(*) FILTER (WHERE ABS((sales + unit_price*quantity*discount_pct) -
                              unit_price*quantity) > 1.00) AS sales_math_check
FROM public.sales;
