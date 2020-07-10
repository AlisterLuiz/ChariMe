import 'package:ChariMe/utilities/index.dart';

class CharityPieChart extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CharityPieChartState();
}

class CharityPieChartState extends State {
  int touchedIndex;
  int total = 100;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
      child: Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        child: Column(
          children: <Widget>[
            sizedBox(30, 0),
            Expanded(
              child: PieChart(
                PieChartData(
                  pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                    setState(() {
                      if (pieTouchResponse.touchInput is FlLongPressEnd ||
                          pieTouchResponse.touchInput is FlPanEnd) {
                        touchedIndex = -1;
                      } else {
                        touchedIndex = pieTouchResponse.touchedSectionIndex;
                      }
                    });
                  }),
                  borderData: FlBorderData(
                    show: false,
                  ),
                  sectionsSpace: 0,
                  centerSpaceRadius: 40,
                  sections: showingSections(),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                sizedBox(30, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Indicator(
                      color: Color(0xff0293ee),
                      text: 'Asia',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Color(0xfff8b250),
                      text: 'Americas',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Color(0xff13d38e),
                      text: 'Africa',
                      isSquare: true,
                    ),
                  ],
                ),
                sizedBox(10, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Indicator(
                      color: Color(0xff845bef),
                      text: 'Europe',
                      isSquare: true,
                    ),
                    Indicator(
                      color: Colors.red,
                      text: 'Australia',
                      isSquare: true,
                    ),
                  ],
                ),
              ],
            ),
            // sizedBox(15, 0),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(5, (i) {
      final isTouched = i == touchedIndex;
      final double fontSize = isTouched ? 25 : 16;
      final double radius = isTouched ? 60 : 50;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: getPercent(25, total),
            title: '${getPercent(25, total)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: getPercent(20, total),
            title: '${getPercent(20, total)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: getPercent(30, total),
            title: '${getPercent(30, total)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: Color(0xff845bef),
            value: getPercent(20, total),
            title: '${getPercent(20, total)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 4:
          return PieChartSectionData(
            color: Colors.red,
            value: getPercent(5, total),
            title: '${getPercent(5, total)}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}

double getPercent(double val, int total) {
  return ((val / total) * 100).roundToDouble();
}
