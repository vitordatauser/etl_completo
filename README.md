# Pipeline ETL com Airflow - AWS

Este repositório contém o pipeline de dados ETL (Extract, Transform, Load) utilizando Apache Airflow na AWS.

## 📁 Estrutura do Projeto

```
etl_completo/
├── dags/                    # DAGs do Airflow
│   └── extract_data.py      # Exemplo de DAG
├── plugins/                 # Plugins customizados do Airflow
│   └── __init__.py
├── include/                 # Código compartilhado e reutilizável
│   ├── utils/              # Funções utilitárias
│   ├── operators/           # Operadores customizados
│   ├── hooks/               # Hooks customizados (conexões AWS, DB, etc)
│   └── sensors/            # Sensors customizados
├── scripts/                 # Scripts auxiliares (deploy, setup, etc)
├── sql/                     # Queries SQL reutilizáveis
│   ├── raw/                 # Queries para dados brutos
│   └── transformed/         # Queries para dados transformados
├── tests/                   # Testes automatizados
│   ├── unit/                # Testes unitários
│   └── integration/         # Testes de integração
├── config/                  # Arquivos de configuração
├── data/                    # Dados de exemplo/teste (não versionar dados reais)
│   ├── raw/                 # Dados brutos de exemplo
│   └── processed/           # Dados processados de exemplo
├── logs/                    # Logs locais (gitignored)
└── .github/workflows/       # CI/CD workflows

```

## 📂 Descrição das Pastas

### `dags/`
Contém todas as DAGs do Airflow. Cada arquivo Python representa uma ou mais DAGs que definem o fluxo de trabalho do pipeline.

### `plugins/`
Plugins customizados do Airflow que estendem a funcionalidade padrão (operadores, hooks, sensors, executors, etc).

### `include/`
Código Python compartilhado entre DAGs:
- **utils/**: Funções utilitárias (validação, formatação, logging, etc)
- **operators/**: Operadores customizados reutilizáveis
- **hooks/**: Hooks para conexões com serviços AWS (S3, Redshift, RDS, etc)
- **sensors/**: Sensors customizados para aguardar condições específicas

### `scripts/`
Scripts auxiliares para:
- Deploy para AWS (MWAA - Managed Workflows for Apache Airflow)
- Setup do ambiente local
- Migrações de banco de dados
- Utilitários de linha de comando

### `sql/`
Queries SQL organizadas por tipo:
- **raw/**: Queries para extração de dados brutos
- **transformed/**: Queries para transformação e agregação

### `tests/`
Testes automatizados:
- **unit/**: Testes unitários de funções e classes
- **integration/**: Testes de integração com serviços AWS

### `config/`
Arquivos de configuração (YAML, JSON, etc) para diferentes ambientes (dev, staging, prod).

### `data/`
Dados de exemplo para desenvolvimento e testes locais. **Não versionar dados sensíveis ou grandes volumes**.

### `logs/`
Logs gerados localmente (adicionado ao .gitignore).

## 🚀 Como Usar

### Setup Inicial

1. **Configure o ambiente virtual** (recomendado):
```bash
./scripts/setup_env.sh
```

Ou manualmente:
```bash
python3 -m venv venv
source venv/bin/activate  # Linux/Mac
pip install -r requirements.txt
```

2. **Ative o ambiente virtual** (sempre antes de trabalhar):
```bash
source venv/bin/activate
```

3. **Configure as variáveis de ambiente** (copie `.env.example` para `.env`)

4. **Execute o Airflow localmente** ou faça deploy para AWS MWAA

📖 **Para mais detalhes, consulte o guia completo:** [SETUP.md](SETUP.md)

## 📤 Conectando ao GitHub

Para conectar este repositório ao GitHub e fazer push das alterações, consulte o guia completo em [GITHUB_SETUP.md](GITHUB_SETUP.md).

**Resumo rápido:**
```bash
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/vitordatauser/etl_completo.git
git branch -M main
git push -u origin main
```

## 📝 Notas

- Mantenha as DAGs simples e delegue lógica complexa para módulos em `include/`
- Use `plugins/` para funcionalidades específicas do Airflow
- Organize SQL por tipo de operação (raw vs transformed)
- Escreva testes para código crítico em `tests/`
