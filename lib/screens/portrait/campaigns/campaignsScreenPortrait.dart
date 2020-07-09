import 'package:ChariMe/utilities/index.dart';
import 'package:country_provider/country_provider.dart';
import 'package:search_page/search_page.dart';

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
  List<Country> result = [];

  Widget build(BuildContext context) {
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
                delegate: SearchPage(
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
                  items: ['Campaign Name', 'Campaign Name', 'Campaign Name'],
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
                        getCardList(context, () {
                          setState(() {});
                        }),
                      ],
                    ),
                  ),
                  // failure: Center(
                  //   child: Text('No Campaign Found :('),
                  // ),
                  failure: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: GridView.builder(
                        itemCount: 5,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: screenWidth(context) *
                              0.5 /
                              (screenHeight(context) * 0.35),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {},
                            child: Container(
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
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
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          Text(
                                            'Charity Name',
                                            style: TextStyle(
                                              fontSize: 11,
                                              color: Theme.of(context)
                                                  .secondaryHeaderColor,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                            maxLines: 1,
                                          ),
                                          AutoSizeText(
                                            'Campaign Name',
                                            maxLines: 2,
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w700,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                            textAlign: TextAlign.justify,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  filter: (filter) => [],
                  builder: (filter) => getCardList(
                    context,
                    () {
                      setState(() {});
                    },
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
            getCardList(context, () {
              setState(() {});
            }),
            sizedBox(10, 0),
            getHomeHeader(context, 'Most Popular Campaigns',
                'Campaigns that have raised the most money!'),
            sizedBox(10, 0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: 5,
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
                        onTap: () {},
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text((i + 1).toString()),
                            // sizedBox(0, 25),
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
                            // SizedBox(width: 20),
                            AutoSizeText(
                              'Campaign Name',
                              maxLines: 2,
                            ),
                          ],
                        ),
                        trailing: Text(
                          '\$100,421',
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
