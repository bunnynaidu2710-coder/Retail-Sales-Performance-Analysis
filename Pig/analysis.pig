sales = LOAD '/retailsalesdataset/retail_sales_5kb.csv' USING PigStorage(',') AS (
transaction_id:chararray, product_id:chararray, product_name:chararray,
category:chararray, sale_date:chararray, region:chararray, city:chararray,
quantity:int, unit_price:double, discount:double, sales_amount:double,
customer_id:chararray, channel:chararray, payment_method:chararray, status:chararray);
clean_sales = FILTER sales BY product_name IS NOT NULL AND region IS NOT NULL
AND quantity IS NOT NULL AND sales_amount IS NOT NULL;
products = GROUP clean_sales BY product_name;
product_summary = FOREACH products GENERATE group AS product_name,
SUM(clean_sales.quantity) AS total_quantity, SUM(clean_sales.sales_amount) AS total_sales;
regions = GROUP clean_sales BY region;
region_summary = FOREACH regions GENERATE group AS region,
SUM(clean_sales.quantity) AS total_quantity, SUM(clean_sales.sales_amount) AS total_sales;
DUMP product_summary;
DUMP region_summary;
STORE region_summary INTO '/retailsalesdataset/pig_region_sales' USING PigStorage(',');
