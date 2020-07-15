import 'package:ChariMe/utilities/index.dart';

class LineChartHistory extends StatefulWidget {
  final String groupBy;
  final double aspect;
  final double maxX;

  LineChartHistory(this.groupBy, this.aspect, this.maxX);

  State<LineChartHistory> createState() => _LineChartHistoryState();
}

class _LineChartHistoryState extends State<LineChartHistory> {
  List<Color> gradientColors = [
    Color(0xff00c569),
    Color(0xff00c569),
    Color(0xff00c569),
    Color(0xff00c569),
    Color(0xff00c569),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: widget.aspect,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(
                        Radius.circular(18),
                      ),
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                    child: Padding(
                        padding: const EdgeInsets.only(
                            right: 18.0, left: 12.0, top: 24, bottom: 12),
                        child: LineChart(
                          mainData(widget.groupBy),
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  LineChartData mainData(String groupby) {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Theme.of(context).scaffoldBackgroundColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: const Color(0xff37434d),
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 22,
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
          getTitles: (value) {
            if (groupby == "Day")
              switch (value.toInt()) {
                case 1:
                  return '6 AM';
                case 4:
                  return '7 AM';
                case 7:
                  return '8 AM';
                case 10:
                  return '9 AM';
                case 13:
                  return '10 AM';
                case 16:
                  return '11 AM';
                case 19:
                  return '12 PM';
                case 22:
                  return '1 PM';
                case 25:
                  return '2 PM';
                case 28:
                  return '3 PM';
                case 31:
                  return '4 PM';
                case 34:
                  return '5 PM';
                case 37:
                  return '6 PM';
              }
            else if (groupby == "Week")
              switch (value.toInt()) {
                case 13:
                  return 'SUN';
                case 1:
                  return 'MON';
                case 3:
                  return 'TUE';
                case 5:
                  return 'WED';
                case 7:
                  return 'THU';
                case 9:
                  return 'FRI';
                case 11:
                  return 'SAT';
              }
            else
              switch (value.toInt()) {
                case 1:
                  return 'JAN';
                case 3:
                  return 'FEB';
                case 5:
                  return 'MAR';
                case 7:
                  return 'APR';
                case 9:
                  return 'MAY';
                case 11:
                  return 'JUN';
                case 13:
                  return 'JUL';
                case 15:
                  return 'AUG';
                case 17:
                  return 'SEP';
                case 19:
                  return 'OCT';
                case 21:
                  return 'NOV';
                case 23:
                  return 'DEC';
              }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            if (groupby == "Day") {
              switch (value.toInt()) {
                case 1:
                  return '2 ';
                // case 2:
                //   return '3.4';
                case 3:
                  return '4 ';
                // case 4:
                //   return '6.8';
                case 5:
                  return '6 ';
              }
            } else if (groupby == "Week") {
              switch (value.toInt()) {
                case 1:
                  return '10';
                // case 2:
                //   return '30';
                case 3:
                  return '30';
                // case 4:
                //   return '50';
                case 5:
                  return '50';
              }
            } else {
              switch (value.toInt()) {
                case 1:
                  return '600';
                // case 2:
                //   return '900';
                case 3:
                  return '1200';
                // case 4:
                //   return '1500';
                case 5:
                  return '1800';
              }
            }
            return '';
          },
          reservedSize: 28,
          margin: 12,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(color: const Color(0xff37434d), width: 1)),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(2.6, 2),
            FlSpot(4.9, 5),
            FlSpot(6.8, 3.1),
            FlSpot(8, 4),
            FlSpot(9.5, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
