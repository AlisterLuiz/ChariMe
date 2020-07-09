import 'package:ChariMe/utilities/index.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight(context) * 0.32,
          width: screenWidth(context),
          child: Image.network(
            slideList[index].imageUrl,
            fit: BoxFit.fill,
          ),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
          ),
        ),
        sizedBox(10, 0),
      ],
    );
  }
}
