import '/backend/supabase/supabase.dart';
import '/componentes/pp_detalhe_viagem/pp_detalhe_viagem_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pg_usuarios/pp_detalhe_embarcacao/pp_detalhe_embarcacao_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import '/core/utils/logger.dart';
import 'dart:async';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pg_usuarios_model.dart';
export 'pg_usuarios_model.dart';

class PgUsuariosWidget extends StatefulWidget {
  const PgUsuariosWidget({super.key});

  @override
  State<PgUsuariosWidget> createState() => _PgUsuariosWidgetState();
}

class _PgUsuariosWidgetState extends State<PgUsuariosWidget>
    with TickerProviderStateMixin {
  late PgUsuariosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgUsuariosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.userSelecionado = null;
      _model.empresaSelecionada = null;
      _model.ordenacaoSelecionada = 'Ordem alfabética A-Z';
      _model.updatePage(() {});
    });

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

    _model.txBuscaAdminEmpresaTextController1 ??= TextEditingController();
    _model.txBuscaAdminEmpresaFocusNode1 ??= FocusNode();

    _model.txBuscaPilotosIndiTextController ??= TextEditingController();
    _model.txBuscaPilotosIndiFocusNode ??= FocusNode();

    _model.txBuscaPilotosEmpresaTextController ??= TextEditingController();
    _model.txBuscaPilotosEmpresaFocusNode ??= FocusNode();

    _model.txBuscaAdminEmpresaTextController2 ??= TextEditingController();
    _model.txBuscaAdminEmpresaFocusNode2 ??= FocusNode();

    _model.ddOrdenacaoValueController ??= FormFieldController<String>(
      'Ordem alfabética A-Z',
    );

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (_model.userSelecionado == null || _model.userSelecionado == '')
          Container(
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
                        'Usuários',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                          font: GoogleFonts.inter(
                            fontWeight: FontWeight.w500,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
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
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleMedium.fontStyle,
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
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleMedium.fontStyle,
                            ),
                            indicatorColor: const Color(0xFF90C74F),
                            indicatorWeight: 2.0,
                            tabs: const [
                              Tab(text: 'Administradores de empresas'),
                              Tab(text: 'Pilotos individuais'),
                              Tab(text: 'Pilotos de empresas'),
                            ],
                            controller: _model.tabBarController,
                            onTap: (i) async {
                              [() async {}, () async {}, () async {}][i]();
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                              SizedBox(
                                                width: 320.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model
                                                          .txBuscaAdminEmpresaTextController1,
                                                  focusNode:
                                                      _model
                                                          .txBuscaAdminEmpresaFocusNode1,
                                                  onChanged:
                                                      (
                                                        _,
                                                      ) => EasyDebounce.debounce(
                                                        '_model.txBuscaAdminEmpresaTextController1',
                                                        const Duration(
                                                          milliseconds: 500,
                                                        ),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
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
                                                    hintText: 'Buscar usuário',
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
                                                                  0x00000000,
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
                                                    fillColor:
                                                        Colors.transparent,
                                                    prefixIcon: const Icon(
                                                      Icons.search_rounded,
                                                      color: Color(0xFF4B4D4E),
                                                      size: 24.0,
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
                                                      .txBuscaAdminEmpresaTextController1Validator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xFFFAFAFA,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                      String
                                                    >(
                                                      controller:
                                                          _model.ddOrdenacaoValueController ??=
                                                              FormFieldController<
                                                                String
                                                              >(
                                                                _model.ordenacaoSelecionada ??=
                                                                    'Ordem alfabética A-Z',
                                                              ),
                                                      options: const [
                                                        'Ordem alfabética A-Z',
                                                        'Ordem alfabética Z-A',
                                                        'Acessos mais recentes',
                                                        'Acessos mais antigos',
                                                      ],
                                                      onChanged:
                                                          (
                                                            val,
                                                          ) => safeSetState(() {
                                                            _model.ordenacaoSelecionada =
                                                                val;
                                                          }),
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      textStyle: FlutterFlowTheme.of(
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
                                                      hintText: 'Ordenar por',
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: Color(
                                                          0xFF4B4D4E,
                                                        ),
                                                        size: 24.0,
                                                      ),
                                                      fillColor: const Color(
                                                        0xFFFAFAFA,
                                                      ),
                                                      elevation: 0.0,
                                                      borderColor: const Color(
                                                        0xFFE5E6E6,
                                                      ),
                                                      borderWidth: 1.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          const EdgeInsetsDirectional.fromSTEB(
                                                            12.0,
                                                            0.0,
                                                            12.0,
                                                            0.0,
                                                          ),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12.0),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await actions.exportUsers(
                                                        functions
                                                            .noventaDiasAtras(
                                                              getCurrentTimestamp,
                                                            ),
                                                        getCurrentTimestamp,
                                                        'Admin Empresa',
                                                      );
                                                    },
                                                    text: 'Baixar relatório',
                                                    icon: const Icon(
                                                      Icons
                                                          .file_download_outlined,
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
                                                      color: const Color(
                                                        0x00007191,
                                                      ),
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
                                                        color: const Color(
                                                          0xFF252627,
                                                        ),
                                                        letterSpacing: 0.0,
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
                                                      elevation: 0.0,
                                                      borderSide:
                                                          const BorderSide(
                                                            color: Color(
                                                              0xFF007191,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 50.0,
                                                      height: 50.0,
                                                      decoration:
                                                          const BoxDecoration(),
                                                    ),
                                                    Container(
                                                      width: 350.0,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 220.0,
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
                                                            'E-mail',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 150.0,
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
                                                            'Telefone',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 115.0,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                    key: ValueKey('admin_empresa_${_model.ordenacaoSelecionada}_${_model.txBuscaAdminEmpresaTextController1.text}'),
                                                    future: UsersTable().queryRows(
                                                      queryFn: (q) {
                                                        var query = q
                                                            .eqOrNull(
                                                              'tipo_user',
                                                              'Admin Empresa',
                                                            );
                                                        
                                                        // Aplicar filtro de busca apenas se houver texto
                                                        final buscaTexto = _model.txBuscaAdminEmpresaTextController1.text;
                                                        if (buscaTexto.isNotEmpty) {
                                                          query = query.ilike(
                                                            'nome',
                                                            '%$buscaTexto%',
                                                          );
                                                        }
                                                        
                                                        // Ordenação sempre por nome
                                                        final ordenacao =
                                                            _model
                                                                .ordenacaoSelecionada ??
                                                            'Ordem alfabética A-Z';
                                                        final ascending = ordenacao == 'Ordem alfabética A-Z' ||
                                                            ordenacao == 'Acessos mais recentes' ||
                                                            ordenacao == 'Acessos mais antigos';
                                                        
                                                        return query.order(
                                                          'nome',
                                                          ascending: ascending,
                                                        );
                                                      },
                                                    ),
                                                    builder: (
                                                      context,
                                                      snapshot,
                                                    ) {
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
                                                      lvAdminEmpresasUsersRowList =
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
                                                            lvAdminEmpresasUsersRowList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) =>
                                                                const SizedBox(
                                                                  height: 12.0,
                                                                ),
                                                        itemBuilder: (
                                                          context,
                                                          lvAdminEmpresasIndex,
                                                        ) {
                                                          final lvAdminEmpresasUsersRow =
                                                              lvAdminEmpresasUsersRowList[lvAdminEmpresasIndex];
                                                          return InkWell(
                                                            splashColor:
                                                                Colors
                                                                    .transparent,
                                                            focusColor:
                                                                Colors
                                                                    .transparent,
                                                            hoverColor:
                                                                Colors
                                                                    .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.userSelecionado =
                                                                  null;
                                                              _model.empresaSelecionada =
                                                                  null;
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                              _model.userSelecionado =
                                                                  lvAdminEmpresasUsersRow
                                                                      .id;
                                                              _model.empresaSelecionada =
                                                                  lvAdminEmpresasUsersRow
                                                                      .companiesId;
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                              safeSetState(
                                                                () =>
                                                                    _model.requestCompleter =
                                                                        null,
                                                              );
                                                              await _model
                                                                  .waitForRequestCompleted();
                                                              safeSetState(
                                                                () {},
                                                              );
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                      child: Image.network(
                                                                        valueOrDefault<
                                                                          String
                                                                        >(
                                                                          valueOrDefault<
                                                                            String
                                                                          >(
                                                                            lvAdminEmpresasUsersRow.foto,
                                                                            'https://picsum.photos/seed/779/600',
                                                                          ),
                                                                          'https://picsum.photos/seed/779/600',
                                                                        ),
                                                                        fit:
                                                                            BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          350.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment: const AlignmentDirectional(
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
                                                                                  lvAdminEmpresasUsersRow.nome,
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
                                                                        ].divide(
                                                                          const SizedBox(
                                                                            height:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          220.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvAdminEmpresasUsersRow.email,
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
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvAdminEmpresasUsersRow.telefone,
                                                                              '(00) 0 0000-0000',
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
                                                                      width:
                                                                          115.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              dateTimeFormat(
                                                                                "dd/MM/yyyy",
                                                                                lvAdminEmpresasUsersRow.createdAt,
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
                                                                      width:
                                                                          280.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvAdminEmpresasUsersRow.tipoUser,
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
                                                                  thickness:
                                                                      2.0,
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
                                              ],
                                            ),
                                          ),
                                        ],
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                              SizedBox(
                                                width: 320.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model
                                                          .txBuscaPilotosIndiTextController,
                                                  focusNode:
                                                      _model
                                                          .txBuscaPilotosIndiFocusNode,
                                                  onChanged:
                                                      (
                                                        _,
                                                      ) => EasyDebounce.debounce(
                                                        '_model.txBuscaPilotosIndiTextController',
                                                        const Duration(
                                                          milliseconds: 500,
                                                        ),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
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
                                                    hintText: 'Buscar usuário',
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
                                                                  0x00000000,
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
                                                    fillColor:
                                                        Colors.transparent,
                                                    prefixIcon: const Icon(
                                                      Icons.search_rounded,
                                                      color: Color(0xFF4B4D4E),
                                                      size: 24.0,
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
                                                      .txBuscaPilotosIndiTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xFFFAFAFA,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                      String
                                                    >(
                                                      controller:
                                                          _model.ddOrdenacaoValueController ??=
                                                              FormFieldController<
                                                                String
                                                              >(
                                                                _model.ordenacaoSelecionada ??=
                                                                    'Ordem alfabética A-Z',
                                                              ),
                                                      options: const [
                                                        'Ordem alfabética A-Z',
                                                        'Ordem alfabética Z-A',
                                                        'Acessos mais recentes',
                                                        'Acessos mais antigos',
                                                      ],
                                                      onChanged:
                                                          (
                                                            val,
                                                          ) => safeSetState(() {
                                                            _model.ordenacaoSelecionada =
                                                                val;
                                                          }),
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      textStyle: FlutterFlowTheme.of(
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
                                                      hintText: 'Ordenar por',
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: Color(
                                                          0xFF4B4D4E,
                                                        ),
                                                        size: 24.0,
                                                      ),
                                                      fillColor: const Color(
                                                        0xFFFAFAFA,
                                                      ),
                                                      elevation: 0.0,
                                                      borderColor: const Color(
                                                        0xFFE5E6E6,
                                                      ),
                                                      borderWidth: 1.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          const EdgeInsetsDirectional.fromSTEB(
                                                            12.0,
                                                            0.0,
                                                            12.0,
                                                            0.0,
                                                          ),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12.0),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await actions.exportUsers(
                                                        functions
                                                            .noventaDiasAtras(
                                                              getCurrentTimestamp,
                                                            ),
                                                        getCurrentTimestamp,
                                                        'Piloto Individual',
                                                      );
                                                    },
                                                    text: 'Baixar relatório',
                                                    icon: const Icon(
                                                      Icons
                                                          .file_download_outlined,
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
                                                      color: const Color(
                                                        0x00007191,
                                                      ),
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
                                                        color: const Color(
                                                          0xFF252627,
                                                        ),
                                                        letterSpacing: 0.0,
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
                                                      elevation: 0.0,
                                                      borderSide:
                                                          const BorderSide(
                                                            color: Color(
                                                              0xFF007191,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 220.0,
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
                                                            'E-mail',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 150.0,
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
                                                            'Telefone',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 115.0,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                    key: ValueKey('piloto_individual_${_model.ordenacaoSelecionada}_${_model.txBuscaPilotosIndiTextController.text}'),
                                                    future: UsersTable().queryRows(
                                                      queryFn: (q) {
                                                        var query = q
                                                            .eqOrNull(
                                                              'tipo_user',
                                                              'Piloto Individual',
                                                            );
                                                        
                                                        // Aplicar filtro de busca apenas se houver texto
                                                        final buscaTexto = _model.txBuscaPilotosIndiTextController.text;
                                                        if (buscaTexto.isNotEmpty) {
                                                          query = query.ilike(
                                                            'nome',
                                                            '%$buscaTexto%',
                                                          );
                                                        }
                                                        
                                                        // Ordenação sempre por nome
                                                        final ordenacao =
                                                            _model
                                                                .ordenacaoSelecionada ??
                                                            'Ordem alfabética A-Z';
                                                        final ascending = ordenacao == 'Ordem alfabética A-Z' ||
                                                            ordenacao == 'Acessos mais recentes' ||
                                                            ordenacao == 'Acessos mais antigos';
                                                        
                                                        return query.order(
                                                          'nome',
                                                          ascending: ascending,
                                                        );
                                                      },
                                                    ),
                                                    builder: (
                                                      context,
                                                      snapshot,
                                                    ) {
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
                                                      lvPilotoIndividualUsersRowList =
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
                                                            lvPilotoIndividualUsersRowList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) =>
                                                                const SizedBox(
                                                                  height: 12.0,
                                                                ),
                                                        itemBuilder: (
                                                          context,
                                                          lvPilotoIndividualIndex,
                                                        ) {
                                                          final lvPilotoIndividualUsersRow =
                                                              lvPilotoIndividualUsersRowList[lvPilotoIndividualIndex];
                                                          return InkWell(
                                                            splashColor:
                                                                Colors
                                                                    .transparent,
                                                            focusColor:
                                                                Colors
                                                                    .transparent,
                                                            hoverColor:
                                                                Colors
                                                                    .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.userSelecionado =
                                                                  null;
                                                              _model.empresaSelecionada =
                                                                  null;
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                              _model.userSelecionado =
                                                                  lvPilotoIndividualUsersRow
                                                                      .id;
                                                              _model.empresaSelecionada =
                                                                  lvPilotoIndividualUsersRow
                                                                      .companiesId;
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                              safeSetState(
                                                                () =>
                                                                    _model.requestCompleter =
                                                                        null,
                                                              );
                                                              await _model
                                                                  .waitForRequestCompleted();
                                                              safeSetState(
                                                                () {},
                                                              );
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                      child: Image.network(
                                                                        valueOrDefault<
                                                                          String
                                                                        >(
                                                                          valueOrDefault<
                                                                            String
                                                                          >(
                                                                            lvPilotoIndividualUsersRow.foto,
                                                                            'https://picsum.photos/seed/779/600',
                                                                          ),
                                                                          'https://picsum.photos/seed/779/600',
                                                                        ),
                                                                        fit:
                                                                            BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          407.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment: const AlignmentDirectional(
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
                                                                                  lvPilotoIndividualUsersRow.nome,
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
                                                                        ].divide(
                                                                          const SizedBox(
                                                                            height:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          220.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvPilotoIndividualUsersRow.email,
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
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvPilotoIndividualUsersRow.telefone,
                                                                              '(00) 0 0000-0000',
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
                                                                      width:
                                                                          115.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              dateTimeFormat(
                                                                                "dd/MM/yyyy",
                                                                                lvPilotoIndividualUsersRow.createdAt,
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
                                                                      width:
                                                                          280.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvPilotoIndividualUsersRow.tipoUser,
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
                                                                  thickness:
                                                                      2.0,
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
                                              ],
                                            ),
                                          ),
                                        ],
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
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
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
                                              SizedBox(
                                                width: 320.0,
                                                child: TextFormField(
                                                  controller:
                                                      _model
                                                          .txBuscaPilotosEmpresaTextController,
                                                  focusNode:
                                                      _model
                                                          .txBuscaPilotosEmpresaFocusNode,
                                                  onChanged:
                                                      (
                                                        _,
                                                      ) => EasyDebounce.debounce(
                                                        '_model.txBuscaPilotosEmpresaTextController',
                                                        const Duration(
                                                          milliseconds: 500,
                                                        ),
                                                        () =>
                                                            safeSetState(() {}),
                                                      ),
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
                                                    hintText: 'Buscar usuário',
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
                                                                  0x00000000,
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
                                                    fillColor:
                                                        Colors.transparent,
                                                    prefixIcon: const Icon(
                                                      Icons.search_rounded,
                                                      color: Color(0xFF4B4D4E),
                                                      size: 24.0,
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
                                                      .txBuscaPilotosEmpresaTextControllerValidator
                                                      .asValidator(context),
                                                ),
                                              ),
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                    width: 220.0,
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xFFFAFAFA,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                    ),
                                                    child: FlutterFlowDropDown<
                                                      String
                                                    >(
                                                      controller:
                                                          _model.ddOrdenacaoValueController ??=
                                                              FormFieldController<
                                                                String
                                                              >(
                                                                _model.ordenacaoSelecionada ??=
                                                                    'Ordem alfabética A-Z',
                                                              ),
                                                      options: const [
                                                        'Ordem alfabética A-Z',
                                                        'Ordem alfabética Z-A',
                                                        'Acessos mais recentes',
                                                        'Acessos mais antigos',
                                                      ],
                                                      onChanged:
                                                          (
                                                            val,
                                                          ) => safeSetState(() {
                                                            _model.ordenacaoSelecionada =
                                                                val;
                                                          }),
                                                      width: double.infinity,
                                                      height: 40.0,
                                                      textStyle: FlutterFlowTheme.of(
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
                                                      hintText: 'Ordenar por',
                                                      icon: const Icon(
                                                        Icons
                                                            .keyboard_arrow_down_rounded,
                                                        color: Color(
                                                          0xFF4B4D4E,
                                                        ),
                                                        size: 24.0,
                                                      ),
                                                      fillColor: const Color(
                                                        0xFFFAFAFA,
                                                      ),
                                                      elevation: 0.0,
                                                      borderColor: const Color(
                                                        0xFFE5E6E6,
                                                      ),
                                                      borderWidth: 1.0,
                                                      borderRadius: 8.0,
                                                      margin:
                                                          const EdgeInsetsDirectional.fromSTEB(
                                                            12.0,
                                                            0.0,
                                                            12.0,
                                                            0.0,
                                                          ),
                                                      hidesUnderline: true,
                                                      isOverButton: false,
                                                      isSearchable: false,
                                                    ),
                                                  ),
                                                  const SizedBox(width: 12.0),
                                                  FFButtonWidget(
                                                    onPressed: () async {
                                                      await actions.exportUsers(
                                                        functions
                                                            .noventaDiasAtras(
                                                              getCurrentTimestamp,
                                                            ),
                                                        getCurrentTimestamp,
                                                        'Piloto da Empresa',
                                                      );
                                                    },
                                                    text: 'Baixar relatório',
                                                    icon: const Icon(
                                                      Icons
                                                          .file_download_outlined,
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
                                                      color: const Color(
                                                        0x00007191,
                                                      ),
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
                                                        color: const Color(
                                                          0xFF252627,
                                                        ),
                                                        letterSpacing: 0.0,
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
                                                      elevation: 0.0,
                                                      borderSide:
                                                          const BorderSide(
                                                            color: Color(
                                                              0xFF007191,
                                                            ),
                                                            width: 1.0,
                                                          ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8.0,
                                                          ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Flexible(
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 220.0,
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
                                                            'E-mail',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 150.0,
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
                                                            'Telefone',
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
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 115.0,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                                    FontWeight
                                                                        .w500,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 16.0,
                                                              letterSpacing:
                                                                  0.0,
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
                                                    key: ValueKey('piloto_empresa_${_model.ordenacaoSelecionada}_${_model.txBuscaPilotosEmpresaTextController.text}'),
                                                    future: UsersTable().queryRows(
                                                      queryFn: (q) {
                                                        var query = q
                                                            .eqOrNull(
                                                              'tipo_user',
                                                              'Piloto da Empresa',
                                                            );
                                                        
                                                        // Aplicar filtro de busca apenas se houver texto
                                                        final buscaTexto = _model.txBuscaPilotosEmpresaTextController.text;
                                                        if (buscaTexto.isNotEmpty) {
                                                          query = query.ilike(
                                                            'nome',
                                                            '%$buscaTexto%',
                                                          );
                                                        }
                                                        
                                                        // Ordenação sempre por nome
                                                        final ordenacao =
                                                            _model
                                                                .ordenacaoSelecionada ??
                                                            'Ordem alfabética A-Z';
                                                        final ascending = ordenacao == 'Ordem alfabética A-Z' ||
                                                            ordenacao == 'Acessos mais recentes' ||
                                                            ordenacao == 'Acessos mais antigos';
                                                        
                                                        return query.order(
                                                          'nome',
                                                          ascending: ascending,
                                                        );
                                                      },
                                                    ),
                                                    builder: (
                                                      context,
                                                      snapshot,
                                                    ) {
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
                                                      lvPilotoEmpresaUsersRowList =
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
                                                            lvPilotoEmpresaUsersRowList
                                                                .length,
                                                        separatorBuilder:
                                                            (_, __) =>
                                                                const SizedBox(
                                                                  height: 12.0,
                                                                ),
                                                        itemBuilder: (
                                                          context,
                                                          lvPilotoEmpresaIndex,
                                                        ) {
                                                          final lvPilotoEmpresaUsersRow =
                                                              lvPilotoEmpresaUsersRowList[lvPilotoEmpresaIndex];
                                                          return InkWell(
                                                            splashColor:
                                                                Colors
                                                                    .transparent,
                                                            focusColor:
                                                                Colors
                                                                    .transparent,
                                                            hoverColor:
                                                                Colors
                                                                    .transparent,
                                                            highlightColor:
                                                                Colors
                                                                    .transparent,
                                                            onTap: () async {
                                                              _model.userSelecionado =
                                                                  null;
                                                              _model.empresaSelecionada =
                                                                  null;
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                              _model.userSelecionado =
                                                                  lvPilotoEmpresaUsersRow
                                                                      .id;
                                                              _model.empresaSelecionada =
                                                                  lvPilotoEmpresaUsersRow
                                                                      .companiesId;
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                              safeSetState(
                                                                () {},
                                                              );
                                                              _model.updatePage(
                                                                () {},
                                                              );
                                                              safeSetState(
                                                                () =>
                                                                    _model.requestCompleter =
                                                                        null,
                                                              );
                                                              await _model
                                                                  .waitForRequestCompleted();
                                                            },
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      width:
                                                                          50.0,
                                                                      height:
                                                                          50.0,
                                                                      clipBehavior:
                                                                          Clip.antiAlias,
                                                                      decoration:
                                                                          const BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                      child: Image.network(
                                                                        valueOrDefault<
                                                                          String
                                                                        >(
                                                                          valueOrDefault<
                                                                            String
                                                                          >(
                                                                            lvPilotoEmpresaUsersRow.foto,
                                                                            'https://picsum.photos/seed/779/600',
                                                                          ),
                                                                          'https://picsum.photos/seed/779/600',
                                                                        ),
                                                                        fit:
                                                                            BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          407.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Align(
                                                                            alignment: const AlignmentDirectional(
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
                                                                                  lvPilotoEmpresaUsersRow.nome,
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
                                                                        ].divide(
                                                                          const SizedBox(
                                                                            height:
                                                                                2.0,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Container(
                                                                      width:
                                                                          220.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvPilotoEmpresaUsersRow.email,
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
                                                                      width:
                                                                          150.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvPilotoEmpresaUsersRow.telefone,
                                                                              '(00) 0 0000-0000',
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
                                                                      width:
                                                                          115.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              dateTimeFormat(
                                                                                "dd/MM/yyyy",
                                                                                lvPilotoEmpresaUsersRow.createdAt,
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
                                                                      width:
                                                                          280.0,
                                                                      height:
                                                                          48.0,
                                                                      decoration:
                                                                          const BoxDecoration(),
                                                                      child: Align(
                                                                        alignment: const AlignmentDirectional(
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
                                                                              lvPilotoEmpresaUsersRow.tipoUser,
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
                                                                  thickness:
                                                                      2.0,
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
                                              ],
                                            ),
                                          ),
                                        ],
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
          ),
        if (_model.userSelecionado != null && _model.userSelecionado != '')
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () async {
                        safeSetState(() {
                          _model.userSelecionado = null;
                          _model.empresaSelecionada = null;
                        });
                        _model.updatePage(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            color: Color(0xFF646768),
                            size: 24.0,
                          ),
                          Text(
                            'Voltar',
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
                              color: const Color(0xFF646768),
                              fontSize: 14.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                          ),
                        ].divide(const SizedBox(width: 5.0)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        0.0,
                        0.0,
                        24.0,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Text(
                            'Detalhes do usuário',
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
                              fontSize: 24.0,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.w500,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.stage = 'Geral';
                            safeSetState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Geral',
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
                              ),
                              Container(
                                width: 100.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.stage == 'Geral'
                                        ? const Color(0xFF90C74F)
                                        : Colors.transparent,
                                    Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ].divide(const SizedBox(height: 6.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.stage = 'Histórico de viagens';
                            safeSetState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Histórico de viagens',
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
                              ),
                              Container(
                                width: 150.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.stage == 'Histórico de viagens'
                                        ? const Color(0xFF90C74F)
                                        : Colors.transparent,
                                    Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ].divide(const SizedBox(height: 6.0)),
                          ),
                        ),
                        InkWell(
                          splashColor: Colors.transparent,
                          focusColor: Colors.transparent,
                          hoverColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () async {
                            _model.stage = 'Embarcações';
                            safeSetState(() {});
                          },
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'Embarcações',
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
                              ),
                              Container(
                                width: 150.0,
                                height: 4.0,
                                decoration: BoxDecoration(
                                  color: valueOrDefault<Color>(
                                    _model.stage == 'Embarcações'
                                        ? const Color(0xFF90C74F)
                                        : Colors.transparent,
                                    Colors.transparent,
                                  ),
                                  borderRadius: BorderRadius.circular(24.0),
                                ),
                              ),
                            ].divide(const SizedBox(height: 6.0)),
                          ),
                        ),
                      ].divide(const SizedBox(width: 24.0)),
                    ),
                    if (_model.stage == 'Geral')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          24.0,
                          0.0,
                          24.0,
                        ),
                        child: FutureBuilder<List<UsersRow>>(
                          future:
                              (_model.requestCompleter ??=
                                      Completer<List<UsersRow>>()..complete(
                                        UsersTable().querySingleRow(
                                          queryFn:
                                              (q) => q.eqOrNull(
                                                'id',
                                                _model.userSelecionado,
                                              ),
                                        ),
                                      ))
                                  .future,
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UsersRow> pgUserIndividualUsersRowList =
                                snapshot.data!;

                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final pgUserIndividualUsersRow =
                                pgUserIndividualUsersRowList.isNotEmpty
                                    ? pgUserIndividualUsersRowList.first
                                    : null;

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Container(
                                decoration: const BoxDecoration(),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Material(
                                      color: Colors.transparent,
                                      elevation: 3.0,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(
                                          16.0,
                                        ),
                                      ),
                                      child: Container(
                                        width: 240.0,
                                        height: 253.0,
                                        decoration: BoxDecoration(
                                          color:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).primaryBackground,
                                          borderRadius: BorderRadius.circular(
                                            16.0,
                                          ),
                                          border: Border.all(
                                            color: const Color(0xFFE5E6E6),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 100.0,
                                                height: 100.0,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    valueOrDefault<String>(
                                                      pgUserIndividualUsersRow
                                                          ?.foto,
                                                      'https://picsum.photos/seed/779/600',
                                                    ),
                                                    'https://picsum.photos/seed/648/600',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                      0.0,
                                                      24.0,
                                                      0.0,
                                                      0.0,
                                                    ),
                                                child: Text(
                                                  'Membro desde',
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
                                                    fontSize: 12.0,
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
                                                ),
                                              ),
                                              Text(
                                                valueOrDefault<String>(
                                                  dateTimeFormat(
                                                    "dd/MM/yyyy",
                                                    pgUserIndividualUsersRow
                                                        ?.createdAt,
                                                    locale:
                                                        FFLocalizations.of(
                                                          context,
                                                        ).languageCode,
                                                  ),
                                                  'dd/MM/yyyy',
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
                                                  fontSize: 12.0,
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
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
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
                                              Container(
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFFE5E6E6,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                  border: Border.all(
                                                    color: const Color(
                                                      0xFFE5E6E6,
                                                    ),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                        -1.0,
                                                        0.0,
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          24.0,
                                                          0.0,
                                                          24.0,
                                                          0.0,
                                                        ),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        pgUserIndividualUsersRow
                                                            ?.nome,
                                                        'Nome',
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
                                                    ),
                                                  ),
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
                                              Container(
                                                decoration:
                                                    const BoxDecoration(),
                                              ),
                                              Container(
                                                height: 44.0,
                                                decoration: BoxDecoration(
                                                  color: const Color(
                                                    0xFFE5E6E6,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        8.0,
                                                      ),
                                                  border: Border.all(
                                                    color: const Color(
                                                      0xFFE5E6E6,
                                                    ),
                                                  ),
                                                ),
                                                child: Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                        -1.0,
                                                        0.0,
                                                      ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          24.0,
                                                          0.0,
                                                          24.0,
                                                          0.0,
                                                        ),
                                                    child: Text(
                                                      valueOrDefault<String>(
                                                        pgUserIndividualUsersRow
                                                            ?.email,
                                                        'E-mail',
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
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ].divide(
                                              const SizedBox(height: 8.0),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Tefone',
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
                                                    Container(
                                                      decoration:
                                                          const BoxDecoration(),
                                                    ),
                                                    Container(
                                                      height: 44.0,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                          0xFFE5E6E6,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius.circular(
                                                              8.0,
                                                            ),
                                                        border: Border.all(
                                                          color: const Color(
                                                            0xFFE5E6E6,
                                                          ),
                                                        ),
                                                      ),
                                                      child: Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                              -1.0,
                                                              0.0,
                                                            ),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional.fromSTEB(
                                                                24.0,
                                                                0.0,
                                                                24.0,
                                                                0.0,
                                                              ),
                                                          child: Text(
                                                            valueOrDefault<
                                                              String
                                                            >(
                                                              pgUserIndividualUsersRow
                                                                  ?.telefone,
                                                              '(00) 0 0000-0000',
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
                                                              letterSpacing:
                                                                  0.0,
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
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ].divide(
                                                    const SizedBox(height: 8.0),
                                                  ),
                                                ),
                                              ),
                                            ].divide(
                                              const SizedBox(width: 24.0),
                                            ),
                                          ),
                                          Divider(
                                            thickness: 1.0,
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).alternate,
                                          ),
                                          if (pgUserIndividualUsersRow
                                                      ?.tipoUser ==
                                                  'Admin Empresa' &&
                                              pgUserIndividualUsersRow
                                                      ?.companiesId !=
                                                  null)
                                            FutureBuilder<List<CompaniesRow>>(
                                              future: CompaniesTable()
                                                  .querySingleRow(
                                                    queryFn:
                                                        (q) => q.eqOrNull(
                                                          'id',
                                                          pgUserIndividualUsersRow
                                                              ?.companiesId,
                                                        ),
                                                  ),
                                              builder: (context, snapshot) {
                                                // Customize what your widget looks like when it's loading.
                                                if (!snapshot.hasData) {
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Expanded(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Text(
                                                              'Tipo de usuário',
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
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 16.0,
                                                                letterSpacing:
                                                                    0.0,
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
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  const BoxDecoration(),
                                                            ),
                                                            Container(
                                                              height: 44.0,
                                                              decoration: BoxDecoration(
                                                                color:
                                                                    const Color(
                                                                      0xFFE5E6E6,
                                                                    ),
                                                                borderRadius:
                                                                    BorderRadius.circular(
                                                                      8.0,
                                                                    ),
                                                                border: Border.all(
                                                                  color: const Color(
                                                                    0xFFE5E6E6,
                                                                  ),
                                                                ),
                                                              ),
                                                              child: Align(
                                                                alignment:
                                                                    const AlignmentDirectional(
                                                                      -1.0,
                                                                      0.0,
                                                                    ),
                                                                child: Padding(
                                                                  padding:
                                                                      const EdgeInsetsDirectional.fromSTEB(
                                                                        24.0,
                                                                        0.0,
                                                                        24.0,
                                                                        0.0,
                                                                      ),
                                                                  child: Text(
                                                                    valueOrDefault<
                                                                      String
                                                                    >(
                                                                      pgUserIndividualUsersRow
                                                                          ?.tipoUser,
                                                                      'Tipo',
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
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FlutterFlowTheme.of(
                                                                            context,
                                                                          ).bodyMedium.fontWeight,
                                                                      fontStyle:
                                                                          FlutterFlowTheme.of(
                                                                            context,
                                                                          ).bodyMedium.fontStyle,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ].divide(
                                                            const SizedBox(
                                                              height: 8.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                      const SizedBox(
                                                        width: 24.0,
                                                      ),
                                                    ),
                                                  );
                                                }
                                                List<CompaniesRow>
                                                companyRowList = snapshot.data!;
                                                final companyRow =
                                                    companyRowList.isNotEmpty
                                                        ? companyRowList.first
                                                        : null;

                                                return Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Empresa',
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
                                                                        ).bodyMedium.fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                              ),
                                                              Container(
                                                                height: 44.0,
                                                                decoration: BoxDecoration(
                                                                  color: const Color(
                                                                    0xFFE5E6E6,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        8.0,
                                                                      ),
                                                                  border: Border.all(
                                                                    color: const Color(
                                                                      0xFFE5E6E6,
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0,
                                                                      ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                        ),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                        String
                                                                      >(
                                                                        companyRow
                                                                            ?.nome,
                                                                        'Empresa',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontWeight,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(
                                                              const SizedBox(
                                                                height: 8.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(
                                                                'Tipo de usuário',
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
                                                                        ).bodyMedium.fontStyle,
                                                                  ),
                                                                  fontSize:
                                                                      16.0,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(),
                                                              ),
                                                              Container(
                                                                height: 44.0,
                                                                decoration: BoxDecoration(
                                                                  color: const Color(
                                                                    0xFFE5E6E6,
                                                                  ),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                        8.0,
                                                                      ),
                                                                  border: Border.all(
                                                                    color: const Color(
                                                                      0xFFE5E6E6,
                                                                    ),
                                                                  ),
                                                                ),
                                                                child: Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                        -1.0,
                                                                        0.0,
                                                                      ),
                                                                  child: Padding(
                                                                    padding:
                                                                        const EdgeInsetsDirectional.fromSTEB(
                                                                          24.0,
                                                                          0.0,
                                                                          24.0,
                                                                          0.0,
                                                                        ),
                                                                    child: Text(
                                                                      valueOrDefault<
                                                                        String
                                                                      >(
                                                                        pgUserIndividualUsersRow
                                                                            ?.tipoUser,
                                                                        'Tipo',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontWeight,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ].divide(
                                                              const SizedBox(
                                                                height: 8.0,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                      ].divide(
                                                        const SizedBox(
                                                          width: 24.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsetsDirectional.fromSTEB(
                                                            0.0,
                                                            8.0,
                                                            0.0,
                                                            0.0,
                                                          ),
                                                      child: InkWell(
                                                        splashColor:
                                                            Colors.transparent,
                                                        focusColor:
                                                            Colors.transparent,
                                                        hoverColor:
                                                            Colors.transparent,
                                                        highlightColor:
                                                            Colors.transparent,
                                                        onTap: () async {
                                                          FFAppState()
                                                                  .empresaSelecionadaGlobal =
                                                              pgUserIndividualUsersRow
                                                                  ?.companiesId;
                                                          FFAppState().menu =
                                                              'Empresas';
                                                          FFAppState().update(
                                                            () {},
                                                          );
                                                        },
                                                        child: Text(
                                                          'Visualizar empresa',
                                                          style: FlutterFlowTheme.of(
                                                            context,
                                                          ).bodyMedium.override(
                                                            font: GoogleFonts.inter(
                                                              color:
                                                                  FlutterFlowTheme.of(
                                                                    context,
                                                                  ).primary,
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
                                                            fontSize: 14.0,
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
                                                  ],
                                                );
                                              },
                                            )
                                          else
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        'Tipo de usuário',
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
                                                      Container(
                                                        decoration:
                                                            const BoxDecoration(),
                                                      ),
                                                      Container(
                                                        height: 44.0,
                                                        decoration: BoxDecoration(
                                                          color: const Color(
                                                            0xFFE5E6E6,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius.circular(
                                                                8.0,
                                                              ),
                                                          border: Border.all(
                                                            color: const Color(
                                                              0xFFE5E6E6,
                                                            ),
                                                          ),
                                                        ),
                                                        child: Align(
                                                          alignment:
                                                              const AlignmentDirectional(
                                                                -1.0,
                                                                0.0,
                                                              ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsetsDirectional.fromSTEB(
                                                                  24.0,
                                                                  0.0,
                                                                  24.0,
                                                                  0.0,
                                                                ),
                                                            child: Text(
                                                              valueOrDefault<
                                                                String
                                                              >(
                                                                pgUserIndividualUsersRow
                                                                    ?.tipoUser,
                                                                'Tipo',
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
                                                                letterSpacing:
                                                                    0.0,
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
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ].divide(
                                                      const SizedBox(
                                                        height: 8.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(
                                                const SizedBox(width: 24.0),
                                              ),
                                            ),
                                          Divider(
                                            thickness: 1.0,
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).alternate,
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                valueOrDefault<bool>(
                                                      pgUserIndividualUsersRow
                                                          ?.ativo,
                                                      true,
                                                    )
                                                    ? 'Desativar conta'
                                                    : 'Ativar conta',
                                                style: FlutterFlowTheme.of(
                                                  context,
                                                ).headlineSmall.override(
                                                  font: GoogleFonts.inter(
                                                    fontWeight: FontWeight.w600,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                              context,
                                                            )
                                                            .headlineSmall
                                                            .fontStyle,
                                                  ),
                                                  fontSize: 20.0,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).headlineSmall.fontStyle,
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional.fromSTEB(
                                                      0.0,
                                                      12.0,
                                                      0.0,
                                                      24.0,
                                                    ),
                                                child: Text(
                                                  valueOrDefault<bool>(
                                                        pgUserIndividualUsersRow
                                                            ?.ativo,
                                                        true,
                                                      )
                                                      ? 'Ao inativar este usuário, ele perderá o acesso ao sistema imediatamente. Os dados e históricos vinculados a ele serão mantidos e poderão ser consultados posteriormente.'
                                                      : 'Ao ativar este usuário, ele recuperará o acesso ao sistema imediatamente. Todos os dados e históricos vinculados a ele permanecerão disponíveis.',
                                                  style: FlutterFlowTheme.of(
                                                    context,
                                                  ).bodyMedium.override(
                                                    font: GoogleFonts.inter(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .bodyMedium
                                                              .fontStyle,
                                                    ),
                                                    fontSize: 14.0,
                                                    letterSpacing: 0.0,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontStyle:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.fontStyle,
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    const AlignmentDirectional(
                                                      -1.0,
                                                      0.0,
                                                    ),
                                                child: FFButtonWidget(
                                                  onPressed: () {
                                                    safeSetState(() {
                                                      if (valueOrDefault<bool>(
                                                        pgUserIndividualUsersRow
                                                            ?.ativo,
                                                        true,
                                                      )) {
                                                        _model.mostrarModalDesativar =
                                                            true;
                                                      } else {
                                                        _model.mostrarModalAtivar =
                                                            true;
                                                      }
                                                    });
                                                  },
                                                  text:
                                                      valueOrDefault<bool>(
                                                            pgUserIndividualUsersRow
                                                                ?.ativo,
                                                            true,
                                                          )
                                                          ? 'Desativar conta'
                                                          : 'Ativar conta',
                                                  options: FFButtonOptions(
                                                    width: 200.0,
                                                    height: 48.0,
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          24.0,
                                                          0.0,
                                                          24.0,
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
                                                        valueOrDefault<bool>(
                                                              pgUserIndividualUsersRow
                                                                  ?.ativo,
                                                              true,
                                                            )
                                                            ? const Color(
                                                              0xFFB91C1C,
                                                            )
                                                            : const Color(
                                                              0xFF90C74F,
                                                            ),
                                                    textStyle: FlutterFlowTheme.of(
                                                      context,
                                                    ).titleSmall.override(
                                                      font: GoogleFonts.interTight(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontStyle:
                                                            FlutterFlowTheme.of(
                                                                  context,
                                                                )
                                                                .titleSmall
                                                                .fontStyle,
                                                      ),
                                                      color: Colors.white,
                                                      fontSize: 16.0,
                                                      letterSpacing: 0.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontStyle:
                                                          FlutterFlowTheme.of(
                                                                context,
                                                              )
                                                              .titleSmall
                                                              .fontStyle,
                                                    ),
                                                    elevation: 0.0,
                                                    borderSide:
                                                        const BorderSide(
                                                          color:
                                                              Colors
                                                                  .transparent,
                                                          width: 1.0,
                                                        ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8.0,
                                                        ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ].divide(const SizedBox(height: 24.0)),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 24.0)),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    if (_model.stage == 'Histórico de viagens')
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          24.0,
                          0.0,
                          24.0,
                        ),
                        child: FutureBuilder<List<UsersRow>>(
                          future: UsersTable().querySingleRow(
                            queryFn:
                                (q) => q.eqOrNull('id', _model.userSelecionado),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<UsersRow> pgHistoricoViagensUsersRowList =
                                snapshot.data!;

                            // Return an empty Container when the item does not exist.
                            if (snapshot.data!.isEmpty) {
                              return Container();
                            }
                            final pgHistoricoViagensUsersRow =
                                pgHistoricoViagensUsersRowList.isNotEmpty
                                    ? pgHistoricoViagensUsersRowList.first
                                    : null;

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: 320.0,
                                        child: TextFormField(
                                          controller:
                                              _model
                                                  .txBuscaAdminEmpresaTextController2,
                                          focusNode:
                                              _model
                                                  .txBuscaAdminEmpresaFocusNode2,
                                          onChanged:
                                              (_) => EasyDebounce.debounce(
                                                '_model.txBuscaAdminEmpresaTextController2',
                                                const Duration(
                                                  milliseconds: 500,
                                                ),
                                                () => safeSetState(() {}),
                                              ),
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
                                            hintText: 'Buscar viagem',
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
                                                color: Color(0x00000000),
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
                                            fillColor: Colors.transparent,
                                            prefixIcon: const Icon(
                                              Icons.search_rounded,
                                              color: Color(0xFF4B4D4E),
                                              size: 24.0,
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
                                              .txBuscaAdminEmpresaTextController2Validator
                                              .asValidator(context),
                                        ),
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          FFButtonWidget(
                                            onPressed: () {
                                              AppLogger.d('Button pressed ...');
                                            },
                                            text: 'Baixar relatório',
                                            icon: const Icon(
                                              Icons.file_download_outlined,
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
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).titleSmall.fontStyle,
                                                ),
                                                color: const Color(0xFF252627),
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
                                              borderSide: const BorderSide(
                                                color: Color(0xFF007191),
                                                width: 1.0,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ].divide(const SizedBox(width: 24.0)),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 100.0,
                                        height: 48.0,
                                        decoration: const BoxDecoration(),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
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
                                              'ID\n',
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
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 300.0,
                                        height: 48.0,
                                        decoration: const BoxDecoration(),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
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
                                              'Embarcação',
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
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 100.0,
                                        height: 48.0,
                                        decoration: const BoxDecoration(),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
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
                                              'Distância',
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
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 100.0,
                                        height: 48.0,
                                        decoration: const BoxDecoration(),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
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
                                              'Duração',
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
                                          ),
                                        ),
                                      ),
                                      Container(
                                        width: 115.0,
                                        height: 48.0,
                                        decoration: const BoxDecoration(),
                                        child: Align(
                                          alignment: const AlignmentDirectional(
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
                                              'Data',
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
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: FutureBuilder<
                                      List<VwViagensResumoRow>
                                    >(
                                      future: VwViagensResumoTable().queryRows(
                                        queryFn:
                                            (q) => q.eqOrNull(
                                              'companie_id',
                                              pgHistoricoViagensUsersRow
                                                  ?.companiesId,
                                            ),
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
                                        List<VwViagensResumoRow>
                                        lvHistoricoVwViagensResumoRowList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            24.0,
                                          ),
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              lvHistoricoVwViagensResumoRowList
                                                  .length,
                                          separatorBuilder:
                                              (_, __) =>
                                                  const SizedBox(height: 12.0),
                                          itemBuilder: (
                                            context,
                                            lvHistoricoIndex,
                                          ) {
                                            final lvHistoricoVwViagensResumoRow =
                                                lvHistoricoVwViagensResumoRowList[lvHistoricoIndex];
                                            return Builder(
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
                                                                EdgeInsets.zero,
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
                                                              child: PpDetalheViagemWidget(
                                                                idViagem:
                                                                    lvHistoricoVwViagensResumoRow
                                                                        .idViagem!,
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
                                                              MainAxisSize.max,
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              width: 100.0,
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
                                                                          lvHistoricoVwViagensResumoRow
                                                                              .idViagem
                                                                              ?.toString(),
                                                                          '0000',
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
                                                                ].divide(
                                                                  const SizedBox(
                                                                    height: 2.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 300.0,
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
                                                                          lvHistoricoVwViagensResumoRow
                                                                              .nomeBarco,
                                                                          'Nome Barco',
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
                                                                ].divide(
                                                                  const SizedBox(
                                                                    height: 2.0,
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              width: 100.0,
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
                                                                      lvHistoricoVwViagensResumoRow
                                                                          .kmTotais
                                                                          ?.toString(),
                                                                      '00Km',
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
                                                                          FontWeight
                                                                              .normal,
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
                                                              width: 100.0,
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
                                                                      lvHistoricoVwViagensResumoRow
                                                                          .duracaoMinutos
                                                                          ?.toString(),
                                                                      '00h',
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
                                                                          FontWeight
                                                                              .normal,
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
                                                              width: 115.0,
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
                                                                        lvHistoricoVwViagensResumoRow
                                                                            .dataViagem,
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
                                                                          FontWeight
                                                                              .normal,
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
                                                  ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)),
                              ),
                            );
                          },
                        ),
                      ),
                    if (_model.stage == 'Embarcações')
                      Container(
                        decoration: const BoxDecoration(),
                        child: FutureBuilder<List<EmbarcacoesRow>>(
                          future: EmbarcacoesTable().queryRows(
                            queryFn:
                                (q) => q.eqOrNull(
                                  'companie',
                                  _model.empresaSelecionada,
                                ),
                          ),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50.0,
                                  height: 50.0,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<EmbarcacoesRow> gridViewEmbarcacoesRowList =
                                snapshot.data!;

                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 12.0,
                                    mainAxisSpacing: 12.0,
                                    childAspectRatio: 4.0,
                                  ),
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: gridViewEmbarcacoesRowList.length,
                              itemBuilder: (context, gridViewIndex) {
                                final gridViewEmbarcacoesRow =
                                    gridViewEmbarcacoesRowList[gridViewIndex];
                                return Builder(
                                  builder:
                                      (context) => InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          await showDialog(
                                            context: context,
                                            builder: (dialogContext) {
                                              return Dialog(
                                                elevation: 0,
                                                insetPadding: EdgeInsets.zero,
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
                                                child: WebViewAware(
                                                  child:
                                                      PpDetalheEmbarcacaoWidget(
                                                        idEmbarcacao:
                                                            gridViewEmbarcacoesRow
                                                                .id,
                                                      ),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Material(
                                          color: Colors.transparent,
                                          elevation: 1.0,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              12.0,
                                            ),
                                          ),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(
                                              12.0,
                                            ),
                                            child: Container(
                                              width: 100.0,
                                              height: 100.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFFAFAFA),
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                border: Border.all(
                                                  color: const Color(
                                                    0xFFE5E6E6,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    width: 12.0,
                                                    height: double.infinity,
                                                    decoration: BoxDecoration(
                                                      color: valueOrDefault<
                                                        Color
                                                      >(
                                                        gridViewEmbarcacoesRow
                                                                .ativo!
                                                            ? const Color(
                                                              0xFF1EAE3E,
                                                            )
                                                            : const Color(
                                                              0xFFAE1E1E,
                                                            ),
                                                        const Color(0xFFAE1E1E),
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets.all(
                                                                  24.0,
                                                                ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      valueOrDefault<
                                                                        String
                                                                      >(
                                                                        gridViewEmbarcacoesRow
                                                                            .nomeEmbarcacoes,
                                                                        'Barco Acquaway',
                                                                      ),
                                                                      style: FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle:
                                                                              FlutterFlowTheme.of(
                                                                                context,
                                                                              ).bodyMedium.fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '#${gridViewEmbarcacoesRow.id.toString()}',
                                                                      style: FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.override(
                                                                        font: GoogleFonts.inter(
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontStyle:
                                                                              FlutterFlowTheme.of(
                                                                                context,
                                                                              ).bodyMedium.fontStyle,
                                                                        ),
                                                                        fontSize:
                                                                            16.0,
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .start,
                                                                  children: [
                                                                    Text(
                                                                      'TIE: ${valueOrDefault<String>(gridViewEmbarcacoesRow.tieTiem, '403M000000012944')}',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontWeight,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      'Dimensões: ${gridViewEmbarcacoesRow.comprimento?.toString()}x${gridViewEmbarcacoesRow.boca?.toString()}x${gridViewEmbarcacoesRow.calado?.toString()}',
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
                                                                        letterSpacing:
                                                                            0.0,
                                                                        fontWeight:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontWeight,
                                                                        fontStyle:
                                                                            FlutterFlowTheme.of(
                                                                              context,
                                                                            ).bodyMedium.fontStyle,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Text(
                                                                  'Embarcação ${gridViewEmbarcacoesRow.ativo! ? 'Ativo' : 'Inativa'}',
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
                                                                          ).bodyMedium.fontStyle,
                                                                    ),
                                                                    color: valueOrDefault<
                                                                      Color
                                                                    >(
                                                                      gridViewEmbarcacoesRow
                                                                              .ativo!
                                                                          ? const Color(
                                                                            0xFF1EAE3E,
                                                                          )
                                                                          : const Color(
                                                                            0xFFAE1E1E,
                                                                          ),
                                                                      const Color(
                                                                        0xFFAE1E1E,
                                                                      ),
                                                                    ),
                                                                    letterSpacing:
                                                                        0.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontStyle:
                                                                        FlutterFlowTheme.of(
                                                                          context,
                                                                        ).bodyMedium.fontStyle,
                                                                  ),
                                                                ),
                                                              ],
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
                                        ),
                                      ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                  ].divide(const SizedBox(height: 24.0)),
                ),
              ),
            ),
          ),
        if (_model.mostrarModalDesativar)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Color(0x99000000)),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 480.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFFEE2E2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.warning_rounded,
                                  color: Color(0xFFB91C1C),
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0,
                                  0.0,
                                  0.0,
                                  0.0,
                                ),
                                child: Text(
                                  'Desativar conta',
                                  style: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).headlineSmall.fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).headlineSmall.fontStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              safeSetState(() {
                                _model.mostrarModalDesativar = false;
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xFF4B4D4E),
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          24.0,
                          0.0,
                          0.0,
                        ),
                        child: Text(
                          'Deseja realmente desativar essa conta?',
                          style: FlutterFlowTheme.of(
                            context,
                          ).headlineSmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontStyle,
                            ),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          12.0,
                          0.0,
                          24.0,
                        ),
                        child: Text(
                          'Ao prosseguir, o acesso do usuário será suspenso.\nEsta ação é reversível e a conta poderá ser\nreativada a qualquer momento, sem perda de dados.',
                          style: FlutterFlowTheme.of(
                            context,
                          ).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF6B7280),
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              safeSetState(() {
                                _model.mostrarModalDesativar = false;
                              });
                            },
                            child: Text(
                              'Cancelar',
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
                                color: const Color(0xFF4B4D4E),
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          FFButtonWidget(
                            onPressed: () async {
                              // Desativar o usuário
                              if (_model.userSelecionado != null) {
                                final userId = _model.userSelecionado!;
                                await UsersTable().update(
                                  data: {'ativo': false},
                                  matchingRows: (rows) => rows.eq('id', userId),
                                );
                                safeSetState(() {
                                  _model.mostrarModalDesativar = false;
                                  _model.requestCompleter = null;
                                });
                              }
                            },
                            text: 'Sim, desativar',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0,
                                0.0,
                                24.0,
                                0.0,
                              ),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                0.0,
                                0.0,
                              ),
                              color: const Color(0xFFB91C1C),
                              textStyle: FlutterFlowTheme.of(
                                context,
                              ).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      FlutterFlowTheme.of(
                                        context,
                                      ).titleSmall.fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontStyle,
                              ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        if (_model.mostrarModalAtivar)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Color(0x99000000)),
            child: Align(
              alignment: const AlignmentDirectional(0.0, 0.0),
              child: Container(
                width: 480.0,
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).secondaryBackground,
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 24.0,
                                height: 24.0,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFD1FAE5),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.check_circle_rounded,
                                  color: Color(0xFF90C74F),
                                  size: 16.0,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                  12.0,
                                  0.0,
                                  0.0,
                                  0.0,
                                ),
                                child: Text(
                                  'Ativar conta',
                                  style: FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.override(
                                    font: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontStyle:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).headlineSmall.fontStyle,
                                    ),
                                    fontSize: 20.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle:
                                        FlutterFlowTheme.of(
                                          context,
                                        ).headlineSmall.fontStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              safeSetState(() {
                                _model.mostrarModalAtivar = false;
                              });
                            },
                            child: const Icon(
                              Icons.close,
                              color: Color(0xFF4B4D4E),
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          24.0,
                          0.0,
                          0.0,
                        ),
                        child: Text(
                          'Deseja realmente ativar essa conta?',
                          style: FlutterFlowTheme.of(
                            context,
                          ).headlineSmall.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w600,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).headlineSmall.fontStyle,
                            ),
                            fontSize: 18.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).headlineSmall.fontStyle,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0,
                          12.0,
                          0.0,
                          24.0,
                        ),
                        child: Text(
                          'Ao prosseguir, o acesso do usuário será restaurado.\nEsta ação é reversível e a conta poderá ser\ndesativada a qualquer momento, sem perda de dados.',
                          style: FlutterFlowTheme.of(
                            context,
                          ).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.normal,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).bodyMedium.fontStyle,
                            ),
                            fontSize: 14.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.normal,
                            color: const Color(0xFF6B7280),
                            fontStyle:
                                FlutterFlowTheme.of(
                                  context,
                                ).bodyMedium.fontStyle,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () async {
                              safeSetState(() {
                                _model.mostrarModalAtivar = false;
                              });
                            },
                            child: Text(
                              'Cancelar',
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
                                color: const Color(0xFF4B4D4E),
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                              ),
                            ),
                          ),
                          const SizedBox(width: 12.0),
                          FFButtonWidget(
                            onPressed: () async {
                              // Ativar o usuário
                              if (_model.userSelecionado != null) {
                                final userId = _model.userSelecionado!;
                                await UsersTable().update(
                                  data: {'ativo': true},
                                  matchingRows: (rows) => rows.eq('id', userId),
                                );
                                safeSetState(() {
                                  _model.mostrarModalAtivar = false;
                                  _model.requestCompleter = null;
                                });
                              }
                            },
                            text: 'Sim, ativar',
                            options: FFButtonOptions(
                              height: 40.0,
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                24.0,
                                0.0,
                                24.0,
                                0.0,
                              ),
                              iconPadding: const EdgeInsetsDirectional.fromSTEB(
                                0.0,
                                0.0,
                                0.0,
                                0.0,
                              ),
                              color: const Color(0xFF90C74F),
                              textStyle: FlutterFlowTheme.of(
                                context,
                              ).titleSmall.override(
                                font: GoogleFonts.interTight(
                                  fontWeight: FontWeight.w600,
                                  fontStyle:
                                      FlutterFlowTheme.of(
                                        context,
                                      ).titleSmall.fontStyle,
                                ),
                                color: Colors.white,
                                fontSize: 16.0,
                                letterSpacing: 0.0,
                                fontWeight: FontWeight.w600,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleSmall.fontStyle,
                              ),
                              elevation: 0.0,
                              borderSide: const BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
