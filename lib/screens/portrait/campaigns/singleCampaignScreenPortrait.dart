import 'package:ChariMe/utilities/index.dart';

class CampaignScreenPortrait extends StatefulWidget {
  final String campaignImage;
  final String campaignName;
  final String charityImage;
  final String charityName;

  CampaignScreenPortrait(
      {this.campaignImage,
      this.campaignName,
      this.charityName,
      this.charityImage});

  @override
  _CampaignScreenPortraitState createState() => _CampaignScreenPortraitState();
}

class _CampaignScreenPortraitState extends State<CampaignScreenPortrait> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: ListView(
        children: [
          Stack(
            children: [
              Image.network(
                widget.campaignImage,
                fit: BoxFit.fill,
                height: screenHeight(context) * 0.32,
                width: screenWidth(context),
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(FontAwesomeIcons.chevronLeft),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
            ],
          ),
          sizedBox(20, 0),
          Column(
            children: [
              Text(
                widget.campaignName,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w800,
                ),
              ),
              sizedBox(10, 0),
              Text(
                'Total Money Raised',
                style: TextStyle(
                  fontSize: 23,
                ),
              ),
              sizedBox(10, 0),
              Text(
                '\$1,023,141',
                style: TextStyle(
                  fontSize: 23,
                  color: Theme.of(context).accentColor,
                ),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ProgressButton(
                  onPressed: () {},
                  child: Text(
                    'DONATE',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  buttonState: ButtonState.normal,
                  backgroundColor: Theme.of(context).cardColor,
                  progressColor: Theme.of(context).primaryColor,
                ),
                sizedBox(20, 0),
                Text(
                  'Run By',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                sizedBox(10, 0),
                getCharityRow(context, widget.charityName),
                sizedBox(10, 0),
                getCharityRow(context, widget.charityName),
                sizedBox(10, 0),
                getHomeHeader(
                  context,
                  'About',
                  'Get to know more about ${widget.campaignName}',
                ),
                sizedBox(10, 0),
                Text(
                  'Ad cupidatat deserunt pariatur et velit nisi cupidatat dolore qui mollit. Veniam consectetur aute excepteur exercitation irure eiusmod fugiat. Sint laboris enim ea aliqua amet ad veniam sunt sunt enim ad ea aliquip. Nulla tempor adipisicing elit labore enim proident.',
                  textAlign: TextAlign.justify,
                ),
                sizedBox(10, 0),
                getHomeHeader(
                  context,
                  'Top Donors',
                  'Donors ranked by amount',
                ),
                sizedBox(10, 0),
                CampaignBarChart(),
                sizedBox(10, 0),
                getHomeHeader(context, 'Similar Campaigns',
                    'Campaigns related to this cause!'),
                sizedBox(5, 0),
                getCampaignsList(context, () {
                  setState(() {});
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Column getCharityRow(BuildContext context, String charityName) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Theme.of(context).canvasColor,
                      backgroundImage: NetworkImage(
                          'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png'),
                    ),
                  ),
                  sizedBox(0, 10),
                  Text(
                    charityName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Icon(
            FontAwesomeIcons.chevronRight,
            color: Theme.of(context).secondaryHeaderColor,
            size: 15,
          ),
        ],
      ),
      Divider(
        color: Theme.of(context).primaryColor,
      ),
    ],
  );
}
