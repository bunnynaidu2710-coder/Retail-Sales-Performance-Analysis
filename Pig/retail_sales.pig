sales = LOAD '/retailsalesdataset/retail_sales_5kb.csv' USING PigStorage(',') AS (
transaction_id:chararray, product_id:chararray, product_name:chararray,
category:chararray, sale_date:chararray, region:chararray, city:chararray,
quantity:int, unit_price:double, discount:double, sales_amount:double,
customer_id:chararray, channel:chararray, payment_method:chararray, status:chararray);
clean_sales = FILTER sales BY product_name IS NOT NULL AND quantity IS NOT NULL AND sales_amount IS NOT NULL;
product_group = GROUP clean_sales BY product_name;
product_summary = FOREACH product_group GENERATE group AS product_name,
SUM(clean_sales.quantity) AS total_quantity, SUM(clean_sales.sales_amount) AS total_sales;
sorted_products = ORDER product_summary BY total_sales DESC;
top_products = LIMIT sorted_products 5;
DUMP top_products;
region_group = GROUP clean_sales BY region;
region_summary = FOREACH region_group GENERATE group AS region,
SUM(clean_sales.quantity) AS total_quantity, SUM(clean_sales.sales_amount) AS total_sales;
sorted_regions = ORDER region_summary BY total_sales DESC;
DUMP sorted_regions;
STORE product_summary INTO '/retailsalesdataset/pig_product_sales' USING PigStorage(',');
