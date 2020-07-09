import 'package:ChariMe/utilities/index.dart';

class SettingsPortrait extends StatefulWidget {
  @override
  _SettingsPortraitState createState() => _SettingsPortraitState();
}

class _SettingsPortraitState extends State<SettingsPortrait> {
  TextEditingController fullNameController = new TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: ListView(
          children: [
            getHeader(
              2,
              true,
              'Settings',
              () {
                Navigator.pop(context);
              },
            ),
            sizedBox(30, 0),
            Text(
              'Personal Information',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            sizedBox(20, 0),
            customTextField(
              context,
              'Harris Foley',
              'Full Name',
              'Harris Foley',
            ),
            sizedBox(10, 0),
            customTextField(
              context,
              '12/12/1989',
              'Date of Birth',
              '12/12/1989',
            ),
            sizedBox(20, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Password',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Change',
                  style: TextStyle(
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ],
            ),
            sizedBox(20, 0),
            customTextField(
              context,
              'password',
              'Password',
              'password',
            ),
            sizedBox(20, 0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Theme',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text('Light'),
                    Switch(
                      activeColor: Theme.of(context).accentColor,
                      inactiveThumbColor: Theme.of(context).accentColor,
                      inactiveTrackColor: Theme.of(context).accentColor,
                      value: Provider.of<ThemeModel>(context, listen: false)
                          .getTheme(),
                      onChanged: (value) {
                        setState(() {
                          Provider.of<ThemeModel>(context, listen: false)
                              .toggleTheme();
                        });
                      },
                    ),
                    Text('Dark'),
                  ],
                ),
              ],
            ),
            sizedBox(20, 0),
          ],
        ),
      ),
    );
  }

  TextField customTextField(BuildContext context, String currentText,
      String labelText, String hintText) {
    return TextField(
      obscureText: (labelText == 'Password') ? true : false,
      controller: TextEditingController.fromValue(
        TextEditingValue(
          text: currentText,
          selection: TextSelection.collapsed(offset: 11),
        ),
      ),
      onChanged: (String _email) {},
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(
        color:
            (currentTheme(context) == lightTheme) ? Colors.black : Colors.white,
        fontSize: 14,
      ),
      decoration: (currentTheme(context) == lightTheme)
          ? konboardingtextdecorationlight.copyWith(
              labelText: labelText,
              hintText: hintText,
            )
          : konboardingtextdecorationdark.copyWith(
              labelText: labelText,
              hintText: hintText,
            ),
    );
  }
}
