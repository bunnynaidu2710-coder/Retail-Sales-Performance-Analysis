# Query Optimization Report

## 1. ORC Storage
The clean Hive table is stored as ORC to reduce storage and improve column-oriented scans.

## 2. Partitioning
The optimization example partitions data by sales year and month. Queries restricted to a particular period can scan only relevant partitions.

## 3. Bucketing
The optimization example creates 8 buckets using `Product_ID`, which can help repeated product-level joins and aggregations when the table is properly populated and bucket settings are enabled.

## 4. Early Filtering
The raw CSV header and null records are removed before aggregation. This reduces unnecessary processing.

## 5. Column Projection
Queries select only required columns rather than using `SELECT *`.

## 6. Aggregation Strategy
Product and region summaries use `GROUP BY` with `SUM`, matching the business questions in the project specification.

## 7. Practical Note
Partitioning and bucketing should be populated and benchmarked in the user's Hadoop/Hive environment before claiming measured performance improvements. This repository documents the optimization design rather than inventing execution-time benchmarks.
