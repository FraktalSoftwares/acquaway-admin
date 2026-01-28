import '/auth/supabase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/core/validators/validators.dart';
import '/backend/supabase/supabase.dart';
import '/index.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'login_model.dart';
export 'login_model.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  static String routeName = 'login';
  static String routePath = '/login';

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  late LoginModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => LoginModel());

    _model.txEmailLoginTextController ??= TextEditingController();
    _model.txEmailLoginFocusNode ??= FocusNode();
    _model.txEmailLoginTextControllerValidator ??=
        (context, value) => Validators.email(value);

    _model.txSenhaLoginTextController ??= TextEditingController();
    _model.txSenhaLoginFocusNode ??= FocusNode();
    _model.txSenhaLoginTextControllerValidator ??=
        (context, value) => Validators.required(value, 'Senha');

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
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
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.network(
                                        'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/29t30mo7xge1/Logo_(3).png',
                                        height: 53.0,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'E-mail',
                                          style: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.fontStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                                _model
                                                    .txEmailLoginTextController,
                                            focusNode:
                                                _model.txEmailLoginFocusNode,
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
                                              hintText: 'E-mail',
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
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFE5E6E6),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.0,
                                                        ),
                                                  ),
                                              filled: true,
                                              fillColor: const Color(
                                                0xFFFAFAFA,
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.person_outlined,
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyMedium.fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.fontStyle,
                                            ),
                                            cursorColor:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txEmailLoginTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Senha',
                                          style: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.fontStyle,
                                            ),
                                            fontSize: 16.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.fontStyle,
                                          ),
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          child: TextFormField(
                                            controller:
                                                _model
                                                    .txSenhaLoginTextController,
                                            focusNode:
                                                _model.txSenhaLoginFocusNode,
                                            autofocus: false,
                                            enabled: true,
                                            obscureText:
                                                !_model.txSenhaLoginVisibility,
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
                                              hintText: 'Senha',
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
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: const BorderSide(
                                                  color: Color(0xFFE5E6E6),
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              errorBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                  color:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).error,
                                                  width: 1.0,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                              ),
                                              focusedErrorBorder:
                                                  OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).error,
                                                      width: 1.0,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.0,
                                                        ),
                                                  ),
                                              filled: true,
                                              fillColor: const Color(
                                                0xFFFAFAFA,
                                              ),
                                              prefixIcon: const Icon(
                                                Icons.lock_outlined,
                                              ),
                                              suffixIcon: InkWell(
                                                onTap: () async {
                                                  safeSetState(
                                                    () =>
                                                        _model.txSenhaLoginVisibility =
                                                            !_model
                                                                .txSenhaLoginVisibility,
                                                  );
                                                },
                                                focusNode: FocusNode(
                                                  skipTraversal: true,
                                                ),
                                                child: Icon(
                                                  _model.txSenhaLoginVisibility
                                                      ? Icons
                                                          .visibility_outlined
                                                      : Icons
                                                          .visibility_off_outlined,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                            style: FlutterFlowTheme.of(
                                              context,
                                            ).bodyMedium.override(
                                              font: GoogleFonts.inter(
                                                fontWeight:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyMedium.fontWeight,
                                                fontStyle:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyMedium.fontStyle,
                                              ),
                                              letterSpacing: 0.0,
                                              fontWeight:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.fontWeight,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.fontStyle,
                                            ),
                                            cursorColor:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primaryText,
                                            enableInteractiveSelection: true,
                                            validator: _model
                                                .txSenhaLoginTextControllerValidator
                                                .asValidator(context),
                                          ),
                                        ),
                                      ].divide(const SizedBox(height: 8.0)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.goNamed(
                                            RecuperarSenhaWidget.routeName,
                                          );
                                        },
                                        child: Text(
                                          'Esqueci minha senha',
                                          style: FlutterFlowTheme.of(
                                            context,
                                          ).bodyMedium.override(
                                            font: GoogleFonts.inter(
                                              fontWeight: FontWeight.w500,
                                              fontStyle:
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.fontStyle,
                                            ),
                                            color: const Color(0xFF007191),
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.fontStyle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    FFButtonWidget(
                                      onPressed: () async {
                                        GoRouter.of(context).prepareAuthEvent();

                                        final user = await authManager
                                            .signInWithEmail(
                                              context,
                                              _model
                                                  .txEmailLoginTextController
                                                  .text,
                                              _model
                                                  .txSenhaLoginTextController
                                                  .text,
                                            );
                                        if (user == null) {
                                          return;
                                        }

                                        // Verificar se o usuário tem permissão (Admin ou Moderador)
                                        try {
                                          final userRows = await UsersTable().queryRows(
                                            queryFn: (q) => q.eqOrNull(
                                              'id',
                                              currentUserUid,
                                            ),
                                          );

                                          if (userRows.isEmpty) {
                                            // Usuário não encontrado na tabela
                                            await authManager.signOut();
                                            GoRouter.of(context).clearRedirectLocation();
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Usuário não encontrado. Entre em contato com o administrador.',
                                                  ),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                            return;
                                          }

                                          final tipoUser = userRows.firstOrNull?.tipoUser;
                                          
                                          // Verificar se é Admin ou Moderador
                                          if (tipoUser != 'Admin' && tipoUser != 'Moderador') {
                                            // Usuário não tem permissão - deslogar
                                            await authManager.signOut();
                                            GoRouter.of(context).clearRedirectLocation();
                                            if (context.mounted) {
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                const SnackBar(
                                                  content: Text(
                                                    'Você não tem permissão para acessar o sistema. Apenas usuários Admin e Moderador podem acessar.',
                                                  ),
                                                  backgroundColor: Colors.red,
                                                  duration: Duration(seconds: 5),
                                                ),
                                              );
                                            }
                                            return;
                                          }

                                          // Usuário tem permissão - permitir acesso
                                          context.goNamedAuth(
                                            HomeWidget.routeName,
                                            context.mounted,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  const TransitionInfo(
                                                    hasTransition: true,
                                                    transitionType:
                                                        PageTransitionType.fade,
                                                    duration: Duration(
                                                      milliseconds: 0,
                                                    ),
                                                  ),
                                            },
                                          );
                                        } catch (e) {
                                          // Erro ao buscar dados do usuário
                                          await authManager.signOut();
                                          GoRouter.of(context).clearRedirectLocation();
                                          if (context.mounted) {
                                            ScaffoldMessenger.of(context).showSnackBar(
                                              const SnackBar(
                                                content: Text(
                                                  'Erro ao verificar permissões. Tente novamente.',
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            );
                                          }
                                        }
                                      },
                                      text: 'Entrar',
                                      options: FFButtonOptions(
                                        width: double.infinity,
                                        height: 54.0,
                                        padding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              16.0,
                                              0.0,
                                              16.0,
                                              0.0,
                                            ),
                                        iconPadding:
                                            const EdgeInsetsDirectional.fromSTEB(
                                              0.0,
                                              0.0,
                                              0.0,
                                              0.0,
                                            ),
                                        color:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).primary,
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
                                        borderRadius: BorderRadius.circular(
                                          12.0,
                                        ),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 24.0)),
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
