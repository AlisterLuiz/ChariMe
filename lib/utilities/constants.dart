import 'package:ChariMe/utilities/index.dart';

const kNavigationBarTextStyle = TextStyle(
  fontSize: 11.5,
  fontWeight: FontWeight.w600,
);

const konboardingtextdecorationdark = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.white,
    fontFamily: 'Montserrat',
  ),
  fillColor: Colors.white,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
);

const konboardingtextdecorationlight = InputDecoration(
  labelStyle: TextStyle(
    color: Colors.black,
    fontFamily: 'Montserrat',
  ),
  fillColor: Colors.black,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2.0),
  ),
);
