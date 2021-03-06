import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/utilities/index.dart';

class CampaignsScreenPortrait extends StatefulWidget {
  @override
  _CampaignsScreenPortraitState createState() =>
      _CampaignsScreenPortraitState();
}

class _CampaignsScreenPortraitState extends State<CampaignsScreenPortrait> {
  List countries = [
    'Asia',
    'Europe',
    'Americas',
    'Africa',
    'Oceania',
  ];
  bool isLoading = false;

  Widget build(BuildContext context) {
    List<Campaigns> campaigns = Provider.of<List<Campaigns>>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Campaigns',
          style: TextStyle(
            fontFamily: 'Montserrat',
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: SearchPage<Campaigns>(
                  barTheme: (Provider.of<ThemeModel>(context, listen: false)
                              .currentTheme ==
                          darkTheme)
                      ? ThemeData(
                          primaryColor: Colors.black,
                          textTheme: TextTheme(
                            headline6: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          fontFamily: 'Montserrat',
                        )
                      : ThemeData(
                          primaryColor: Colors.white,
                          textTheme: TextTheme(
                            headline6: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                          fontFamily: 'Montserrat',
                        ),
                  items: campaigns.toList(),
                  searchLabel: 'Search Campaigns',
                  suggestion: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getHomeHeader(context, 'Recent Searches',
                            'Campaigns that you have searched previously'),
                        sizedBox(10, 0),
                        getCampaignsList(context, () {
                          setState(() {});
                        }, campaigns),
                      ],
                    ),
                  ),
                  failure: Center(
                    child: Text('No such campaign found :('),
                  ),
                  filter: (campaign) => [
                    campaign.campTitle,
                    campaign.campDescription,
                    campaign.hostedByNPO,
                    // campaign.isActive,
                    // campaign.totalMoneyRaised,
                    // campaign.region,
                    // campaign.bannerImage
                  ],
                  builder: (campaign) => getCampaignCard(
                    context,
                    campaign,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20,
        ),
        child: ListView(
          children: [
            getHomeHeader(context, 'Trending Campaigns',
                'Campaigns trending worldwide right now!'),
            getCampaignsList(context, () {
              setState(() {});
            }, campaigns),
            sizedBox(10, 0),
            getHomeHeader(context, 'Most Popular Campaigns',
                'Campaigns that have raised the most money!'),
            sizedBox(10, 0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: (campaigns.length > 5) ? 5 : campaigns.length,
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, i) {
                return Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: ListTile(
                        onTap: () async {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => FutureBuilder<NPO>(
                                  future:
                                      getNpoDetails(campaigns[i].hostedByNPO),
                                  builder: (context, snapshot) {
                                    return snapshot.hasData
                                        ? CampaignScreenPortrait(
                                            campaignImage:
                                                campaigns[i].bannerImage,
                                            campaignName:
                                                campaigns[i].campTitle,
                                            npo: snapshot.data,
                                            desc: campaigns[i].campDescription,
                                            moneyRaised:
                                                campaigns[i].totalMoneyRaised,
                                          )
                                        : Center(
                                            child: CircularProgressIndicator(),
                                          );
                                  }),
                            ),
                          );
                        },
                        title: Row(
                          children: <Widget>[
                            Text((i + 1).toString()),
                            sizedBox(0, 10),
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: CircleAvatar(
                                backgroundColor: Theme.of(context).canvasColor,
                                backgroundImage:
                                    NetworkImage(campaigns[i].bannerImage),
                              ),
                            ),
                            sizedBox(0, 10),
                            Container(
                              width: screenWidth(context) * 0.35,
                              child: AutoSizeText(
                                campaigns[i].campTitle,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        trailing: Text(
                          '\$' + "${campaigns[i].totalMoneyRaised}",
                          style: TextStyle(
                            color: Theme.of(context).accentColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
