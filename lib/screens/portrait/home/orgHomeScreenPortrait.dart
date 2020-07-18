import 'package:ChariMe/services/dbServices.dart';
import 'package:ChariMe/utilities/index.dart';

class OrgHomeScreenPortrait extends StatefulWidget {
  @override
  _OrgHomeScreenPortraitState createState() => _OrgHomeScreenPortraitState();
}

class _OrgHomeScreenPortraitState extends State<OrgHomeScreenPortrait> {
  Widget build(BuildContext context) {
    List<Campaigns> campaigns = Provider.of<List<Campaigns>>(context);
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
                  '\$1,023,141',
                  style: TextStyle(
                    fontSize: 23,
                    color: Theme.of(context).accentColor,
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
                  getButton(
                    context,
                    'ADD NEW CAMPAIGN',
                    () async {
                      getAllCampaigns();
                      Navigator.pushNamed(
                        context,
                        Routes.addNewCampaignPortrait,
                      );
                    },
                  ),
                  sizedBox(15, 0),
                  getHomeHeader(context, 'Current Campaigns',
                      'Campaigns currently run by you!'),
                  sizedBox(5, 0),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: (campaigns.length > 5) ? 5 : campaigns.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: screenWidth(context) *
                            0.5 /
                            (screenHeight(context) * 0.35),
                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return getCampaignCard(context, campaigns[index]);
                      }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
