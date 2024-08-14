import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class GivingSummaryChart extends StatelessWidget {
  const GivingSummaryChart({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'My Giving Summary',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8.0),
            Text(
              'Your donations to the body of Christ between 01 Mar, 2024 - 31, Mar 2024',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total giving',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Row(
                  children: [
                    Text(
                      '₦1,018,893.00',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    const SizedBox(width: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                          SizedBox(width: 4.0),
                          Text(
                            '98.3%',
                            style: TextStyle(color: Colors.green),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4.0),
            Text(
              'Count: 56',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16.0),
            AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false,
                    horizontalInterval: 5,
                    getDrawingHorizontalLine: (value) {
                      return FlLine(
                        color: Colors.grey.withOpacity(0.2),
                        strokeWidth: 1,
                      );
                    },
                  ),
                  titlesData: FlTitlesData(
                    leftTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true, reservedSize: 40),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 22,
                        getTitlesWidget: (value, meta) {
                          switch (value.toInt()) {
                            case 0:
                              return const Text('1W');
                            case 1:
                              return const Text('1M');
                            case 2:
                              return const Text('3M');
                            case 3:
                              return const Text('6M');
                            case 4:
                              return const Text('1Y');
                            default:
                              return Container();
                          }
                        },
                      ),
                    ),
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
                  ),
                  minX: 0,
                  maxX: 4,
                  minY: 0,
                  maxY: 20,
                  lineBarsData: [
                    LineChartBarData(
                      spots: const [
                        FlSpot(0, 1),
                        FlSpot(1, 3),
                        FlSpot(2, 10),
                        FlSpot(3, 7),
                        FlSpot(4, 12),
                      ],
                      isCurved: true,
                      color:Colors.redAccent,
                      barWidth: 4,
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.redAccent.withOpacity(0.3),
                      ),
                      dotData: FlDotData(
                        show: true,
                        getDotPainter: (spot, percent, barData, index) {
                          return FlDotCirclePainter(
                            radius: 4,
                            color: Colors.redAccent,
                            strokeWidth: 2,
                            strokeColor: Colors.white,
                          );
                        },
                      ),
                      aboveBarData: BarAreaData(
                        show: true,
                        color: Colors.transparent,
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      tooltipRoundedRadius: 8,
                      tooltipPadding: const EdgeInsets.all(8),
                      
                      getTooltipItems: (List<LineBarSpot> touchedSpots) {
                        return touchedSpots.map((spot) {
                          return LineTooltipItem(
                            '₦${spot.y * 100000}\n06 Mar 2023',
                            const TextStyle(color: Colors.white),
                          );
                        }).toList();
                      },
                    ),
                    touchCallback: (FlTouchEvent event, LineTouchResponse? response) {
                      if (event is FlTapUpEvent && response != null) {
                        // Handle tap event here if needed
                      }
                    },
                    handleBuiltInTouches: true,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
