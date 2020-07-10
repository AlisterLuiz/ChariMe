import 'package:ChariMe/utilities/index.dart';

Container getCharitiesList(BuildContext context, Function setState) {
  return Container(
    height: screenHeight(context) * 0.25,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return getCharityCard(context);
      },
    ),
  );
}

InkWell getCharityCard(BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CharityScreenPortrait(
            charityBanner:
                'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
            charityImage:
                'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
            charityName: 'Charity Name',
          ),
        ),
      );
    },
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.all(5.0),
          width: 150.0,
          child: Card(
            color: Theme.of(context).cardColor,
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            elevation: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100,
                  child: Image(
                    image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                    ),
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                ),
                sizedBox(30, 0),
                Center(
                  child: AutoSizeText(
                    'Charity Name',
                    maxLines: 2,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned.fill(
          top: 35,
          child: Align(
            alignment: Alignment.center,
            child: Container(
              height: 60,
              width: 60,
              child: Card(
                elevation: 2,
                shape: CircleBorder(),
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).buttonColor,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
