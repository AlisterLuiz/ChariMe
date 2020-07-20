import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/screens/portrait/campaigns/donatePage.dart';
import 'package:ChariMe/utilities/index.dart';

class CampaignScreenPortrait extends StatefulWidget {
  final String campaignImage;
  final String campaignName;
  final String desc;
  final double moneyRaised;
  final NPO npo;

  CampaignScreenPortrait(
      {this.campaignImage,
      this.campaignName,
      this.moneyRaised,
      this.npo,
      this.desc});

  @override
  _CampaignScreenPortraitState createState() => _CampaignScreenPortraitState();
}

class _CampaignScreenPortraitState extends State<CampaignScreenPortrait> {
  Widget build(BuildContext context) {
    List<Campaigns> campaigns = Provider.of<List<Campaigns>>(context);
    print("NPO HERE" + widget.npo.profilePicture);
    // print("NPO HERE" + widget.npo.name);
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
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(
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
                  '\$${widget.moneyRaised}',
                  style: TextStyle(
                    fontSize: 23,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ],
            ),
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
                getButton(
                  context,
                  'DONATE',
                  () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DonatePagePortrait(
                          campaignName: widget.campaignName,
                          npo: widget.npo,
                        ),
                      ),
                    );
                  },
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
                getCharityRow(context, widget.npo),
                sizedBox(10, 0),
                getHomeHeader(
                  context,
                  'About',
                  'Get to know more about ${widget.campaignName}',
                ),
                sizedBox(10, 0),
                Text(
                  widget.desc,
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
                }, campaigns),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

InkWell getCharityRow(
  BuildContext context,
  NPO npo,
) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CharityScreenPortrait(
            charityBanner: npo.bannerPicture,
            charityImage: npo.profilePicture,
            charityName: npo.name,
            desc: npo.npoDescription,
            moneyRaised: npo.totalMoneyRaised,
          ),
        ),
      );
    },
    child: Column(
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
                        backgroundImage: NetworkImage(npo.profilePicture),
                      ),
                    ),
                    sizedBox(0, 10),
                    Text(
                      npo.name,
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
    ),
  );
}
