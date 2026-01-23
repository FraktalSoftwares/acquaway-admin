// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/backend/supabase/supabase.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoAlertasPorTipo extends StatefulWidget {
  const GraficoAlertasPorTipo({
    super.key,
    this.width,
    this.height,
    this.dashboardData,
  });

  final double? width;
  final double? height;
  final dynamic dashboardData;

  @override
  State<GraficoAlertasPorTipo> createState() => _GraficoAlertasPorTipoState();
}

class _GraficoAlertasPorTipoState extends State<GraficoAlertasPorTipo> {
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

    // 2. Extrair dados do JSON vindo da Edge Function
    // Estrutura: { "alertas": { "Neblina": 2, ... }, "total": 85 }
    final dynamic alertasMap = widget.dashboardData['alertas'] ?? {};
    final int totalAlertas = widget.dashboardData['total'] ?? 0;

    // 3. Preparar paleta de cores para os diferentes tipos de alerta
    // Como são vários tipos, criamos uma lista para ciclar entre elas
    final List<Color> palette = [
      const Color(0xFFEF5350), // Vermelho (Urgência)
      const Color(0xFFFFA726), // Laranja (Atenção)
      const Color(0xFFFFEE58), // Amarelo
      const Color(0xFF42A5F5), // Azul
      const Color(0xFFAB47BC), // Roxo
      const Color(0xFF26A69A), // Verde Água
      const Color(0xFF8D6E63), // Marrom
      const Color(0xFF78909C), // Cinza Azulado
    ];

    // 4. Transformar o Map em lista de _ChartData
    final List<_ChartData> chartData = [];
    int colorIndex = 0;

    if (alertasMap is Map) {
      alertasMap.forEach((key, value) {
        // Apenas adicionamos ao gráfico se houver pelo menos 1 alerta
        // Convertendo value para int de forma segura
        int val = 0;
        if (value is int) {
          val = value;
        } else if (value is double) {
          val = value.toInt();
        }

        if (val > 0) {
          chartData.add(
            _ChartData(
              key.toString(), // Nome do alerta (ex: Neblina)
              val,
              palette[colorIndex % palette.length], // Cicla as cores
            ),
          );
          colorIndex++;
        }
      });
    }

    // Se não houver dados (total 0), mostrar mensagem ou gráfico vazio
    if (chartData.isEmpty) {
      return Container(
        width: widget.width,
        height: widget.height,
        alignment: Alignment.center,
        child: Text(
          'Sem alertas registrados',
          style: FlutterFlowTheme.of(context).bodyMedium,
        ),
      );
    }

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: SfCircularChart(
        // Anotação no centro (O número total)
        annotations: <CircularChartAnnotation>[
          CircularChartAnnotation(
            widget: Container(
              child: Text(
                '$totalAlertas',
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
                fontSize: 10, // Um pouco menor pois podem haver muitos itens
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
              connectorLineSettings: const ConnectorLineSettings(
                type: ConnectorType.curve,
                length: '15%',
                color: Colors.grey,
                width: 1,
              ),
              // Estilização do texto do label (Nome e valor)
              builder: (dynamic data, dynamic point, dynamic series,
                  int pointIndex, int seriesIndex) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.x, // O Nome (ex: Neblina)
                        style: TextStyle(
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 11,
                        ),
                      ),
                      Text(
                        data.y.toString(), // O Valor (ex: 5)
                        style: TextStyle(
                          color: data.color, // Cor igual a do gráfico
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
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
