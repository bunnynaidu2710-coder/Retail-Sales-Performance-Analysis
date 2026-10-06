# Execution Command Checklist

## HDFS

```bash
hdfs dfs -mkdir -p /retailsalesdataset
hdfs dfs -put retail_sales_5kb.csv /retailsalesdataset/
hdfs dfs -ls /retailsalesdataset
```

## Hive

```bash
hive -f Hive/create_tables.hql
hive -f Hive/retail_analysis.hql
```

## Pig

```bash
pig Pig/retail_sales.pig
pig Pig/analysis.pig
```

## HDFS output checks

```bash
hdfs dfs -ls /retailsalesdataset
hdfs dfs -ls /retailsalesdataset/pig_product_sales
hdfs dfs -ls /retailsalesdataset/pig_region_sales
```

Adjust local script paths if the commands are executed from inside the `Hive` or `Pig` directories.
