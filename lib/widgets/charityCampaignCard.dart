import 'package:ChariMe/utilities/index.dart';

Widget getCharityDetailsCard(
    BuildContext context, String title, String subtitle) {
  return FittedBox(
    fit: BoxFit.fitHeight,
    child: Container(
      width: screenWidth(context) * 0.4,
      height: screenHeight(context) * 0.14,
      child: Card(
        color: Theme.of(context).cardColor,
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              AutoSizeText(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  // fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
