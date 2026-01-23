# AcquaWay Web - Documentação Completa

## 📋 Índice

1. [Visão Geral](#visão-geral)
2. [Tecnologias Utilizadas](#tecnologias-utilizadas)
3. [Estrutura do Projeto](#estrutura-do-projeto)
4. [Funcionalidades Principais](#funcionalidades-principais)
5. [Configuração e Instalação](#configuração-e-instalação)
6. [Arquitetura](#arquitetura)
7. [Banco de Dados](#banco-de-dados)
8. [Autenticação](#autenticação)
9. [Desenvolvimento](#desenvolvimento)
10. [Deploy](#deploy)

---

## 🎯 Visão Geral

**AcquaWay Web** é uma aplicação web desenvolvida em Flutter para gerenciamento de embarcações, viagens, alertas e solicitações de SOS. O sistema oferece uma interface completa para monitoramento e gestão de operações marítimas, incluindo dashboards analíticos, gerenciamento de usuários, empresas e embarcações.

### Características Principais

- ✅ Interface web responsiva desenvolvida com Flutter
- ✅ Autenticação segura via Supabase
- ✅ Dashboard com gráficos e métricas em tempo real
- ✅ Gerenciamento completo de viagens e embarcações
- ✅ Sistema de alertas e notificações
- ✅ Exportação de dados para Excel
- ✅ Suporte multi-empresa e multi-usuário

---

## 🛠 Tecnologias Utilizadas

### Framework e Linguagem
- **Flutter** 3.0+ (SDK >=3.0.0 <4.0.0)
- **Dart** 3.0+

### Backend e Banco de Dados
- **Supabase** - Backend as a Service (BaaS)
  - Autenticação
  - Banco de dados PostgreSQL
  - Storage

### Principais Dependências

#### Navegação e Roteamento
- `go_router: 12.1.3` - Roteamento declarativo
- `page_transition: 2.1.0` - Transições de página

#### Estado e Gerenciamento
- `provider: 6.1.5` - Gerenciamento de estado
- `flutter_secure_storage: 10.0.0-beta.4` - Armazenamento seguro

#### UI e Componentes
- `google_fonts: 6.1.0` - Fontes Google
- `font_awesome_flutter: 10.7.0` - Ícones FontAwesome
- `auto_size_text: 3.0.0` - Texto auto-redimensionável
- `cached_network_image: 3.4.1` - Cache de imagens
- `syncfusion_flutter_charts: ^26.1.38` - Gráficos e visualizações

#### Utilitários
- `excel: ^4.0.0` - Geração de arquivos Excel
- `csv: 6.0.0` - Manipulação de CSV
- `intl: 0.20.2` - Internacionalização
- `timeago: 3.7.1` - Formatação de datas relativas
- `uuid: ^4.0.0` - Geração de UUIDs

#### Supabase
- `supabase_flutter: 2.9.0` - Cliente Flutter para Supabase
- `supabase: 2.7.0` - SDK Supabase

---

## 📁 Estrutura do Projeto

```
acqua_way_web/
├── android/                 # Configurações Android
├── ios/                     # Configurações iOS
├── web/                     # Configurações Web
├── assets/                  # Recursos estáticos
│   ├── audios/
│   ├── fonts/
│   ├── images/
│   ├── jsons/
│   ├── pdfs/
│   ├── rive_animations/
│   └── videos/
├── lib/
│   ├── actions/            # Ações customizadas
│   │   └── actions.dart
│   ├── auth/               # Sistema de autenticação
│   │   ├── auth_manager.dart
│   │   └── supabase_auth/
│   ├── backend/            # Integração com backend
│   │   ├── api_requests/   # Requisições API
│   │   ├── schema/         # Schemas e structs
│   │   └── supabase/       # Configuração Supabase
│   │       ├── database/   # Tabelas e queries
│   │       └── storage/     # Storage
│   ├── componentes/        # Componentes reutilizáveis
│   │   ├── nav_menu/
│   │   ├── pp_detalhe_viagem/
│   │   └── pp_logout/
│   ├── custom_code/        # Código customizado
│   │   ├── actions/        # Ações customizadas
│   │   └── widgets/        # Widgets customizados
│   ├── flutter_flow/       # Utilitários FlutterFlow
│   ├── pages/              # Páginas principais
│   │   ├── home/
│   │   └── login/
│   ├── pages_extras/       # Páginas extras
│   ├── pg_*/               # Módulos de páginas
│   │   ├── pg_dashboard/
│   │   ├── pg_usuarios/
│   │   ├── pg_empresas/
│   │   ├── pg_embarcacoes/
│   │   ├── pg_viagens/
│   │   ├── pg_acompanhamento/
│   │   ├── pg_notificacao/
│   │   ├── pg_avisos/
│   │   └── pg_solicitacoes_sos/
│   ├── app_state.dart      # Estado global da aplicação
│   ├── index.dart          # Exports principais
│   └── main.dart           # Ponto de entrada
├── pubspec.yaml            # Dependências do projeto
├── analysis_options.yaml   # Configurações do analisador
└── README.md               # Este arquivo
```

---

## 🚀 Funcionalidades Principais

### 1. **Dashboard**
- Visualização de métricas e KPIs
- Gráficos de evolução mensal
- Gráficos de alertas por tipo
- Gráficos de SOS por tipo
- Estatísticas de viagens e embarcações

### 2. **Gerenciamento de Usuários**
- CRUD completo de usuários
- Controle de permissões e verificações
- Filtros e busca avançada
- Exportação para Excel

### 3. **Gerenciamento de Empresas**
- Cadastro e edição de empresas
- Ativação/desativação de empresas
- Relacionamento com usuários e embarcações

### 4. **Gerenciamento de Embarcações**
- Cadastro de embarcações
- Detalhes e histórico
- Vinculação com empresas

### 5. **Gerenciamento de Viagens**
- Registro de viagens
- Visualização de rotas e paradas
- Filtros por período
- Exportação para Excel
- Calendário de viagens

### 6. **Acompanhamento**
- Monitoramento em tempo real
- Localização de embarcações
- Histórico de movimentações

### 7. **Notificações**
- Sistema de notificações
- Histórico de notificações
- Filtros e busca

### 8. **Avisos**
- Gerenciamento de avisos
- Filtros por tipo e período
- Exportação para Excel

### 9. **Solicitações de SOS**
- Visualização de solicitações
- Detalhes completos
- Filtros e busca
- Status e histórico

### 10. **Conta e Configurações**
- Perfil do usuário
- Preferências
- Configurações de conta

---

## ⚙️ Configuração e Instalação

### Pré-requisitos

- Flutter SDK 3.0 ou superior
- Dart SDK 3.0 ou superior
- Git
- Conta no Supabase (para backend)

### Passo a Passo

1. **Clone o repositório**
   ```bash
   git clone <repository-url>
   cd acqua_way_web
   ```

2. **Instale as dependências**
   ```bash
   flutter pub get
   ```

3. **Configure o Supabase**
   
   Edite o arquivo `lib/backend/supabase/supabase.dart` e configure:
   ```dart
   String _kSupabaseUrl = 'SUA_URL_SUPABASE';
   String _kSupabaseAnonKey = 'SUA_CHAVE_ANON';
   ```

4. **Execute o projeto**
   ```bash
   # Web
   flutter run -d chrome
   
   # Android
   flutter run
   
   # iOS
   flutter run
   ```

### Variáveis de Ambiente

⚠️ **IMPORTANTE**: As credenciais do Supabase estão hardcoded no código. Recomenda-se mover para variáveis de ambiente (veja seção de melhorias).

---

## 🏗 Arquitetura

### Padrão de Arquitetura

O projeto utiliza uma arquitetura baseada em:
- **Provider** para gerenciamento de estado
- **GoRouter** para navegação
- **Supabase** como backend
- **FlutterFlow** como base estrutural

### Fluxo de Dados

```
UI (Widgets) 
  ↓
Models (State Management)
  ↓
Actions (Business Logic)
  ↓
Backend (Supabase)
  ↓
Database (PostgreSQL)
```

### Estado Global

O estado global é gerenciado através de `FFAppState` que utiliza:
- `ChangeNotifier` para notificação de mudanças
- `FlutterSecureStorage` para persistência
- `Provider` para injeção de dependência

---

## 🗄 Banco de Dados

### Tabelas Principais

#### **users**
- Informações de usuários
- Autenticação e permissões
- Verificação de conta

#### **companies**
- Dados das empresas
- Status ativo/inativo

#### **embarcacoes**
- Informações de embarcações
- Vinculação com empresas

#### **viagens**
- Registro de viagens
- Datas, horários, distâncias
- Origem e destino

#### **viagens_rotas**
- Rotas das viagens
- Coordenadas geográficas

#### **viagens_paradas**
- Paradas durante viagens
- Localização e tempo

#### **alertas**
- Sistema de alertas
- Tipos e severidades

#### **sos**
- Solicitações de SOS
- Status e histórico

#### **avisos**
- Avisos do sistema
- Tipos e categorias

#### **notificacoes**
- Notificações para usuários
- Status de leitura

### Views

- `vw_viagens_resumo` - Resumo de viagens
- `vw_viagens_paradas` - Paradas de viagens
- `view_sos_completo` - Visualização completa de SOS
- `viagem_timer_view` - Timer de viagens

---

## 🔐 Autenticação

### Sistema de Autenticação

O sistema utiliza **Supabase Auth** com:
- Autenticação por email/senha
- Suporte a múltiplos provedores (configurável)
- Verificação de email
- Gerenciamento de sessão

### Fluxo de Autenticação

1. Usuário faz login
2. Sistema verifica credenciais no Supabase
3. Verifica se usuário está verificado
4. Carrega dados do usuário
5. Atualiza estado global (`FFAppState`)
6. Redireciona para home

### Proteção de Rotas

Rotas protegidas são definidas com `requireAuth: true` no `GoRouter`:
```dart
FFRoute(
  name: HomeWidget.routeName,
  path: HomeWidget.routePath,
  requireAuth: true,  // Requer autenticação
  builder: (context, params) => HomeWidget(),
)
```

---

## 💻 Desenvolvimento

### Estrutura de Páginas

Cada página segue o padrão:
```
pg_nome/
├── pg_nome/
│   ├── pg_nome_widget.dart  # Widget principal
│   └── pg_nome_model.dart   # Model/State
```

### Código Customizado

Código customizado está em `lib/custom_code/`:
- **Actions**: Funções reutilizáveis
- **Widgets**: Componentes customizados

### Exportação de Dados

O sistema possui funções de exportação:
- `export_viagens_excel.dart` - Exporta viagens
- `export_avisos_excel.dart` - Exporta avisos
- `export_users.dart` - Exporta usuários

### Gráficos Customizados

Widgets de gráficos em `lib/custom_code/widgets/`:
- `grafico_evolucao_mensal.dart`
- `grafico_alertas_por_tipo.dart`
- `grafico_sos_por_tipo.dart`
- `grafico_numero_por_tipo.dart`
- `grafico_numero_por_tipo_plano.dart`

---

## 🚢 Deploy

### Build para Web

```bash
flutter build web --release
```

Os arquivos serão gerados em `build/web/`

### Build para Android

```bash
flutter build apk --release
# ou
flutter build appbundle --release
```

### Build para iOS

```bash
flutter build ios --release
```

### Configurações de Deploy

#### Web - Vercel (Recomendado)

O projeto está configurado para deploy automático no Vercel.

**Configuração:**
- Arquivo `vercel.json` já está configurado
- Build command: `flutter build web --release`
- Output directory: `build/web`
- Framework: Static Site

**Passos para Deploy:**

1. **Conecte o repositório ao Vercel:**
   - Acesse [Vercel Dashboard](https://vercel.com/dashboard)
   - Clique em "Add New Project"
   - Importe o repositório `FraktalSoftwares/acquaway-admin`
   - O Vercel detectará automaticamente as configurações do `vercel.json`

2. **Configure variáveis de ambiente (se necessário):**
   - No painel do Vercel, vá em Settings > Environment Variables
   - Adicione variáveis necessárias (ex: credenciais do Supabase)

3. **Deploy automático:**
   - O Vercel fará deploy automaticamente a cada push na branch `main`
   - Ou faça deploy manual clicando em "Deploy"

**Nota:** Certifique-se de que o Flutter está instalado no ambiente de build do Vercel. O Vercel suporta Flutter Web através de buildpacks ou configuração customizada.

#### Web (Firebase Hosting, Netlify, etc.)
1. Build do projeto: `flutter build web --release`
2. Deploy da pasta `build/web/`

#### Android
- Configure signing no `android/app/build.gradle`
- Gere keystore para release

#### iOS
- Configure certificados no Xcode
- Configure App Store Connect

---

## 📝 Convenções de Código

### Nomenclatura

- **Arquivos**: snake_case (ex: `pg_dashboard_widget.dart`)
- **Classes**: PascalCase (ex: `PgDashboardWidget`)
- **Variáveis**: camelCase (ex: `userName`)
- **Constantes**: camelCase com `const` (ex: `const kApiUrl`)

### Estrutura de Widgets

```dart
class MyWidget extends StatefulWidget {
  const MyWidget({super.key});
  
  static String routeName = 'my_widget';
  static String routePath = '/my-widget';
  
  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  late MyModel _model;
  
  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MyModel());
  }
  
  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    // ...
  }
}
```

---

## 🧪 Testes

O projeto possui estrutura básica de testes em `test/widget_test.dart`. 

Para executar:
```bash
flutter test
```

---

## 📚 Recursos Adicionais

### Documentação Flutter
- [Flutter Documentation](https://flutter.dev/docs)
- [Dart Documentation](https://dart.dev/guides)

### Supabase
- [Supabase Documentation](https://supabase.com/docs)
- [Supabase Flutter](https://supabase.com/docs/reference/dart/introduction)

### FlutterFlow
- [FlutterFlow Documentation](https://docs.flutterflow.io/)

---

## 👥 Contribuindo

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/AmazingFeature`)
3. Commit suas mudanças (`git commit -m 'Add some AmazingFeature'`)
4. Push para a branch (`git push origin feature/AmazingFeature`)
5. Abra um Pull Request

---

## 📄 Licença

Este projeto é privado e proprietário.

---

## 📞 Suporte

Para suporte, entre em contato com a equipe de desenvolvimento.

---

**Última atualização**: 2024
