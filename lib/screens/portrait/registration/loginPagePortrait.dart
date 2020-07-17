import 'package:ChariMe/services/dbServices.dart';
import 'package:ChariMe/services/login.dart';
import 'package:ChariMe/providers/usernameProvider.dart';
import 'package:ChariMe/utilities/index.dart';

class LoginPagePortrait extends StatefulWidget {
  @override
  _LoginPagePortraitState createState() => _LoginPagePortraitState();
}



class _LoginPagePortraitState extends State<LoginPagePortrait> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String username = '';
  String password = '';

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: Container(
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
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      CustomTextField(
                        labelText: 'Username',
                        controller: emailController,
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
                        () async {
                           if (await verify(username, password)) {
                             Provider.of<UserNameProvider>(context, listen: false).setUsername(username);
                             if (await checkAccountType(username)){
                               
                               Navigator.pushNamed(
                                 context,
                                 Routes.orgnavigationScreenPortrait,
                               );
                             } else {
                               getUserInfo(username);
                               Navigator.pushNamed(
                                 context,
                                 Routes.navigationScreenPortrait,
                               );
                             }

                           } else {
                             print("Password did not match.");
                             showDialog(
                               context: context,
                               builder: (_) => AlertDialog(
                                 title: Text("Incorrect Password"),
                                 actions: <Widget>[
                                   FlatButton(
                                     color: Theme.of(context).accentColor,
                                     textColor: Theme.of(context).primaryColor,
                                     child: Text('Close'),
                                     onPressed: () {
                                       Navigator.of(context).pop();
                                     },
                                   )
                                 ],
                               ),
                             );
                           }
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
                      FittedBox(
                        fit: BoxFit.fitWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Are you a Non-Profit Organization?'),
                            sizedBox(0, 5),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.signUpPortraitNPO);
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      sizedBox(10, 0),
                    ],
                  ),
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
    );
  }
}
