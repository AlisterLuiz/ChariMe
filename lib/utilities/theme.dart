import 'package:ChariMe/utilities/index.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  accentColor: Color(0xff00C569),
  
  fontFamily: 'Montserrat',
  appBarTheme: AppBarTheme(
    elevation: 1.0,
    color: Colors.black,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.white,
    ),
    
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.white,
  ),
  cursorColor: Colors.white,
  backgroundColor: Colors.black,
  scaffoldBackgroundColor: Color(0xff222222),
  secondaryHeaderColor: Color(0xff9B9B9B),
  cardColor: Color(0xff2A2C36),
  primaryColor: Colors.white,
  buttonColor: Colors.white,
);

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Color(0xfffdfdfd),
  accentColor: Color(0xff00C569),
  primaryColor: Colors.black,
  cursorColor: Colors.black,
  secondaryHeaderColor: Color(0xff9B9B9B),
  fontFamily: 'Montserrat',
  cardColor: Colors.white,
  buttonColor: Colors.white,
  appBarTheme: AppBarTheme(
    elevation: 1.0,
    color: Colors.white,
    textTheme: TextTheme(
      headline6: TextStyle(
        color: Colors.black,
        fontSize: 20,
        fontWeight: FontWeight.w700,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
  ),
  tabBarTheme: TabBarTheme(
    labelColor: Colors.black,
  ),
);
