import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pg_acompanhamento/pp_acompanhamento/pp_acompanhamento_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'pg_acompanhamento_model.dart';
export 'pg_acompanhamento_model.dart';

class PgAcompanhamentoWidget extends StatefulWidget {
  const PgAcompanhamentoWidget({super.key});

  @override
  State<PgAcompanhamentoWidget> createState() => _PgAcompanhamentoWidgetState();
}

class _PgAcompanhamentoWidgetState extends State<PgAcompanhamentoWidget> {
  late PgAcompanhamentoModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgAcompanhamentoModel());

    // On component load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      _model.empresaSelecionada = null;
      _model.stage = 'Geral';
      safeSetState(() {});
    });

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
          decoration: const BoxDecoration(
            color: Color(0xFFFAFAFA),
          ),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(
                      'Acompanhamento',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            font: GoogleFonts.inter(
                              fontWeight: FontWeight.w500,
                              fontStyle: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .fontStyle,
                            ),
                            fontSize: 24.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w500,
                            fontStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .fontStyle,
                          ),
                    ),
                  ],
                ),
                Flexible(
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        0.0, 24.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Flexible(
                          child: Container(
                            decoration: const BoxDecoration(),
                            child: FutureBuilder<ApiCallResponse>(
                              future: SupabaseEdgeGroup.buscarViagensAtivasCall
                                  .call(),
                              builder: (context, snapshot) {
                                // Tratamento de estados do FutureBuilder
                                if (snapshot.connectionState ==
                                    ConnectionState.waiting) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50.0,
                                      height: 50.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }

                                // Tratamento de erros
                                if (snapshot.hasError) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          size: 48.0,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                        const SizedBox(height: 16.0),
                                        Text(
                                          'Erro ao carregar viagens',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          snapshot.error.toString(),
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                          textAlign: TextAlign.center,
                                        ),
                                        const SizedBox(height: 16.0),
                                        FFButtonWidget(
                                          onPressed: () {
                                            setState(() {});
                                          },
                                          text: 'Tentar novamente',
                                          options: FFButtonOptions(
                                            height: 40.0,
                                            padding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(
                                                24.0, 0.0, 24.0, 0.0,
                                              ),
                                            iconPadding:
                                                const EdgeInsetsDirectional
                                                    .fromSTEB(0.0, 0.0, 0.0, 0.0),
                                            color: FlutterFlowTheme.of(context)
                                                .primary,
                                            textStyle:
                                                FlutterFlowTheme.of(context)
                                                    .titleSmall
                                                    .override(
                                                      fontFamily: 'Inter',
                                                      color: Colors.white,
                                                      letterSpacing: 0.0,
                                                    ),
                                            elevation: 3.0,
                                            borderSide: const BorderSide(
                                              color: Colors.transparent,
                                              width: 1.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                // Verificar se tem dados
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.info_outline,
                                          size: 48.0,
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                        ),
                                        const SizedBox(height: 16.0),
                                        Text(
                                          'Nenhum dado disponível',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                final gridViewBuscarViagensAtivasResponse =
                                    snapshot.data!;

                                // Verificar status da resposta
                                if (gridViewBuscarViagensAtivasResponse
                                        .statusCode !=
                                    200) {
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.error_outline,
                                          size: 48.0,
                                          color: FlutterFlowTheme.of(context)
                                              .error,
                                        ),
                                        const SizedBox(height: 16.0),
                                        Text(
                                          'Erro na resposta da API',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyLarge,
                                        ),
                                        const SizedBox(height: 8.0),
                                        Text(
                                          'Status: ${gridViewBuscarViagensAtivasResponse.statusCode}',
                                          style: FlutterFlowTheme.of(context)
                                              .bodySmall,
                                        ),
                                      ],
                                    ),
                                  );
                                }

                                return Builder(
                                  builder: (context) {
                                    final listaViagens = SupabaseEdgeGroup
                                            .buscarViagensAtivasCall
                                            .viagens(
                                              gridViewBuscarViagensAtivasResponse
                                                  .jsonBody,
                                            )
                                            ?.map((e) => e)
                                            .toList()
                                            .toList() ??
                                        [];

                                    // Verificar se a lista está vazia
                                    if (listaViagens.isEmpty) {
                                      return Center(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.directions_boat_outlined,
                                              size: 48.0,
                                              color: FlutterFlowTheme.of(context)
                                                  .secondaryText,
                                            ),
                                            const SizedBox(height: 16.0),
                                            Text(
                                              'Nenhuma viagem ativa encontrada',
                                              style: FlutterFlowTheme.of(context)
                                                  .bodyLarge,
                                            ),
                                          ],
                                        ),
                                      );
                                    }

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
                                      itemCount: listaViagens.length,
                                      itemBuilder:
                                          (context, listaViagensIndex) {
                                        final listaViagensItem =
                                            listaViagens[listaViagensIndex];
                                        return Builder(
                                          builder: (context) => InkWell(
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
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: WebViewAware(
                                                      child:
                                                          PpAcompanhamentoWidget(
                                                        idViagem: (SupabaseEdgeGroup
                                                            .buscarViagensAtivasCall
                                                            .viagensviagemid(
                                                              gridViewBuscarViagensAtivasResponse
                                                                  .jsonBody,
                                                            )!
                                                            .elementAtOrNull(
                                                                listaViagensIndex))!,
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
                                                    BorderRadius.circular(12.0),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(12.0),
                                                child: Container(
                                                  width: 100.0,
                                                  height: 100.0,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xFFFAFAFA),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.0),
                                                    border: Border.all(
                                                      color: const Color(
                                                          0xFFE5E6E6),
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Container(
                                                        width: 12.0,
                                                        height: double.infinity,
                                                        decoration:
                                                            const BoxDecoration(
                                                          color: Color(
                                                              0xFF1EAE3E),
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
                                                                    const EdgeInsets
                                                                        .all(
                                                                        24.0),
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
                                                                              String>(
                                                                            SupabaseEdgeGroup.buscarViagensAtivasCall
                                                                                .viagensnomebarco(
                                                                                  gridViewBuscarViagensAtivasResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(listaViagensIndex),
                                                                            'Nome Barco',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            SupabaseEdgeGroup.buscarViagensAtivasCall
                                                                                .viagenscoordenadasformatadas(
                                                                                  gridViewBuscarViagensAtivasResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(listaViagensIndex),
                                                                            '00° 00\' 00.00\" S  00° 00\' 00.00\" W',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FontWeight.w500,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                fontSize: 16.0,
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FontWeight.w500,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                                                                          valueOrDefault<
                                                                              String>(
                                                                            'Piloto: ${valueOrDefault<String>(
                                                                              SupabaseEdgeGroup.buscarViagensAtivasCall
                                                                                  .viagensnomepiloto(
                                                                                    gridViewBuscarViagensAtivasResponse.jsonBody,
                                                                                  )
                                                                                  ?.elementAtOrNull(listaViagensIndex),
                                                                              'Nome piloto',
                                                                            )}',
                                                                            'Nome piloto',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          'Origem: ${valueOrDefault<String>(
                                                                            SupabaseEdgeGroup.buscarViagensAtivasCall
                                                                                .viagensorigem(
                                                                                  gridViewBuscarViagensAtivasResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(listaViagensIndex),
                                                                            'Nome origem',
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                        Text(
                                                                          'Destino: ${valueOrDefault<String>(
                                                                            SupabaseEdgeGroup.buscarViagensAtivasCall
                                                                                .viagensdestino(
                                                                                  gridViewBuscarViagensAtivasResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(listaViagensIndex),
                                                                            'Nome destino',
                                                                          )}',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyMedium
                                                                              .override(
                                                                                font: GoogleFonts.inter(
                                                                                  fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                                ),
                                                                                letterSpacing: 0.0,
                                                                                fontWeight: FlutterFlowTheme.of(context).bodyMedium.fontWeight,
                                                                                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Text(
                                                                      '${valueOrDefault<String>(
                                                                        (SupabaseEdgeGroup.buscarViagensAtivasCall
                                                                                .viagensqtdalertas(
                                                                                  gridViewBuscarViagensAtivasResponse.jsonBody,
                                                                                )
                                                                                ?.elementAtOrNull(listaViagensIndex))
                                                                            ?.toString(),
                                                                        '0',
                                                                      )} alertas emitidos',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyMedium
                                                                          .override(
                                                                            font:
                                                                                GoogleFonts.inter(
                                                                              fontWeight: FontWeight.w500,
                                                                              fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                                                                            ),
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            letterSpacing:
                                                                                0.0,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            fontStyle:
                                                                                FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
