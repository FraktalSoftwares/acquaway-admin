# AcquaWay Web - Análise Completa do Supabase

## 📋 Índice

1. [Visão Geral](#visão-geral)
2. [Estrutura do Banco de Dados](#estrutura-do-banco-de-dados)
3. [Problemas Críticos de Segurança](#problemas-críticos-de-segurança)
4. [Problemas de Performance](#problemas-de-performance)
5. [Análise Detalhada por Tabela](#análise-detalhada-por-tabela)
6. [Extensões Instaladas](#extensões-instaladas)
7. [Recomendações Prioritárias](#recomendações-prioritárias)
8. [Scripts de Correção](#scripts-de-correção)

---

## 🎯 Visão Geral

### Estatísticas do Banco

- **Total de Tabelas**: 17 tabelas no schema `public`
- **Total de Registros**: ~1.500+ registros distribuídos
- **RLS Habilitado**: ❌ **0 tabelas** (CRÍTICO!)
- **Views**: 4 views com problemas de segurança
- **Funções**: 15 funções com problemas de segurança
- **Foreign Keys sem Índices**: 20+ FKs sem índices

### Status Geral

| Categoria | Status | Prioridade |
|-----------|--------|------------|
| **Segurança (RLS)** | 🔴 **CRÍTICO** | **ALTA** |
| **Segurança (Views)** | 🔴 **CRÍTICO** | **ALTA** |
| **Segurança (Funções)** | 🟡 **IMPORTANTE** | **MÉDIA** |
| **Performance (Índices)** | 🟡 **IMPORTANTE** | **MÉDIA** |
| **Performance (FKs)** | 🟢 **MELHORIA** | **BAIXA** |

---

## 🗄 Estrutura do Banco de Dados

### Tabelas Principais

#### 1. **users** (99 registros)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id (UUID), nome, email, tipo_user, companies_id, verificado, ativo
- **Foreign Keys**: 
  - `users.id` → `auth.users.id`
  - `users.companies_id` → `companies.id`
- **Problemas**: 
  - ❌ RLS desabilitado
  - ⚠️ FK `companies_id` sem índice

#### 2. **companies** (91 registros)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id, user_id, nome, cnpj, ativo, aprovadas
- **Foreign Keys**:
  - `companies.user_id` → `users.id`
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ FK `user_id` sem índice

#### 3. **embarcacoes** (76 registros)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id, companie, user_id, nome_embarcacoes, ativo
- **Foreign Keys**:
  - `embarcacoes.companie` → `companies.id`
  - `embarcacoes.user_id` → `users.id`
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ FKs sem índices

#### 4. **viagens** (245 registros)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id, companie_id, embarcacao_id, user_id_piloto, data, distancia
- **Foreign Keys**: 5 FKs
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ 5 FKs sem índices

#### 5. **viagem_localizacoes** (693 registros)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id, viagem_id, lat, long, local, companies_id
- **Foreign Keys**: 2 FKs
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ FKs sem índices

#### 6. **alertas** (257 registros)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id, companies_id, user_id_piloto, tipo_alerta, viagem_id
- **Foreign Keys**: 3 FKs
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ 3 FKs sem índices

#### 7. **sos** (5 registros)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id, companie_id, user_id_piloto, tipo_sos, resolvida
- **Foreign Keys**: 5 FKs
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ 5 FKs sem índices

#### 8. **notificacoes** (1 registro)
- **RLS**: ❌ Desabilitado
- **Colunas Principais**: id, user_reciver, titulo, descricao, lido
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ FKs sem índices

#### 9. **avisos** (3 registros)
- **RLS**: ❌ Desabilitado
- **Problemas**: ❌ RLS desabilitado

#### 10. **assinaturas** (0 registros)
- **RLS**: ❌ Desabilitado
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ Índices não utilizados

#### 11. **users_preferencias** (99 registros)
- **RLS**: ❌ Desabilitado
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ FK sem índice

#### 12. **viagem_timer** (50 registros)
- **RLS**: ❌ Desabilitado
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ Índices não utilizados

#### 13. **viagens_paradas** (0 registros)
- **RLS**: ❌ Desabilitado
- **Problemas**: ❌ RLS desabilitado

#### 14. **viagens_rotas** (0 registros)
- **RLS**: ❌ Desabilitado
- **Problemas**: ❌ RLS desabilitado

#### 15. **historico_alertas** (0 registros)
- **RLS**: ❌ Desabilitado
- **Problemas**:
  - ❌ RLS desabilitado
  - ⚠️ 3 índices não utilizados

#### 16. **app** (1 registro)
- **RLS**: ❌ Desabilitado
- **Problemas**: ❌ RLS desabilitado

---

## 🔒 Problemas Críticos de Segurança

### 1. **RLS (Row Level Security) Desabilitado em TODAS as Tabelas**

**Severidade**: 🔴 **CRÍTICO**

**Problema**: Nenhuma tabela tem RLS habilitado. Isso significa que:
- Qualquer usuário autenticado pode acessar TODOS os dados
- Não há isolamento entre empresas/usuários
- Dados sensíveis estão expostos
- Violação de privacidade e segurança

**Impacto**:
- Usuários podem ver dados de outras empresas
- Dados pessoais expostos
- Possível vazamento de informações sensíveis
- Não conformidade com LGPD/GDPR

**Tabelas Afetadas**: **TODAS as 17 tabelas**

### 2. **Views com SECURITY DEFINER**

**Severidade**: 🔴 **CRÍTICO**

**Problema**: 4 views usam `SECURITY DEFINER`, o que pode contornar políticas RLS:

1. `vw_viagens_resumo`
2. `viagem_timer_view`
3. `view_sos_completo`
4. `vw_viagens_paradas`

**Risco**: Essas views executam com permissões do criador, não do usuário, potencialmente expondo dados.

### 3. **Funções com Search Path Mutável**

**Severidade**: 🟡 **IMPORTANTE**

**Problema**: 15 funções não têm `search_path` definido, vulneráveis a ataques de injeção:

1. `handle_subscription_activation`
2. `calcular_dados_projeto`
3. `upsert_projeto`
4. `tg_set_updated_at`
5. `sos_zero_to_null`
6. `duplicate_viagem`
7. `viagem_timer_start`
8. `viagem_timer_pause`
9. `viagem_timer_resume`
10. `viagem_timer_stop`
11. `duplicate_viagem_volta`
12. `viagem_timer_get_or_create`
13. `viagem_timer_start_by_viagem`
14. `viagem_timer_pause_by_viagem`
15. `viagem_timer_resume_by_viagem`
16. `viagem_timer_stop_by_viagem`

**Risco**: Possível SQL injection através de manipulação do search_path.

### 4. **Proteção de Senhas Vazadas Desabilitada**

**Severidade**: 🟡 **IMPORTANTE**

**Problema**: Supabase Auth não está verificando senhas comprometidas contra HaveIBeenPwned.org.

**Impacto**: Usuários podem usar senhas já vazadas em vazamentos anteriores.

### 5. **Versão do PostgreSQL com Patches de Segurança Pendentes**

**Severidade**: 🟡 **IMPORTANTE**

**Problema**: Versão atual `supabase-postgres-17.4.1.074` tem patches de segurança disponíveis.

**Recomendação**: Atualizar para a versão mais recente.

---

## ⚡ Problemas de Performance

### 1. **Foreign Keys sem Índices**

**Severidade**: 🟡 **IMPORTANTE**

**Problema**: 20+ foreign keys não têm índices, causando:
- Queries lentas em JOINs
- Locks mais longos em operações de atualização
- Degradação de performance em operações de DELETE

**Tabelas Afetadas**:

#### **alertas** (3 FKs sem índice)
- `alertas_companies_id_fkey`
- `alertas_user_id_piloto_fkey`
- `alertas_viagem_id_fkey`

#### **companies** (1 FK sem índice)
- `companies_user_id_fkey`

#### **embarcacoes** (2 FKs sem índice)
- `embarcacoes_companie_fkey`
- `embarcacoes_user_id_fkey`

#### **notificacoes** (2 FKs sem índice)
- `notificacoes_companies_id_fkey`
- `notificacoes_user_reciver_fkey`

#### **sos** (5 FKs sem índice)
- `sos_companie_id_fkey`
- `sos_embarcacoes_id_fkey`
- `sos_user_id_atendente_fkey`
- `sos_user_id_piloto_fkey`
- `sos_viagem_id_fkey`

#### **users** (1 FK sem índice)
- `users_companies_id_fkey`

#### **users_preferencias** (1 FK sem índice)
- `users_preferencias_users_id_fkey`

#### **viagem_localizacoes** (2 FKs sem índice)
- `viagem_localizacoes_companies_id_fkey`
- `viagem_localizacoes_viagem_id_fkey`

#### **viagens** (5 FKs sem índice)
- `viagens_companie_id_fkey`
- `viagens_destino_fkey`
- `viagens_embarcacao_id_fkey`
- `viagens_origem_fkey`
- `viagens_user_id_piloto_fkey`

#### **viagens_paradas** (2 FKs sem índice)
- `viagens_paradas_viagem_localizacoes_id_fkey`
- `viagens_paradas_viagens_id_fkey`

#### **viagens_rotas** (1 FK sem índice)
- `viagens_rotas_viagem_id_fkey`

### 2. **Índices Não Utilizados**

**Severidade**: 🟢 **MELHORIA**

**Problema**: Alguns índices nunca foram usados, ocupando espaço desnecessário:

1. `idx_historico_projeto_id` em `historico_alertas`
2. `idx_historico_data` em `historico_alertas`
3. `idx_historico_tipo` em `historico_alertas`
4. `idx_users_stripe_customer_id` em `users`
5. `idx_assinaturas_user_id` em `assinaturas`
6. `idx_assinaturas_companies_id` em `assinaturas`
7. `viagem_timer_viagens_id_idx` em `viagem_timer`
8. `viagem_timer_status_idx` em `viagem_timer`

**Recomendação**: Avaliar se esses índices são necessários ou removê-los.

### 3. **Estratégia de Conexão Auth**

**Severidade**: 🟢 **MELHORIA**

**Problema**: Auth está usando conexões absolutas (10) em vez de percentual.

**Impacto**: Ao aumentar o tamanho da instância, Auth não se beneficia automaticamente.

---

## 📊 Análise Detalhada por Tabela

### Tabelas com Mais Problemas

1. **viagens** - 5 FKs sem índice + RLS desabilitado
2. **sos** - 5 FKs sem índice + RLS desabilitado
3. **alertas** - 3 FKs sem índice + RLS desabilitado
4. **viagem_localizacoes** - 2 FKs sem índice + RLS desabilitado + 693 registros

### Tabelas Críticas para Negócio

1. **users** - Dados pessoais, precisa de RLS urgente
2. **companies** - Dados empresariais sensíveis
3. **viagens** - Dados operacionais importantes
4. **sos** - Dados de emergência críticos
5. **assinaturas** - Dados financeiros sensíveis

---

## 🔌 Extensões Instaladas

### Extensões Ativas

1. **pg_net** (0.14.0) - Async HTTP
2. **uuid-ossp** (1.1) - Geração de UUIDs
3. **pgcrypto** (1.3) - Funções criptográficas
4. **pg_stat_statements** (1.11) - Estatísticas de queries
5. **pg_graphql** (1.5.11) - Suporte GraphQL
6. **supabase_vault** (0.3.1) - Vault do Supabase
7. **plpgsql** (1.0) - Linguagem procedural

### Extensões Disponíveis (Não Instaladas)

- **postgis** - Para dados geoespaciais (útil para coordenadas)
- **pg_trgm** - Busca de texto (útil para busca de nomes)
- **pg_cron** - Agendamento de tarefas

---

## 🎯 Recomendações Prioritárias

### 🔴 Prioridade CRÍTICA (Fazer Imediatamente)

#### 1. Habilitar RLS em TODAS as Tabelas

**Impacto**: Segurança crítica
**Esforço**: Médio
**Tempo**: 2-4 horas

**Ações**:
1. Criar políticas RLS para cada tabela
2. Testar políticas em ambiente de desenvolvimento
3. Implementar gradualmente em produção
4. Monitorar logs após implementação

#### 2. Corrigir Views com SECURITY DEFINER

**Impacto**: Segurança crítica
**Esforço**: Baixo-Médio
**Tempo**: 1-2 horas

**Ações**:
1. Revisar cada view
2. Remover SECURITY DEFINER ou ajustar políticas
3. Testar funcionalidade

#### 3. Corrigir Funções com Search Path Mutável

**Impacto**: Segurança importante
**Esforço**: Médio
**Tempo**: 2-3 horas

**Ações**:
1. Adicionar `SET search_path = public, pg_temp` em todas as funções
2. Testar cada função
3. Atualizar migrações

### 🟡 Prioridade ALTA (Próximas 2 Semanas)

#### 4. Adicionar Índices em Foreign Keys

**Impacto**: Performance
**Esforço**: Baixo
**Tempo**: 1-2 horas

**Ações**:
1. Criar índices para todas as FKs listadas
2. Monitorar performance após criação
3. Verificar uso dos índices

#### 5. Habilitar Proteção de Senhas Vazadas

**Impacto**: Segurança
**Esforço**: Muito Baixo
**Tempo**: 5 minutos

**Ações**:
1. Habilitar no dashboard do Supabase
2. Configurar política de senhas

#### 6. Atualizar PostgreSQL

**Impacto**: Segurança
**Esforço**: Baixo (com backup)
**Tempo**: 30 minutos + testes

### 🟢 Prioridade MÉDIA (Próximo Mês)

#### 7. Remover Índices Não Utilizados

**Impacto**: Performance/Espaço
**Esforço**: Baixo
**Tempo**: 30 minutos

#### 8. Configurar Estratégia de Conexão Auth

**Impacto**: Performance
**Esforço**: Baixo
**Tempo**: 10 minutos

---

## 📝 Scripts de Correção

### Script 1: Habilitar RLS em Todas as Tabelas

```sql
-- Habilitar RLS
ALTER TABLE public.users ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.companies ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.embarcacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.viagens ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.viagem_localizacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.alertas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.sos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notificacoes ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.avisos ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.assinaturas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.users_preferencias ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.viagem_timer ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.viagens_paradas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.viagens_rotas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.historico_alertas ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.app ENABLE ROW LEVEL SECURITY;
```

### Script 2: Políticas RLS Básicas (Exemplo para users)

```sql
-- Política: Usuários podem ver apenas seus próprios dados
CREATE POLICY "Users can view own data"
ON public.users
FOR SELECT
USING (auth.uid() = id);

-- Política: Usuários podem atualizar apenas seus próprios dados
CREATE POLICY "Users can update own data"
ON public.users
FOR UPDATE
USING (auth.uid() = id);

-- Política: Admins podem ver todos os usuários
CREATE POLICY "Admins can view all users"
ON public.users
FOR SELECT
USING (
  EXISTS (
    SELECT 1 FROM public.users
    WHERE id = auth.uid()
    AND tipo_user = 'Admin'
  )
);
```

### Script 3: Adicionar Índices em Foreign Keys

```sql
-- Índices para alertas
CREATE INDEX idx_alertas_companies_id ON public.alertas(companies_id);
CREATE INDEX idx_alertas_user_id_piloto ON public.alertas(user_id_piloto);
CREATE INDEX idx_alertas_viagem_id ON public.alertas(viagem_id);

-- Índices para companies
CREATE INDEX idx_companies_user_id ON public.companies(user_id);

-- Índices para embarcacoes
CREATE INDEX idx_embarcacoes_companie ON public.embarcacoes(companie);
CREATE INDEX idx_embarcacoes_user_id ON public.embarcacoes(user_id);

-- Índices para notificacoes
CREATE INDEX idx_notificacoes_companies_id ON public.notificacoes(companies_id);
CREATE INDEX idx_notificacoes_user_reciver ON public.notificacoes(user_reciver);

-- Índices para sos
CREATE INDEX idx_sos_companie_id ON public.sos(companie_id);
CREATE INDEX idx_sos_embarcacoes_id ON public.sos(embarcacoes_id);
CREATE INDEX idx_sos_user_id_atendente ON public.sos(user_id_atendente);
CREATE INDEX idx_sos_user_id_piloto ON public.sos(user_id_piloto);
CREATE INDEX idx_sos_viagem_id ON public.sos(viagem_id);

-- Índices para users
CREATE INDEX idx_users_companies_id ON public.users(companies_id);

-- Índices para users_preferencias
CREATE INDEX idx_users_preferencias_users_id ON public.users_preferencias(users_id);

-- Índices para viagem_localizacoes
CREATE INDEX idx_viagem_localizacoes_companies_id ON public.viagem_localizacoes(companies_id);
CREATE INDEX idx_viagem_localizacoes_viagem_id ON public.viagem_localizacoes(viagem_id);

-- Índices para viagens
CREATE INDEX idx_viagens_companie_id ON public.viagens(companie_id);
CREATE INDEX idx_viagens_destino ON public.viagens(destino);
CREATE INDEX idx_viagens_embarcacao_id ON public.viagens(embarcacao_id);
CREATE INDEX idx_viagens_origem ON public.viagens(origem);
CREATE INDEX idx_viagens_user_id_piloto ON public.viagens(user_id_piloto);

-- Índices para viagens_paradas
CREATE INDEX idx_viagens_paradas_viagem_localizacoes_id ON public.viagens_paradas(viagem_localizacoes_id);
CREATE INDEX idx_viagens_paradas_viagens_id ON public.viagens_paradas(viagens_id);

-- Índices para viagens_rotas
CREATE INDEX idx_viagens_rotas_viagem_id ON public.viagens_rotas(viagem_id);
```

### Script 4: Corrigir Funções com Search Path

```sql
-- Exemplo: Corrigir função tg_set_updated_at
CREATE OR REPLACE FUNCTION public.tg_set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public, pg_temp
AS $$
BEGIN
  NEW.updated_at = NOW();
  RETURN NEW;
END;
$$;
```

### Script 5: Corrigir Views com SECURITY DEFINER

```sql
-- Exemplo: Remover SECURITY DEFINER de uma view
-- (Ajustar conforme necessário)

-- Primeiro, verificar a definição atual:
SELECT pg_get_viewdef('public.vw_viagens_resumo', true);

-- Recriar view sem SECURITY DEFINER
-- (Substituir pela definição correta)
```

---

## 📈 Métricas de Impacto Esperado

### Segurança

| Ação | Impacto | Risco Reduzido |
|------|---------|----------------|
| Habilitar RLS | 🔴 Crítico | 90% |
| Corrigir Views | 🔴 Crítico | 80% |
| Corrigir Funções | 🟡 Importante | 60% |
| Proteção Senhas | 🟡 Importante | 40% |

### Performance

| Ação | Impacto | Melhoria Esperada |
|------|---------|-------------------|
| Índices em FKs | 🟡 Importante | 30-50% mais rápido em JOINs |
| Remover índices não usados | 🟢 Melhoria | Redução de espaço |

---

## ✅ Checklist de Implementação

### Segurança (Crítico)

- [ ] Habilitar RLS em todas as 17 tabelas
- [ ] Criar políticas RLS para cada tabela
- [ ] Testar políticas em desenvolvimento
- [ ] Corrigir 4 views com SECURITY DEFINER
- [ ] Corrigir 15 funções com search_path mutável
- [ ] Habilitar proteção de senhas vazadas
- [ ] Atualizar PostgreSQL

### Performance (Importante)

- [ ] Adicionar 20+ índices em foreign keys
- [ ] Monitorar uso de índices
- [ ] Remover índices não utilizados
- [ ] Configurar estratégia de conexão Auth

### Monitoramento

- [ ] Configurar alertas de segurança
- [ ] Monitorar logs de acesso
- [ ] Revisar políticas RLS periodicamente
- [ ] Auditar permissões de usuários

---

## 🔗 Links Úteis

- [Documentação RLS do Supabase](https://supabase.com/docs/guides/auth/row-level-security)
- [Guia de Segurança do Supabase](https://supabase.com/docs/guides/platform/security)
- [Database Linter](https://supabase.com/docs/guides/database/database-linter)
- [Performance Tuning](https://supabase.com/docs/guides/database/performance)

---

## 📞 Próximos Passos

1. **Imediato**: Habilitar RLS nas tabelas mais críticas (users, companies, viagens)
2. **Esta Semana**: Corrigir views e funções com problemas de segurança
3. **Próximas 2 Semanas**: Adicionar índices em foreign keys
4. **Próximo Mês**: Otimizações e limpeza

---

**Última atualização**: 2024

**Status**: 🔴 **AÇÃO URGENTE NECESSÁRIA**
