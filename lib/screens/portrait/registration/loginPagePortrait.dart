import 'package:ChariMe/utilities/index.dart';

class LoginPagePortrait extends StatefulWidget {
  @override
  _LoginPagePortraitState createState() => _LoginPagePortraitState();
}

class _LoginPagePortraitState extends State<LoginPagePortrait> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight(context),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getHeader(3, false, 'Login', null),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: 'Email',
                        controller: emailController,
                        type: TextInputType.emailAddress,
                      ),
                      sizedBox(15, 0),
                      CustomTextField(
                        labelText: 'Password',
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                      ),
                      sizedBox(15, 0),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            Routes.forgotPasswordPortrait,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Forgot your password?'),
                            sizedBox(0, 5),
                            Icon(
                              FontAwesomeIcons.chevronRight,
                              size: 20,
                              color: Theme.of(context).accentColor,
                            ),
                          ],
                        ),
                      ),
                      sizedBox(15, 0),
                      getButton(
                        context,
                        'LOGIN',
                        () {
                          Navigator.pushNamed(
                              context, Routes.navigationScreenPortrait);
                        },
                      ),
                      sizedBox(30, 0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have an account?'),
                          sizedBox(0, 5),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, Routes.signUpPortrait);
                            },
                            child: Text(
                              'Sign Up',
                              style: TextStyle(
                                  color: Theme.of(context).accentColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text('Or login with social account'),
                ),
                sizedBox(15, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    getRegistrationIcons(
                      context,
                      'assets/images/google.png',
                    ),
                    sizedBox(0, 30),
                    getRegistrationIcons(
                      context,
                      'assets/images/facebook.png',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
