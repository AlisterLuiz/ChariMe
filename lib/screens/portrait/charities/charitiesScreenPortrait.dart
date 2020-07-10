import 'package:ChariMe/utilities/index.dart';

class CharitiesScreenPortrait extends StatefulWidget {
  @override
  _CharitiesScreenPortraitState createState() =>
      _CharitiesScreenPortraitState();
}

class _CharitiesScreenPortraitState extends State<CharitiesScreenPortrait> {
  @override
  Widget build(BuildContext context) {
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
                  items: ['Charity Name', 'Charity Name', 'Charity Name'],
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
                        }),
                      ],
                    ),
                  ),
                  // failure: Center(
                  //   child: Text('No Charity Found :('),
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
                              (screenHeight(context) * 0.2),
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          return getCharityCard(context);
                        }),
                  ),
                  filter: (filter) => [],
                  builder: (filter) => getCharitiesList(context, () {
                    setState(() {});
                  }),
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
                                charityBanner:
                                    'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                                charityImage:
                                    'https://upload.wikimedia.org/wikipedia/commons/7/70/Kawasaki_Candy_Lime_Green.png',
                                charityName: 'Charity Name',
                              ),
                            ),
                          );
                        },
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text((i + 1).toString()),
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
                            AutoSizeText(
                              'Charity Name',
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
