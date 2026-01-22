"""
DAG de exemplo para extração de dados.
"""
from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.python import PythonOperator
from airflow.operators.bash import BashOperator

# Importar utilitários do módulo include
import sys
from pathlib import Path

# Adicionar o diretório include ao path
sys.path.append(str(Path(__file__).parent.parent / "include"))
from utils.logger import get_logger

logger = get_logger(__name__)

default_args = {
    'owner': 'data-engineering',
    'depends_on_past': False,
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

def extract_data():
    """Função de exemplo para extração de dados."""
    logger.info("Iniciando extração de dados...")
    # Adicione sua lógica de extração aqui
    logger.info("Extração concluída!")

with DAG(
    'extract_data',
    default_args=default_args,
    description='DAG de exemplo para extração de dados',
    schedule_interval=timedelta(days=1),
    start_date=datetime(2024, 1, 1),
    catchup=False,
    tags=['extract', 'etl'],
) as dag:
    
    extract_task = PythonOperator(
        task_id='extract_data',
        python_callable=extract_data,
    )
    
    validate_task = BashOperator(
        task_id='validate_data',
        bash_command='echo "Validando dados..."',
    )
    
    extract_task >> validate_task
