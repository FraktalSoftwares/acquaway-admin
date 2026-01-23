# Análise da Tela PgEmpresasWidget

## 📋 Visão Geral

A tela `PgEmpresasWidget` é uma interface complexa para gerenciamento de empresas no sistema Acqua Way. O widget possui aproximadamente **5900 linhas de código** e gerencia múltiplos estados e visualizações.

## 🏗️ Estrutura do Componente

### Arquivos Relacionados
- **Widget Principal**: `lib/pg_empresas/pg_empresas/pg_empresas_widget.dart` (~5900 linhas)
- **Model**: `lib/pg_empresas/pg_empresas/pg_empresas_model.dart` (53 linhas)

### Estados do Model (`PgEmpresasModel`)
```dart
- empresaSelecionada: int?           // ID da empresa selecionada
- stage: String? = 'Geral'           // Aba atual: 'Geral', 'Histórico de viagens', 'Embarcações'
- aprovacoes: bool = false           // Flag para tela de aprovações
- empresaSelecionadaNaoAprovada: int? // ID de empresa não aprovada selecionada
- ordenacaoSelecionada: String?     // Ordenação: 'Ordem alfabética A-Z' ou 'Z-A'
```

### Controllers de Texto
- `txBuscaEmpresaTextController1` - Busca na lista principal
- `txBuscaAdminEmpresaTextController` - Busca no histórico de viagens
- `txBuscaEmpresaTextController2` - Busca na lista de aprovações

## 🎯 Funcionalidades Principais

### 1. **Lista Principal de Empresas** (`empresaSelecionada == null && aprovacoes == false`)

**Características:**
- Exibe empresas aprovadas e ativas (`aprovadas == true && ativo == true`)
- Busca por nome com filtro `ilike`
- Ordenação alfabética (A-Z ou Z-A)
- Exportação para CSV via `actions.exportEmpresasCSV()`
- Alerta de empresas pendentes de aprovação

**Colunas da Tabela:**
- ID
- Nome da empresa
- CNPJ
- Data de cadastro
- E-mail

**Queries:**
```dart
CompaniesTable().queryRows(
  queryFn: (q) => q
    .ilike('nome', '%${busca}%')
    .eqOrNull('aprovadas', true)
    .eq('ativo', true)
    .order('nome', ascending: ordenacao == 'A-Z')
)
```

### 2. **Tela de Aprovações** (`aprovacoes == true`)

**Características:**
- Lista empresas não aprovadas (`aprovadas == false`)
- Mesma estrutura de tabela da lista principal
- Busca por nome
- Permite selecionar empresa para aprovação/rejeição

**Acesso:**
- Banner amarelo no topo quando há empresas pendentes
- Botão "Visualizar empresas" no banner

### 3. **Detalhes da Empresa** (`empresaSelecionada != null`)

**Abas Disponíveis:**

#### 3.1. Aba "Geral"
- **Card de Informações:**
  - Imagem da empresa (business_center.png)
  - Data de cadastro ("Membro desde")
  - Informações da empresa (nome, CNPJ, e-mail, telefone, etc.)
  - Status de ativação

- **Ações:**
  - **Ativar Conta**: Se empresa está inativa (`ativo == false`)
    - Abre dialog `PpAtivarContaWidget`
  - **Desativar Conta**: Se empresa está ativa (`ativo == true`)
    - Abre dialog `PpDesativarContaWidget`
    - Aviso: "Ao inativar esta empresa, todos os usuários vinculados a ela perderão o acesso ao sistema imediatamente."

#### 3.2. Aba "Histórico de viagens" (`stage == 'Histórico de viagens'`)
- Lista viagens da empresa via `VwViagensResumoTable`
- Busca por nome do barco
- Colunas: ID Viagem, Nome Barco, KM Totais, Duração
- Ao clicar, abre dialog `PpDetalheViagemWidget`

**Query:**
```dart
VwViagensResumoTable().queryRows(
  queryFn: (q) => q.eqOrNull('companie_id', empresaSelecionada)
)
```

#### 3.3. Aba "Embarcações" (`stage == 'Embarcações'`)
- Lista embarcações da empresa via `EmbarcacoesTable`
- Ao clicar, abre dialog `PpDetalheEmbarcacaoWidget`

**Query:**
```dart
EmbarcacoesTable().queryRows(
  queryFn: (q) => q.eqOrNull('companie_id', empresaSelecionada)
)
```

### 4. **Detalhes de Empresa Não Aprovada** (`empresaSelecionadaNaoAprovada != null`)

**Características:**
- Similar à tela de detalhes normal
- Permite aprovar/rejeitar empresa
- Botões de ativar/desativar conta

## 🔄 Fluxo de Navegação

```
Lista Principal
    ↓ (clicar em empresa)
Detalhes da Empresa
    ├─ Geral
    ├─ Histórico de viagens
    └─ Embarcações

Lista Principal
    ↓ (clicar "Visualizar empresas" no banner)
Tela de Aprovações
    ↓ (clicar em empresa não aprovada)
Detalhes Empresa Não Aprovada
```

## ⚠️ Problemas Identificados

### 1. ✅ **Bug na Query de Empresa Não Aprovada** - CORRIGIDO
**Linha 5047-5050:**
```dart
future: CompaniesTable().querySingleRow(
  queryFn: (q) => q.eqOrNull(
    'id',
    _model.empresaSelecionadaNaoAprovada,  // ✅ CORRIGIDO
  ),
),
```
**Problema:** Usava `empresaSelecionada` em vez de `empresaSelecionadaNaoAprovada`.
**Status:** ✅ Corrigido

### 2. ✅ **Campo E-mail Mostrando Nome** - CORRIGIDO
**Linhas 1028-1030 e 4984-4986:**
```dart
// ❌ ANTES:
lvHistoricoCompaniesRow.nome

// ✅ DEPOIS:
lvHistoricoCompaniesRow.email
```
**Problema:** Coluna "E-mail" exibia o nome da empresa em vez do e-mail.
**Status:** ✅ Corrigido em ambas as tabelas (lista principal e lista de aprovações)

### 3. **Código Duplicado**
- Muita duplicação de código entre:
  - Lista principal e lista de aprovações
  - Detalhes de empresa aprovada e não aprovada
  - Estrutura de tabelas repetida múltiplas vezes

### 3. **Performance**
- Múltiplos `FutureBuilder` sem cache
- Queries executadas a cada rebuild
- Falta de paginação nas listas

### 4. **Manutenibilidade**
- Arquivo muito grande (~5900 linhas)
- Lógica de UI misturada com lógica de negócio
- Falta de componentes reutilizáveis

### 5. **Tratamento de Erros**
- `FutureBuilder` não trata erros explicitamente
- Falta feedback quando queries falham

### 6. ✅ **Inconsistências** - CORRIGIDO
- ~~Campo "E-mail" na tabela mostra `nome` em vez de e-mail~~ ✅ Corrigido
- ~~Mesmo problema na lista de aprovações~~ ✅ Corrigido

## 💡 Sugestões de Melhoria

### 1. **Refatoração Estrutural**
```dart
// Separar em componentes menores:
- EmpresasListWidget
- EmpresasAprovacoesWidget  
- EmpresaDetalhesWidget
- EmpresaGeralTab
- EmpresaViagensTab
- EmpresaEmbarcacoesTab
```

### 2. **Correção de Bugs**
- Corrigir query na linha 5050
- Corrigir exibição de e-mail nas tabelas

### 3. **Melhorias de Performance**
- Implementar cache para queries
- Adicionar paginação
- Usar `StreamBuilder` com real-time updates (se aplicável)

### 4. **Melhorias de UX**
- Loading states mais informativos
- Tratamento de erros com mensagens claras
- Empty states quando não há dados
- Confirmação antes de desativar conta

### 5. **Código Limpo**
- Extrair constantes (cores, tamanhos, textos)
- Criar widgets reutilizáveis para tabelas
- Usar extension methods para formatação

### 6. **Testes**
- Adicionar testes unitários para lógica de negócio
- Testes de widget para componentes críticos

## 📊 Métricas do Código

- **Linhas de código**: ~5900
- **FutureBuilders**: 6
- **Estados condicionais**: 7 (`if` statements principais)
- **Queries ao banco**: 6 diferentes
- **Dialogs**: 4 tipos diferentes

## 🔍 Pontos de Atenção

1. **Estado Global**: Usa `FFAppState().empresaSelecionadaGlobal` para navegação entre telas
2. **Debounce**: Implementado corretamente nas buscas (500ms)
3. **Navegação**: Usa Stack para alternar entre visualizações
4. **Responsividade**: Larguras fixas podem causar problemas em telas menores

## 📝 Conclusão

A tela `PgEmpresasWidget` é funcional mas precisa de refatoração significativa para melhorar:
- **Manutenibilidade**: Dividir em componentes menores
- **Performance**: Implementar cache e paginação
- **Confiabilidade**: Corrigir bugs identificados
- **UX**: Melhorar feedback e tratamento de erros

**Prioridade de Correções:**
1. ✅ ~~Corrigir bug na query de empresa não aprovada~~ - **CONCLUÍDO**
2. ✅ ~~Corrigir exibição de e-mail nas tabelas~~ - **CONCLUÍDO**
3. 🟡 **MÉDIA**: Refatorar em componentes menores
4. 🟡 **MÉDIA**: Adicionar tratamento de erros
5. 🟢 **BAIXA**: Melhorias de performance e UX

## ✅ Correções Aplicadas

### Bug 1: Query de Empresa Não Aprovada
- **Arquivo**: `lib/pg_empresas/pg_empresas/pg_empresas_widget.dart`
- **Linha**: 5050
- **Correção**: Alterado `_model.empresaSelecionada` para `_model.empresaSelecionadaNaoAprovada`

### Bug 2: Exibição de E-mail na Lista Principal
- **Arquivo**: `lib/pg_empresas/pg_empresas/pg_empresas_widget.dart`
- **Linha**: ~1030
- **Correção**: Alterado `lvHistoricoCompaniesRow.nome` para `lvHistoricoCompaniesRow.email`

### Bug 3: Exibição de E-mail na Lista de Aprovações
- **Arquivo**: `lib/pg_empresas/pg_empresas/pg_empresas_widget.dart`
- **Linha**: ~4986
- **Correção**: Alterado `lvHistoricoCompaniesRow.nome` para `lvHistoricoCompaniesRow.email`
