import 'package:ChariMe/utilities/index.dart';

class CustomTextField extends StatelessWidget {
  final String labelText;
  final TextEditingController controller;
  final TextInputType type;
  final String hintText;
  final Function func;

  CustomTextField(
      {@required this.labelText,
      this.controller,
      @required this.type,
      this.func,
      this.hintText});

  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onChanged: func,
      keyboardType: type,
      maxLines: null,
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
