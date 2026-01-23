// Automatic FlutterFlow imports
// Imports other custom widgets
// Imports custom actions
// Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:syncfusion_flutter_charts/charts.dart';

class GraficoEvolucaoMensal extends StatefulWidget {
  const GraficoEvolucaoMensal({
    super.key,
    this.width,
    this.height,
    this.dashboardData,
  });

  final double? width;
  final double? height;
  final dynamic dashboardData; // Lista vinda da Edge Function

  @override
  State<GraficoEvolucaoMensal> createState() => _GraficoEvolucaoMensalState();
}

class _GraficoEvolucaoMensalState extends State<GraficoEvolucaoMensal> {
  @override
  Widget build(BuildContext context) {
    if (widget.dashboardData == null) {
      return const Center(child: CircularProgressIndicator());
    }

    final List<dynamic> data = widget.dashboardData as List<dynamic>;

    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: SfCartesianChart(
        legend: const Legend(isVisible: true, position: LegendPosition.bottom),
        primaryXAxis: const CategoryAxis(
          majorGridLines: MajorGridLines(width: 0),
        ),
        primaryYAxis: const NumericAxis(
          axisLine: AxisLine(width: 0),
          majorTickLines: MajorTickLines(size: 0),
        ),
        tooltipBehavior: TooltipBehavior(enable: true),
        series: <CartesianSeries>[
          // Série Ticket Médio (Verde)
          ColumnSeries<dynamic, String>(
            name: 'Ticket Médio',
            dataSource: data,
            xValueMapper: (dynamic item, _) => item['mes'],
            yValueMapper: (dynamic item, _) => item['ticketMedio'],
            color: const Color(0xFFAED581), // Verde conforme imagem
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 9),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
          // Série Assinaturas (Azul)
          ColumnSeries<dynamic, String>(
            name: 'Assinaturas',
            dataSource: data,
            xValueMapper: (dynamic item, _) => item['mes'],
            yValueMapper: (dynamic item, _) => item['totalAssinaturas'],
            color: const Color(0xFF29B6F6), // Azul conforme imagem
            dataLabelSettings: const DataLabelSettings(
              isVisible: true,
              textStyle: TextStyle(fontSize: 9),
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(4),
              topRight: Radius.circular(4),
            ),
          ),
        ],
      ),
    );
  }
}
