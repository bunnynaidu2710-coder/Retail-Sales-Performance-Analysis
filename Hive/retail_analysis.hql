-- Retail Sales Analysis using Hive
USE retail_sales;

-- Remove the CSV header and standardize the date.
INSERT OVERWRITE TABLE retail_sales_clean
SELECT
    Transaction_ID,
    Product_ID,
    Product_Name,
    Category,
    CAST(Sale_Date AS DATE),
    Region,
    City,
    Quantity,
    Unit_Price,
    Discount_Percent,
    Revenue,
    Inventory_After_Sale,
    Sales_Channel,
    Payment_Method,
    Order_Status
FROM retail_sales_raw
WHERE Transaction_ID <> 'Transaction_ID'
  AND Quantity IS NOT NULL
  AND Revenue IS NOT NULL;

-- Basic record count.
SELECT COUNT(*) AS total_transactions
FROM retail_sales_clean;

-- Product-wise quantity and revenue.
SELECT
    Product_Name,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales_clean
GROUP BY Product_Name
ORDER BY total_revenue DESC;

-- Top 5 products by revenue.
SELECT
    Product_Name,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales_clean
GROUP BY Product_Name
ORDER BY total_revenue DESC
LIMIT 5;

-- Region-wise performance.
SELECT
    Region,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales_clean
GROUP BY Region
ORDER BY total_revenue DESC;

-- Monthly revenue trend.
SELECT
    YEAR(Sale_Date) AS sales_year,
    MONTH(Sale_Date) AS sales_month,
    COUNT(*) AS transactions,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales_clean
GROUP BY YEAR(Sale_Date), MONTH(Sale_Date)
ORDER BY sales_year, sales_month;

-- Category performance.
SELECT
    Category,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales_clean
GROUP BY Category
ORDER BY total_revenue DESC;

-- Order-status summary.
SELECT
    Order_Status,
    COUNT(*) AS transactions,
    SUM(Quantity) AS total_quantity,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM retail_sales_clean
GROUP BY Order_Status;

-- Inventory insight: products with low average remaining inventory.
SELECT
    Product_Name,
    ROUND(AVG(Inventory_After_Sale), 2) AS avg_inventory_after_sale,
    SUM(Quantity) AS total_quantity
FROM retail_sales_clean
GROUP BY Product_Name
ORDER BY avg_inventory_after_sale ASC;
