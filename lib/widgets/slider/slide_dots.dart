import 'package:ChariMe/utilities/index.dart';

class SlideDots extends StatelessWidget {
  final bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      height: isActive ? 7 : 7,
      width: isActive ? 52 : 8,
      decoration: BoxDecoration(
        color: isActive
            ? Theme.of(context).accentColor
            : Theme.of(context).secondaryHeaderColor,
        // borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}
