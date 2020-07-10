import 'package:ChariMe/utilities/index.dart';

RichText getRichText(BuildContext context, String text1, String text2) {
  return RichText(
    text: TextSpan(
      style: TextStyle(fontFamily: 'Montserrat'),
      children: <TextSpan>[
        TextSpan(
          text: text1,
          style: TextStyle(
            color: Theme.of(context).secondaryHeaderColor,
          ),
        ),
        TextSpan(
          text: text2,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
