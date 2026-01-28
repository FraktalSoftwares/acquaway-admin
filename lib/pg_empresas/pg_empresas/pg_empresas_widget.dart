import '/backend/supabase/supabase.dart';
import '/componentes/pp_detalhe_viagem/pp_detalhe_viagem_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pg_empresas/pp_ativar_conta/pp_ativar_conta_widget.dart';
import '/pg_empresas/pp_desativar_conta/pp_desativar_conta_widget.dart';
import '/pg_usuarios/pp_detalhe_embarcacao/pp_detalhe_embarcacao_widget.dart';
import '/core/utils/logger.dart';
import '/custom_code/actions/index.dart' as actions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pg_empresas_model.dart';
export 'pg_empresas_model.dart';

class PgEmpresasWidget extends StatefulWidget {
  const PgEmpresasWidget({super.key});

  @override
  State<PgEmpresasWidget> createState() => _PgEmpresasWidgetState();
}

class _PgEmpresasWidgetState extends State<PgEmpresasWidget> {
  late PgEmpresasModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgEmpresasModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      // Check if there's a global empresa selecionada (from navigation from user details)
      if (FFAppState().empresaSelecionadaGlobal != null) {
        _model.empresaSelecionada = FFAppState().empresaSelecionadaGlobal;
        FFAppState().empresaSelecionadaGlobal = null; // Clear after use
      } else {
        _model.empresaSelecionada = null;
      }
      _model.stage = 'Geral';
      _model.ordenacaoSelecionada ??= 'Ordem alfabética A-Z';
      safeSetState(() {});
    });

    _model.txBuscaEmpresaTextController1 ??= TextEditingController();
    _model.txBuscaEmpresaFocusNode1 ??= FocusNode();

    _model.txBuscaAdminEmpresaTextController ??= TextEditingController();
    _model.txBuscaAdminEmpresaFocusNode ??= FocusNode();

    _model.txBuscaEmpresaTextController2 ??= TextEditingController();
    _model.txBuscaEmpresaFocusNode2 ??= FocusNode();

    _model.txBuscaUsuariosEmpresaTextController ??= TextEditingController();
    _model.txBuscaUsuariosEmpresaFocusNode ??= FocusNode();

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
        if (_model.empresaSelecionada == null)
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
                        'Empresas',
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
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        24.0,
                        0.0,
                        0.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 320.0,
                                child: TextFormField(
                                  controller:
                                      _model.txBuscaEmpresaTextController1,
                                  focusNode: _model.txBuscaEmpresaFocusNode1,
                                  onChanged:
                                      (_) => EasyDebounce.debounce(
                                        '_model.txBuscaEmpresaTextController1',
                                        const Duration(milliseconds: 500),
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
                                    hintText: 'Buscar empresa',
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .txBuscaEmpresaTextController1Validator
                                      .asValidator(context),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Container(
                                    width: 220.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFAFAFA),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: FlutterFlowDropDown<String>(
                                      controller:
                                          _model.ddOrdenacaoValueController ??=
                                              FormFieldController<String>(
                                                _model.ordenacaoSelecionada ??=
                                                    'Ordem alfabética A-Z',
                                              ),
                                      options: const [
                                        'Ordem alfabética A-Z',
                                        'Ordem alfabética Z-A',
                                      ],
                                      onChanged:
                                          (val) => safeSetState(() {
                                            _model.ordenacaoSelecionada = val;
                                            _model
                                                .ddOrdenacaoValueController
                                                ?.value = val;
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
                                              ).bodyMedium.fontWeight,
                                          fontStyle:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.fontStyle,
                                        ),
                                        letterSpacing: 0.0,
                                      ),
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).secondaryText,
                                        size: 24.0,
                                      ),
                                      fillColor:
                                          FlutterFlowTheme.of(
                                            context,
                                          ).secondaryBackground,
                                      elevation: 2.0,
                                      borderColor: const Color(0xFFE5E6E6),
                                      borderWidth: 1.0,
                                      borderRadius: 8.0,
                                      margin:
                                          const EdgeInsetsDirectional.fromSTEB(
                                            12.0,
                                            4.0,
                                            12.0,
                                            4.0,
                                          ),
                                      hidesUnderline: true,
                                      isSearchable: false,
                                    ),
                                  ),
                                  const SizedBox(width: 12.0),
                                  FFButtonWidget(
                                    onPressed: () async {
                                      await actions.exportEmpresasCSV();
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          FutureBuilder<List<CompaniesRow>>(
                            future: CompaniesTable().queryRows(
                              queryFn: (q) => q.eqOrNull('aprovadas', false),
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
                              List<CompaniesRow> containerCompaniesRowList =
                                  snapshot.data!;

                              return Container(
                                decoration: const BoxDecoration(),
                                child: Visibility(
                                  visible: containerCompaniesRowList.isNotEmpty,
                                  child: Container(
                                    width: double.infinity,
                                    height: 100.0,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFFFAF7EB),
                                      borderRadius: BorderRadius.circular(16.0),
                                      border: Border.all(
                                        color: const Color(0xFFF0E8C2),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(24.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Há ${valueOrDefault<String>(containerCompaniesRowList.length.toString(), '0')} novas empresas aguardando aprovação',
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
                                          FFButtonWidget(
                                            onPressed: () async {
                                              _model.empresaSelecionada = null;
                                              _model.aprovacoes = true;
                                              safeSetState(() {});
                                            },
                                            text: 'Visualizar empresas',
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
                                                  BorderRadius.circular(8.0),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      'Nome da empresa',
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
                                width: 200.0,
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
                                      'CNPJ',
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
                                width: 200.0,
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
                                      'Data de cadastro',
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
                                width: 200.0,
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
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: FutureBuilder<List<CompaniesRow>>(
                                key: ValueKey(
                                  'empresas_${_model.ordenacaoSelecionada ?? 'Ordem alfabética A-Z'}_${_model.txBuscaEmpresaTextController1.text}',
                                ),
                                future: CompaniesTable().queryRows(
                                  queryFn: (q) {
                                    var query = q
                                        .ilike(
                                          'nome',
                                          '%${_model.txBuscaEmpresaTextController1.text}%',
                                        )
                                        .eqOrNull('aprovadas', true)
                                        .eq('ativo', true);

                                    // Aplicar ordenação pelo nome
                                    final ordenacao =
                                        _model.ordenacaoSelecionada ??
                                        'Ordem alfabética A-Z';
                                    final ascending =
                                        ordenacao == 'Ordem alfabética A-Z';

                                    return query.order(
                                      'nome',
                                      ascending: ascending,
                                    );
                                  },
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
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
                                              ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CompaniesRow>
                                  lvHistoricoCompaniesRowList = snapshot.data!;

                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      24.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        lvHistoricoCompaniesRowList.length,
                                    separatorBuilder:
                                        (_, __) => const SizedBox(height: 12.0),
                                    itemBuilder: (context, lvHistoricoIndex) {
                                      final lvHistoricoCompaniesRow =
                                          lvHistoricoCompaniesRowList[lvHistoricoIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.empresaSelecionada =
                                              lvHistoricoCompaniesRow.id;
                                          safeSetState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100.0,
                                                  height: 48.0,
                                                  decoration:
                                                      const BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
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
                                                              lvHistoricoCompaniesRow
                                                                  .id
                                                                  .toString(),
                                                              '0000',
                                                            ),
                                                            style: FlutterFlowTheme.of(
                                                              context,
                                                            ).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
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
                                                        MainAxisSize.min,
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
                                                              lvHistoricoCompaniesRow
                                                                  .nome,
                                                              'Nome',
                                                            ),
                                                            style: FlutterFlowTheme.of(
                                                              context,
                                                            ).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
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
                                                      const SizedBox(
                                                        height: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
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
                                                        valueOrDefault<String>(
                                                          lvHistoricoCompaniesRow
                                                              .cnpj,
                                                          '12.345.678/0001-10',
                                                        ),
                                                        style: FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
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
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd/MM/yyyy",
                                                            lvHistoricoCompaniesRow
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
                                                                FontWeight
                                                                    .normal,
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
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
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
                                                        valueOrDefault<String>(
                                                          lvHistoricoCompaniesRow
                                                              .email,
                                                          'N/A',
                                                        ),
                                                        style: FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(
                                                const SizedBox(width: 12.0),
                                              ),
                                            ),
                                            const Divider(
                                              height: 1.0,
                                              thickness: 2.0,
                                              color: Color(0xFFE5E6E6),
                                            ),
                                          ].divide(
                                            const SizedBox(height: 12.0),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        if (_model.empresaSelecionada != null)
          FutureBuilder<List<CompaniesRow>>(
            future: CompaniesTable().querySingleRow(
              queryFn: (q) => q.eqOrNull('id', _model.empresaSelecionada),
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
              List<CompaniesRow> ccDetalhesCompaniesRowList = snapshot.data!;

              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final ccDetalhesCompaniesRow =
                  ccDetalhesCompaniesRowList.isNotEmpty
                      ? ccDetalhesCompaniesRowList.first
                      : null;

              return Container(
                width: double.infinity,
                height: double.infinity,
                decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: SingleChildScrollView(
                    primary: false,
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
                            _model.empresaSelecionada = null;
                            _model.empresaSelecionadaNaoAprovada = null;
                            safeSetState(() {});
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
                                'Detalhes da empresa',
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
                            InkWell(
                              splashColor: Colors.transparent,
                              focusColor: Colors.transparent,
                              hoverColor: Colors.transparent,
                              highlightColor: Colors.transparent,
                              onTap: () async {
                                _model.stage = 'Usuários';
                                safeSetState(() {});
                              },
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Text(
                                    'Usuários',
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
                                        _model.stage == 'Usuários'
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
                            child: Container(
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
                                            color: const Color(0xFF00BDF2),
                                          ),
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(24.0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Image.network(
                                                valueOrDefault<String>(
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/2hxjo9i8onor/business_center.png',
                                                  'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/2hxjo9i8onor/business_center.png',
                                                ),
                                                width: 100.0,
                                                height: 100.0,
                                                fit: BoxFit.contain,
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
                                                    ccDetalhesCompaniesRow
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
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'ID',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.id
                                                                  .toString(),
                                                              '0000',
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
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Nome',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.nome,
                                                              'Marine Transportes',
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
                                                        ccDetalhesCompaniesRow
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
                                                'CNPJ',
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
                                                        ccDetalhesCompaniesRow
                                                            ?.cnpj,
                                                        '12.345.678/0001-10',
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
                                                      'E-mail',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.email,
                                                              'N/A',
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
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Telefone',
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
                                                              ccDetalhesCompaniesRow
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
                                          Padding(
                                            padding:
                                                const EdgeInsetsDirectional.fromSTEB(
                                                  0.0,
                                                  24.0,
                                                  0.0,
                                                  0.0,
                                                ),
                                            child: Text(
                                              'Endereço',
                                              style: FlutterFlowTheme.of(
                                                context,
                                              ).bodyMedium.override(
                                                font: GoogleFonts.inter(
                                                  fontWeight: FontWeight.w600,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontStyle,
                                                ),
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w600,
                                                fontStyle:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyMedium.fontStyle,
                                              ),
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                flex: 1,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'CEP',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.cep,
                                                              '00000-000',
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
                                              Expanded(
                                                flex: 2,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Endereço',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.endereco,
                                                              'N/A',
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
                                                      'Número',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.numero,
                                                              '0000',
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
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Bairro',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.bairro,
                                                              'N/A',
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
                                                      'Cidade',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.cidade,
                                                              'N/A',
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
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Estado',
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
                                                              ccDetalhesCompaniesRow
                                                                  ?.estado,
                                                              'N/A',
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
                                          Text(
                                            'Desativar conta',
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
                                          Text(
                                            'Ao inativar esta empresa, todos os usuários vinculados a ela perderão o acesso ao sistema imediatamente. Os dados e históricos vinculados a eles serão mantidos e poderão ser consultados posteriormente.',
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
                                          if (ccDetalhesCompaniesRow?.ativo ==
                                              false)
                                            Builder(
                                              builder:
                                                  (context) => FFButtonWidget(
                                                    onPressed: () async {
                                                      final ativou = await showDialog<
                                                        bool
                                                      >(
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
                                                              child: PpAtivarContaWidget(
                                                                idEmpresa:
                                                                    ccDetalhesCompaniesRow!
                                                                        .id,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      if (ativou == true) {
                                                        _model.empresaSelecionada =
                                                            null;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    text: 'Ativar conta',
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12.0,
                                                          ),
                                                    ),
                                                  ),
                                            ),
                                          if (ccDetalhesCompaniesRow?.ativo ==
                                              true)
                                            Builder(
                                              builder:
                                                  (context) => FFButtonWidget(
                                                    onPressed: () async {
                                                      final desativou = await showDialog<
                                                        bool
                                                      >(
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
                                                              child: PpDesativarContaWidget(
                                                                idEmpresa:
                                                                    ccDetalhesCompaniesRow!
                                                                        .id,
                                                              ),
                                                            ),
                                                          );
                                                        },
                                                      );
                                                      if (desativou == true) {
                                                        _model.empresaSelecionada =
                                                            null;
                                                        safeSetState(() {});
                                                      }
                                                    },
                                                    text: 'Desativar conta',
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
                                                        0xFFAE1E1E,
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
                                                        color: Colors.white,
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12.0,
                                                          ),
                                                    ),
                                                  ),
                                            ),
                                        ].divide(const SizedBox(height: 24.0)),
                                      ),
                                    ),
                                  ].divide(const SizedBox(width: 24.0)),
                                ),
                              ),
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
                            child: Container(
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
                                                  .txBuscaAdminEmpresaTextController,
                                          focusNode:
                                              _model
                                                  .txBuscaAdminEmpresaFocusNode,
                                          onChanged:
                                              (_) => EasyDebounce.debounce(
                                                '_model.txBuscaAdminEmpresaTextController',
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
                                              .txBuscaAdminEmpresaTextControllerValidator
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
                            ),
                          ),
                        if (_model.stage == 'Embarcações')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              24.0,
                              0.0,
                              24.0,
                            ),
                            child: Container(
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
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
                                              ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<EmbarcacoesRow>
                                  gridViewEmbarcacoesRowList = snapshot.data!;

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
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        gridViewEmbarcacoesRowList.length,
                                    itemBuilder: (context, gridViewIndex) {
                                      final gridViewEmbarcacoesRow =
                                          gridViewEmbarcacoesRowList[gridViewIndex];
                                      return Builder(
                                        builder:
                                            (context) => InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
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
                                                      child: WebViewAware(
                                                        child: PpDetalheEmbarcacaoWidget(
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
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        12.0,
                                                      ),
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        12.0,
                                                      ),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: const Color(
                                                        0xFFFAFAFA,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            12.0,
                                                          ),
                                                      border: Border.all(
                                                        color: const Color(
                                                          0xFFE5E6E6,
                                                        ),
                                                      ),
                                                    ),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .stretch,
                                                      children: [
                                                        Container(
                                                          width: 12.0,
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
                                                              const Color(
                                                                0xFFAE1E1E,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
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
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Text(
                                                                            valueOrDefault<
                                                                              String
                                                                            >(
                                                                              gridViewEmbarcacoesRow.nomeEmbarcacoes,
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
                                                                            MainAxisSize.max,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
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
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(
                                                                                  context,
                                                                                ).bodyMedium.fontStyle,
                                                                          ),
                                                                          color: valueOrDefault<
                                                                            Color
                                                                          >(
                                                                            gridViewEmbarcacoesRow.ativo!
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
                                                                              FontWeight.w500,
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
                          ),
                        if (_model.stage == 'Usuários')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0,
                              24.0,
                              0.0,
                              24.0,
                            ),
                            child: Container(
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
                                                  .txBuscaUsuariosEmpresaTextController,
                                          focusNode:
                                              _model
                                                  .txBuscaUsuariosEmpresaFocusNode,
                                          onChanged:
                                              (_) => EasyDebounce.debounce(
                                                '_model.txBuscaUsuariosEmpresaTextController',
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
                                            ),
                                            hintText: 'Buscar usuário',
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
                                          ),
                                          cursorColor:
                                              FlutterFlowTheme.of(
                                                context,
                                              ).primaryText,
                                          enableInteractiveSelection: true,
                                          validator: _model
                                              .txBuscaUsuariosEmpresaTextControllerValidator
                                              .asValidator(context),
                                        ),
                                      ),
                                      FFButtonWidget(
                                        onPressed: () async {
                                          await actions.exportUsers(
                                            DateTime.now().subtract(
                                              const Duration(days: 365),
                                            ),
                                            DateTime.now(),
                                            'Todos',
                                          );
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
                                          ),
                                          elevation: 0.0,
                                          borderSide: const BorderSide(
                                            color: Color(0xFF007191),
                                            width: 1.0,
                                          ),
                                          borderRadius: BorderRadius.circular(
                                            8.0,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                          0.0,
                                          24.0,
                                          0.0,
                                          0.0,
                                        ),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 250.0,
                                          height: 48.0,
                                          decoration: const BoxDecoration(),
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
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: 200.0,
                                          height: 48.0,
                                          decoration: const BoxDecoration(),
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
                                          width: 250.0,
                                          height: 48.0,
                                          decoration: const BoxDecoration(),
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
                                                'Email',
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
                                          width: 200.0,
                                          height: 48.0,
                                          decoration: const BoxDecoration(),
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
                                                'Tipo',
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
                                          width: 150.0,
                                          height: 48.0,
                                          decoration: const BoxDecoration(),
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
                                                'Status',
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
                                      ].divide(const SizedBox(width: 12.0)),
                                    ),
                                  ),
                                  Container(
                                    decoration: const BoxDecoration(),
                                    child: FutureBuilder<List<UsersRow>>(
                                      future: UsersTable().queryRows(
                                        queryFn: (q) {
                                          var query = q
                                              .eqOrNull(
                                                'companies_id',
                                                _model.empresaSelecionada,
                                              )
                                              .ilike(
                                                'nome',
                                                '%${_model.txBuscaUsuariosEmpresaTextController.text}%',
                                              );
                                          return query.order('nome');
                                        },
                                      ),
                                      builder: (context, snapshot) {
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
                                        lvUsuariosEmpresaUsersRowList =
                                            snapshot.data!;

                                        return ListView.separated(
                                          padding: const EdgeInsets.fromLTRB(
                                            0,
                                            0,
                                            0,
                                            24.0,
                                          ),
                                          primary: false,
                                          shrinkWrap: true,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              lvUsuariosEmpresaUsersRowList
                                                  .length,
                                          separatorBuilder:
                                              (_, __) =>
                                                  const SizedBox(height: 12.0),
                                          itemBuilder: (
                                            context,
                                            lvUsuariosIndex,
                                          ) {
                                            final lvUsuariosUsersRow =
                                                lvUsuariosEmpresaUsersRowList[lvUsuariosIndex];
                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 250.0,
                                                        height: 48.0,
                                                        decoration:
                                                            const BoxDecoration(),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
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
                                                                    lvUsuariosUsersRow
                                                                        .nome,
                                                                    'Nome',
                                                                  ),
                                                                  style: FlutterFlowTheme.of(
                                                                    context,
                                                                  ).bodyMedium.override(
                                                                    font: GoogleFonts.inter(
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
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
                                                          ].divide(
                                                            const SizedBox(
                                                              height: 2.0,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 200.0,
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
                                                                lvUsuariosUsersRow
                                                                    .telefone,
                                                                'N/A',
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                        width: 250.0,
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
                                                                lvUsuariosUsersRow
                                                                    .email,
                                                                'N/A',
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                        width: 200.0,
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
                                                                lvUsuariosUsersRow
                                                                    .tipoUser,
                                                                'N/A',
                                                              ),
                                                              style: FlutterFlowTheme.of(
                                                                context,
                                                              ).bodyMedium.override(
                                                                font: GoogleFonts.inter(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                  fontStyle:
                                                                      FlutterFlowTheme.of(
                                                                        context,
                                                                      ).bodyMedium.fontStyle,
                                                                ),
                                                                fontSize: 14.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
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
                                                              valueOrDefault<
                                                                String
                                                              >(
                                                                lvUsuariosUsersRow
                                                                            .ativo ==
                                                                        true
                                                                    ? 'Ativo'
                                                                    : 'Inativo',
                                                                '-',
                                                              ),
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
                                                                  lvUsuariosUsersRow
                                                                              .ativo ==
                                                                          true
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
                                                                fontSize: 14.0,
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
                                                    ].divide(
                                                      const SizedBox(
                                                        width: 12.0,
                                                      ),
                                                    ),
                                                  ),
                                                  const Divider(
                                                    height: 1.0,
                                                    thickness: 2.0,
                                                    color: Color(0xFFE5E6E6),
                                                  ),
                                                ].divide(
                                                  const SizedBox(height: 12.0),
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
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              );
            },
          ),
        if (_model.aprovacoes == true)
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFFFAFAFA)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
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
                      _model.empresaSelecionada = null;
                      _model.aprovacoes = false;
                      _model.empresaSelecionadaNaoAprovada = null;
                      safeSetState(() {});
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
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Text(
                        'Empresas aguardando aprovação',
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
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0,
                        24.0,
                        0.0,
                        0.0,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: 320.0,
                                child: TextFormField(
                                  controller:
                                      _model.txBuscaEmpresaTextController2,
                                  focusNode: _model.txBuscaEmpresaFocusNode2,
                                  onChanged:
                                      (_) => EasyDebounce.debounce(
                                        '_model.txBuscaEmpresaTextController2',
                                        const Duration(milliseconds: 500),
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
                                    hintText: 'Buscar empresa',
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
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                        color: Color(0x00000000),
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            FlutterFlowTheme.of(context).error,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
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
                                      FlutterFlowTheme.of(context).primaryText,
                                  enableInteractiveSelection: true,
                                  validator: _model
                                      .txBuscaEmpresaTextController2Validator
                                      .asValidator(context),
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  if (responsiveVisibility(
                                    context: context,
                                    phone: false,
                                    tablet: false,
                                    tabletLandscape: false,
                                    desktop: false,
                                  ))
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
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                    ),
                                ].divide(const SizedBox(width: 24.0)),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
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
                                      'Nome da empresa',
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
                                width: 200.0,
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
                                      'CNPJ',
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
                                width: 200.0,
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
                                      'Data de cadastro',
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
                                width: 200.0,
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
                                  ),
                                ),
                              ),
                            ].divide(const SizedBox(width: 12.0)),
                          ),
                          Flexible(
                            child: Container(
                              decoration: const BoxDecoration(),
                              child: FutureBuilder<List<CompaniesRow>>(
                                key: ValueKey(
                                  'empresas_nao_aprovadas_${_model.txBuscaEmpresaTextController2.text}',
                                ),
                                future: CompaniesTable().queryRows(
                                  queryFn:
                                      (q) => q
                                          .ilike(
                                            'nome',
                                            '%${_model.txBuscaEmpresaTextController2.text}%',
                                          )
                                          .eqOrNull('aprovadas', false),
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
                                              AlwaysStoppedAnimation<Color>(
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
                                              ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<CompaniesRow>
                                  lvHistoricoCompaniesRowList = snapshot.data!;

                                  return ListView.separated(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      0,
                                      0,
                                      24.0,
                                    ),
                                    primary: false,
                                    shrinkWrap: true,
                                    scrollDirection: Axis.vertical,
                                    itemCount:
                                        lvHistoricoCompaniesRowList.length,
                                    separatorBuilder:
                                        (_, __) => const SizedBox(height: 12.0),
                                    itemBuilder: (context, lvHistoricoIndex) {
                                      final lvHistoricoCompaniesRow =
                                          lvHistoricoCompaniesRowList[lvHistoricoIndex];
                                      return InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          _model.empresaSelecionadaNaoAprovada =
                                              lvHistoricoCompaniesRow.id;
                                          safeSetState(() {});
                                        },
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  width: 100.0,
                                                  height: 48.0,
                                                  decoration:
                                                      const BoxDecoration(),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.min,
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
                                                              lvHistoricoCompaniesRow
                                                                  .id
                                                                  .toString(),
                                                              '0000',
                                                            ),
                                                            style: FlutterFlowTheme.of(
                                                              context,
                                                            ).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
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
                                                        MainAxisSize.min,
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
                                                              lvHistoricoCompaniesRow
                                                                  .nome,
                                                              'Nome',
                                                            ),
                                                            style: FlutterFlowTheme.of(
                                                              context,
                                                            ).bodyMedium.override(
                                                              font: GoogleFonts.inter(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                fontStyle:
                                                                    FlutterFlowTheme.of(
                                                                          context,
                                                                        )
                                                                        .bodyMedium
                                                                        .fontStyle,
                                                              ),
                                                              fontSize: 14.0,
                                                              letterSpacing:
                                                                  0.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
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
                                                      const SizedBox(
                                                        height: 2.0,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
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
                                                        valueOrDefault<String>(
                                                          lvHistoricoCompaniesRow
                                                              .cnpj,
                                                          '12.345.678/0001-10',
                                                        ),
                                                        style: FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
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
                                                        valueOrDefault<String>(
                                                          dateTimeFormat(
                                                            "dd/MM/yyyy",
                                                            lvHistoricoCompaniesRow
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
                                                                FontWeight
                                                                    .normal,
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
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 200.0,
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
                                                        valueOrDefault<String>(
                                                          lvHistoricoCompaniesRow
                                                              .email,
                                                          'N/A',
                                                        ),
                                                        style: FlutterFlowTheme.of(
                                                          context,
                                                        ).bodyMedium.override(
                                                          font: GoogleFonts.inter(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                                  )
                                                                  .bodyMedium
                                                                  .fontStyle,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(
                                                const SizedBox(width: 12.0),
                                              ),
                                            ),
                                            const Divider(
                                              height: 1.0,
                                              thickness: 2.0,
                                              color: Color(0xFFE5E6E6),
                                            ),
                                          ].divide(
                                            const SizedBox(height: 12.0),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ),
                        ].divide(const SizedBox(height: 24.0)),
                      ),
                    ),
                  ),
                ].divide(const SizedBox(height: 24.0)),
              ),
            ),
          ),
        if (_model.empresaSelecionadaNaoAprovada != null)
          FutureBuilder<List<CompaniesRow>>(
            future: CompaniesTable().querySingleRow(
              queryFn:
                  (q) => q.eqOrNull('id', _model.empresaSelecionadaNaoAprovada),
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
              List<CompaniesRow> ccDetalhesNaoAprovadoCompaniesRowList =
                  snapshot.data!;

              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final ccDetalhesNaoAprovadoCompaniesRow =
                  ccDetalhesNaoAprovadoCompaniesRowList.isNotEmpty
                      ? ccDetalhesNaoAprovadoCompaniesRowList.first
                      : null;

              return Container(
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
                            _model.empresaSelecionada = null;
                            _model.empresaSelecionadaNaoAprovada = null;
                            safeSetState(() {});
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
                                'Detalhes da empresa',
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
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0,
                            24.0,
                            0.0,
                            24.0,
                          ),
                          child: Container(
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
                                      borderRadius: BorderRadius.circular(16.0),
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
                                          color: const Color(0xFF00BDF2),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(24.0),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Image.network(
                                              valueOrDefault<String>(
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/2hxjo9i8onor/business_center.png',
                                                'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/acqua-way-web-bqkdd1/assets/2hxjo9i8onor/business_center.png',
                                              ),
                                              width: 100.0,
                                              height: 100.0,
                                              fit: BoxFit.contain,
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
                                            ),
                                            Text(
                                              valueOrDefault<String>(
                                                dateTimeFormat(
                                                  "dd/MM/yyyy",
                                                  ccDetalhesNaoAprovadoCompaniesRow
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
                                              'Telefone do responsável',
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
                                                color: const Color(0xFFE5E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      ccDetalhesNaoAprovadoCompaniesRow
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
                                          ].divide(const SizedBox(height: 8.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'CNPJ da empresa',
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
                                                color: const Color(0xFFE5E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      ccDetalhesNaoAprovadoCompaniesRow
                                                          ?.cnpj,
                                                      '12.345.678/0001-10',
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
                                          ].divide(const SizedBox(height: 8.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Qual a sua área de operação?',
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
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFE5E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      -1.0,
                                                    ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional.fromSTEB(
                                                        24.0,
                                                        24.0,
                                                        24.0,
                                                        0.0,
                                                      ),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      ccDetalhesNaoAprovadoCompaniesRow
                                                          ?.areaAtuacao,
                                                      'N/A',
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
                                          ].divide(const SizedBox(height: 8.0)),
                                        ),
                                        Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Qual a atividade da sua empresa?',
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
                                              height: 150.0,
                                              decoration: BoxDecoration(
                                                color: const Color(0xFFE5E6E6),
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
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
                                                      -1.0,
                                                    ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsetsDirectional.fromSTEB(
                                                        24.0,
                                                        24.0,
                                                        24.0,
                                                        0.0,
                                                      ),
                                                  child: Text(
                                                    valueOrDefault<String>(
                                                      ccDetalhesNaoAprovadoCompaniesRow
                                                          ?.atividadeEmpresa,
                                                      'N/A',
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
                                          ].divide(const SizedBox(height: 8.0)),
                                        ),
                                        Text(
                                          'Desativar conta',
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
                                        Text(
                                          'Ao inativar esta empresa, todos os usuários vinculados a ela perderão o acesso ao sistema imediatamente. Os dados e históricos vinculados a eles serão mantidos e poderão ser consultados posteriormente.',
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
                                        if (ccDetalhesNaoAprovadoCompaniesRow
                                                ?.ativo ==
                                            false)
                                          Builder(
                                            builder:
                                                (context) => FFButtonWidget(
                                                  onPressed: () async {
                                                    final ativou = await showDialog<
                                                      bool
                                                    >(
                                                      context: context,
                                                      builder: (dialogContext) {
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
                                                            child: PpAtivarContaWidget(
                                                              idEmpresa:
                                                                  ccDetalhesNaoAprovadoCompaniesRow!
                                                                      .id,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    if (ativou == true) {
                                                      _model.empresaSelecionadaNaoAprovada =
                                                          null;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  text: 'Ativar conta',
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12.0,
                                                        ),
                                                  ),
                                                ),
                                          ),
                                        if (ccDetalhesNaoAprovadoCompaniesRow
                                                ?.ativo ==
                                            true)
                                          Builder(
                                            builder:
                                                (context) => FFButtonWidget(
                                                  onPressed: () async {
                                                    final desativou = await showDialog<
                                                      bool
                                                    >(
                                                      context: context,
                                                      builder: (dialogContext) {
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
                                                            child: PpDesativarContaWidget(
                                                              idEmpresa:
                                                                  ccDetalhesNaoAprovadoCompaniesRow!
                                                                      .id,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    );
                                                    if (desativou == true) {
                                                      _model.empresaSelecionadaNaoAprovada =
                                                          null;
                                                      safeSetState(() {});
                                                    }
                                                  },
                                                  text: 'Desativar conta',
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
                                                      0xFFAE1E1E,
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
                                                      color: Colors.white,
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          12.0,
                                                        ),
                                                  ),
                                                ),
                                          ),
                                      ].divide(const SizedBox(height: 24.0)),
                                    ),
                                  ),
                                ].divide(const SizedBox(width: 24.0)),
                              ),
                            ),
                          ),
                        ),
                      ].divide(const SizedBox(height: 24.0)),
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
