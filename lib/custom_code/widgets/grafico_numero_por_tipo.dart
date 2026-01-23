// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoNumeroPorTipo extends StatefulWidget {
  const GraficoNumeroPorTipo({
    super.key,
    this.width,
    this.height,
    this.dashboardData,
  });

  final double? width;
  final double? height;
  final dynamic dashboardData;

  @override
  State<GraficoNumeroPorTipo> createState() => _GraficoNumeroPorTipoState();
}

class _GraficoNumeroPorTipoState extends State<GraficoNumeroPorTipo> {
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

    // 2. Extrair dados do JSON de forma segura
    // Estrutura esperada: { "user": { "Admin Empresa": 10, ... }, "total": 100 }
    final userData = widget.dashboardData['user'] ?? {};
    final int totalUsers = widget.dashboardData['total'] ?? 0;

    // 3. Preparar a lista de dados para o gráfico
    // Mapeando as chaves do banco para o visual desejado e cores da imagem
    final List<_ChartData> chartData = [
      if (userData['Piloto Individual'] != null &&
          userData['Piloto Individual'] > 0)
        _ChartData(
          'Pilotos individuais',
          userData['Piloto Individual'],
          const Color(0xFF4DD0E1), // Azul Ciano (Exemplo da imagem)
        ),
      if (userData['Piloto da Empresa'] != null &&
          userData['Piloto da Empresa'] > 0)
        _ChartData(
          'Pilotos de empresas',
          userData['Piloto da Empresa'],
          const Color(0xFFFF8A80), // Rosa/Salmão (Exemplo da imagem)
        ),
      if (userData['Admin Empresa'] != null && userData['Admin Empresa'] > 0)
        _ChartData(
          'Administradores',
          userData['Admin Empresa'],
          const Color(0xFF9575CD), // Roxo (Exemplo da imagem)
        ),
    ];

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: SfCircularChart(
        // Anotação no centro (O número total)
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              child: Text(
                '$totalUsers',
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
        // Legenda na parte inferior
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
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
            // Configuração do raio interno para parecer um Donut fino como na imagem
            innerRadius: '75%',
            radius: '90%',
            startAngle: 90,
            endAngle: 90,
            // Configuração dos Labels externos com linhas
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              // O conector (a linha)
              connectorLineSettings: const ConnectorLineSettings(
                type: ConnectorType.curve,
                length: '20%',
                color: Colors.grey,
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
                        data.x, // O Nome (ex: Pilotos individuais)
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        data.y.toString(), // O Valor (ex: 1503)
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
