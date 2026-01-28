// Automatic FlutterFlow imports
import '/flutter_flow/flutter_flow_theme.dart';
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoNumeroPorTipoPlano extends StatefulWidget {
  const GraficoNumeroPorTipoPlano({
    super.key,
    this.width,
    this.height,
    this.dashboardData,
  });

  final double? width;
  final double? height;
  final dynamic dashboardData;

  @override
  State<GraficoNumeroPorTipoPlano> createState() =>
      _GraficoNumeroPorTipoPlanoState();
}

class _GraficoNumeroPorTipoPlanoState extends State<GraficoNumeroPorTipoPlano> {
  // Conjunto para rastrear quais itens estão ocultos (desativados na legenda)
  final Set<String> _hiddenItems = {};

  @override
  Widget build(BuildContext context) {
    if (widget.dashboardData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final planData = widget.dashboardData['plans'] ?? {};

    // Cores mapeadas conforme a identidade visual da imagem
    final Map<String, Color> colorMap = {
      'Básico': const Color(0xFF817BFF),
      'Esporte e Recreio 1': const Color(0xFFFF948A),
      'Esporte e Recreio 2': const Color(0xFF4DD0E1),
      'Comercial/Profissional 1': const Color(0xFFFFB74D),
      'Comercial/Profissional 2': const Color(0xFF4A80F0),
      'Demo': const Color(0xFF81C784),
    };

    final List<_ChartData> chartData = [];
    planData.forEach((key, value) {
      chartData.add(
        _ChartData(key, value.toInt(), colorMap[key] ?? Colors.grey),
      );
    });

    // Calcular o total visível (apenas itens não ocultos)
    int totalVisivel = 0;
    for (final data in chartData) {
      if (!_hiddenItems.contains(data.x)) {
        totalVisivel += data.y;
      }
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: SfCircularChart(
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Text(
              '$totalVisivel',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                fontFamily: 'Outfit',
                fontWeight: FontWeight.bold,
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
        legend: Legend(
          isVisible: true,
          position: LegendPosition.bottom,
          overflowMode: LegendItemOverflowMode.wrap,
          toggleSeriesVisibility: true,
          textStyle: FlutterFlowTheme.of(context).bodySmall,
        ),
        series: <CircularSeries>[
          DoughnutSeries<_ChartData, String>(
            dataSource: chartData,
            xValueMapper: (_ChartData data, _) => data.x,
            yValueMapper: (_ChartData data, _) => data.y,
            pointColorMapper: (_ChartData data, _) => data.color,
            innerRadius: '75%',
            radius: '85%',
            dataLabelSettings: DataLabelSettings(
              isVisible: true,
              labelPosition: ChartDataLabelPosition.outside,
              connectorLineSettings: const ConnectorLineSettings(
                type: ConnectorType.curve,
                length: '15%',
              ),
              builder: (
                dynamic data,
                dynamic point,
                dynamic series,
                int index,
                int seriesIndex,
              ) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      data.x,
                      style: TextStyle(
                        fontSize: 10,
                        color: FlutterFlowTheme.of(context).secondaryText,
                      ),
                    ),
                    Text(
                      data.y.toString(),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: data.color,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y, this.color);
  final String x;
  final int y;
  final Color color;
}
