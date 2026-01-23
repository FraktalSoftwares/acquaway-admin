import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/core/validators/validators.dart';
import 'dart:ui';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'recuperar_senha_model.dart';
export 'recuperar_senha_model.dart';

class RecuperarSenhaWidget extends StatefulWidget {
  const RecuperarSenhaWidget({super.key});

  static String routeName = 'recuperarSenha';
  static String routePath = '/recuperar-senha';

  @override
  State<RecuperarSenhaWidget> createState() => _RecuperarSenhaWidgetState();
}

class _RecuperarSenhaWidgetState extends State<RecuperarSenhaWidget> {
  late RecuperarSenhaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => RecuperarSenhaModel());

    _model.txEmailTextController ??= TextEditingController();
    _model.txEmailFocusNode ??= FocusNode();
    _model.txEmailTextControllerValidator ??=
        (context, value) => Validators.email(value);

    _model.txNovaSenhaTextController ??= TextEditingController();
    _model.txNovaSenhaFocusNode ??= FocusNode();
    _model.txNovaSenhaTextControllerValidator ??=
        (context, value) => Validators.required(value, 'Nova senha');

    _model.txConfirmarSenhaTextController ??= TextEditingController();
    _model.txConfirmarSenhaFocusNode ??= FocusNode();
    _model.txConfirmarSenhaTextControllerValidator ??=
        (context, value) {
      if (value == null || value.isEmpty) {
        return 'Confirme a nova senha';
      }
      if (value != _model.txNovaSenhaTextController?.text) {
        return 'As senhas não coincidem';
      }
      return null;
    };

    // Verificar se há parâmetros na URL (token do Supabase)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkUrlParams();
      safeSetState(() {});
    });
  }

  void _checkUrlParams() async {
    // Verificar se há hash na URL (Supabase usa hash para tokens)
    final uri = Uri.base;
    if (uri.hasFragment) {
      final fragment = uri.fragment;
      // Se houver um token de recuperação, aguardar processamento e mudar para estado de redefinição
      if (fragment.contains('access_token') && fragment.contains('type=recovery')) {
        try {
          // O Supabase processa o hash fragment automaticamente
          // Aguardar um pouco para garantir que o processamento foi concluído
          await Future.delayed(const Duration(milliseconds: 500));
          
          // Verificar se há uma sessão ativa (indicando que o token foi processado)
          final session = SupaFlow.client.auth.currentSession;
          if (session != null) {
            safeSetState(() {
              _model.currentState = RecuperarSenhaState.redefinirSenha;
            });
          } else {
            // Se não houver sessão, o token pode ter expirado ou ser inválido
            debugPrint('Token de recuperação não processado ou inválido');
          }
        } catch (e) {
          // Se houver erro ao processar, manter no estado inicial
          debugPrint('Erro ao processar token de recuperação: $e');
        }
      }
    }
  }

  @override
  void dispose() {
    _model.dispose();
    super.dispose();
  }

  String _maskEmail(String email) {
    if (email.isEmpty) return '';
    final parts = email.split('@');
    if (parts.length != 2) return email;
    final username = parts[0];
    final domain = parts[1];
    if (username.length <= 2) {
      return '${username[0]}*****@$domain';
    }
    return '${username.substring(0, 2)}*****@$domain';
  }

  Widget _buildEmailInputState() {
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
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
          child: Text(
            'Insira o email cadastrado para redefinir sua senha. Você receberá um link de recuperação.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                  ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                'E-mail',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.txEmailTextController,
                focusNode: _model.txEmailFocusNode,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'E-mail',
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
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(),
                      letterSpacing: 0.0,
                    ),
                validator: _model.txEmailTextControllerValidator
                    .asValidator(context),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: () async {
              if (_model.txEmailTextController?.text.isEmpty ?? true) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Por favor, insira um e-mail'),
                  ),
                );
                return;
              }

              final email = _model.txEmailTextController!.text.trim();

              try {
                await authManager.resetPassword(
                  email: email,
                  context: context,
                  redirectTo: Uri.base.origin + RedefinirSenhaWidget.routePath,
                );

                safeSetState(() {
                  _model.emailEnviado = email;
                  _model.currentState = RecuperarSenhaState.emailEnviado;
                });
              } catch (e) {
                // Erro já tratado no authManager
              }
            },
            text: 'Enviar',
            options: FFButtonOptions(
              width: double.infinity,
              height: 54.0,
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                    ),
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
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                    ),
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

  Widget _buildEmailEnviadoState() {
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
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color(0xFF90C74F),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFF90C74F),
                  size: 24.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Email enviado com sucesso!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                            ),
                            color: const Color(0xFF2E7D32),
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
            'Você receberá um link para redefinir sua senha em instantes. Verifique sua caixa de entrada.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                  ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                'E-mail',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                    ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              child: TextFormField(
                controller: _model.txEmailTextController,
                focusNode: _model.txEmailFocusNode,
                enabled: false,
                autofocus: false,
                obscureText: false,
                decoration: InputDecoration(
                  isDense: true,
                  hintText: 'E-mail',
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
                  fillColor: const Color(0xFFF5F5F5),
                  prefixIcon: const Icon(Icons.email_outlined),
                ),
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(),
                      color: const Color(0xFF646768),
                      letterSpacing: 0.0,
                    ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: FFButtonWidget(
            onPressed: null,
            text: 'Enviar',
            options: FFButtonOptions(
              width: double.infinity,
              height: 54.0,
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: const Color(0xFFE5E6E6),
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                    ),
                    color: const Color(0xFFB1B3B4),
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
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                    ),
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

  Widget _buildRedefinirSenhaState() {
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
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
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
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                  ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
              child: Text(
                'Nova senha',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                      ),
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
              padding: const EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 0.0, 0.0),
              child: Text(
                'Confirme a nova senha',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                      ),
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
            onPressed: () async {
              if (_model.txNovaSenhaTextController?.text.isEmpty ?? true) {
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

              try {
                final newPassword = _model.txNovaSenhaTextController!.text;

                // Verificar se há uma sessão ativa (do token de recuperação)
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
                    _model.currentState = RecuperarSenhaState.emailInput;
                  });
                  return;
                }

                // Atualizar senha usando o Supabase
                await SupaFlow.client.auth.updateUser(
                  UserAttributes(password: newPassword),
                );

                safeSetState(() {
                  _model.currentState = RecuperarSenhaState.sucesso;
                });
              } catch (e) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Erro ao redefinir senha: ${e.toString()}'),
                  ),
                );
              }
            },
            text: 'Redefinir',
            options: FFButtonOptions(
              width: double.infinity,
              height: 54.0,
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                    ),
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
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                    ),
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

  Widget _buildSucessoState() {
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
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w600,
                  ),
                  fontSize: 24.0,
                  letterSpacing: 0.0,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0.0, 24.0, 0.0, 0.0),
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(16.0, 12.0, 16.0, 12.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F5E9),
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(
                color: const Color(0xFF90C74F),
                width: 1.0,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.check_circle_outline,
                  color: Color(0xFF90C74F),
                  size: 24.0,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(12.0, 0.0, 0.0, 0.0),
                    child: Text(
                      'Senha redefinida com sucesso!',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                            ),
                            color: const Color(0xFF2E7D32),
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
            'Sua senha foi atualizada. Você já pode fazer login com sua nova senha.',
            style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                  ),
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
              context.goNamed(LoginWidget.routeName);
            },
            text: 'Ir para o login',
            options: FFButtonOptions(
              width: double.infinity,
              height: 54.0,
              padding: const EdgeInsetsDirectional.fromSTEB(16.0, 0.0, 16.0, 0.0),
              iconPadding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
              color: FlutterFlowTheme.of(context).primary,
              textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                    font: GoogleFonts.interTight(
                      fontWeight: FontWeight.w600,
                    ),
                    color: Colors.white,
                    letterSpacing: 0.0,
                  ),
              elevation: 0.0,
              borderRadius: BorderRadius.circular(12.0),
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
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Builder(
                                  builder: (context) {
                                    switch (_model.currentState) {
                                      case RecuperarSenhaState.emailInput:
                                        return _buildEmailInputState();
                                      case RecuperarSenhaState.emailEnviado:
                                        return _buildEmailEnviadoState();
                                      case RecuperarSenhaState.redefinirSenha:
                                        return _buildRedefinirSenhaState();
                                      case RecuperarSenhaState.sucesso:
                                        return _buildSucessoState();
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
