import 'package:ChariMe/utilities/index.dart';

Container getRegistrationIcons(BuildContext context, String image) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(40),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Theme.of(context).secondaryHeaderColor,
          offset: Offset(
            0.0,
            1.0,
          ), //(x,y)
          blurRadius: 3.0,
        ),
      ],
    ),
    height: 60,
    width: 60,
    child: Center(
      child: Image.asset(
        image,
        height: 30,
        width: 30,
      ),
    ),
  );
}
