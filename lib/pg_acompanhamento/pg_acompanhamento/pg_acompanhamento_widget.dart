import '/backend/api_requests/api_calls.dart';
import '/backend/api_requests/api_manager.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/pg_acompanhamento/pp_acompanhamento/pp_acompanhamento_widget.dart';
import 'package:flutter/material.dart';
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
  Future<ApiCallResponse>? _futureViagens;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  Future<ApiCallResponse> _loadViagens() {
    ApiManager.clearCache('Buscar Viagens Ativas');
    return SupabaseEdgeGroup.buscarViagensAtivasCall.call();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PgAcompanhamentoModel());
    _futureViagens = _loadViagens();

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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Acompanhamento',
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
                    IconButton(
                      icon: const Icon(Icons.refresh_rounded),
                      onPressed: () {
                        setState(() {
                          _futureViagens = _loadViagens();
                        });
                      },
                      tooltip: 'Atualizar lista',
                      color: FlutterFlowTheme.of(context).primary,
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
                            child: RefreshIndicator(
                              onRefresh: () async {
                                setState(() {
                                  _futureViagens = _loadViagens();
                                });
                                await _futureViagens;
                              },
                              child: FutureBuilder<ApiCallResponse>(
                                future: _futureViagens,
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
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).primary,
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
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).error,
                                          ),
                                          const SizedBox(height: 16.0),
                                          Text(
                                            'Erro ao carregar viagens',
                                            style:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodyLarge,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            snapshot.error.toString(),
                                            style:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodySmall,
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
                                                  FlutterFlowTheme.of(
                                                    context,
                                                  ).primary,
                                              textStyle: FlutterFlowTheme.of(
                                                context,
                                              ).titleSmall.override(
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
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).secondaryText,
                                          ),
                                          const SizedBox(height: 16.0),
                                          Text(
                                            'Nenhum dado disponível',
                                            style:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodyLarge,
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
                                            color:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).error,
                                          ),
                                          const SizedBox(height: 16.0),
                                          Text(
                                            'Erro na resposta da API',
                                            style:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodyLarge,
                                          ),
                                          const SizedBox(height: 8.0),
                                          Text(
                                            'Status: ${gridViewBuscarViagensAtivasResponse.statusCode}',
                                            style:
                                                FlutterFlowTheme.of(
                                                  context,
                                                ).bodySmall,
                                          ),
                                        ],
                                      ),
                                    );
                                  }

                                  return Builder(
                                    builder: (context) {
                                      // Verificar se jsonBody não é null
                                      if (gridViewBuscarViagensAtivasResponse
                                              .jsonBody ==
                                          null) {
                                        return Center(
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.error_outline,
                                                size: 48.0,
                                                color:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).error,
                                              ),
                                              const SizedBox(height: 16.0),
                                              Text(
                                                'Erro: Resposta da API está vazia',
                                                style:
                                                    FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyLarge,
                                              ),
                                            ],
                                          ),
                                        );
                                      }

                                      // Extrair lista de viagens diretamente do jsonBody
                                      var viagensRaw = SupabaseEdgeGroup
                                          .buscarViagensAtivasCall
                                          .viagens(
                                            gridViewBuscarViagensAtivasResponse
                                                .jsonBody,
                                          );

                                      // Se não retornou nada, tentar acessar diretamente
                                      viagensRaw ??= getJsonField(
                                        gridViewBuscarViagensAtivasResponse
                                            .jsonBody,
                                        r'''$.viagens''',
                                        true,
                                      );

                                      // Converter para lista e filtrar nulls
                                      final listaViagens =
                                          (viagensRaw is List
                                                  ? viagensRaw
                                                  : <dynamic>[])
                                              .where((e) => e != null)
                                              .toList();

                                      // Verificar se a lista está vazia
                                      if (listaViagens.isEmpty) {
                                        return SingleChildScrollView(
                                          physics:
                                              const AlwaysScrollableScrollPhysics(),
                                          child: SizedBox(
                                            height:
                                                MediaQuery.of(
                                                  context,
                                                ).size.height *
                                                0.6,
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons
                                                        .directions_boat_outlined,
                                                    size: 64.0,
                                                    color:
                                                        FlutterFlowTheme.of(
                                                          context,
                                                        ).secondaryText,
                                                  ),
                                                  const SizedBox(height: 16.0),
                                                  Text(
                                                    'Nenhuma viagem ativa encontrada',
                                                    style: FlutterFlowTheme.of(
                                                      context,
                                                    ).headlineSmall.override(
                                                      fontFamily: 'Inter',
                                                      letterSpacing: 0.0,
                                                    ),
                                                  ),
                                                  const SizedBox(height: 8.0),
                                                  Text(
                                                    'Não há viagens em andamento no momento',
                                                    style: FlutterFlowTheme.of(
                                                      context,
                                                    ).bodyMedium.override(
                                                      fontFamily: 'Inter',
                                                      color:
                                                          FlutterFlowTheme.of(
                                                            context,
                                                          ).secondaryText,
                                                      letterSpacing: 0.0,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }

                                      return SingleChildScrollView(
                                        physics:
                                            const AlwaysScrollableScrollPhysics(),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    0.0,
                                                    0.0,
                                                    12.0,
                                                  ),
                                              child: Text(
                                                '${listaViagens.length} ${listaViagens.length == 1 ? 'viagem ativa' : 'viagens ativas'}',
                                                style: FlutterFlowTheme.of(
                                                  context,
                                                ).bodyMedium.override(
                                                  fontFamily: 'Inter',
                                                  color:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).secondaryText,
                                                  fontSize: 14.0,
                                                  letterSpacing: 0.0,
                                                ),
                                              ),
                                            ),
                                            LayoutBuilder(
                                              builder: (context, constraints) {
                                                // Responsivo: largura total em telas < 600px, metade em telas maiores
                                                final isMobile =
                                                    constraints.maxWidth < 600;
                                                final itemWidth =
                                                    isMobile
                                                        ? constraints.maxWidth
                                                        : (constraints
                                                                    .maxWidth -
                                                                12.0) /
                                                            2;

                                                return Wrap(
                                                  spacing: 12.0,
                                                  runSpacing: 12.0,
                                                  children:
                                                      listaViagens.map((
                                                        listaViagensItem,
                                                      ) {
                                                        return SizedBox(
                                                          width: itemWidth,
                                                          child: InkWell(
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
                                                                        EdgeInsets
                                                                            .zero,
                                                                    backgroundColor:
                                                                        Colors
                                                                            .transparent,
                                                                    alignment: const AlignmentDirectional(
                                                                      0.0,
                                                                      0.0,
                                                                    ).resolve(
                                                                      Directionality.of(
                                                                        context,
                                                                      ),
                                                                    ),
                                                                    child: WebViewAware(
                                                                      child: PpAcompanhamentoWidget(
                                                                        idViagem: castToType<
                                                                          int
                                                                        >(
                                                                          getJsonField(
                                                                            listaViagensItem,
                                                                            r'''$.viagem_id''',
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                              );
                                                            },
                                                            child: Material(
                                                              color:
                                                                  Colors
                                                                      .transparent,
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
                                                                  child: IntrinsicHeight(
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Container(
                                                                          width:
                                                                              12.0,
                                                                          height:
                                                                              double.infinity,
                                                                          decoration: BoxDecoration(
                                                                            color:
                                                                                castToType<
                                                                                          bool
                                                                                        >(
                                                                                          getJsonField(
                                                                                            listaViagensItem,
                                                                                            r'''$.sos_emitido''',
                                                                                          ),
                                                                                        ) ==
                                                                                        true
                                                                                    ? const Color(
                                                                                      0xFFFF3B30,
                                                                                    )
                                                                                    : const Color(
                                                                                      0xFF1EAE3E,
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
                                                                                  padding: const EdgeInsets.all(
                                                                                    16.0,
                                                                                  ),
                                                                                  child: Column(
                                                                                    mainAxisSize:
                                                                                        MainAxisSize.min,
                                                                                    mainAxisAlignment:
                                                                                        MainAxisAlignment.start,
                                                                                    crossAxisAlignment:
                                                                                        CrossAxisAlignment.start,
                                                                                    children: [
                                                                                      Row(
                                                                                        mainAxisSize:
                                                                                            MainAxisSize.max,
                                                                                        mainAxisAlignment:
                                                                                            MainAxisAlignment.spaceBetween,
                                                                                        children: [
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              valueOrDefault<
                                                                                                String
                                                                                              >(
                                                                                                castToType<
                                                                                                  String
                                                                                                >(
                                                                                                  getJsonField(
                                                                                                    listaViagensItem,
                                                                                                    r'''$.nome_barco''',
                                                                                                  ),
                                                                                                ),
                                                                                                'Nome Barco',
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
                                                                                                    14.0,
                                                                                                letterSpacing:
                                                                                                    0.0,
                                                                                                fontWeight:
                                                                                                    FontWeight.w500,
                                                                                                fontStyle:
                                                                                                    FlutterFlowTheme.of(
                                                                                                      context,
                                                                                                    ).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              overflow:
                                                                                                  TextOverflow.ellipsis,
                                                                                              maxLines:
                                                                                                  1,
                                                                                            ),
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            width:
                                                                                                8.0,
                                                                                          ),
                                                                                          Flexible(
                                                                                            child: Text(
                                                                                              valueOrDefault<
                                                                                                String
                                                                                              >(
                                                                                                castToType<
                                                                                                  String
                                                                                                >(
                                                                                                  getJsonField(
                                                                                                    listaViagensItem,
                                                                                                    r'''$.coordenadas_formatadas''',
                                                                                                  ),
                                                                                                ),
                                                                                                '00° 00\' 00.00" S  00° 00\' 00.00" W',
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
                                                                                                    12.0,
                                                                                                letterSpacing:
                                                                                                    0.0,
                                                                                                fontWeight:
                                                                                                    FontWeight.w500,
                                                                                                fontStyle:
                                                                                                    FlutterFlowTheme.of(
                                                                                                      context,
                                                                                                    ).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              overflow:
                                                                                                  TextOverflow.ellipsis,
                                                                                              maxLines:
                                                                                                  1,
                                                                                              textAlign:
                                                                                                  TextAlign.end,
                                                                                            ),
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height:
                                                                                            8.0,
                                                                                      ),
                                                                                      Column(
                                                                                        mainAxisSize:
                                                                                            MainAxisSize.min,
                                                                                        crossAxisAlignment:
                                                                                            CrossAxisAlignment.start,
                                                                                        children: [
                                                                                          Text(
                                                                                            valueOrDefault<
                                                                                              String
                                                                                            >(
                                                                                              'Piloto: ${valueOrDefault<String>(castToType<String>(getJsonField(listaViagensItem, r'''$.nome_piloto''')), 'Nome piloto')}',
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
                                                                                              fontSize:
                                                                                                  12.0,
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
                                                                                            overflow:
                                                                                                TextOverflow.ellipsis,
                                                                                            maxLines:
                                                                                                1,
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            height:
                                                                                                4.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'Origem: ${valueOrDefault<String>(castToType<String>(getJsonField(listaViagensItem, r'''$.origem''')), 'Nome origem')}',
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
                                                                                              fontSize:
                                                                                                  12.0,
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
                                                                                            overflow:
                                                                                                TextOverflow.ellipsis,
                                                                                            maxLines:
                                                                                                1,
                                                                                          ),
                                                                                          const SizedBox(
                                                                                            height:
                                                                                                4.0,
                                                                                          ),
                                                                                          Text(
                                                                                            'Destino: ${valueOrDefault<String>(castToType<String>(getJsonField(listaViagensItem, r'''$.destino''')), 'Nome destino')}',
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
                                                                                              fontSize:
                                                                                                  12.0,
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
                                                                                            overflow:
                                                                                                TextOverflow.ellipsis,
                                                                                            maxLines:
                                                                                                1,
                                                                                          ),
                                                                                        ],
                                                                                      ),
                                                                                      const SizedBox(
                                                                                        height:
                                                                                            8.0,
                                                                                      ),
                                                                                      Row(
                                                                                        mainAxisSize:
                                                                                            MainAxisSize.max,
                                                                                        children: [
                                                                                          if (castToType<
                                                                                                bool
                                                                                              >(
                                                                                                getJsonField(
                                                                                                  listaViagensItem,
                                                                                                  r'''$.sos_emitido''',
                                                                                                ),
                                                                                              ) ==
                                                                                              true)
                                                                                            Container(
                                                                                              padding: const EdgeInsets.symmetric(
                                                                                                horizontal:
                                                                                                    8.0,
                                                                                                vertical:
                                                                                                    4.0,
                                                                                              ),
                                                                                              decoration: BoxDecoration(
                                                                                                color: const Color(
                                                                                                  0xFFFF3B30,
                                                                                                ),
                                                                                                borderRadius: BorderRadius.circular(
                                                                                                  12.0,
                                                                                                ),
                                                                                              ),
                                                                                              child: Row(
                                                                                                mainAxisSize:
                                                                                                    MainAxisSize.min,
                                                                                                children: [
                                                                                                  const Icon(
                                                                                                    Icons.warning_rounded,
                                                                                                    color:
                                                                                                        Colors.white,
                                                                                                    size:
                                                                                                        14.0,
                                                                                                  ),
                                                                                                  const SizedBox(
                                                                                                    width:
                                                                                                        4.0,
                                                                                                  ),
                                                                                                  Text(
                                                                                                    'SOS',
                                                                                                    style: FlutterFlowTheme.of(
                                                                                                      context,
                                                                                                    ).bodySmall.override(
                                                                                                      fontFamily:
                                                                                                          'Inter',
                                                                                                      color:
                                                                                                          Colors.white,
                                                                                                      fontSize:
                                                                                                          11.0,
                                                                                                      fontWeight:
                                                                                                          FontWeight.bold,
                                                                                                      letterSpacing:
                                                                                                          0.0,
                                                                                                    ),
                                                                                                  ),
                                                                                                ],
                                                                                              ),
                                                                                            ),
                                                                                          if (castToType<
                                                                                                bool
                                                                                              >(
                                                                                                getJsonField(
                                                                                                  listaViagensItem,
                                                                                                  r'''$.sos_emitido''',
                                                                                                ),
                                                                                              ) ==
                                                                                              true)
                                                                                            const SizedBox(
                                                                                              width:
                                                                                                  8.0,
                                                                                            ),
                                                                                          Expanded(
                                                                                            child: Text(
                                                                                              '${valueOrDefault<String>((castToType<int>(getJsonField(listaViagensItem, r'''$.qtd_alertas''')))?.toString(), '0')} alertas emitidos',
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
                                                                                                    12.0,
                                                                                                color:
                                                                                                    FlutterFlowTheme.of(
                                                                                                      context,
                                                                                                    ).primaryText,
                                                                                                letterSpacing:
                                                                                                    0.0,
                                                                                                fontWeight:
                                                                                                    FontWeight.w500,
                                                                                                fontStyle:
                                                                                                    FlutterFlowTheme.of(
                                                                                                      context,
                                                                                                    ).bodyMedium.fontStyle,
                                                                                              ),
                                                                                              overflow:
                                                                                                  TextOverflow.ellipsis,
                                                                                              maxLines:
                                                                                                  1,
                                                                                            ),
                                                                                          ),
                                                                                        ],
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
                                                          ),
                                                        );
                                                      }).toList(),
                                                );
                                              },
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
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
