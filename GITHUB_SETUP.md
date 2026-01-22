# 🚀 Guia: Conectar Repositório Local ao GitHub

Este guia vai te ensinar passo a passo como conectar seu repositório local ao GitHub e fazer o push das alterações.

## 📋 Pré-requisitos

1. Ter uma conta no GitHub (se não tiver, crie em: https://github.com)
2. Ter o Git instalado (verificar com: `git --version`)
3. Ter o repositório local pronto

## 🔧 Passo 1: Inicializar o Repositório Git Local

Se ainda não inicializou, execute:

```bash
cd /home/victor/etl_completo
git init
```

## 🔧 Passo 2: Configurar o Git (se ainda não configurou)

Configure seu nome e email (substitua pelos seus dados):

```bash
git config --global user.name "Seu Nome"
git config --global user.email "seu.email@example.com"
```

## 🔧 Passo 3: Criar Repositório no GitHub

1. Acesse https://github.com e faça login
2. Clique no botão **"+"** no canto superior direito
3. Selecione **"New repository"**
4. Preencha:
   - **Repository name**: `etl_completo` (ou o nome que preferir)
   - **Description**: "Pipeline ETL com Airflow na AWS"
   - **Visibility**: Escolha Public ou Private
   - **NÃO marque** "Initialize this repository with a README" (já temos um)
5. Clique em **"Create repository"**

## 🔧 Passo 4: Adicionar Arquivos ao Git

Adicione todos os arquivos ao staging:

```bash
git add .
```

Verifique o que será commitado:

```bash
git status
```

## 🔧 Passo 5: Fazer o Primeiro Commit

```bash
git commit -m "Initial commit: estrutura base do projeto ETL com Airflow"
```

## 🔧 Passo 6: Conectar ao Repositório Remoto

Após criar o repositório no GitHub, você verá uma página com instruções. Use o comando abaixo substituindo `SEU_USUARIO` pelo seu username do GitHub:

```bash
git remote add origin https://github.com/SEU_USUARIO/etl_completo.git
```

**OU se preferir usar SSH** (recomendado para maior segurança):

```bash
git remote add origin git@github.com:SEU_USUARIO/etl_completo.git
```

Verificar se foi adicionado corretamente:

```bash
git remote -v
```

## 🔧 Passo 7: Renomear Branch Principal (Opcional)

Se necessário, renomeie a branch para `main`:

```bash
git branch -M main
```

## 🔧 Passo 8: Fazer o Primeiro Push

Envie os arquivos para o GitHub:

```bash
git push -u origin main
```

Se usar HTTPS, o GitHub pedirá suas credenciais. Se usar SSH, certifique-se de ter configurado suas chaves SSH.

## 📝 Comandos para Trabalhos Futuros

Depois do setup inicial, sempre que fizer alterações:

### 1. Ver o status das alterações:
```bash
git status
```

### 2. Adicionar arquivos modificados:
```bash
git add .                    # Adiciona todos os arquivos
# OU
git add caminho/do/arquivo   # Adiciona arquivo específico
```

### 3. Fazer commit:
```bash
git commit -m "Descrição clara do que foi alterado"
```

### 4. Enviar para o GitHub:
```bash
git push
```

## 🔐 Autenticação no GitHub

### Opção 1: Personal Access Token (HTTPS)

Se usar HTTPS e o GitHub pedir senha:
1. Vá em: GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Gere um novo token com permissões `repo`
3. Use o token como senha quando solicitado

### Opção 2: SSH Keys (Recomendado)

Para usar SSH, configure suas chaves:

```bash
# Gerar chave SSH (se ainda não tiver)
ssh-keygen -t ed25519 -C "seu.email@example.com"

# Copiar chave pública
cat ~/.ssh/id_ed25519.pub

# Adicionar a chave no GitHub:
# Settings → SSH and GPG keys → New SSH key
```

## 🆘 Solução de Problemas

### Erro: "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/SEU_USUARIO/etl_completo.git
```

### Erro: "failed to push some refs"
```bash
git pull origin main --allow-unrelated-histories
git push -u origin main
```

### Ver histórico de commits:
```bash
git log --oneline
```

## 📚 Recursos Úteis

- [Documentação oficial do Git](https://git-scm.com/doc)
- [GitHub Docs](https://docs.github.com)
- [Git Cheat Sheet](https://education.github.com/git-cheat-sheet-education.pdf)
