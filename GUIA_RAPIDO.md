# AcquaWay Web - Guia Rápido de Início

## 🚀 Início Rápido

### 1. Pré-requisitos
```bash
# Verificar versão do Flutter
flutter --version

# Verificar se está tudo configurado
flutter doctor
```

### 2. Instalação
```bash
# Clonar repositório
git clone <repository-url>
cd acqua_way_web

# Instalar dependências
flutter pub get

# Configurar variáveis de ambiente
cp .env.example .env
# Editar .env com suas credenciais
```

### 3. Executar
```bash
# Web (Chrome)
flutter run -d chrome

# Web (modo release)
flutter run -d chrome --release

# Android
flutter run

# iOS
flutter run
```

## 📦 Comandos Úteis

### Desenvolvimento
```bash
# Analisar código
flutter analyze

# Formatar código
dart format lib/

# Limpar build
flutter clean

# Reinstalar dependências
flutter pub get
```

### Build
```bash
# Build Web
flutter build web --release

# Build Android APK
flutter build apk --release

# Build Android App Bundle
flutter build appbundle --release

# Build iOS
flutter build ios --release
```

### Testes
```bash
# Executar todos os testes
flutter test

# Executar testes com cobertura
flutter test --coverage

# Ver cobertura
genhtml coverage/lcov.info -o coverage/html
```

## 🗂 Estrutura de Pastas Principais

```
lib/
├── pages/          # Páginas principais (Login, Home)
├── pg_*/           # Módulos de funcionalidades
├── backend/        # Integração com Supabase
├── auth/           # Sistema de autenticação
├── componentes/    # Componentes reutilizáveis
└── custom_code/    # Código customizado
```

## 🔑 Configuração do Supabase

1. Acesse [Supabase Dashboard](https://app.supabase.com)
2. Crie um novo projeto ou use existente
3. Copie a URL e Anon Key
4. Cole no arquivo `.env`

## 🐛 Troubleshooting Comum

### Erro: "Unable to find Supabase credentials"
- Verifique se o arquivo `.env` existe
- Confirme que as variáveis estão corretas
- Reinicie o app após alterar `.env`

### Erro: "Build failed"
```bash
flutter clean
flutter pub get
flutter run
```

### Erro: "Package not found"
```bash
flutter pub get
flutter pub upgrade
```

### Performance lenta
- Use modo release: `flutter run --release`
- Limpe o cache: `flutter clean`
- Verifique se há muitos prints no código

## 📱 Testando em Dispositivos

### Android
```bash
# Listar dispositivos
flutter devices

# Executar em dispositivo específico
flutter run -d <device-id>
```

### iOS
```bash
# Abrir simulador
open -a Simulator

# Executar
flutter run
```

## 🔍 Debugging

### DevTools
```bash
# Abrir DevTools
flutter pub global activate devtools
flutter pub global run devtools
```

### Logs
```bash
# Ver logs em tempo real
flutter logs

# Filtrar logs
flutter logs | grep "ERROR"
```

## 📚 Recursos

- [Documentação Flutter](https://flutter.dev/docs)
- [Supabase Docs](https://supabase.com/docs)
- [Dart Language Tour](https://dart.dev/guides/language/language-tour)

## ⚡ Dicas

1. **Hot Reload**: Pressione `r` no terminal durante `flutter run`
2. **Hot Restart**: Pressione `R` para reiniciar
3. **Quit**: Pressione `q` para sair
4. **DevTools**: Use `flutter pub global run devtools` para profiling

## 🆘 Precisa de Ajuda?

1. Verifique a documentação completa em `README.md`
2. Consulte `MELHORIAS_E_AJUSTES.md` para melhorias
3. Revise os logs de erro
4. Entre em contato com a equipe de desenvolvimento

---

**Última atualização**: 2024
