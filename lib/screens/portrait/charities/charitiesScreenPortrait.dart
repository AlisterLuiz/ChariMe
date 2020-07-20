import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/utilities/index.dart';

class CharitiesScreenPortrait extends StatefulWidget {
  @override
  _CharitiesScreenPortraitState createState() =>
      _CharitiesScreenPortraitState();
}

class _CharitiesScreenPortraitState extends State<CharitiesScreenPortrait> {
  @override
  Widget build(BuildContext context) {
    List<NPO> npo = Provider.of<List<NPO>>(context);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Charities',
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
                delegate: SearchPage<NPO>(
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
                  items: npo.toList(),
                  searchLabel: 'Search Charities',
                  suggestion: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getHomeHeader(context, 'Recent Searches',
                            'Charities that you have searched previously'),
                        sizedBox(10, 0),
                        getCharitiesList(context, () {
                          setState(() {});
                        }, npo),
                      ],
                    ),
                  ),
                  failure: Center(
                    child: Text('No Charity Found :('),
                  ),
                  filter: (charity) => [
                    charity.name,
                    charity.npoDescription,
                    charity.region,
                  ],
                  builder: (charity) => getCharityCard(context, charity),
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
            getHomeHeader(context, 'Worldwide Charities',
                'Where our charities are based on'),
            CharityPieChart(),
            sizedBox(15, 0),
            getHomeHeader(context, 'Most Popular Charities',
                'Charities that have raised the most money!'),
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
                          onTap: () {
                            Navigator.push(
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
                                  backgroundColor:
                                      Theme.of(context).canvasColor,
                                  backgroundImage:
                                      NetworkImage(npo[i].profilePicture),
                                ),
                              ),
                              sizedBox(0, 10),
                              Container(
                                width: screenWidth(context) * 0.35,
                                child: AutoSizeText(
                                  npo[i].name,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          trailing: Text(
                            '\$' + "${npo[i].totalMoneyRaised}",
                            style: TextStyle(
                              color: Theme.of(context).accentColor,
                            ),
                          )),
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
