# Project Workflow

## 1. HDFS
Upload the supplied `retail_sales_5kb.csv` into HDFS:

```bash
hdfs dfs -mkdir -p /retailsalesdataset
hdfs dfs -put retail_sales_5kb.csv /retailsalesdataset/
hdfs dfs -ls /retailsalesdataset
```

## 2. Hive
Create the raw external table and ORC clean table using `Hive/create_tables.hql`.

Then run `Hive/retail_analysis.hql` to obtain:
- transaction count
- product-wise quantity/revenue
- top 5 products
- region-wise quantity/revenue
- monthly revenue trend
- category performance
- order-status summary
- inventory insight

## 3. Pig
Run:

```bash
pig Pig/retail_sales.pig
pig Pig/analysis.pig
```

Pig performs filtering and GROUP BY/SUM aggregations for product, region, category and order status.

## 4. Results
The exact results from the supplied CSV are documented in `Results.md`.

## 5. Optimization
Use `Hive/optimization.hql` for examples of:
- ORC storage
- date partitioning
- bucketing by Product_ID
- projection and early filtering

## Screenshot Evidence
The project presentation/PDF supplied with the project contains terminal screenshots of the Hive/Pig execution. Add those screenshots to `Documentation/Screenshots/` if the final submission requires individual image files.
