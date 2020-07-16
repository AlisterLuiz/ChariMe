import 'package:ChariMe/services/register.dart';
import 'package:ChariMe/utilities/index.dart';

class SignUpPortraitNPO extends StatefulWidget {
  @override
  _SignUpPortraitState createState() => _SignUpPortraitState();
}

class _SignUpPortraitState extends State<SignUpPortraitNPO> {
  TextEditingController nameController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController regionController = new TextEditingController();

  String name = '';
  String emailID = '';
  String username = '';
  String password = '';
  String region = '';


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
                getHeader(2, false, 'Sign Up as an Organization', () {
                  Navigator.pop(context);
                }),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: 'Name',
                        controller: nameController,
                        type: TextInputType.text,
                        func: (value) {
                          setState(
                                () {
                              name = value;
                            },
                          );
                        },
                      ),
                      sizedBox(15, 0),
                      CustomTextField(
                        labelText: 'Email',
                        controller: emailController,
                        type: TextInputType.emailAddress,
                        func: (value) {
                          setState(
                                () {
                              emailID = value;
                            },
                          );
                        },
                      ),
                      sizedBox(15, 0),
                      CustomTextField(
                        labelText: 'Username',
                        controller: usernameController,
                        type: TextInputType.text,
                        func: (value) {
                          setState(
                                () {
                              username = value;
                            },
                          );
                        },
                      ),
                      sizedBox(15, 0),
                      CustomTextField(
                        labelText: 'Password',
                        controller: passwordController,
                        type: TextInputType.visiblePassword,
                        func: (value) {
                          setState(
                                () {
                              password = value;
                            },
                          );
                        },
                      ),
                      sizedBox(15, 0),
                      CustomTextField(
                        labelText: 'Region',
                        controller: regionController,
                        type: TextInputType.text,
                        func: (value) {
                          setState(
                                () {
                              region = value;
                            },
                          );
                        },
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
                          registerNPO(name, emailID, username, password, region);
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
