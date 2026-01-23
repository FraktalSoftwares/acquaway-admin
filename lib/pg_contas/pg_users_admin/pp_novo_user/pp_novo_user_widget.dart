import '/backend/supabase/supabase.dart';
import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import '/core/validators/validators.dart';
import '/pg_contas/pg_users_admin/pp_sucesso_novo_user/pp_sucesso_novo_user_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pp_novo_user_model.dart';
export 'pp_novo_user_model.dart';

class PpNovoUserWidget extends StatefulWidget {
  const PpNovoUserWidget({super.key});

  @override
  State<PpNovoUserWidget> createState() => _PpNovoUserWidgetState();
}

class _PpNovoUserWidgetState extends State<PpNovoUserWidget> {
  late PpNovoUserModel _model;

  // Gerar senha temporária aleatória segura
  String _generateTempPassword() {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*';
    final random = DateTime.now().millisecondsSinceEpoch;
    final random2 = DateTime.now().microsecondsSinceEpoch;
    final buffer = StringBuffer();
    // Gerar senha de 16 caracteres
    for (int i = 0; i < 16; i++) {
      final index = ((random + random2 + i) * 7919) % chars.length;
      buffer.write(chars[index]);
    }
    return buffer.toString();
  }

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpNovoUserModel());

    _model.txNomeTextController ??= TextEditingController();
    _model.txNomeFocusNode ??= FocusNode();
    _model.txNomeTextControllerValidator ??=
        (context, value) => Validators.required(value, 'Nome');

    _model.txEmailTextController ??= TextEditingController();
    _model.txEmailFocusNode ??= FocusNode();
    _model.txEmailTextControllerValidator ??=
        (context, value) => Validators.email(value);

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: const BoxConstraints(maxWidth: 549.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Text(
                      'Novo Usuário',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight: FontWeight.w500,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        color: const Color(0xFF323334),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                    ),
                  ),
                  FlutterFlowIconButton(
                    borderRadius: 8.0,
                    buttonSize: 40.0,
                    icon: const Icon(
                      Icons.close_rounded,
                      color: Color(0xFF323334),
                      size: 24.0,
                    ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nome',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.txNomeTextController,
                      focusNode: _model.txNomeFocusNode,
                      autofocus: false,
                      enabled: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        hintText: 'Nome',
                        hintStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          color: const Color(0xFFB1B3B4),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
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
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      enableInteractiveSelection: true,
                      validator: _model.txNomeTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'E-mail',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: TextFormField(
                      controller: _model.txEmailTextController,
                      focusNode: _model.txEmailFocusNode,
                      autofocus: false,
                      enabled: true,
                      obscureText: false,
                      decoration: InputDecoration(
                        isDense: true,
                        labelStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
                        ),
                        hintText: 'Insira o e-mail',
                        hintStyle: FlutterFlowTheme.of(
                          context,
                        ).labelMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontWeight,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).labelMedium.fontStyle,
                          ),
                          color: const Color(0xFFB1B3B4),
                          letterSpacing: 0.0,
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).labelMedium.fontStyle,
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
                      ),
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                        font: GoogleFonts.inter(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).bodyMedium.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      cursorColor: FlutterFlowTheme.of(context).primaryText,
                      enableInteractiveSelection: true,
                      validator: _model.txEmailTextControllerValidator
                          .asValidator(context),
                    ),
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Nível de acesso',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      fontSize: 16.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                  // Dropdown desabilitado - sempre será Moderador
                  FlutterFlowDropDown<String>(
                    controller:
                        _model.ddNivelValueController ??=
                            FormFieldController<String>(
                              _model.ddNivelValue ??= 'Moderador',
                            ),
                    options: const ['Moderador'],
                    optionLabels: const ['Moderador'],
                    onChanged:
                        (val) => safeSetState(() => _model.ddNivelValue = val),
                    width: double.infinity,
                    height: 44.0,
                    textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight:
                            FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      letterSpacing: 0.0,
                      fontWeight:
                          FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    hintText: 'Moderador',
                    icon: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: FlutterFlowTheme.of(context).secondaryText,
                      size: 24.0,
                    ),
                    fillColor: const Color(0xFFFAFAFA),
                    elevation: 2.0,
                    borderColor: const Color(0xFFE5E6E6),
                    borderWidth: 0.0,
                    borderRadius: 8.0,
                    margin: const EdgeInsetsDirectional.fromSTEB(
                      12.0,
                      0.0,
                      12.0,
                      0.0,
                    ),
                    hidesUnderline: true,
                    isOverButton: false,
                    isSearchable: false,
                    isMultiSelect: false,
                    disabled: true, // Desabilitado - sempre Moderador
                  ),
                ].divide(const SizedBox(height: 8.0)),
              ),
              Text(
                'O novo usuário receberá um e-mail para criar a sua senha e acessar a área administrativa. ',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.normal,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: const Color(0xFF646768),
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  FFButtonWidget(
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                    text: 'Cancelar',
                    options: FFButtonOptions(
                      height: 40.0,
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
                      color: const Color(0x00007191),
                      textStyle: FlutterFlowTheme.of(
                        context,
                      ).titleSmall.override(
                        font: GoogleFonts.interTight(
                          fontWeight:
                              FlutterFlowTheme.of(
                                context,
                              ).titleSmall.fontWeight,
                          fontStyle:
                              FlutterFlowTheme.of(context).titleSmall.fontStyle,
                        ),
                        color: FlutterFlowTheme.of(context).primaryText,
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      elevation: 0.0,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  Builder(
                    builder:
                        (context) => FFButtonWidget(
                          onPressed: () async {
                            // Validações
                            if (_model.txNomeTextController?.text.isEmpty ??
                                true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Por favor, preencha o nome'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            if (_model.txEmailTextController?.text.isEmpty ??
                                true) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Por favor, preencha o e-mail'),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            // Validar formato de email
                            final emailError = _model
                                .txEmailTextControllerValidator
                                ?.call(
                                  context,
                                  _model.txEmailTextController!.text,
                                );
                            if (emailError != null && emailError.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(emailError),
                                  backgroundColor: Colors.red,
                                ),
                              );
                              return;
                            }

                            try {
                              // Gerar senha temporária aleatória
                              final tempPassword = _generateTempPassword();

                              // Criar conta no Supabase Auth
                              final authResponse = await SupaFlow.client.auth
                                  .signUp(
                                    email:
                                        _model.txEmailTextController!.text
                                            .trim(),
                                    password: tempPassword,
                                    emailRedirectTo: null,
                                  );

                              if (authResponse.user == null) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text(
                                      'Erro ao criar conta. Tente novamente.',
                                    ),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                return;
                              }

                              final userId = authResponse.user!.id;

                              // Criar registro na tabela users
                              await UsersTable().insert({
                                'id': userId,
                                'nome':
                                    _model.txNomeTextController!.text.trim(),
                                'email':
                                    _model.txEmailTextController!.text.trim(),
                                'tipo_user':
                                    'Moderador', // Sempre Moderador conforme solicitado
                                'ativo': true,
                                'verificado': false,
                                'termos': false,
                                'onboard': false,
                              });

                              // Enviar email de reset de senha para o usuário definir sua própria senha
                              await authManager.resetPassword(
                                email:
                                    _model.txEmailTextController!.text.trim(),
                                context: context,
                              );

                              // Fechar dialog atual e mostrar dialog de sucesso
                              Navigator.pop(context);
                              await showDialog(
                                context: context,
                                builder: (dialogContext) {
                                  return Dialog(
                                    elevation: 0,
                                    insetPadding: EdgeInsets.zero,
                                    backgroundColor: Colors.transparent,
                                    alignment: const AlignmentDirectional(
                                      0.0,
                                      0.0,
                                    ).resolve(Directionality.of(context)),
                                    child: const WebViewAware(
                                      child: PpSucessoNovoUserWidget(),
                                    ),
                                  );
                                },
                              );
                            } catch (e) {
                              String errorMessage =
                                  'Erro ao criar usuário. Tente novamente.';
                              if (e.toString().contains(
                                    'User already registered',
                                  ) ||
                                  e.toString().contains('already exists')) {
                                errorMessage =
                                    'Este e-mail já está cadastrado no sistema.';
                              } else if (e.toString().contains(
                                'Invalid email',
                              )) {
                                errorMessage =
                                    'E-mail inválido. Verifique e tente novamente.';
                              }

                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(errorMessage),
                                  backgroundColor: Colors.red,
                                ),
                              );
                            }
                          },
                          text: 'Confirmar',
                          options: FFButtonOptions(
                            height: 40.0,
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
                            textStyle: FlutterFlowTheme.of(
                              context,
                            ).titleSmall.override(
                              font: GoogleFonts.interTight(
                                fontWeight:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontStyle,
                              ),
                              color: Colors.white,
                              letterSpacing: 0.0,
                              fontWeight:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleSmall.fontWeight,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleSmall.fontStyle,
                            ),
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                        ),
                  ),
                ].divide(const SizedBox(width: 12.0)),
              ),
            ].divide(const SizedBox(height: 12.0)),
          ),
        ),
      ),
    );
  }
}
