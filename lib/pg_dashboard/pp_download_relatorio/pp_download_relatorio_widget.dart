import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pp_download_relatorio_model.dart';
export 'pp_download_relatorio_model.dart';

class PpDownloadRelatorioWidget extends StatefulWidget {
  const PpDownloadRelatorioWidget({
    super.key,
    required this.dataInicio,
    required this.dataFim,
  });

  final DateTime? dataInicio;
  final DateTime? dataFim;

  @override
  State<PpDownloadRelatorioWidget> createState() =>
      _PpDownloadRelatorioWidgetState();
}

class _PpDownloadRelatorioWidgetState extends State<PpDownloadRelatorioWidget> {
  late PpDownloadRelatorioModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PpDownloadRelatorioModel());

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
        width: double.infinity,
        constraints: const BoxConstraints(maxWidth: 600.0),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(24.0, 24.0, 24.0, 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header com título e botão fechar
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Relatório',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.w500,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: const Color(0xFF323334),
                      fontSize: 20.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.w500,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
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
                ],
              ),
              const SizedBox(height: 24.0),
              // Tipo de relatório
              Text(
                'Tipo de relatório',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: const Color(0xFF323334),
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
              ),
              const SizedBox(height: 12.0),
              // Radio buttons para tipo de relatório
              Row(
                children: [
                  Radio<String>(
                    value: 'compilado',
                    groupValue: _model.tipoRelatorio,
                    onChanged: (value) {
                      setState(() {
                        _model.tipoRelatorio = value!;
                      });
                    },
                    activeColor: const Color(0xFF007191),
                  ),
                  Text(
                    'Compilado',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: const Color(0xFF323334),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                  const SizedBox(width: 32.0),
                  Radio<String>(
                    value: 'descritivo',
                    groupValue: _model.tipoRelatorio,
                    onChanged: (value) {
                      setState(() {
                        _model.tipoRelatorio = value!;
                      });
                    },
                    activeColor: const Color(0xFF007191),
                  ),
                  Text(
                    'Descritivo por estatística',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                      font: GoogleFonts.inter(
                        fontWeight: FontWeight.normal,
                        fontStyle:
                            FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                      ),
                      color: const Color(0xFF323334),
                      fontSize: 14.0,
                      letterSpacing: 0.0,
                      fontWeight: FontWeight.normal,
                      fontStyle:
                          FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24.0),
              // Título Estatísticas
              Text(
                'Estatísticas',
                style: FlutterFlowTheme.of(context).bodyMedium.override(
                  font: GoogleFonts.inter(
                    fontWeight: FontWeight.w500,
                    fontStyle:
                        FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                  ),
                  color: const Color(0xFF323334),
                  fontSize: 14.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w500,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
              ),
              const SizedBox(height: 12.0),
              // Lista de checkboxes
              Flexible(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _buildCheckbox(
                        'Faturamento mensal',
                        _model.faturamentoMensal,
                        (value) =>
                            setState(() => _model.faturamentoMensal = value!),
                      ),
                      _buildCheckbox(
                        'Faturamento recebido',
                        _model.faturamentoRecebido,
                        (value) =>
                            setState(() => _model.faturamentoRecebido = value!),
                      ),
                      _buildCheckbox(
                        'Valores pendentes/inadimplentes',
                        _model.valoresPendentes,
                        (value) =>
                            setState(() => _model.valoresPendentes = value!),
                      ),
                      _buildCheckbox(
                        'Taxa de inadimplência',
                        _model.taxaInadimplencia,
                        (value) =>
                            setState(() => _model.taxaInadimplencia = value!),
                      ),
                      _buildCheckbox(
                        'Ticket médio por empresa',
                        _model.ticketMedioEmpresa,
                        (value) =>
                            setState(() => _model.ticketMedioEmpresa = value!),
                      ),
                      _buildCheckbox(
                        'Número de assinaturas por plano',
                        _model.numeroAssinaturasPlano,
                        (value) => setState(
                          () => _model.numeroAssinaturasPlano = value!,
                        ),
                      ),
                      _buildCheckbox(
                        'Usuários cadastrados',
                        _model.usuariosCadastrados,
                        (value) =>
                            setState(() => _model.usuariosCadastrados = value!),
                      ),
                      _buildCheckbox(
                        'Empresas cadastradas',
                        _model.empresasCadastradas,
                        (value) =>
                            setState(() => _model.empresasCadastradas = value!),
                      ),
                      _buildCheckbox(
                        'Número de usuários por tipo',
                        _model.numeroUsuariosPorTipo,
                        (value) => setState(
                          () => _model.numeroUsuariosPorTipo = value!,
                        ),
                      ),
                      _buildCheckbox(
                        'Total de viagens realizadas',
                        _model.totalViagensRealizadas,
                        (value) => setState(
                          () => _model.totalViagensRealizadas = value!,
                        ),
                      ),
                      _buildCheckbox(
                        'Total de embarcações cadastradas',
                        _model.totalEmbarcacoesCadastradas,
                        (value) => setState(
                          () => _model.totalEmbarcacoesCadastradas = value!,
                        ),
                      ),
                      _buildCheckbox(
                        'Média de embarcações por empresa',
                        _model.mediaEmbarcacoesPorEmpresa,
                        (value) => setState(
                          () => _model.mediaEmbarcacoesPorEmpresa = value!,
                        ),
                      ),
                      _buildCheckbox(
                        'Média de embarcações por piloto individual',
                        _model.mediaEmbarcacoesPorPiloto,
                        (value) => setState(
                          () => _model.mediaEmbarcacoesPorPiloto = value!,
                        ),
                      ),
                      _buildCheckbox(
                        'SOS emitidos por tipo',
                        _model.sosEmitidosPorTipo,
                        (value) =>
                            setState(() => _model.sosEmitidosPorTipo = value!),
                      ),
                      _buildCheckbox(
                        'Alertas emitidos por tipo',
                        _model.alertasEmitidosPorTipo,
                        (value) => setState(
                          () => _model.alertasEmitidosPorTipo = value!,
                        ),
                      ),
                      _buildCheckbox(
                        'Planejamento de viagens por tipo',
                        _model.planejamentoViagensPorTipo,
                        (value) => setState(
                          () => _model.planejamentoViagensPorTipo = value!,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24.0),
              // Botões de ação
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
                      color: Colors.white,
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
                        color: const Color(0xFF323334),
                        letterSpacing: 0.0,
                        fontWeight:
                            FlutterFlowTheme.of(context).titleSmall.fontWeight,
                        fontStyle:
                            FlutterFlowTheme.of(context).titleSmall.fontStyle,
                      ),
                      elevation: 0.0,
                      borderSide: const BorderSide(
                        color: Color(0xFFE5E6E6),
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  FFButtonWidget(
                    onPressed: () async {
                      // Fechar modal e chamar função de download
                      Navigator.pop(context);
                      await actions.exportDashboardCSV(
                        widget.dataInicio,
                        widget.dataFim,
                        _model.tipoRelatorio,
                        _model.getEstatisticasSelecionadas(),
                      );
                    },
                    text: 'Baixar relatório',
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
                      color: const Color(0xFF007191),
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
                        color: Colors.white,
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(
    String label,
    bool value,
    ValueChanged<bool?> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 12.0),
      child: Row(
        children: [
          Checkbox(
            value: value,
            onChanged: onChanged,
            activeColor: const Color(0xFF007191),
          ),
          Expanded(
            child: Text(
              label,
              style: FlutterFlowTheme.of(context).bodyMedium.override(
                font: GoogleFonts.inter(
                  fontWeight: FontWeight.normal,
                  fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
                ),
                color: const Color(0xFF323334),
                fontSize: 14.0,
                letterSpacing: 0.0,
                fontWeight: FontWeight.normal,
                fontStyle: FlutterFlowTheme.of(context).bodyMedium.fontStyle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
