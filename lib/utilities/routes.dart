import 'package:ChariMe/screens/portrait/campaigns/donatePage.dart';
import 'package:ChariMe/utilities/index.dart';

class Routes {
  Routes._();

  //static variables
  static const String myApp = '/myApp';

  static const String homeView = '/homeView';

  static const String forgotPasswordLandscape = '/forgotPasswordLandscape';
  static const String forgotPasswordPortrait = '/forgotPasswordPortrait';

  static const String signUpLandscape = '/signUpLandscape';
  static const String signUpPortrait = '/signUpPortrait';
  static const String signUpPortraitNPO = '/signUpPortraitNPO';

  static const String otpScreenLandscape = '/otpScreenLandscape';
  static const String otpScreenPortrait = '/otpScreenPortrait';

  static const String navigationScreenLandscape = '/navigationScreenLandscape';
  static const String navigationScreenPortrait = '/navigationScreenPortrait';

  static const String orgnavigationScreenLandscape =
      '/orgnavigationScreenLandscape';
  static const String orgnavigationScreenPortrait =
      '/orgnavigationScreenPortrait';

  static const String myDonationsLandscape = '/myDonationsLandscape';
  static const String myDonationsPortrait = '/myDonationsPortrait';

  static const String settingsLandscape = '/settingsLandscape';
  static const String settingsPortrait = '/settingsPortrait';

  static const String addNewCampaignLandscape = '/addNewCampaignLandscape';
  static const String addNewCampaignPortrait = '/addNewCampaignPortrait';

  static const String webView = '/webView';

  static const String donatePageLandscape = '/donatePageLandscape';
  static const String donatePagePortrait = '/donatePagePortrait';

  static final routes = <String, WidgetBuilder>{
    myApp: (BuildContext context) => MyApp(),
    homeView: (BuildContext context) => HomeView(),
    forgotPasswordLandscape: (BuildContext context) =>
        ForgotPasswordLandscape(),
    forgotPasswordPortrait: (BuildContext context) => ForgotPasswordPortrait(),
    signUpLandscape: (BuildContext context) => SignUpLandscape(),
    signUpPortrait: (BuildContext context) => SignUpPortrait(),
    signUpPortraitNPO: (BuildContext context) => SignUpPortraitNPO(),
    otpScreenLandscape: (BuildContext context) => OTPScreenLandscape(),
    otpScreenPortrait: (BuildContext context) => OTPScreenPortrait(),
    navigationScreenLandscape: (BuildContext context) =>
        NavigationBarLandscape(),
    navigationScreenPortrait: (BuildContext context) => NavigationBarPortrait(),
    //  navigationScreenLandscape: (BuildContext context) =>
    //     NavigationBarLandscape(),
    orgnavigationScreenPortrait: (BuildContext context) =>
        OrgNavigationBarPortrait(),
    // myDonationsLandscape: (BuildContext context) => MyDonationsLandscape(),
    myDonationsPortrait: (BuildContext context) => MyDonationsPortrait(),
    // settingsLandscape: (BuildContext context) => SettingsLandscape(),
    settingsPortrait: (BuildContext context) => SettingsPortrait(),
    // addNewCampaignLandscape: (BuildContext context) => AddNewCampaignLandscape(),
    addNewCampaignPortrait: (BuildContext context) => AddNewCampaignPortrait(),
    webView: (BuildContext context) => MyWebView(),
    // donatePageLandscape: (BuildContext context) => DonatePageLandscape(),
    // donatePagePortrait: (BuildContext context) => DonatePagePortrait(),
  };
}
