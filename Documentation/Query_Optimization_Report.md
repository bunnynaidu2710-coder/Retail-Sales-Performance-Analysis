# Query Optimization Report

- Use ORC for analytical Hive tables.
- Partition by year/month for frequent date filtering.
- Bucket by product_id for suitable repeated joins and product operations.
- Filter rows early.
- Select only required columns.
- Use LIMIT for top-N reports.
- Avoid global ORDER BY unless global ordering is required.
