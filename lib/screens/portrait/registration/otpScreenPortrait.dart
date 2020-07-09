import 'package:ChariMe/utilities/index.dart';

class OTPScreenPortrait extends StatefulWidget {
  @override
  _OTPScreenPortraitState createState() => _OTPScreenPortraitState();
}

class _OTPScreenPortraitState extends State<OTPScreenPortrait> {
  // String thisText = "";
  int pinLength = 4;
  bool hasError = false;
  // String errorMessage;
  String pin = '';
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight(context),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                getHeader(3, false, 'Verify OTP', () {
                  Navigator.pop(context);
                }),
                Text('A verification code has been sent to'),
                Text(
                  'test@gmail.com',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      PinCodeTextField(
                        autofocus: true,
                        controller: controller,
                        hideCharacter: false,
                        highlight: true,
                        highlightColor: Theme.of(context).accentColor,
                        defaultBorderColor: Theme.of(context).primaryColor,
                        hasTextBorderColor: Theme.of(context).primaryColor,
                        maxLength: pinLength,
                        hasError: hasError,
                        maskCharacter: "*",
                        onTextChanged: (text) {
                          setState(() {
                            hasError = false;
                          });
                        },
                        onDone: (text) {
                          pin = text;
                        },
                        wrapAlignment: WrapAlignment.start,
                        pinBoxDecoration:
                            ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                        pinTextStyle: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 32,
                        ),
                        pinTextAnimatedSwitcherTransition:
                            ProvidedPinBoxTextAnimation.scalingTransition,
                        pinTextAnimatedSwitcherDuration:
                            Duration(milliseconds: 300),
                      ),
                      sizedBox(30, 0),
                      getButton(context, 'VERIFY NOW', () {}),
                      sizedBox(30, 0),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Did not recieve a code?'),
                            sizedBox(0, 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.signUpPortrait);
                              },
                              child: Text(
                                'Resend Email',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
