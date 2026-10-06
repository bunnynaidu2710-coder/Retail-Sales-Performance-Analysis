-- Additional Pig analytics for the supplied retail dataset.

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

clean_sales = FILTER raw_sales BY
    Transaction_ID != 'Transaction_ID'
    AND Quantity IS NOT NULL
    AND Revenue IS NOT NULL;

-- Region analysis.
region_group = GROUP clean_sales BY Region;

region_data = FOREACH region_group GENERATE
    group AS Region,
    SUM(clean_sales.Quantity) AS total_quantity,
    SUM(clean_sales.Revenue) AS total_revenue;

DUMP region_data;

STORE region_data INTO '/retailsalesdataset/pig_region_sales'
USING PigStorage(',');

-- Category analysis.
category_group = GROUP clean_sales BY Category;

category_data = FOREACH category_group GENERATE
    group AS Category,
    SUM(clean_sales.Quantity) AS total_quantity,
    SUM(clean_sales.Revenue) AS total_revenue;

DUMP category_data;

-- Order status analysis.
status_group = GROUP clean_sales BY Order_Status;

status_data = FOREACH status_group GENERATE
    group AS Order_Status,
    COUNT(clean_sales) AS transactions,
    SUM(clean_sales.Quantity) AS total_quantity,
    SUM(clean_sales.Revenue) AS total_revenue;

DUMP status_data;
