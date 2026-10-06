USE retail_sales;
DROP TABLE IF EXISTS retail_sales_partitioned;
CREATE TABLE retail_sales_partitioned (
 transaction_id STRING, product_id STRING, product_name STRING, category STRING,
 sale_date DATE, region STRING, city STRING, quantity INT, unit_price DOUBLE,
 discount DOUBLE, sales_amount DOUBLE, customer_id STRING, channel STRING,
 payment_method STRING, status STRING)
PARTITIONED BY (sales_year INT, sales_month INT) STORED AS ORC;

DROP TABLE IF EXISTS retail_sales_bucketed;
CREATE TABLE retail_sales_bucketed (
 transaction_id STRING, product_id STRING, product_name STRING, category STRING,
 sale_date DATE, region STRING, city STRING, quantity INT, unit_price DOUBLE,
 discount DOUBLE, sales_amount DOUBLE, customer_id STRING, channel STRING,
 payment_method STRING, status STRING)
CLUSTERED BY (product_id) INTO 8 BUCKETS STORED AS ORC;

-- Optimization concepts: ORC, date partitioning, bucketing, early filtering,
-- and selecting only required columns.
