// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoSosPorTipo extends StatefulWidget {
  const GraficoSosPorTipo({
    super.key,
    this.width,
    this.height,
    this.dashboardData,
  });

  final double? width;
  final double? height;
  final dynamic dashboardData;

  @override
  State<GraficoSosPorTipo> createState() => _GraficoSosPorTipoState();
}

class _GraficoSosPorTipoState extends State<GraficoSosPorTipo> {
  // Conjunto para rastrear quais itens estão ocultos (desativados na legenda)
  final Set<String> _hiddenItems = {};

  @override
  Widget build(BuildContext context) {
    // 1. Tratamento para quando os dados ainda não chegaram (Loading/Null)
    if (widget.dashboardData == null) {
      return Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        child: const CircularProgressIndicator(),
      );
    }

    // 2. Extrair dados do JSON da Edge Function
    // Estrutura esperada: { "sos": { "Naufrágio": 1, "Incêndio": 0... }, "total": 90 }
    final sosData = widget.dashboardData['sos'] ?? {};

    // 3. Preparar a lista de dados para o gráfico
    // Mapeando as chaves do ENUM para o visual com cores semânticas
    final List<_ChartData> chartData = [];

    // Helper function para adicionar dados de forma segura e limpa
    void addDataIfPresent(String key, Color color) {
      if (sosData[key] != null && sosData[key] > 0) {
        chartData.add(_ChartData(key, sosData[key], color));
      }
    }

    // Adicionando os tipos com cores específicas
    addDataIfPresent('Naufrágio', const Color(0xFFD32F2F)); // Vermelho Escuro
    addDataIfPresent('Incêndio', const Color(0xFFFF5722)); // Laranja Vibrante
    addDataIfPresent('Abalroamento', const Color(0xFF7B1FA2)); // Roxo
    addDataIfPresent('Colisão', const Color(0xFF1976D2)); // Azul Forte
    addDataIfPresent('Homem ao mar', const Color(0xFF0097A7)); // Ciano/Teal
    addDataIfPresent('Alagamento', const Color(0xFF0288D1)); // Azul Claro
    addDataIfPresent(
      'Alarme de pânico',
      const Color(0xFFC2185B),
    ); // Rosa/Magenta

    // Calcular o total visível (apenas itens não ocultos)
    int totalVisivel = 0;
    for (final data in chartData) {
      if (!_hiddenItems.contains(data.x)) {
        totalVisivel += data.y;
      }
    }

    // Caso não tenha nenhum dado (Total 0), evita erro no gráfico
    if (chartData.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        child: Text(
          'Sem dados de SOS',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      );
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: SfCircularChart(
        // Anotação no centro (O número total visível)
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              child: Text(
                '$totalVisivel',
                style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Outfit',
                  color: FlutterFlowTheme.of(context).primaryText,
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
        // Callback quando um item da legenda é clicado
        onLegendTapped: (LegendTapArgs args) {
          final pointIndex = args.pointIndex;
          if (pointIndex == null ||
              pointIndex < 0 ||
              pointIndex >= chartData.length)
            return;
          setState(() {
            final String itemName = chartData[pointIndex].x;
            if (_hiddenItems.contains(itemName)) {
              _hiddenItems.remove(itemName);
            } else {
              _hiddenItems.add(itemName);
            }
          });
        },
        // Legenda na parte inferior
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
          toggleSeriesVisibility: true,
          textStyle: FlutterFlowTheme.of(context).bodyMedium.override(
            fontFamily: 'Readex Pro',
            color: FlutterFlowTheme.of(context).secondaryText,
          ),
        ),
        series: <CircularSeries>[
          DoughnutSeries<_ChartData, String>(
            dataSource: chartData,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            pointColorMapper: (_ChartData data, _) => data.color,
            // Configuração do raio interno para parecer um Donut fino
            innerRadius: '75%',
            radius: '90%',
            startAngle: 90,
            endAngle: 90,
            // Configuração dos Labels externos com linhas
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              // O conector (a linha)
              connectorLineSettings: ConnectorLineSettings(
                type: ConnectorType.curve,
                length: '20%',
                color: FlutterFlowTheme.of(context).secondaryText,
                width: 1,
              ),
              // Estilização do texto do label (Nome e valor)
              builder: (
                dynamic data,
                dynamic point,
                dynamic series,
                int pointIndex,
                int seriesIndex,
              ) {
                return Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 2,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.x, // O Nome (ex: Incêndio)
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 10, // Levemente menor para caber melhor
                        ),
                      ),
                      Text(
                        data.y.toString(), // O Valor (ex: 2)
                        style: TextStyle(
                          color: data.color, // Cor igual a do gráfico
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

// Classe auxiliar privada para organizar os dados
class _ChartData {
  _ChartData(this.x, this.y, this.color);

  final String x; // Nome (Legenda)
  final int y; // Valor
  final Color color; // Cor
}
