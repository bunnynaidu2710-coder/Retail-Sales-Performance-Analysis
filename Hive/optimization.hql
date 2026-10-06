-- Query Optimization Examples
USE retail_sales;

-- Partition by year and month for time-based queries.
DROP TABLE IF EXISTS retail_sales_partitioned;

CREATE TABLE retail_sales_partitioned (
    Transaction_ID STRING,
    Product_ID STRING,
    Product_Name STRING,
    Category STRING,
    Sale_Date DATE,
    Region STRING,
    City STRING,
    Quantity INT,
    Unit_Price DOUBLE,
    Discount_Percent DOUBLE,
    Revenue DOUBLE,
    Inventory_After_Sale INT,
    Sales_Channel STRING,
    Payment_Method STRING,
    Order_Status STRING
)
PARTITIONED BY (sales_year INT, sales_month INT)
STORED AS ORC;

-- Example population command:
-- INSERT INTO retail_sales_partitioned PARTITION (sales_year, sales_month)
-- SELECT Transaction_ID, Product_ID, Product_Name, Category, Sale_Date,
--        Region, City, Quantity, Unit_Price, Discount_Percent, Revenue,
--        Inventory_After_Sale, Sales_Channel, Payment_Method, Order_Status,
--        YEAR(Sale_Date), MONTH(Sale_Date)
-- FROM retail_sales_clean;

-- Bucket by Product_ID for repeated product-level joins/analysis.
DROP TABLE IF EXISTS retail_sales_bucketed;

CREATE TABLE retail_sales_bucketed (
    Transaction_ID STRING,
    Product_ID STRING,
    Product_Name STRING,
    Category STRING,
    Sale_Date DATE,
    Region STRING,
    City STRING,
    Quantity INT,
    Unit_Price DOUBLE,
    Discount_Percent DOUBLE,
    Revenue DOUBLE,
    Inventory_After_Sale INT,
    Sales_Channel STRING,
    Payment_Method STRING,
    Order_Status STRING
)
CLUSTERED BY (Product_ID) INTO 8 BUCKETS
STORED AS ORC;

-- Optimization practices:
-- 1. Use ORC for columnar storage.
-- 2. Partition on frequently filtered date dimensions.
-- 3. Bucket on frequently joined/grouped identifiers.
-- 4. Select only required columns instead of SELECT *.
-- 5. Filter early to reduce records processed.
