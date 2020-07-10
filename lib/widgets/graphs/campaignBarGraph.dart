import 'package:ChariMe/utilities/index.dart';

class CampaignBarChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CampaignBarChartState();
}

class CampaignBarChartState extends State<CampaignBarChart> {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.7,
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
        color: Theme.of(context).cardColor,
        child: BarChart(
          BarChartData(
            alignment: BarChartAlignment.spaceAround,
            maxY: 80000,
            barTouchData: BarTouchData(
              enabled: false,
              touchTooltipData: BarTouchTooltipData(
                tooltipBgColor: Colors.transparent,
                tooltipPadding: const EdgeInsets.all(0),
                tooltipBottomMargin: 8,
                getTooltipItem: (
                  BarChartGroupData group,
                  int groupIndex,
                  BarChartRodData rod,
                  int rodIndex,
                ) {
                  return BarTooltipItem(
                    '\$${rod.y.round().toString()}',
                    TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
            titlesData: FlTitlesData(
              show: true,
              bottomTitles: SideTitles(
                showTitles: true,
                textStyle: TextStyle(fontSize: 12),
                margin: 20,
                getTitles: (double value) {
                  switch (value.toInt()) {
                    case 0:
                      return 'Username';
                    case 1:
                      return 'Username';
                    case 2:
                      return 'Username';
                    case 3:
                      return 'Username';
                    case 4:
                      return 'Username';
                    default:
                      return '';
                  }
                },
              ),
              leftTitles: SideTitles(showTitles: false),
            ),
            borderData: FlBorderData(
              show: false,
            ),
            barGroups: [
              BarChartGroupData(x: 0, barRods: [
                BarChartRodData(y: 50000, color: Theme.of(context).accentColor)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 1, barRods: [
                BarChartRodData(y: 24200, color: Theme.of(context).accentColor)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 2, barRods: [
                BarChartRodData(y: 12000, color: Theme.of(context).accentColor)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(y: 5000, color: Theme.of(context).accentColor)
              ], showingTooltipIndicators: [
                0
              ]),
              BarChartGroupData(x: 3, barRods: [
                BarChartRodData(y: 4000, color: Theme.of(context).accentColor)
              ], showingTooltipIndicators: [
                0
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
