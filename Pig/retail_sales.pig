-- Retail Sales Performance Analysis using Pig
-- Dataset columns match retail_sales_5kb.csv exactly.

raw_sales = LOAD '/retailsalesdataset/retail_sales_5kb.csv'
USING PigStorage(',')
AS (
    Transaction_ID:chararray,
    Product_ID:chararray,
    Product_Name:chararray,
    Category:chararray,
    Sale_Date:chararray,
    Region:chararray,
    City:chararray,
    Quantity:int,
    Unit_Price:double,
    Discount_Percent:double,
    Revenue:double,
    Inventory_After_Sale:int,
    Sales_Channel:chararray,
    Payment_Method:chararray,
    Order_Status:chararray
);

-- Remove CSV header and invalid rows.
clean_sales = FILTER raw_sales BY
    Transaction_ID != 'Transaction_ID'
    AND Product_Name IS NOT NULL
    AND Region IS NOT NULL
    AND Quantity IS NOT NULL
    AND Revenue IS NOT NULL;

-- Product-wise aggregation.
product_group = GROUP clean_sales BY Product_Name;

product_sales = FOREACH product_group GENERATE
    group AS Product_Name,
    SUM(clean_sales.Quantity) AS total_quantity,
    SUM(clean_sales.Revenue) AS total_revenue;

sorted_products = ORDER product_sales BY total_revenue DESC;

top_products = LIMIT sorted_products 5;

DUMP top_products;

-- Region-wise aggregation.
region_group = GROUP clean_sales BY Region;

region_sales = FOREACH region_group GENERATE
    group AS Region,
    SUM(clean_sales.Quantity) AS total_quantity,
    SUM(clean_sales.Revenue) AS total_revenue;

sorted_regions = ORDER region_sales BY total_revenue DESC;

DUMP sorted_regions;

-- Store reusable product results.
STORE product_sales INTO '/retailsalesdataset/pig_product_sales'
USING PigStorage(',');
