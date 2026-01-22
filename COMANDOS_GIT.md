# 📝 Comandos Git - Guia Rápido

## 🚀 Setup Inicial (Primeira Vez)

### 1. Inicializar repositório
```bash
cd /home/victor/etl_completo
git init
```

### 2. Configurar Git (se ainda não fez)
```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@example.com"
```

### 3. Adicionar todos os arquivos
```bash
git add .
```

### 4. Fazer primeiro commit
```bash
git commit -m "Initial commit: estrutura base do projeto ETL com Airflow"
```

### 5. Conectar ao GitHub (substitua SEU_USUARIO)
```bash
git remote add origin https://github.com/SEU_USUARIO/etl_completo.git
```

### 6. Renomear branch para main
```bash
git branch -M main
```

### 7. Enviar para o GitHub
```bash
git push -u origin main
```

---

## 🔄 Comandos do Dia a Dia

### Ver status das alterações
```bash
git status
```

### Adicionar arquivos modificados
```bash
git add .                          # Todos os arquivos
git add dags/nova_dag.py           # Arquivo específico
git add dags/ include/             # Múltiplos arquivos/pastas
```

### Fazer commit
```bash
git commit -m "Descrição clara do que foi alterado"
```

### Enviar para o GitHub
```bash
git push
```

### Ver histórico de commits
```bash
git log --oneline                  # Versão compacta
git log                            # Versão completa
```

### Ver diferenças antes de commitar
```bash
git diff                           # Ver todas as mudanças
git diff dags/extract_data.py      # Ver mudanças em arquivo específico
```

---

## 🔍 Comandos Úteis

### Ver remotes configurados
```bash
git remote -v
```

### Atualizar do GitHub (se trabalhar em múltiplos lugares)
```bash
git pull
```

### Criar nova branch
```bash
git checkout -b nome-da-branch
```

### Voltar para branch main
```bash
git checkout main
```

### Ver branches
```bash
git branch                         # Locais
git branch -a                      # Todas (locais + remotas)
```

---

## ⚠️ Comandos de Emergência

### Desfazer mudanças em arquivo não commitado
```bash
git checkout -- nome-do-arquivo.py
```

### Remover arquivo do staging (mas manter alterações)
```bash
git reset HEAD nome-do-arquivo.py
```

### Alterar mensagem do último commit
```bash
git commit --amend -m "Nova mensagem"
```

---

## 📚 Exemplo de Fluxo Completo

```bash
# 1. Ver o que mudou
git status

# 2. Adicionar arquivos
git add dags/nova_dag.py include/utils/helper.py

# 3. Ver o que será commitado
git status

# 4. Fazer commit
git commit -m "Adiciona nova DAG e função helper"

# 5. Enviar para GitHub
git push
```

---

💡 **Dica:** Use mensagens de commit descritivas:
- ✅ "Adiciona DAG de extração de dados do S3"
- ✅ "Corrige bug na validação de dados"
- ✅ "Atualiza dependências no requirements.txt"
- ❌ "update"
- ❌ "fix"
- ❌ "changes"
