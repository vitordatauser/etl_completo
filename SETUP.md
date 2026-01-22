# 🚀 Guia de Setup do Ambiente Local

Este guia explica como configurar o ambiente de desenvolvimento local para trabalhar com o projeto ETL.

## 📋 Pré-requisitos

- **Python 3.8+** instalado
- **pip** (geralmente vem com Python)
- **Git** (para clonar o repositório)

### Verificar instalações

```bash
python3 --version  # Deve mostrar Python 3.8 ou superior
pip3 --version      # Deve mostrar a versão do pip
git --version       # Deve mostrar a versão do git
```

## 🐍 Opção 1: Setup Automático (Recomendado)

Use o script de setup que automatiza todo o processo:

```bash
cd /home/victor/etl_completo
chmod +x scripts/setup_env.sh
./scripts/setup_env.sh
```

O script irá:
1. ✅ Verificar se Python está instalado
2. ✅ Criar o ambiente virtual (`venv/`)
3. ✅ Atualizar pip, setuptools e wheel
4. ✅ Instalar todas as dependências do `requirements.txt`

## 🐍 Opção 2: Setup Manual

### 1. Criar ambiente virtual

```bash
cd /home/victor/etl_completo
python3 -m venv venv
```

### 2. Ativar ambiente virtual

**Linux/Mac:**
```bash
source venv/bin/activate
```

**Windows:**
```bash
venv\Scripts\activate
```

Você verá `(venv)` no início do prompt quando o ambiente estiver ativado.

### 3. Atualizar pip

```bash
pip install --upgrade pip setuptools wheel
```

### 4. Instalar dependências

```bash
pip install -r requirements.txt
```

## ✅ Verificar Instalação

Após a instalação, verifique se tudo está funcionando:

```bash
# Verificar versões instaladas
python --version
pip list

# Testar importação do Airflow
python -c "import airflow; print(airflow.__version__)"
```

## 🔄 Usar o Ambiente Virtual

### Ativar o ambiente

**Linux/Mac:**
```bash
source venv/bin/activate
```

**Ou use o script:**
```bash
source scripts/activate.sh
```

### Desativar o ambiente

```bash
deactivate
```

## 📦 Gerenciar Dependências

### Adicionar nova dependência

1. Ative o ambiente virtual
2. Instale a dependência:
   ```bash
   pip install nome-do-pacote
   ```
3. Atualize o `requirements.txt`:
   ```bash
   pip freeze > requirements.txt
   ```

### Atualizar dependências

```bash
pip install --upgrade -r requirements.txt
```

### Ver dependências instaladas

```bash
pip list
```

## 🧪 Testar o Ambiente

### Testar importações principais

```bash
python -c "import airflow; import boto3; import pandas; print('✅ Todas as dependências OK!')"
```

### Executar testes (quando disponíveis)

```bash
pytest tests/
```

## 🐛 Solução de Problemas

### Erro: "python3: command not found"

**Linux:**
```bash
sudo apt-get update
sudo apt-get install python3 python3-pip python3-venv
```

**Mac:**
```bash
brew install python3
```

### Erro: "No module named 'venv'"

Instale o módulo venv:
```bash
sudo apt-get install python3-venv  # Linux
```

### Ambiente virtual não ativa

Certifique-se de estar no diretório correto e use o caminho completo:
```bash
source /home/victor/etl_completo/venv/bin/activate
```

### Limpar e recriar ambiente

Se algo der errado, você pode recriar o ambiente:

```bash
# Desativar ambiente (se estiver ativo)
deactivate

# Remover ambiente antigo
rm -rf venv/

# Recriar
./scripts/setup_env.sh
```

## 📝 Estrutura do Ambiente

Após o setup, sua estrutura ficará assim:

```
etl_completo/
├── venv/              # Ambiente virtual (não versionado)
│   ├── bin/           # Scripts executáveis
│   ├── lib/           # Bibliotecas Python
│   └── ...
├── requirements.txt    # Dependências do projeto
└── ...
```

## 🎯 Próximos Passos

Após configurar o ambiente:

1. ✅ Configure variáveis de ambiente (crie `.env` baseado em `.env.example`)
2. ✅ Teste as DAGs localmente
3. ✅ Desenvolva novos scripts
4. ✅ Execute testes

## 💡 Dicas

- **Sempre ative o ambiente virtual** antes de trabalhar no projeto
- **Não commite o diretório `venv/`** (já está no `.gitignore`)
- **Atualize o `requirements.txt`** sempre que adicionar novas dependências
- Use `pip freeze > requirements.txt` para gerar a lista completa

## 📚 Recursos

- [Documentação Python venv](https://docs.python.org/3/library/venv.html)
- [Guia pip](https://pip.pypa.io/en/stable/user_guide/)
- [Documentação Airflow](https://airflow.apache.org/docs/)
