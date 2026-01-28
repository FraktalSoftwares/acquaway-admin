import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/core/validators/validators.dart';
import '/core/config/env_config.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html show window;
import 'redefinir_senha_model.dart';
export 'redefinir_senha_model.dart';

class RedefinirSenhaWidget extends StatefulWidget {
  const RedefinirSenhaWidget({super.key});

  static String routeName = 'redefinirSenha';
  static String routePath = '/redefinir-senha';

  @override
  State<RedefinirSenhaWidget> createState() => _RedefinirSenhaWidgetState();
}

class _RedefinirSenhaWidgetState extends State<RedefinirSenhaWidget> {
  late RedefinirSenhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  StreamSubscription<AuthState>? _authStateSubscription;

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RedefinirSenhaModel());

    _model.txNovaSenhaTextController ??= TextEditingController();
    _model.txNovaSenhaFocusNode ??= FocusNode();
    _model.txNovaSenhaTextControllerValidator ??=
        (context, value) => Validators.required(value, 'Nova senha');

    _model.txConfirmarSenhaTextController ??= TextEditingController();
    _model.txConfirmarSenhaFocusNode ??= FocusNode();
    _model.txConfirmarSenhaTextControllerValidator ??= (context, value) {
      if (value == null || value.isEmpty) {
        return 'Confirme a nova senha';
      }
      if (value != _model.txNovaSenhaTextController?.text) {
        return 'As senhas não coincidem';
      }
      return null;
    };

    // Processar token do Supabase quando a página carregar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _setupAuthListener();
      _processToken();
    });
  }

  void _setupAuthListener() {
    // Escutar eventos de autenticação do Supabase
    // Isso detecta quando o token de recuperação é processado
    _authStateSubscription = SupaFlow.client.auth.onAuthStateChange.listen((
      AuthState state,
    ) {
      // Prevenir redirecionamentos automáticos durante recuperação de senha
      // Desabilitar notificações de mudança de auth para evitar redirecionamentos
      AppStateNotifier.instance.updateNotifyOnAuthChange(false);

      if (state.event == AuthChangeEvent.passwordRecovery) {
        // Token de recuperação foi processado com sucesso
        debugPrint('Evento passwordRecovery detectado');
        safeSetState(() {
          _model.tokenProcessed = true;
          _model.tokenValid = true;
          _model.isLoading = false;
        });
      } else if (state.event == AuthChangeEvent.signedIn) {
        // Quando o usuário é logado automaticamente pelo token de recuperação
        // Verificar se estamos na página de redefinir senha
        final session = state.session;
        if (session != null) {
          // Verificar se há token de recuperação na URL
          final uri = Uri.base;
          final hasRecoveryToken =
              (uri.hasFragment && uri.fragment.contains('type=recovery')) ||
              (uri.queryParameters.containsKey('type') &&
                  uri.queryParameters['type'] == 'recovery');

          if (hasRecoveryToken) {
            debugPrint(
              'Usuário logado via token de recuperação - mostrando formulário',
            );
            safeSetState(() {
              _model.tokenProcessed = true;
              _model.tokenValid = true;
              _model.isLoading = false;
            });
          }
        }
      }
    });
  }

  void _processToken() async {
    safeSetState(() {
      _model.isLoading = true;
    });

    try {
      final uri = Uri.base;
      bool hasRecoveryToken = false;

      // Verificar se há token no hash fragment (formato padrão do Supabase)
      // Quando o Supabase redireciona, ele adiciona o token no hash fragment
      if (uri.hasFragment) {
        final fragment = uri.fragment;
        if (fragment.contains('access_token') &&
            fragment.contains('type=recovery')) {
          hasRecoveryToken = true;
          debugPrint('Token de recuperação encontrado no hash fragment');
        }
      }

      // Verificar se há token nos query parameters
      // Isso pode acontecer se o link do Supabase for aberto diretamente
      if (uri.queryParameters.containsKey('token') &&
          uri.queryParameters.containsKey('type') &&
          uri.queryParameters['type'] == 'recovery') {
        hasRecoveryToken = true;
        debugPrint('Token de recuperação encontrado nos query parameters');
        // Se o token estiver nos query parameters, significa que o link
        // do Supabase foi aberto diretamente. Nesse caso, precisamos
        // redirecionar para o Supabase para que ele processe o token
        // e redirecione de volta com o token no hash fragment.
        final token = uri.queryParameters['token'];
        final currentRedirectTo = uri.queryParameters['redirect_to'];

        // Construir URL de redirecionamento completa
        final redirectTo =
            currentRedirectTo ??
            '${uri.scheme}://${uri.host}${uri.hasPort ? ':${uri.port}' : ''}${RedefinirSenhaWidget.routePath}';

        // Construir URL do Supabase para processar o token
        final supabaseUrl = EnvConfig.supabaseUrl;
        final verifyUrl =
            '$supabaseUrl/auth/v1/verify?token=$token&type=recovery&redirect_to=${Uri.encodeComponent(redirectTo)}';

        debugPrint('Redirecionando para Supabase: $verifyUrl');

        // Redirecionar para o Supabase processar o token
        // O Supabase irá processar o token e redirecionar de volta
        // com o token no hash fragment
        if (kIsWeb) {
          html.window.location.href = verifyUrl;
        } else {
          // Em outras plataformas, usar url_launcher se necessário
          // Por enquanto, apenas logar o erro
          debugPrint('Redirecionamento não suportado nesta plataforma');
        }

        // Não continuar o processamento, pois estamos redirecionando
        return;
      }

      if (hasRecoveryToken) {
        // O Supabase processa automaticamente tokens de recuperação
        // através do onAuthStateChange. O listener já foi configurado.
        // Aguardar um pouco para o Supabase processar o token
        await Future.delayed(const Duration(milliseconds: 2000));

        // Verificar se há uma sessão ativa (indicando que o token foi processado)
        final session = SupaFlow.client.auth.currentSession;

        if (session != null) {
          // Token foi processado e usuário foi logado
          // Mostrar formulário de redefinição de senha
          debugPrint('Sessão de recuperação detectada - mostrando formulário');
          safeSetState(() {
            _model.tokenProcessed = true;
            _model.tokenValid = true;
            _model.isLoading = false;
          });
        } else {
          // Se ainda não houver sessão após aguardar, o token pode ser inválido ou expirado
          debugPrint('Token de recuperação não resultou em sessão válida');
          safeSetState(() {
            _model.tokenProcessed = true;
            _model.tokenValid = false;
            _model.isLoading = false;
          });
        }
      } else {
        // Não há token de recuperação na URL
        // Verificar se já existe uma sessão ativa (pode ter sido processada antes)
        final session = SupaFlow.client.auth.currentSession;
        if (session != null) {
          // Se há sessão mas não há token na URL, pode ser que o token já foi processado
          // Verificar se estamos na página de redefinir senha
          debugPrint(
            'Sessão encontrada sem token na URL - verificando se é recuperação',
          );
          safeSetState(() {
            _model.tokenProcessed = true;
            _model.tokenValid = true;
            _model.isLoading = false;
          });
        } else {
          safeSetState(() {
            _model.tokenProcessed = true;
            _model.tokenValid = false;
            _model.isLoading = false;
          });
        }
      }
    } catch (e) {
      debugPrint('Erro ao processar token de recuperação: $e');
      safeSetState(() {
        _model.tokenProcessed = true;
        _model.tokenValid = false;
        _model.isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    _authStateSubscription?.cancel();
    // Reabilitar notificações de mudança de auth ao sair da página
    AppStateNotifier.instance.updateNotifyOnAuthChange(true);
    _model.dispose();
    super.dispose();
  }

  Widget _buildLoadingState() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'Processando link de recuperação...',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(),
              letterSpacing: 0.0,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildInvalidTokenState() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/29t30mo7xge1/Logo_(3).png',
            height: 53.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Text(
            'Recuperar senha',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w600),
              fontSize: 24.0,
              letterSpacing: 0.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(
              16.0,
              12.0,
              16.0,
              12.0,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFFFEBEE),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: const Color(0xFFE57373), width: 1.0),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.error_outline,
                  color: Color(0xFFD32F2F),
                  size: 24.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                      12.0,
                      0.0,
                      0.0,
                      0.0,
                    ),
                    child: Text(
                      'Link inválido ou expirado',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                        color: const Color(0xFFD32F2F),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Text(
            'O link de recuperação de senha é inválido ou já expirou. Por favor, solicite um novo link.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.normal),
              color: const Color(0xFF646768),
              fontSize: 14.0,
              letterSpacing: 0.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: () async {
              context.goNamed(RecuperarSenhaWidget.routeName);
            },
            text: 'Solicitar novo link',
            options: FFButtonOptions(
              width: double.infinity,
              height: 54.0,
              padding: const EdgeInsetsDirectional.fromSTEB(
                16.0,
                0.0,
                16.0,
                0.0,
              ),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                0.0,
                0.0,
                0.0,
                0.0,
              ),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.interTight(fontWeight: FontWeight.w600),
                color: Colors.white,
                letterSpacing: 0.0,
              ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.goNamed(LoginWidget.routeName);
            },
            child: Text(
              'Voltar para o login',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                color: const Color(0xFF007191),
                fontSize: 14.0,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildRedefinirSenhaForm() {
    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: Image.network(
            'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/29t30mo7xge1/Logo_(3).png',
            height: 53.0,
            fit: BoxFit.cover,
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Text(
            'Recuperar senha',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.w600),
              fontSize: 24.0,
              letterSpacing: 0.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Text(
            'Crie uma nova senha para sua conta.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
              font: GoogleFonts.inter(fontWeight: FontWeight.normal),
              color: const Color(0xFF646768),
              fontSize: 14.0,
              letterSpacing: 0.0,
            ),
          ),
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                0.0,
                24.0,
                0.0,
                0.0,
              ),
              child: Text(
                'Nova senha',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.txNovaSenhaTextController,
                focusNode: _model.txNovaSenhaFocusNode,
                autofocus: false,
                obscureText: !_model.txNovaSenhaVisibility,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Nova senha',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.inter(),
                    color: const Color(0xFFB1B3B4),
                    letterSpacing: 0.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E6E6),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E6E6),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: InkWell(
                    onTap: () async {
                      safeSetState(() {
                        _model.txNovaSenhaVisibility =
                            !_model.txNovaSenhaVisibility;
                      });
                    },
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _model.txNovaSenhaVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 24.0,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(),
                  letterSpacing: 0.0,
                ),
                validator: _model.txNovaSenhaTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ],
        ),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                0.0,
                16.0,
                0.0,
                0.0,
              ),
              child: Text(
                'Confirme a nova senha',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.txConfirmarSenhaTextController,
                focusNode: _model.txConfirmarSenhaFocusNode,
                autofocus: false,
                obscureText: !_model.txConfirmarSenhaVisibility,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'Confirme a nova senha',
                  hintStyle: FlutterFlowTheme.of(context).labelMedium.override(
                    font: GoogleFonts.inter(),
                    color: const Color(0xFFB1B3B4),
                    letterSpacing: 0.0,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E6E6),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color(0xFFE5E6E6),
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: FlutterFlowTheme.of(context).error,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  filled: true,
                  fillColor: const Color(0xFFFAFAFA),
                  prefixIcon: const Icon(Icons.lock_outlined),
                  suffixIcon: InkWell(
                    onTap: () async {
                      safeSetState(() {
                        _model.txConfirmarSenhaVisibility =
                            !_model.txConfirmarSenhaVisibility;
                      });
                    },
                    focusNode: FocusNode(skipTraversal: true),
                    child: Icon(
                      _model.txConfirmarSenhaVisibility
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                      size: 24.0,
                    ),
                  ),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(),
                  letterSpacing: 0.0,
                ),
                validator: _model.txConfirmarSenhaTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed:
                _model.isLoading
                    ? null
                    : () async {
                      if (_model.txNovaSenhaTextController?.text.isEmpty ??
                          true) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Por favor, insira uma nova senha'),
                          ),
                        );
                        return;
                      }

                      if (_model.txConfirmarSenhaTextController?.text !=
                          _model.txNovaSenhaTextController?.text) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('As senhas não coincidem'),
                          ),
                        );
                        return;
                      }

                      safeSetState(() {
                        _model.isLoading = true;
                      });

                      try {
                        final newPassword =
                            _model.txNovaSenhaTextController!.text;

                        // Verificar se ainda há uma sessão ativa (do token de recuperação)
                        final session = SupaFlow.client.auth.currentSession;
                        if (session == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Token de recuperação inválido ou expirado. Por favor, solicite um novo link.',
                              ),
                            ),
                          );
                          safeSetState(() {
                            _model.isLoading = false;
                            _model.tokenValid = false;
                          });
                          return;
                        }

                        // Atualizar senha usando o Supabase
                        await SupaFlow.client.auth.updateUser(
                          UserAttributes(password: newPassword),
                        );

                        // Fazer logout após atualizar a senha (por segurança)
                        await SupaFlow.client.auth.signOut();

                        if (mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Senha redefinida com sucesso!'),
                              backgroundColor: Color(0xFF90C74F),
                            ),
                          );

                          // Redirecionar para a página de sucesso ou login
                          context.goNamed(LoginWidget.routeName);
                        }
                      } catch (e) {
                        safeSetState(() {
                          _model.isLoading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Erro ao redefinir senha: ${e.toString()}',
                            ),
                          ),
                        );
                      }
                    },
            text: 'Redefinir',
            options: FFButtonOptions(
              width: double.infinity,
              height: 54.0,
              padding: const EdgeInsetsDirectional.fromSTEB(
                16.0,
                0.0,
                16.0,
                0.0,
              ),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                0.0,
                0.0,
                0.0,
                0.0,
              ),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                font: GoogleFonts.interTight(fontWeight: FontWeight.w600),
                color: Colors.white,
                letterSpacing: 0.0,
              ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(12.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: InkWell(
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () async {
              context.goNamed(LoginWidget.routeName);
            },
            child: Text(
              'Voltar para o login',
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(fontWeight: FontWeight.w500),
                color: const Color(0xFF007191),
                fontSize: 14.0,
                letterSpacing: 0.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        body: Stack(
          children: [
            Align(
              alignment: const AlignmentDirectional(1.0, 0.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(0.0),
                child: Image.network(
                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/3mpl345wx8op/Subtract_(1)_(1).png',
                  width: MediaQuery.sizeOf(context).width * 0.5,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Align(
              alignment: const AlignmentDirectional(-0.23, 0.0),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: Colors.transparent,
                            elevation: 3.0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Container(
                              width: 471.4,
                              decoration: BoxDecoration(
                                color:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Builder(
                                  builder: (context) {
                                    if (_model.isLoading) {
                                      return _buildLoadingState();
                                    } else if (_model.tokenProcessed &&
                                        !_model.tokenValid) {
                                      return _buildInvalidTokenState();
                                    } else if (_model.tokenValid) {
                                      return _buildRedefinirSenhaForm();
                                    } else {
                                      return _buildLoadingState();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
