import '/backend/supabase/supabase.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pp_detalhe_viagem_model.dart';
export 'pp_detalhe_viagem_model.dart';

class PpDetalheViagemWidget extends StatefulWidget {
  const PpDetalheViagemWidget({super.key, required this.idViagem});

  final int? idViagem;

  @override
  State<PpDetalheViagemWidget> createState() => _PpDetalheViagemWidgetState();
}

class _PpDetalheViagemWidgetState extends State<PpDetalheViagemWidget>
    with TickerProviderStateMixin {
  late PpDetalheViagemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpDetalheViagemModel());

    _model.tabBarController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 0,
    )..addListener(() => safeSetState(() {}));

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
      child: FutureBuilder<List<VwViagensResumoRow>>(
        future: VwViagensResumoTable().querySingleRow(
          queryFn: (q) => q.eqOrNull('id_viagem', widget.idViagem),
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
          List<VwViagensResumoRow> containerVwViagensResumoRowList =
              snapshot.data!;

          final containerVwViagensResumoRow =
              containerVwViagensResumoRowList.isNotEmpty
                  ? containerVwViagensResumoRowList.first
                  : null;

          return Container(
            constraints: const BoxConstraints(
              maxWidth: 764.0,
              maxHeight: 794.0,
            ),
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              borderRadius: BorderRadius.circular(8.0),
            ),
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
                        'Detalhes da viagem',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
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
                              FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderRadius: 8.0,
                        buttonSize: 40.0,
                        icon: Icon(
                          Icons.close_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Align(
                          alignment: const Alignment(0.0, 0),
                          child: TabBar(
                            labelColor:
                                FlutterFlowTheme.of(context).primaryText,
                            unselectedLabelColor:
                                FlutterFlowTheme.of(context).secondaryText,
                            labelStyle: FlutterFlowTheme.of(
                              context,
                            ).titleMedium.override(
                              font: GoogleFonts.interTight(
                                fontWeight:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleMedium.fontWeight,
                                fontStyle:
                                    FlutterFlowTheme.of(
                                      context,
                                    ).titleMedium.fontStyle,
                              ),
                              letterSpacing: 0.0,
                              fontWeight:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleMedium.fontWeight,
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
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.normal,
                              fontStyle:
                                  FlutterFlowTheme.of(
                                    context,
                                  ).titleMedium.fontStyle,
                            ),
                            indicatorColor:
                                FlutterFlowTheme.of(context).primary,
                            tabs: const [
                              Tab(text: 'Geral'),
                              Tab(text: 'Trajeto'),
                              Tab(text: 'Alertas'),
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
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: double.infinity,
                                      constraints: const BoxConstraints(
                                        maxHeight: 359.1,
                                      ),
                                      decoration: BoxDecoration(
                                        color:
                                            FlutterFlowTheme.of(
                                              context,
                                            ).secondaryBackground,
                                        borderRadius: BorderRadius.circular(
                                          8.0,
                                        ),
                                      ),
                                      child: FlutterFlowWebView(
                                        content:
                                            'https://fraktalsistemas.com.br:8006/plan/estatico?viagem_id=${widget.idViagem?.toString()}',
                                        bypass: false,
                                        height: 359.1,
                                        verticalScroll: false,
                                        horizontalScroll: false,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    'DADOS GERAIS',
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
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
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
                                            Container(
                                              decoration: const BoxDecoration(),
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
                                                      containerVwViagensResumoRow
                                                                  ?.kmTotais !=
                                                              null
                                                          ? '${containerVwViagensResumoRow!.kmTotais!.toStringAsFixed(2)} km'
                                                          : '0.00 km',
                                                      '0.00 km',
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
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Tempo',
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
                                              decoration: const BoxDecoration(),
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
                                                      (() {
                                                        final minutos =
                                                            containerVwViagensResumoRow
                                                                ?.duracaoMinutos ??
                                                            0;
                                                        if (minutos > 0) {
                                                          final horas =
                                                              minutos ~/ 60;
                                                          final mins =
                                                              minutos % 60;
                                                          if (horas > 0) {
                                                            return '${horas}h ${mins}min';
                                                          }
                                                          return '${mins}min';
                                                        }
                                                        return '0min';
                                                      })(),
                                                      '0min',
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
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Velocidade média',
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
                                              decoration: const BoxDecoration(),
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
                                                      (() {
                                                        final kmTotais =
                                                            containerVwViagensResumoRow
                                                                ?.kmTotais ??
                                                            0.0;
                                                        final duracaoMinutos =
                                                            containerVwViagensResumoRow
                                                                ?.duracaoMinutos ??
                                                            0;
                                                        if (duracaoMinutos >
                                                                0 &&
                                                            kmTotais > 0) {
                                                          final velocidadeMedia =
                                                              (kmTotais * 60) /
                                                              duracaoMinutos;
                                                          return '${velocidadeMedia.toStringAsFixed(2)} km/h';
                                                        }
                                                        return '0.00 km/h';
                                                      })(),
                                                      '0.00 km/h',
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
                                      ),
                                    ].divide(const SizedBox(width: 24.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nome da embarcação',
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
                                              decoration: const BoxDecoration(),
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
                                                      containerVwViagensResumoRow
                                                          ?.nomeBarco,
                                                      'Nome Barco',
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
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Nome do piloto',
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
                                              decoration: const BoxDecoration(),
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
                                                      containerVwViagensResumoRow
                                                          ?.nomePiloto,
                                                      'Não informado',
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
                                      ),
                                    ].divide(const SizedBox(width: 24.0)),
                                  ),
                                ].divide(const SizedBox(height: 24.0)).around(const SizedBox(height: 24.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Origem',
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
                                              decoration: const BoxDecoration(),
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
                                                      containerVwViagensResumoRow
                                                          ?.origemLocal,
                                                      'Não há Origem',
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
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Hora',
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
                                              decoration: const BoxDecoration(),
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
                                                      dateTimeFormat(
                                                        "Hm",
                                                        containerVwViagensResumoRow
                                                            ?.horaInicio
                                                            ?.time,
                                                        locale:
                                                            FFLocalizations.of(
                                                              context,
                                                            ).languageCode,
                                                      ),
                                                      'Não iníciada',
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
                                      ),
                                    ].divide(const SizedBox(width: 24.0)),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Destino',
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
                                              decoration: const BoxDecoration(),
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
                                                      containerVwViagensResumoRow
                                                          ?.destinoLocal,
                                                      'Não há Destino',
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
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Hora',
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
                                              decoration: const BoxDecoration(),
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
                                                      dateTimeFormat(
                                                        "Hm",
                                                        containerVwViagensResumoRow
                                                            ?.horaFim
                                                            ?.time,
                                                        locale:
                                                            FFLocalizations.of(
                                                              context,
                                                            ).languageCode,
                                                      ),
                                                      'Não finalizada',
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
                                      ),
                                    ].divide(const SizedBox(width: 24.0)),
                                  ),
                                ].divide(const SizedBox(height: 24.0)).around(const SizedBox(height: 24.0)),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'ALERTAS EMITIDOS',
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
                                  Flexible(
                                    child: FutureBuilder<List<AlertasRow>>(
                                      future: AlertasTable().queryRows(
                                        queryFn:
                                            (q) => q
                                                .eqOrNull(
                                                  'viagem_id',
                                                  widget.idViagem,
                                                )
                                                .order(
                                                  'created_at',
                                                  ascending: false,
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
                                        List<AlertasRow>
                                        listViewAlertasRowList = snapshot.data!;

                                        if (listViewAlertasRowList.isEmpty) {
                                          return Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                24.0,
                                              ),
                                              child: Text(
                                                'Nenhum alerta emitido nesta viagem',
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
                                                  color: const Color(
                                                    0xFF7D8082,
                                                  ),
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.normal,
                                                  fontStyle:
                                                      FlutterFlowTheme.of(
                                                        context,
                                                      ).bodyMedium.fontStyle,
                                                ),
                                              ),
                                            ),
                                          );
                                        }

                                        return ListView.separated(
                                          padding: EdgeInsets.zero,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.vertical,
                                          itemCount:
                                              listViewAlertasRowList.length,
                                          separatorBuilder:
                                              (_, __) =>
                                                  const SizedBox(height: 12.0),
                                          itemBuilder: (
                                            context,
                                            listViewIndex,
                                          ) {
                                            final listViewAlertasRow =
                                                listViewAlertasRowList[listViewIndex];
                                            return Padding(
                                              padding:
                                                  const EdgeInsetsDirectional.fromSTEB(
                                                    0.0,
                                                    6.0,
                                                    0.0,
                                                    0.0,
                                                  ),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsetsDirectional.fromSTEB(
                                                          0.0,
                                                          6.0,
                                                          0.0,
                                                          0.0,
                                                        ),
                                                    child: Container(
                                                      width: 10.0,
                                                      height: 10.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            FlutterFlowTheme.of(
                                                              context,
                                                            ).error,
                                                        shape: BoxShape.circle,
                                                      ),
                                                    ),
                                                  ),
                                                  Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        valueOrDefault<String>(
                                                          listViewAlertasRow
                                                              .tipoAlerta,
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
                                                          fontSize: 16.0,
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
                                                      Text(
                                                        'Localização: ${listViewAlertasRow.lat} ${listViewAlertasRow.long}',
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
                                                          color: const Color(
                                                            0xFF7D8082,
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
                                                      Text(
                                                        'Data: ${valueOrDefault<String>(dateTimeFormat("d/M/y", listViewAlertasRow.createdAt, locale: FFLocalizations.of(context).languageCode), 'N/A')} - Hora: ${valueOrDefault<String>(dateTimeFormat("Hm", listViewAlertasRow.hora?.time, locale: FFLocalizations.of(context).languageCode), '00:00')}',
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
                                                          color: const Color(
                                                            0xFF7D8082,
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
                                                    ].divide(
                                                      const SizedBox(
                                                        height: 3.0,
                                                      ),
                                                    ),
                                                  ),
                                                ].divide(
                                                  const SizedBox(width: 12.0),
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ].divide(const SizedBox(height: 24.0)).around(const SizedBox(height: 24.0)),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
