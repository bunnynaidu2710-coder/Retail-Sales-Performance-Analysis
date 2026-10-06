-- Retail Sales Performance Analysis
-- Hive schema and table creation
-- Expected HDFS directory: /retailsalesdataset/
-- Place retail_sales_5kb.csv in that directory before querying.

CREATE DATABASE IF NOT EXISTS retail_sales;
USE retail_sales;

DROP TABLE IF EXISTS retail_sales_raw;

CREATE EXTERNAL TABLE retail_sales_raw (
    Transaction_ID STRING,
    Product_ID STRING,
    Product_Name STRING,
    Category STRING,
    Sale_Date STRING,
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
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION '/retailsalesdataset/';

DROP TABLE IF EXISTS retail_sales_clean;

CREATE TABLE retail_sales_clean (
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
STORED AS ORC;
