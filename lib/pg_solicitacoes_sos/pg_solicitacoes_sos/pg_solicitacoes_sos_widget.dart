import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pg_solicitacoes_sos/pp_detalhe_viagem_sos/pp_detalhe_viagem_sos_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'dart:async';
import 'pg_solicitacoes_sos_model.dart';
export 'pg_solicitacoes_sos_model.dart';

class PgSolicitacoesSosWidget extends StatefulWidget {
  const PgSolicitacoesSosWidget({super.key});

  @override
  State<PgSolicitacoesSosWidget> createState() =>
      _PgSolicitacoesSosWidgetState();
}

class _PgSolicitacoesSosWidgetState extends State<PgSolicitacoesSosWidget> {
  late PgSolicitacoesSosModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgSolicitacoesSosModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.empresaSelecionada = null;
      _model.stage = 'Geral';
      _model.textoBusca = '';
      safeSetState(() {});
    });

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
                        'Solicitações de SOS',
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
                                      _model.txBuscaEmpresaTextController,
                                  focusNode: _model.txBuscaEmpresaFocusNode,
                                  onChanged:
                                      (_) => EasyDebounce.debounce(
                                        '_model.txBuscaEmpresaTextController',
                                        const Duration(milliseconds: 500),
                                        () => safeSetState(() {
                                          _model.textoBusca =
                                              _model
                                                  .txBuscaEmpresaTextController
                                                  .text
                                                  .trim();
                                        }),
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
                                    hintText: 'Buscar solicitações de SOS',
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
                                      .txBuscaEmpresaTextControllerValidator
                                      .asValidator(context),
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
                                  Flexible(
                                    child: Container(
                                      decoration: const BoxDecoration(),
                                      child: FutureBuilder<
                                        List<ViewSosCompletoRow>
                                      >(
                                        key: ValueKey(_model.textoBusca),
                                        future: ViewSosCompletoTable()
                                            .queryRows(
                                              queryFn: (q) {
                                                return q.eqOrNull(
                                                  'resolvida',
                                                  false,
                                                );
                                              },
                                            )
                                            .timeout(
                                              const Duration(seconds: 15),
                                              onTimeout: () {
                                                throw TimeoutException(
                                                  'A busca demorou muito para responder. Tente novamente.',
                                                );
                                              },
                                            )
                                            .then((listaCompleta) {
                                              // Filtra no cliente porque tipo é enum e não suporta ilike
                                              if (_model.textoBusca.isEmpty) {
                                                return listaCompleta;
                                              }
                                              final buscaLower =
                                                  _model.textoBusca
                                                      .toLowerCase();
                                              return listaCompleta.where((sos) {
                                                final tipoStr =
                                                    sos.tipo
                                                        ?.toString()
                                                        .toLowerCase() ??
                                                    '';
                                                return tipoStr.contains(
                                                  buscaLower,
                                                );
                                              }).toList();
                                            }),
                                        builder: (context, snapshot) {
                                          // Customize what your widget looks like when it's loading.
                                          if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
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

                                          if (snapshot.hasError) {
                                            return Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  24.0,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.error_outline,
                                                      size: 48.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).error,
                                                    ),
                                                    const SizedBox(
                                                      height: 16.0,
                                                    ),
                                                    Text(
                                                      'Erro ao buscar solicitações',
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
                                                    const SizedBox(height: 8.0),
                                                    Text(
                                                      snapshot.error.toString(),
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).secondaryText,
                                                        fontSize: 12.0,
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
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          }

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
                                          List<ViewSosCompletoRow>
                                          gridViewViewSosCompletoRowList =
                                              snapshot.data!;

                                          if (gridViewViewSosCompletoRowList
                                              .isEmpty) {
                                            return Center(
                                              child: Padding(
                                                padding: const EdgeInsets.all(
                                                  48.0,
                                                ),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  children: [
                                                    Icon(
                                                      Icons.search_off_rounded,
                                                      size: 64.0,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).secondaryText,
                                                    ),
                                                    const SizedBox(
                                                      height: 16.0,
                                                    ),
                                                    Text(
                                                      'Nenhum resultado encontrado',
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
                                                    const SizedBox(height: 8.0),
                                                    Text(
                                                      'Tente ajustar os termos de busca',
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
                                                        color:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).secondaryText,
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
                                                  ],
                                                ),
                                              ),
                                            );
                                          }

                                          return LayoutBuilder(
                                            builder: (context, constraints) {
                                              // Ajusta o número de colunas baseado na largura disponível
                                              final crossAxisCount =
                                                  constraints.maxWidth > 1200
                                                      ? 3
                                                      : constraints.maxWidth >
                                                          800
                                                      ? 2
                                                      : 1;

                                              // Ajusta o aspect ratio baseado no número de colunas
                                              final childAspectRatio =
                                                  crossAxisCount == 1
                                                      ? 3.5
                                                      : crossAxisCount == 2
                                                      ? 3.0
                                                      : 2.5;

                                              return GridView.builder(
                                                padding: EdgeInsets.zero,
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                      crossAxisCount:
                                                          crossAxisCount,
                                                      crossAxisSpacing: 12.0,
                                                      mainAxisSpacing: 12.0,
                                                      childAspectRatio:
                                                          childAspectRatio,
                                                    ),
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount:
                                                    gridViewViewSosCompletoRowList
                                                        .length,
                                                itemBuilder: (
                                                  context,
                                                  gridViewIndex,
                                                ) {
                                                  final gridViewViewSosCompletoRow =
                                                      gridViewViewSosCompletoRowList[gridViewIndex];
                                                  return Material(
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
                                                        width: 100.0,
                                                        height: 100.0,
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
                                                          children: [
                                                            Container(
                                                              width: 12.0,
                                                              height:
                                                                  double
                                                                      .infinity,
                                                              decoration: BoxDecoration(
                                                                color: valueOrDefault<
                                                                  Color
                                                                >(
                                                                  gridViewViewSosCompletoRow
                                                                          .resolvida!
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
                                                                            20.0,
                                                                          ),
                                                                      child: Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
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
                                                                                  gridViewViewSosCompletoRow.tipo,
                                                                                  'Tipo',
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
                                                                                valueOrDefault<
                                                                                  String
                                                                                >(
                                                                                  functions.latLogGraus(
                                                                                    gridViewViewSosCompletoRow.lat!,
                                                                                    gridViewViewSosCompletoRow.long!,
                                                                                  ),
                                                                                  '0° 0\' 0.00\" S 0° 0\' 0.00\" W',
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
                                                                            ],
                                                                          ),
                                                                          Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            crossAxisAlignment:
                                                                                CrossAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                valueOrDefault<
                                                                                  String
                                                                                >(
                                                                                  'Viagem: ${gridViewViewSosCompletoRow.viagemId?.toString()}',
                                                                                  'Nome piloto',
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
                                                                              Text(
                                                                                valueOrDefault<
                                                                                  String
                                                                                >(
                                                                                  'Piloto: ${gridViewViewSosCompletoRow.nomePiloto}',
                                                                                  'Nome piloto',
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
                                                                              Text(
                                                                                valueOrDefault<
                                                                                  String
                                                                                >(
                                                                                  dateTimeFormat(
                                                                                    "dd MMM\'.\' yyyy h:mm",
                                                                                    gridViewViewSosCompletoRow.createdAt,
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
                                                                          Builder(
                                                                            builder:
                                                                                (
                                                                                  context,
                                                                                ) => FFButtonWidget(
                                                                                  onPressed: () async {
                                                                                    await showDialog(
                                                                                      context:
                                                                                          context,
                                                                                      builder: (
                                                                                        dialogContext,
                                                                                      ) {
                                                                                        return Dialog(
                                                                                          elevation:
                                                                                              0,
                                                                                          insetPadding:
                                                                                              EdgeInsets.zero,
                                                                                          backgroundColor:
                                                                                              Colors.transparent,
                                                                                          alignment: const AlignmentDirectional(
                                                                                            0.0,
                                                                                            0.0,
                                                                                          ).resolve(
                                                                                            Directionality.of(
                                                                                              context,
                                                                                            ),
                                                                                          ),
                                                                                          child: WebViewAware(
                                                                                            child: PpDetalheViagemSosWidget(
                                                                                              idViagem:
                                                                                                  gridViewViewSosCompletoRow.viagemId!,
                                                                                              idSos:
                                                                                                  gridViewViewSosCompletoRow.sosId!,
                                                                                              tipoSos:
                                                                                                  gridViewViewSosCompletoRow.tipo!,
                                                                                            ),
                                                                                          ),
                                                                                        );
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  text:
                                                                                      'Acompanhar viagem',
                                                                                  options: FFButtonOptions(
                                                                                    height:
                                                                                        40.0,
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
                                                                                            ).titleSmall.fontWeight,
                                                                                        fontStyle:
                                                                                            FlutterFlowTheme.of(
                                                                                              context,
                                                                                            ).titleSmall.fontStyle,
                                                                                      ),
                                                                                      color:
                                                                                          Colors.white,
                                                                                      letterSpacing:
                                                                                          0.0,
                                                                                      fontWeight:
                                                                                          FlutterFlowTheme.of(
                                                                                            context,
                                                                                          ).titleSmall.fontWeight,
                                                                                      fontStyle:
                                                                                          FlutterFlowTheme.of(
                                                                                            context,
                                                                                          ).titleSmall.fontStyle,
                                                                                    ),
                                                                                    elevation:
                                                                                        0.0,
                                                                                    borderRadius: BorderRadius.circular(
                                                                                      8.0,
                                                                                    ),
                                                                                  ),
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
                                                  );
                                                },
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
                ],
              ),
            ),
          ),
      ],
    );
  }
}
