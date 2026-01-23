import '/auth/supabase_auth/auth_util.dart';
import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/pg_contas/pg_users_admin/pp_novo_user/pp_novo_user_widget.dart';
import '/pg_contas/pg_users_admin/pp_detalhes_user/pp_detalhes_user_widget.dart';
import '/pg_contas/pp_alterar_senha/pp_alterar_senha_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pg_contas_model.dart';
export 'pg_contas_model.dart';

class PgContasWidget extends StatefulWidget {
  const PgContasWidget({super.key});

  @override
  State<PgContasWidget> createState() => _PgContasWidgetState();
}

class _PgContasWidgetState extends State<PgContasWidget>
    with TickerProviderStateMixin {
  late PgContasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgContasModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 2,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.txNomeTextController ??= TextEditingController(
      text: FFAppState().user.nome,
    );
    _model.txNomeFocusNode ??= FocusNode();

    _model.txEmailTextController ??= TextEditingController(
      text: FFAppState().user.email,
    );
    _model.txEmailFocusNode ??= FocusNode();

    _model.txSenhaTextController ??= TextEditingController();
    _model.txSenhaFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback(
      (_) => safeSetState(() {
        _model.txSenhaTextController?.text = '************';
      }),
    );
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Conta',
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                    font: GoogleFonts.inter(
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                    fontSize: 24.0,
                    letterSpacing: 0.0,
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  Align(
                    alignment: const Alignment(-1.0, 0),
                    child: TabBar(
                      isScrollable: true,
                      labelColor: const Color(0xFF323234),
                      unselectedLabelColor: const Color(0xFF323234),
                      labelPadding: const EdgeInsetsDirectional.fromSTEB(
                        24.0,
                        0.0,
                        24.0,
                        0.0,
                      ),
                      labelStyle: FlutterFlowTheme.of(
                        context,
                      ).titleMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).titleMedium.fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      unselectedLabelStyle: FlutterFlowTheme.of(
                        context,
                      ).titleMedium.override(
                        font: GoogleFonts.interTight(
                          fontWeight: FontWeight.normal,
                          fontStyle:
                              FlutterFlowTheme.of(
                                context,
                              ).titleMedium.fontStyle,
                        ),
                        fontSize: 14.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleMedium.fontStyle,
                      ),
                      indicatorColor: const Color(0xFF90C74F),
                      indicatorWeight: 2.0,
                      tabs: const [Tab(text: 'Perfil'), Tab(text: 'Equipe')],
                      controller: _model.tabBarController,
                      onTap: (i) async {
                        [() async {}, () async {}][i]();
                      },
                    ),
                  ),
                  Expanded(
                    child: TabBarView(
                      controller: _model.tabBarController,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            24.0,
                            0.0,
                            24.0,
                          ),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: const Color(0xFFE5E6E6),
                              ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsets.all(24.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Container(
                                          width: 143.0,
                                          height: 143.0,
                                          decoration: const BoxDecoration(
                                            gradient: LinearGradient(
                                              colors: [
                                                Color(0x9990C74F),
                                                Color(0x6B00BDF2),
                                              ],
                                              stops: [0.0, 1.0],
                                              begin: AlignmentDirectional(
                                                0.0,
                                                -1.0,
                                              ),
                                              end: AlignmentDirectional(0, 1.0),
                                            ),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                              color: Colors.transparent,
                                              shape: BoxShape.circle,
                                            ),
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                14.0,
                                              ),
                                              child: Container(
                                                width: 200.0,
                                                height: 200.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    valueOrDefault<String>(
                                                      FFAppState()
                                                          .user
                                                          .fotoPerfil,
                                                      'https://picsum.photos/seed/805/600',
                                                    ),
                                                    'https://picsum.photos/seed/805/600',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            final selectedMedia =
                                                await selectMedia(
                                                  storageFolderPath:
                                                      'foto_perfil',
                                                  imageQuality: 70,
                                                  mediaSource:
                                                      MediaSource.photoGallery,
                                                  multiImage: false,
                                                );
                                            if (selectedMedia != null &&
                                                selectedMedia.every(
                                                  (m) => validateFileFormat(
                                                    m.storagePath,
                                                    context,
                                                  ),
                                                )) {
                                              safeSetState(
                                                () =>
                                                    _model.isDataUploading_uploadDataFch =
                                                        true,
                                              );
                                              var selectedUploadedFiles =
                                                  <FFUploadedFile>[];

                                              var downloadUrls = <String>[];
                                              try {
                                                selectedUploadedFiles =
                                                    selectedMedia
                                                        .map(
                                                          (m) => FFUploadedFile(
                                                            name:
                                                                m.storagePath
                                                                    .split('/')
                                                                    .last,
                                                            bytes: m.bytes,
                                                            height:
                                                                m
                                                                    .dimensions
                                                                    ?.height,
                                                            width:
                                                                m
                                                                    .dimensions
                                                                    ?.width,
                                                            blurHash:
                                                                m.blurHash,
                                                            originalFilename:
                                                                m.originalFilename,
                                                          ),
                                                        )
                                                        .toList();

                                                downloadUrls =
                                                    await uploadSupabaseStorageFiles(
                                                      bucketName: 'midias',
                                                      selectedFiles:
                                                          selectedMedia,
                                                    );
                                              } finally {
                                                _model.isDataUploading_uploadDataFch =
                                                    false;
                                              }
                                              if (selectedUploadedFiles
                                                          .length ==
                                                      selectedMedia.length &&
                                                  downloadUrls.length ==
                                                      selectedMedia.length) {
                                                safeSetState(() {
                                                  _model.uploadedLocalFile_uploadDataFch =
                                                      selectedUploadedFiles
                                                          .first;
                                                  _model.uploadedFileUrl_uploadDataFch =
                                                      downloadUrls.first;
                                                });
                                              } else {
                                                safeSetState(() {});
                                                return;
                                              }
                                            }

                                            await UsersTable().update(
                                              data: {
                                                'foto':
                                                    _model
                                                        .uploadedFileUrl_uploadDataFch,
                                              },
                                              matchingRows:
                                                  (rows) => rows.eqOrNull(
                                                    'id',
                                                    currentUserUid,
                                                  ),
                                            );
                                            FFAppState().updateUserStruct(
                                              (e) =>
                                                  e
                                                    ..fotoPerfil =
                                                        _model
                                                            .uploadedFileUrl_uploadDataFch,
                                            );
                                            FFAppState().update(() {});
                                          },
                                          child: Text(
                                            'Alterar foto de perfil',
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
                                      ].divide(const SizedBox(height: 16.0)),
                                    ),
                                    Container(
                                      width: 472.0,
                                      constraints: const BoxConstraints(
                                        maxWidth: 472.0,
                                      ),
                                      decoration: const BoxDecoration(),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Nome',
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
                                                          .txNomeTextController,
                                                  focusNode:
                                                      _model.txNomeFocusNode,
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
                                                                )
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    hintText: 'Nome',
                                                    hintStyle: FlutterFlowTheme.of(
                                                      context,
                                                    ).labelMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color: const Color(
                                                        0xFFB1B3B4,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                color: Color(
                                                                  0xFFE5E6E6,
                                                                ),
                                                                width: 1.0,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.0,
                                                              ),
                                                        ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                color: Color(
                                                                  0xFFE5E6E6,
                                                                ),
                                                                width: 1.0,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.0,
                                                              ),
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
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
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
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
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
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .txNomeTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ].divide(
                                              const SizedBox(height: 8.0),
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
                                                          .txEmailTextController,
                                                  focusNode:
                                                      _model.txEmailFocusNode,
                                                  autofocus: false,
                                                  enabled: true,
                                                  readOnly: true,
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
                                                                )
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    hintText: 'E-mail',
                                                    hintStyle: FlutterFlowTheme.of(
                                                      context,
                                                    ).labelMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      color: const Color(
                                                        0xFFB1B3B4,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .labelMedium
                                                              .fontStyle,
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                color: Color(
                                                                  0xFFE5E6E6,
                                                                ),
                                                                width: 1.0,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.0,
                                                              ),
                                                        ),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                          borderSide:
                                                              const BorderSide(
                                                                color: Color(
                                                                  0xFFE5E6E6,
                                                                ),
                                                                width: 1.0,
                                                              ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.0,
                                                              ),
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
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
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
                                                      0xFFE5E6E6,
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
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
                                                  enableInteractiveSelection:
                                                      true,
                                                  validator: _model
                                                      .txEmailTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                            ].divide(
                                              const SizedBox(height: 8.0),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  0.0,
                                                  0.0,
                                                  24.0,
                                                ),
                                            child: Column(
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
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
                                                            .txSenhaTextController,
                                                    focusNode:
                                                        _model.txSenhaFocusNode,
                                                    autofocus: false,
                                                    enabled: true,
                                                    readOnly: true,
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
                                                                  )
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      hintText: 'E-mail',
                                                      hintStyle: FlutterFlowTheme.of(
                                                        context,
                                                      ).labelMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .labelMedium
                                                                  .fontWeight,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .labelMedium
                                                                  .fontStyle,
                                                        ),
                                                        color: const Color(
                                                          0xFFB1B3B4,
                                                        ),
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .labelMedium
                                                                .fontStyle,
                                                      ),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                  color: Color(
                                                                    0xFFE5E6E6,
                                                                  ),
                                                                  width: 1.0,
                                                                ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  8.0,
                                                                ),
                                                          ),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                  color: Color(
                                                                    0xFFE5E6E6,
                                                                  ),
                                                                  width: 1.0,
                                                                ),
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                  8.0,
                                                                ),
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
                                                            BorderRadius.circular(
                                                              8.0,
                                                            ),
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
                                                        0xFFE5E6E6,
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyMedium.override(
                                                      font: GoogleFonts.inter(
                                                        fontWeight:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodyMedium
                                                                .fontWeight,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    cursorColor:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).primaryText,
                                                    enableInteractiveSelection:
                                                        true,
                                                    validator: _model
                                                        .txSenhaTextControllerValidator
                                                        .asValidator(context),
                                                  ),
                                                ),
                                                Builder(
                                                  builder:
                                                      (context) => InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          await showDialog(
                                                            context: context,
                                                            builder: (
                                                              dialogContext,
                                                            ) {
                                                              return Dialog(
                                                                elevation: 0,
                                                                insetPadding:
                                                                    EdgeInsets
                                                                        .zero,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                      0.0,
                                                                      0.0,
                                                                    ).resolve(
                                                                      Directionality.of(
                                                                        context,
                                                                      ),
                                                                    ),
                                                                child: const WebViewAware(
                                                                  child:
                                                                      PpAlterarSenhaWidget(),
                                                                ),
                                                              );
                                                            },
                                                          );
                                                        },
                                                        child: Text(
                                                          'Alterar senha',
                                                          style: FlutterFlowTheme.of(
                                                            context,
                                                          ).bodyMedium.override(
                                                            font: GoogleFonts.inter(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontStyle:
                                                                  FlutterFlowTheme.of(
                                                                        context,
                                                                      )
                                                                      .bodyMedium
                                                                      .fontStyle,
                                                            ),
                                                            color: const Color(
                                                              0xFF007191,
                                                            ),
                                                            fontSize: 16.0,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            fontStyle:
                                                                FlutterFlowTheme.of(
                                                                      context,
                                                                    )
                                                                    .bodyMedium
                                                                    .fontStyle,
                                                          ),
                                                        ),
                                                      ),
                                                ),
                                              ].divide(
                                                const SizedBox(height: 8.0),
                                              ),
                                            ),
                                          ),
                                          FFButtonWidget(
                                            onPressed: () async {
                                              FFAppState().updateUserStruct(
                                                (e) =>
                                                    e
                                                      ..nome =
                                                          _model
                                                              .txNomeTextController
                                                              .text,
                                              );
                                              FFAppState().update(() {});
                                              await UsersTable().update(
                                                data: {
                                                  'nome':
                                                      _model
                                                          .txNomeTextController
                                                          .text,
                                                },
                                                matchingRows:
                                                    (rows) => rows.eqOrNull(
                                                      'id',
                                                      currentUserUid,
                                                    ),
                                              );
                                            },
                                            text: 'Salvar alterações',
                                            options: FFButtonOptions(
                                              height: 40.0,
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
                                              borderRadius:
                                                  BorderRadius.circular(12.0),
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 16.0)),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 24.0)),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            24.0,
                            0.0,
                            24.0,
                          ),
                          child: Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              border: Border.all(
                                color: const Color(0xFFE5E6E6),
                              ),
                            ),
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  24.0,
                                  24.0,
                                  24.0,
                                  0.0,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Equipe',
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
                                            fontSize: 20.0,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                            fontStyle:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.fontStyle,
                                          ),
                                        ),
                                        Builder(
                                          builder:
                                              (context) => FFButtonWidget(
                                                onPressed: () async {
                                                  await showDialog(
                                                    context: context,
                                                    builder: (dialogContext) {
                                                      return Dialog(
                                                        elevation: 0,
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        alignment:
                                                            const AlignmentDirectional(
                                                              0.0,
                                                              0.0,
                                                            ).resolve(
                                                              Directionality.of(
                                                                context,
                                                              ),
                                                            ),
                                                        child: const WebViewAware(
                                                          child:
                                                              PpNovoUserWidget(),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                text: 'Novo usuário',
                                                icon: const Icon(
                                                  Icons.add,
                                                  size: 15.0,
                                                ),
                                                options: FFButtonOptions(
                                                  height: 40.0,
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
                                                              )
                                                              .titleSmall
                                                              .fontWeight,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .titleSmall
                                                              .fontStyle,
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                ),
                                              ),
                                        ),
                                      ],
                                    ),
                                    Flexible(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                width: 50.0,
                                                height: 50.0,
                                                decoration:
                                                    const BoxDecoration(),
                                              ),
                                              Container(
                                                width: 407.0,
                                                height: 48.0,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                        -1.0,
                                                        0.0,
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          12.0,
                                                          0.0,
                                                          12.0,
                                                          0.0,
                                                        ),
                                                    child: Text(
                                                      'Usuário',
                                                      style: FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 280.0,
                                                height: 48.0,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                        -1.0,
                                                        0.0,
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          12.0,
                                                          0.0,
                                                          12.0,
                                                          0.0,
                                                        ),
                                                    child: Text(
                                                      'Criado em',
                                                      style: FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                width: 280.0,
                                                height: 48.0,
                                                decoration:
                                                    const BoxDecoration(),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                        -1.0,
                                                        0.0,
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          12.0,
                                                          0.0,
                                                          12.0,
                                                          0.0,
                                                        ),
                                                    child: Text(
                                                      'Nível de acesso',
                                                      style: FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.override(
                                                        font: GoogleFonts.inter(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontStyle:
                                                              FlutterFlowTheme.of(
                                                                    context,
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                        fontSize: 16.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .bodyMedium
                                                                .fontStyle,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          const Divider(
                                            height: 1.0,
                                            thickness: 2.0,
                                            color: Color(0xFFE5E6E6),
                                          ),
                                          Flexible(
                                            child: FutureBuilder<
                                              List<UsersRow>
                                            >(
                                              future: UsersTable().queryRows(
                                                queryFn:
                                                    (q) => q
                                                        .inFilter('tipo_user', [
                                                          'Admin',
                                                          'Moderador',
                                                        ])
                                                        .order('created_at'),
                                              ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Center(
                                                    child: SizedBox(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      child: CircularProgressIndicator(
                                                        valueColor:
                                                            AlwaysStoppedAnimation<
                                                              Color
                                                            >(
                                                              FlutterFlowTheme.of(
                                                                context,
                                                              ).primary,
                                                            ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<UsersRow>
                                                listViewUsersRowList =
                                                    snapshot.data!;

                                                return ListView.separated(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                        0,
                                                        0,
                                                        0,
                                                        24.0,
                                                      ),
                                                  shrinkWrap: true,
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      listViewUsersRowList
                                                          .length,
                                                  separatorBuilder:
                                                      (_, __) => const SizedBox(
                                                        height: 12.0,
                                                      ),
                                                  itemBuilder: (
                                                    context,
                                                    listViewIndex,
                                                  ) {
                                                    final listViewUsersRow =
                                                        listViewUsersRowList[listViewIndex];
                                                    return InkWell(
                                                      splashColor:
                                                          Colors.transparent,
                                                      focusColor:
                                                          Colors.transparent,
                                                      hoverColor:
                                                          Colors.transparent,
                                                      highlightColor:
                                                          Colors.transparent,
                                                      onTap: () async {
                                                        await showDialog(
                                                          context: context,
                                                          builder: (
                                                            dialogContext,
                                                          ) {
                                                            return Dialog(
                                                              elevation: 0,
                                                              insetPadding:
                                                                  EdgeInsets
                                                                      .zero,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              alignment:
                                                                  const AlignmentDirectional(
                                                                    0.0,
                                                                    0.0,
                                                                  ).resolve(
                                                                    Directionality.of(
                                                                      context,
                                                                    ),
                                                                  ),
                                                              child: WebViewAware(
                                                                child: PpDetalhesUserWidget(
                                                                  user:
                                                                      listViewUsersRow,
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Container(
                                                                width: 50.0,
                                                                height: 50.0,
                                                                clipBehavior:
                                                                    Clip.antiAlias,
                                                                decoration:
                                                                    const BoxDecoration(
                                                                      shape:
                                                                          BoxShape
                                                                              .circle,
                                                                    ),
                                                                child: Image.network(
                                                                  valueOrDefault<
                                                                    String
                                                                  >(
                                                                    valueOrDefault<
                                                                      String
                                                                    >(
                                                                      listViewUsersRow
                                                                          .foto,
                                                                      'https://picsum.photos/seed/779/600',
                                                                    ),
                                                                    'https://picsum.photos/seed/779/600',
                                                                  ),
                                                                  fit:
                                                                      BoxFit
                                                                          .cover,
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 407.0,
                                                                height: 48.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .min,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .center,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0,
                                                                          ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                        ),
                                                                        child: Text(
                                                                          valueOrDefault<
                                                                            String
                                                                          >(
                                                                            listViewUsersRow.nome,
                                                                            'Nome',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(
                                                                            context,
                                                                          ).bodyMedium.override(
                                                                            font: GoogleFonts.inter(
                                                                              fontWeight:
                                                                                  FontWeight.normal,
                                                                              fontStyle:
                                                                                  FlutterFlowTheme.of(
                                                                                    context,
                                                                                  ).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                14.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(
                                                                                  context,
                                                                                ).bodyMedium.fontStyle,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          const AlignmentDirectional(
                                                                            -1.0,
                                                                            0.0,
                                                                          ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                        ),
                                                                        child: Text(
                                                                          valueOrDefault<
                                                                            String
                                                                          >(
                                                                            listViewUsersRow.email,
                                                                            'email@email.com',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(
                                                                            context,
                                                                          ).bodyMedium.override(
                                                                            font: GoogleFonts.inter(
                                                                              fontWeight:
                                                                                  FontWeight.normal,
                                                                              fontStyle:
                                                                                  FlutterFlowTheme.of(
                                                                                    context,
                                                                                  ).bodyMedium.fontStyle,
                                                                            ),
                                                                            fontSize:
                                                                                12.0,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(
                                                                                  context,
                                                                                ).bodyMedium.fontStyle,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ].divide(
                                                                    const SizedBox(
                                                                      height:
                                                                          2.0,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 280.0,
                                                                height: 48.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0,
                                                                      ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                        ),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                        String
                                                                      >(
                                                                        dateTimeFormat(
                                                                          "dd/MM/yyyy",
                                                                          listViewUsersRow
                                                                              .createdAt,
                                                                          locale:
                                                                              FFLocalizations.of(
                                                                                context,
                                                                              ).languageCode,
                                                                        ),
                                                                        '00/00/0000',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle:
                                                                              FlutterFlowTheme.of(
                                                                                context,
                                                                              ).bodyMedium.fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 280.0,
                                                                height: 48.0,
                                                                decoration:
                                                                    const BoxDecoration(),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0,
                                                                      ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                          12.0,
                                                                          0.0,
                                                                          12.0,
                                                                          0.0,
                                                                        ),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                        String
                                                                      >(
                                                                        listViewUsersRow
                                                                            .tipoUser,
                                                                        'Nível',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          fontStyle:
                                                                              FlutterFlowTheme.of(
                                                                                context,
                                                                              ).bodyMedium.fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            14.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          const Divider(
                                                            height: 1.0,
                                                            thickness: 2.0,
                                                            color: Color(
                                                              0xFFE5E6E6,
                                                            ),
                                                          ),
                                                        ].divide(
                                                          const SizedBox(
                                                            height: 12.0,
                                                          ),
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ].divide(const SizedBox(height: 12.0)),
                                      ),
                                    ),
                                  ].divide(const SizedBox(height: 24.0)),
                                ),
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
          ].divide(const SizedBox(height: 24.0)),
        ),
      ),
    );
  }
}
