import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/pg_notificacao/pp_detalhe_notificacao/pp_detalhe_notificacao_widget.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pg_notificacoes_model.dart';
export 'pg_notificacoes_model.dart';

class PgNotificacoesWidget extends StatefulWidget {
  const PgNotificacoesWidget({super.key});

  @override
  State<PgNotificacoesWidget> createState() => _PgNotificacoesWidgetState();
}

class _PgNotificacoesWidgetState extends State<PgNotificacoesWidget> {
  late PgNotificacoesModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgNotificacoesModel());

    _model.txBuscaEmpresaTextController ??= TextEditingController();
    _model.txBuscaEmpresaFocusNode ??= FocusNode();

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
                      'Notificações',
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
                                controller: _model.txBuscaEmpresaTextController,
                                focusNode: _model.txBuscaEmpresaFocusNode,
                                onChanged:
                                    (_) => EasyDebounce.debounce(
                                      '_model.txBuscaEmpresaTextController',
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
                                  hintText: 'Buscar notificações',
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
                                    .txBuscaEmpresaTextControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            FlutterFlowDropDown<String>(
                              controller:
                                  _model.dropDownValueController ??=
                                      FormFieldController<String>(
                                        _model.dropDownValue ??= 'Todas',
                                      ),
                              options: const ['Lidas', 'Não Lidas', 'Todas'],
                              onChanged:
                                  (val) => safeSetState(
                                    () => _model.dropDownValue = val,
                                  ),
                              width: 200.0,
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
                                fontWeight:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).bodyMedium.fontStyle,
                              ),
                              hintText: 'Todas',
                              icon: Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                size: 24.0,
                              ),
                              fillColor:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).secondaryBackground,
                              elevation: 2.0,
                              borderColor: Colors.transparent,
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
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0,
                                    0.0,
                                    12.0,
                                    0.0,
                                  ),
                                  child: Text(
                                    'Título',
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
                              width: double.infinity,
                              height: 48.0,
                              constraints: const BoxConstraints(
                                maxWidth: 700.0,
                              ),
                              decoration: const BoxDecoration(),
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
                                    'Descrição',
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                    12.0,
                                    0.0,
                                    12.0,
                                    0.0,
                                  ),
                                  child: Text(
                                    'Data e hora',
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
                            child: FutureBuilder<List<NotificacoesRow>>(
                              future: NotificacoesTable().queryRows(
                                queryFn:
                                    (q) => q
                                        .ilike(
                                          'descricao',
                                          '%${_model.txBuscaEmpresaTextController.text}%',
                                        )
                                        .eqOrNull('lido', () {
                                          if (_model.dropDownValue == 'Lidas') {
                                            return true;
                                          } else if (_model.dropDownValue ==
                                              'Não Lidas') {
                                            return false;
                                          } else {
                                            return null;
                                          }
                                        }()),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor: AlwaysStoppedAnimation<
                                          Color
                                        >(FlutterFlowTheme.of(context).primary),
                                      ),
                                    ),
                                  );
                                }
                                List<NotificacoesRow>
                                lvHistoricoNotificacoesRowList = snapshot.data!;

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
                                      lvHistoricoNotificacoesRowList.length,
                                  separatorBuilder:
                                      (_, __) => const SizedBox(height: 12.0),
                                  itemBuilder: (context, lvHistoricoIndex) {
                                    final lvHistoricoNotificacoesRow =
                                        lvHistoricoNotificacoesRowList[lvHistoricoIndex];
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
                                                      child: PpDetalheNotificacaoWidget(
                                                        idNotificacao:
                                                            lvHistoricoNotificacoesRow
                                                                .id,
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
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
                                                                  lvHistoricoNotificacoesRow
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
                                                      width: double.infinity,
                                                      height: 48.0,
                                                      constraints:
                                                          const BoxConstraints(
                                                            maxWidth: 700.0,
                                                          ),
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
                                                                  lvHistoricoNotificacoesRow
                                                                      .descricao,
                                                                  'descricao',
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
                                                              dateTimeFormat(
                                                                "dd/MM/yyyy",
                                                                lvHistoricoNotificacoesRow
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
      ],
    );
  }
}
