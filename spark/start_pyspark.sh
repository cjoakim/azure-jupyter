#!/bin/bash

# Start a PySpark shell after setting PYTHONPATH for Spark.
# Chris Joakim, Microsoft, January 2022

export PYTHONPATH="/usr/local/Cellar/apache-spark/3.2.0/libexec/python/pyspark:/usr/local/Cellar/apache-spark/3.2.0/libexec/python:."

pyspark
