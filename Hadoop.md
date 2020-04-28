# Hadoop

## HDFS


## Spark

### Pyspark with user impersonation

```
PYTHONPATH=/usr/hdp/3.1.0.0-78/spark2/python/:/usr/hdp/3.1.0.0-78/spark2/python/lib/py4j-0.10.7-src.zip PYTHONSTARTUP=/usr/hdp/current/spark2-client/python/pyspark/shell.py PYSPARK_PYTHON=python3 PYSPARK_DRIVER_PYTHON=python3 SPARK_HOME=/usr/hdp/current/spark2-client/ HADOOP_CONF_DIR=/etc/hadoop/conf/   /usr/hdp/3.1.0.0-78/spark2//bin/spark-submit py^Cark-shell-main --name "PySparkShell"  --master yarn --deploy-mode client --proxy-user <user>
```

### Find user 

```
sqlContext._sc.sparkUser()
```