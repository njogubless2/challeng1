import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GivingSummaryChart extends StatelessWidget {
  const GivingSummaryChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
        LineChartData(
          gridData: const FlGridData(show: false),
          titlesData: const FlTitlesData(show: true),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots:const [
                FlSpot(0, 1),
                FlSpot(1, 3),
                FlSpot(2, 10),
                FlSpot(3, 7),
                FlSpot(4, 12),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 4,
              belowBarData: BarAreaData(show: false),
            ),
          ],
        ),
      ),
    );
  }
}
