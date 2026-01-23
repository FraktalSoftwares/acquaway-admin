# Guia de Contribuição - AcquaWay Web

Obrigado por considerar contribuir com o AcquaWay Web! Este documento fornece diretrizes para contribuir com o projeto.

## 📋 Índice

1. [Código de Conduta](#código-de-conduta)
2. [Como Contribuir](#como-contribuir)
3. [Padrões de Código](#padrões-de-código)
4. [Processo de Pull Request](#processo-de-pull-request)
5. [Estrutura de Commits](#estrutura-de-commits)
6. [Checklist de Desenvolvimento](#checklist-de-desenvolvimento)

---

## 📜 Código de Conduta

### Nossos Valores

- **Respeito**: Trate todos com respeito e profissionalismo
- **Colaboração**: Trabalhe em conjunto para melhorar o projeto
- **Qualidade**: Mantenha altos padrões de código
- **Comunicação**: Seja claro e objetivo nas comunicações

---

## 🤝 Como Contribuir

### Reportar Bugs

1. Verifique se o bug já não foi reportado
2. Use o template de issue apropriado
3. Inclua informações detalhadas:
   - Passos para reproduzir
   - Comportamento esperado vs. atual
   - Screenshots (se aplicável)
   - Ambiente (OS, Flutter version, etc.)

### Sugerir Melhorias

1. Abra uma issue descrevendo a melhoria
2. Explique o problema que resolve
3. Descreva a solução proposta
4. Discuta antes de implementar grandes mudanças

### Contribuir com Código

1. Fork o repositório
2. Crie uma branch para sua feature/fix
3. Faça suas alterações
4. Siga os padrões de código
5. Adicione testes se aplicável
6. Abra um Pull Request

---

## 💻 Padrões de Código

### Nomenclatura

```dart
// Classes: PascalCase
class UserRepository { }

// Variáveis e funções: camelCase
String userName = 'John';
void fetchUserData() { }

// Constantes: camelCase com const
const int maxRetries = 3;

// Arquivos: snake_case
user_repository.dart
```

### Formatação

```bash
# Sempre formate o código antes de commitar
dart format lib/
```

### Estrutura de Arquivos

```dart
// 1. Imports do Flutter
import 'package:flutter/material.dart';

// 2. Imports de pacotes
import 'package:provider/provider.dart';

// 3. Imports locais
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_util.dart';

// 4. Código
class MyWidget extends StatelessWidget { }
```

### Comentários

```dart
// Comentários de linha única para explicações breves

/// Comentários de documentação para classes e funções públicas
/// 
/// Exemplo de uso:
/// ```dart
/// final user = UserRepository();
/// ```
class UserRepository {
  /// Busca dados do usuário no Supabase
  /// 
  /// [userId] - ID do usuário a ser buscado
  /// Retorna [User] ou null se não encontrado
  Future<User?> fetchUser(String userId) async {
    // Implementação
  }
}
```

### Tratamento de Erros

```dart
// Sempre trate erros adequadamente
try {
  final result = await apiCall();
  return result;
} on ServerException catch (e) {
  logger.e('Server error', error: e);
  throw Failure('Erro ao conectar com servidor');
} catch (e) {
  logger.e('Unexpected error', error: e);
  throw Failure('Erro inesperado');
}
```

### Widgets

```dart
// Use const quando possível
const MyWidget({super.key});

// Dispose recursos adequadamente
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}

// Use keys quando necessário
ListView.builder(
  key: ValueKey('user_list'),
  itemBuilder: (context, index) => UserItem(),
)
```

---

## 🔄 Processo de Pull Request

### Antes de Abrir um PR

1. ✅ Código formatado (`dart format`)
2. ✅ Sem erros de análise (`flutter analyze`)
3. ✅ Testes passando (`flutter test`)
4. ✅ Documentação atualizada
5. ✅ Sem conflitos com main

### Template de PR

```markdown
## Descrição
Breve descrição das mudanças

## Tipo de Mudança
- [ ] Bug fix
- [ ] Nova feature
- [ ] Breaking change
- [ ] Documentação
- [ ] Refatoração

## Checklist
- [ ] Código formatado
- [ ] Testes adicionados/atualizados
- [ ] Documentação atualizada
- [ ] Sem breaking changes (ou documentados)
- [ ] Testado localmente

## Screenshots (se aplicável)
Adicione screenshots das mudanças visuais

## Issues Relacionadas
Closes #123
```

### Revisão de Código

- PRs precisam de pelo menos 1 aprovação
- Responda a comentários de revisão
- Faça alterações solicitadas
- Mantenha a discussão construtiva

---

## 📝 Estrutura de Commits

Seguimos o padrão [Conventional Commits](https://www.conventionalcommits.org/):

```
<tipo>(<escopo>): <descrição curta>

[corpo opcional]

[rodapé opcional]
```

### Tipos

- `feat`: Nova feature
- `fix`: Correção de bug
- `docs`: Documentação
- `style`: Formatação (não afeta código)
- `refactor`: Refatoração
- `test`: Testes
- `chore`: Tarefas de manutenção

### Exemplos

```bash
feat(auth): adiciona login com Google
fix(viagens): corrige filtro de data
docs(readme): atualiza instruções de instalação
refactor(dashboard): melhora performance dos gráficos
test(users): adiciona testes para UserRepository
```

---

## ✅ Checklist de Desenvolvimento

### Antes de Começar

- [ ] Ler documentação relevante
- [ ] Verificar issues relacionadas
- [ ] Criar branch a partir de main
- [ ] Configurar ambiente local

### Durante o Desenvolvimento

- [ ] Seguir padrões de código
- [ ] Escrever código limpo e legível
- [ ] Adicionar comentários quando necessário
- [ ] Testar localmente
- [ ] Verificar performance

### Antes de Commitar

- [ ] Código formatado
- [ ] Sem erros de análise
- [ ] Testes passando
- [ ] Commit message descritivo
- [ ] Sem arquivos desnecessários

### Antes de Abrir PR

- [ ] Revisar suas próprias mudanças
- [ ] Atualizar documentação
- [ ] Adicionar testes se necessário
- [ ] Verificar se não quebrou nada
- [ ] Screenshots se aplicável

---

## 🧪 Testes

### Adicionar Testes

- Testes unitários para lógica de negócio
- Testes de widget para componentes
- Testes de integração para fluxos críticos

### Executar Testes

```bash
# Todos os testes
flutter test

# Teste específico
flutter test test/unit/user_repository_test.dart

# Com cobertura
flutter test --coverage
```

---

## 📚 Documentação

### Atualizar Documentação

- README.md para mudanças gerais
- Comentários inline para código complexo
- CHANGELOG.md para releases
- Documentação de API se aplicável

---

## 🐛 Reportar Problemas

### Template de Bug Report

```markdown
**Descrição**
Descrição clara do bug

**Passos para Reproduzir**
1. Vá para '...'
2. Clique em '...'
3. Veja o erro

**Comportamento Esperado**
O que deveria acontecer

**Comportamento Atual**
O que está acontecendo

**Screenshots**
Se aplicável

**Ambiente**
- OS: [e.g. Windows 10]
- Flutter: [e.g. 3.0.0]
- Browser: [e.g. Chrome 120]

**Logs**
Logs relevantes
```

---

## ❓ Dúvidas?

- Abra uma issue com a tag `question`
- Entre em contato com a equipe
- Consulte a documentação completa

---

**Obrigado por contribuir! 🎉**
