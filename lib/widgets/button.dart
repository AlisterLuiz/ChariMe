import 'package:ChariMe/utilities/index.dart';

GestureDetector getButton(BuildContext context, String text, Function func) {
  return GestureDetector(
    onTap: () {
      func();
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: Theme.of(context).accentColor,
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).secondaryHeaderColor,
            offset: Offset(0.0, 1.0),
          ),
        ],
      ),
      height: 50,
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: Theme.of(context).buttonColor,
            fontSize: 16,
          ),
        ),
      ),
    ),
  );
}
