import 'package:ChariMe/backend/register.dart';
import 'package:ChariMe/utilities/index.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType type;
  final String hintText;
  String password;
  final Function func;

  CustomTextField(
      {@required this.labelText,
      @required this.controller,
      @required this.type,
      this.password,
      this.func,
      this.hintText});

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: (value) {
        password = value;
        print(password);
        hashPassword(password);
        func();
      },
      // onEditingComplete: () => ,
      keyboardType: type,
      obscureText: (type == TextInputType.visiblePassword) ? true : false,
      textAlign: TextAlign.left,
      cursorColor:
          (currentTheme(context) == lightTheme) ? Colors.black : Colors.white,
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
