import 'package:ChariMe/utilities/index.dart';

class Routes {
  Routes._();

  //static variables
  static const String homeView = '/homeView';

  static const String forgotPasswordLandscape = '/forgotPasswordLandscape';
  static const String forgotPasswordPortrait = '/forgotPasswordPortrait';

  static const String signUpLandscape = '/signUpLandscape';
  static const String signUpPortrait = '/signUpPortrait';

  static const String otpScreenLandscape = '/otpScreenLandscape';
  static const String otpScreenPortrait = '/otpScreenPortrait';

  static const String navigationScreenLandscape = '/navigationScreenLandscape';
  static const String navigationScreenPortrait = '/navigationScreenPortrait';

  static const String myDonationsLandscape = '/myDonationsLandscape';
  static const String myDonationsPortrait = '/myDonationsPortrait';

  static const String settingsLandscape = '/settingsLandscape';
  static const String settingsPortrait = '/settingsPortrait';

  static final routes = <String, WidgetBuilder>{
    homeView: (BuildContext context) => HomeView(),
    forgotPasswordLandscape: (BuildContext context) =>
        ForgotPasswordLandscape(),
    forgotPasswordPortrait: (BuildContext context) => ForgotPasswordPortrait(),
    signUpLandscape: (BuildContext context) => SignUpLandscape(),
    signUpPortrait: (BuildContext context) => SignUpPortrait(),
    otpScreenLandscape: (BuildContext context) => OTPScreenLandscape(),
    otpScreenPortrait: (BuildContext context) => OTPScreenPortrait(),
    navigationScreenLandscape: (BuildContext context) =>
        NavigationBarLandscape(),
    navigationScreenPortrait: (BuildContext context) => NavigationBarPortrait(),
    // myDonationsLandscape: (BuildContext context) => MyDonationsLandscape(),
    myDonationsPortrait: (BuildContext context) => MyDonationsPortrait(),
    // settingsLandscape: (BuildContext context) => SettingsLandscape(),
    settingsPortrait: (BuildContext context) => SettingsPortrait(),
  };
}
