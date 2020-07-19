import 'package:ChariMe/utilities/index.dart';

class SlideItem extends StatelessWidget {
  final int index;
  SlideItem(this.index);

  @override
  Widget build(BuildContext context) {
    List<Campaigns> campaigns = Provider.of<List<Campaigns>>(context);
    return Column(
      children: <Widget>[
        Container(
          height: screenHeight(context) * 0.32,
          width: screenWidth(context),
          child: Image.network(
            campaigns[index+30].bannerImage,
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
