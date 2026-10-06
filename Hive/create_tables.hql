CREATE DATABASE IF NOT EXISTS retail_sales;
USE retail_sales;
DROP TABLE IF EXISTS retail_sales_raw;
CREATE EXTERNAL TABLE retail_sales_raw (
 transaction_id STRING, product_id STRING, product_name STRING, category STRING,
 sale_date STRING, region STRING, city STRING, quantity INT, unit_price DOUBLE,
 discount DOUBLE, sales_amount DOUBLE, customer_id STRING, channel STRING,
 payment_method STRING, status STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ','
STORED AS TEXTFILE LOCATION '/retailsalesdataset';
DROP TABLE IF EXISTS retail_sales_clean;
CREATE TABLE retail_sales_clean (
 transaction_id STRING, product_id STRING, product_name STRING, category STRING,
 sale_date DATE, region STRING, city STRING, quantity INT, unit_price DOUBLE,
 discount DOUBLE, sales_amount DOUBLE, customer_id STRING, channel STRING,
 payment_method STRING, status STRING) STORED AS ORC;
