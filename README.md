# Retail Sales Performance Analysis

## Project Title
**Retail Sales Data Processing and Business Intelligence Platform**

## Objective
Process a retail sales dataset using Hadoop HDFS, Apache Hive and Apache Pig to identify top-selling products, regional performance, revenue trends and inventory-related insights.

## Actual Dataset
The project uses the supplied `retail_sales_5kb.csv`.

- Records: **80**
- Columns: **15**
- Date range: **2025-01-04 to 2025-12-26**
- Total quantity: **362**
- Total revenue: **67,065.65**
- Completed orders: **61**
- Returned orders: **19**

## Dataset Columns

`Transaction_ID, Product_ID, Product_Name, Category, Sale_Date, Region, City, Quantity, Unit_Price, Discount_Percent, Revenue, Inventory_After_Sale, Sales_Channel, Payment_Method, Order_Status`

## Workflow

```text
retail_sales_5kb.csv
        |
        v
      HDFS
        |
        v
      Hive
  Raw + Clean Tables
        |
        v
       Pig
 Cleaning + Aggregation
        |
        +------------------+
        |                  |
        v                  v
 Product Analysis     Region Analysis
        |                  |
        +--------+---------+
                 |
                 v
          Business Insights
```

## Repository Structure

```text
Dataset/
  retail_sales_5kb.csv
  README.md

Hive/
  create_tables.hql
  retail_analysis.hql
  optimization.hql

Pig/
  retail_sales.pig
  analysis.pig

Documentation/
  Project_Workflow.md
  Results.md
  Query_Optimization_Report.md
  Business_Recommendations.md
  Screenshots/
```

## Execution Order

1. Start Hadoop/HDFS and YARN.
2. Upload `retail_sales_5kb.csv` to HDFS under `/retailsalesdataset/`.
3. Run `Hive/create_tables.hql`.
4. Run `Hive/retail_analysis.hql`.
5. Run `Pig/retail_sales.pig`.
6. Run `Pig/analysis.pig`.
7. Review the product, region and monthly results.
8. Apply the optimization examples in `Hive/optimization.hql`.

> The SQL/Pig scripts in this repository are aligned to the supplied CSV column names and the analysis outputs obtained from that dataset. They are organized for reproducibility.
