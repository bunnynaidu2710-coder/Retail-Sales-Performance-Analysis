USE retail_sales;
INSERT OVERWRITE TABLE retail_sales_clean
SELECT transaction_id, product_id, product_name, category, CAST(sale_date AS DATE),
 region, city, quantity, unit_price, discount, sales_amount, customer_id, channel,
 payment_method, status FROM retail_sales_raw
WHERE transaction_id IS NOT NULL AND product_name IS NOT NULL
AND quantity IS NOT NULL AND sales_amount IS NOT NULL;

SELECT product_name, SUM(quantity) AS total_quantity, SUM(sales_amount) AS total_sales
FROM retail_sales_clean GROUP BY product_name ORDER BY total_sales DESC;

SELECT region, SUM(quantity) AS total_quantity, SUM(sales_amount) AS total_sales
FROM retail_sales_clean GROUP BY region ORDER BY total_sales DESC;

SELECT YEAR(sale_date) AS sales_year, MONTH(sale_date) AS sales_month,
SUM(sales_amount) AS monthly_revenue FROM retail_sales_clean
GROUP BY YEAR(sale_date), MONTH(sale_date) ORDER BY sales_year, sales_month;

SELECT product_name, SUM(quantity) AS total_quantity, SUM(sales_amount) AS total_sales
FROM retail_sales_clean GROUP BY product_name ORDER BY total_sales DESC LIMIT 5;
