import 'package:ChariMe/utilities/index.dart';

Container getCampaignsList(BuildContext context, Function setState) {
  return Container(
    height: screenHeight(context) * 0.3,
    child: ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        return getCampaignCard(context);
      },
    ),
  );
}

FittedBox getCampaignCard(BuildContext context) {
  return FittedBox(
    fit: BoxFit.fitHeight,
    child: InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CampaignScreenPortrait(
              campaignImage:
                  'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
              charityImage:
                  'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
              campaignName: 'Campaign Name',
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image(
                    image: NetworkImage(
                      'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                    ),
                    fit: BoxFit.cover,
                    width: 150,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        sizedBox(2, 0),
                        Text(
                          'Charity Name',
                          style: TextStyle(
                            fontSize: 11,
                            color: Theme.of(context).secondaryHeaderColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                          maxLines: 1,
                        ),
                        AutoSizeText(
                          'Campaign Name',
                          maxLines: 2,
                          style: TextStyle(
                            // fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                          overflow: TextOverflow.ellipsis,
                          textAlign: TextAlign.justify,
                        ),
                        sizedBox(2, 0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
