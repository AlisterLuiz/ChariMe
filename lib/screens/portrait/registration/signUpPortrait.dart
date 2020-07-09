import 'package:ChariMe/utilities/index.dart';

class SignUpPortrait extends StatefulWidget {
  @override
  _SignUpPortraitState createState() => _SignUpPortraitState();
}

class _SignUpPortraitState extends State<SignUpPortrait> {
  TextEditingController nameController = new TextEditingController();
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
                getHeader(2, false, 'Sign Up', () {
                  Navigator.pop(context);
                }),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: 'Name',
                        controller: nameController,
                        type: TextInputType.text,
                      ),
                      sizedBox(15, 0),
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
                          Navigator.pop(context);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Already have an account?'),
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
                        'SIGN UP',
                        () {
                          Navigator.pushNamed(
                            context,
                            Routes.otpScreenPortrait,
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Center(
                  child: Text('Or sign up with social account'),
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
