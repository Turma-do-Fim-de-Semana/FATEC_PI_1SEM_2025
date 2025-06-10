# FATEC_PI_1SEM_2025
# 📱 CONTATA AQUI - Flutter + Supabase

Aplicativo mobile desenvolvido em Flutter com Supabase como backend, com o objetivo de funcionar como uma lista telefônica moderna. Os usuários podem encontrar profissionais de confiança por setor (como pedreiro, pintor, encanador, etc.), avaliar serviços e entrar em contato com prestadores diretamente pelo app.

---

## 🚀 Funcionalidades

- Autenticação de usuários (Supabase Auth)
- Cadastro de usuários comuns e prestadores de serviço
- Catálogo dividido por **setores de serviço**
- Cadastro de dados dos profissionais (contato, setor, descrição, localização)
- Avaliação dos serviços com notas e comentários
- Listagem de profissionais por categoria
- Backend serverless com Supabase

---

## 🛠️ Tecnologias Utilizadas

### Frontend
- [Flutter](https://flutter.dev/) (SDK para desenvolvimento mobile multiplataforma)
- [Dart](https://dart.dev/) (linguagem do Flutter)

### Backend
- [Supabase](https://supabase.com/)
  - Autenticação (`auth.users`)
  - Banco de dados PostgreSQL
  - Regras de segurança com RLS (Row-Level Security)

---

## 📲 Como rodar o projeto

### Pré-requisitos

- Flutter SDK instalado (`flutter doctor`)
- Clonar este repositório:

```bash
git clone https://github.com/seu-usuario/seu-repositorio.git
cd seu-repositorio
flutter pub get
