import 'package:ChariMe/utilities/index.dart';

Expanded getHeader(
    int flex, bool backArrow, String text, Function func) {
  return Expanded(
    flex: flex,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        (backArrow != false)
            ? GestureDetector(
                onTap: () {
                  func();
                },
                child: Icon(
                  FontAwesomeIcons.chevronLeft,
                ),
              )
            : Container(),
        sizedBox(15, 0),
        Text(
          text,
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}
