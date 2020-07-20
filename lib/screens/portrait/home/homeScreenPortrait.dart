import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/utilities/index.dart';

class HomeScreenPortrait extends StatefulWidget {
  @override
  _HomeScreenPortraitState createState() => _HomeScreenPortraitState();
}

class _HomeScreenPortraitState extends State<HomeScreenPortrait> {
  // List<String> categories = [
  //   '	Red Cross Society',
  //   'Black Lives Matter',
  //   'Goodwill',
  //   'St Judes'
  // ];
  String _total = "Loading value..";
  _HomeScreenPortraitState() {
    getTotalRaisedByTheApp().then((value) => setState(() {
          _total = value;
        }));
  }

  Widget build(BuildContext context) {
    List<Campaigns> campaigns = Provider.of<List<Campaigns>>(context);
    List<NPO> npo = Provider.of<List<NPO>>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: screenHeight(context) * 0.35,
              child: AdvertBanner(),
            ),
            sizedBox(15, 0),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Total Money Raised',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                sizedBox(15, 0),
                Text(
                  '\$' + _total,
                  style: TextStyle(
                    fontSize: 23,
                    color: Theme.of(context).accentColor,
                  ),
                ),
                sizedBox(15, 0),
                Text(
                  'Thank You!',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                sizedBox(15, 0),
                Text(
                  'ChariMe Team',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            sizedBox(15, 0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Recommended Charities',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  sizedBox(15, 0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < 4; i++)
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CharityScreenPortrait(
                                charityBanner: npo[i].bannerPicture,
                                charityImage: npo[i].profilePicture,
                                charityName: npo[i].name,
                                desc: npo[i].npoDescription,
                                moneyRaised: npo[i].totalMoneyRaised,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    NetworkImage(npo[i].profilePicture),
                              ),
                              sizedBox(10, 0),
                              Container(
                                width: screenWidth(context) * 0.2,
                                child: AutoSizeText(
                                  npo[i].name,
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 11),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  sizedBox(15, 0),
                  getHomeHeader(context, 'Recommended Campaigns',
                      'Campaigns recommended for you!'),
                  sizedBox(5, 0),
                  getCampaignsList(context, () {
                    setState(() {});
                  }, campaigns),
                  sizedBox(5, 0),
                  getHomeHeader(context, 'New Campaigns',
                      'Latest and Uprising Campaigns!'),
                  sizedBox(5, 0),
                  getCampaignsList(context, () {
                    setState(() {});
                  }, campaigns),
                  sizedBox(5, 0),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
