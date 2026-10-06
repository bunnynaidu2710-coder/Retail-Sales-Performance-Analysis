# Retail Sales Performance Analysis

## Project Title
**Retail Sales Data Processing and Business Intelligence Platform**

## Objective
Process retail sales data using Hadoop HDFS, Apache Hive, and Apache Pig to identify top-selling products, regional performance, revenue trends, and inventory insights.

## Technology Stack
Hadoop HDFS, Apache Hive, Apache Pig, MapReduce/YARN, Python/Matplotlib, Ubuntu.

## Workflow
Retail CSV -> HDFS -> Hive warehouse -> Pig transformation -> Product/Region aggregation -> Business analysis -> Optimization -> Reporting

## Expected Dataset
`retail_sales_5kb.csv`

Schema: `transaction_id, product_id, product_name, category, date, region, city, quantity, unit_price, discount, sales_amount, customer_id, channel, payment_method, status`

> The complete original CSV was not available in the supplied project materials. The HQL/Pig scripts are cleaned/reconstructed from the project specification and available execution/report evidence.

## Repository Structure
- `Dataset/` - dataset documentation
- `Hive/` - Hive scripts
- `Pig/` - Pig scripts
- `Documentation/` - workflow, results, optimization and recommendations
