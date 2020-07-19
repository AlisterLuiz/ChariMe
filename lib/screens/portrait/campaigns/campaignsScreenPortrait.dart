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
                  builder: (campaign) => Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: GridView.builder(
                      shrinkWrap: true,
                        itemCount: campaigns.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: screenWidth(context) *
                              0.5 /
                              (screenHeight(context) * 0.35),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return getCampaignCard(
                            context,
                            campaign,
                          );
                        }),
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
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CampaignScreenPortrait(
                                campaignImage:
                                    'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                                charityImage:
                                    'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                                campaignName: campaigns[i].campTitle,
                                charityName: campaigns[i].hostedByNPO,
                                desc: campaigns[i].campDescription,
                              ),
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
                                backgroundImage: NetworkImage(
                                    'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png'),
                              ),
                            ),
                            sizedBox(0, 10),
                            Container(
                              width: screenWidth(context) * 0.4,
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
