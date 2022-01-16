# Spark - on Laptop

## macOS Setup

See https://medium.com/beeranddiapers/installing-apache-spark-on-mac-os-ce416007d79f

### Install Scala and Apache Spark

```
$ brew upgrade && brew update

$ java -version
openjdk version "11.0.12" 2021-07-20 LTS
OpenJDK Runtime Environment Zulu11.50+19-CA (build 11.0.12+7-LTS)
OpenJDK 64-Bit Server VM Zulu11.50+19-CA (build 11.0.12+7-LTS, mixed mode)

$ brew uninstall scala
$ brew uninstall apache-spark
$ brew cleanup

$ brew install scala
$ scala -version
Scala code runner version 2.13.8 -- Copyright 2002-2021, LAMP/EPFL and Lightbend, Inc.

$ brew install apache-spark
```

### Locate the new Installation 

```
$ ls -al /usr/local/Cellar/ | grep spark

$ which spark-shell
/usr/local/bin/spark-shell

$ which pyspark
/usr/local/bin/pyspark

$ ls -al /usr/local/bin/ | grep spark-shell
... spark-shell -> ../Cellar/apache-spark/3.2.0/bin/spark-shell

$ ls -al /usr/local/bin/ | grep pyspark
... pyspark -> ../Cellar/apache-spark/3.2.0/bin/pyspark
```

### Update Environment Variables

These values are based on the above locations:

```
export SPARK_HOME="/usr/local/Cellar/apache-spark/3.2.0/libexec"
export PYTHONPATH="/usr/local/Cellar/apache-spark/3.2.0/libexec/python/pyspark:/usr/local/Cellar/apache-spark/3.2.0/libexec/python:."
```

Open a new shell with new environment.

### Start a PySpark Shell

```
$ pyspark
Python 3.9.9 (main, Nov 21 2021, 03:23:44)
...
Welcome to
      ____              __
     / __/__  ___ _____/ /__
    _\ \/ _ \/ _ `/ __/  '_/
   /__ / .__/\_,_/_/ /_/\_\   version 3.2.0
      /_/

Using Python version 3.9.9 (main, Nov 21 2021 03:23:44)
Spark context Web UI available at http://192.168.86.201:4040
Spark context available as 'sc' (master = local[*], app id = local-1642367987438).
SparkSession available as 'spark'.

>>> infile = '/Users/cjoakim/Downloads/stores.csv'
>>> df = spark.read.csv(infile)
>>> df.printSchema()
root
 |-- _c0: string (nullable = true)
 |-- _c1: string (nullable = true)
 |-- _c2: string (nullable = true)
 |-- _c3: string (nullable = true)

>>> df = spark.read.options(header='True', inferSchema='True', delimiter=',').csv(infile)
>>> df.printSchema()
root
 |-- id: integer (nullable = true)
 |-- name: string (nullable = true)
 |-- address: string (nullable = true)
 |-- state: string (nullable = true)

>>> exit()
```

#### Examples

- https://www.tutorialkart.com/apache-spark/python-spark-shell-pyspark-example/

---
