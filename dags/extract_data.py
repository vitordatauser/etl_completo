import os
from datetime import timedelta, datetime
from airflow.decorators import dag
from airflow.providers.amazon.aws.operators.emr import EmrAddStepsOperator
from airflow.providers.amazon.aws.sensors.emr import EmrStepSensor
from pathlib import Path
from dotenv import load_dotenv
import json

def load_config():
    load_dotenv()
    bucket = os.getenv("AWS_BUCKET")
    cluster_id = os.getenv("AWS_EMR_CLUSTER_ID") # add id do cluster aqui ou na variavel de ambiente
    return  cluster_id, bucket

def schema_list():
    path = str(Path(__file__).resolve().parent.parent.parent) + "/utils/config/db_tables.json"
    with open(path) as f:
        schemas = json.load(f)
    return schemas

def step_def(bucket, schema, table):
 
    #"--package-name", f"{schema}.{table}",
    step_def =  {
            "Name": f"SPARK import - {schema}.{table}",
            "ActionOnFailure": "CONTINUE",
            "HadoopJarStep": {
                "Jar": "command-runner.jar",
                "Args": [
                "spark-submit",
                "--deploy-mode", "cluster",
                "--master", "yarn",
                f"s3://{bucket}/scripts/etl/extracao/import_spark_mult.py",
                "--table", table,
                "--schema", schema,
                "--bucket", bucket
                ]
            }
        }
    return step_def

@dag(
    dag_id='spark_extract_data',
    default_args={
        'owner': 'data-team',
        'depends_on_past': False,
        'start_date': datetime(2025, 12, 12),
        'email_on_failure': False,
        'email_on_retry': False,
        'retries': 1,
        'retry_delay': timedelta(minutes=5),
    },
    description='Bronze layer: Sqoop import from MySQL to S3',
    schedule_interval="15 0 * * *",
    catchup=False,
    tags=['bronze', 'sqoop', 'emr', 's3'],
)

def dynamic_sqoop_import_table():

    schemas = schema_list()
    cluster_id, bucket = load_config()

    for schema in schemas["schemas"]:
    
        for table in schema["tabelas"]:

            step = step_def(bucket, schema['nome'], table) # Função que retorna os comandos para o EMR 
            # Task para adicionar etapa ao EMR
            add_step_task = EmrAddStepsOperator(
                task_id=f"add_step_{schema['nome']}_{table}",
                job_flow_id=cluster_id,
                aws_conn_id="aws_default",
                steps=[step],
            )
            """# Task para aguardar conclusão do etapa
            step_sensor = EmrStepSensor(
                task_id=f"watch_step_{client['nome']}_{schema['nome']}_{table}",
                job_flow_id=cluster_id,
                step_id="{{ task_instance.xcom_pull(task_ids='add_step_"+ schema['nome'] + "_" + table + "', key='return_value')[0] }}",
                aws_conn_id="aws_default",
                poke_interval=30,
                timeout=3600, 
            )"""

# Instanciar o DAG
dag_instance = dynamic_sqoop_import_table()