import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineChartWidget extends StatelessWidget {
  const LineChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return LineChart(
      LineChartData(
        titlesData: FlTitlesData(show: false),
        lineBarsData: [
          LineChartBarData(spots: const [
            FlSpot(0, 3),
            FlSpot(1, 4),
            FlSpot(2, 5),
          ]),
        ],
      ),
    );
  }
}
