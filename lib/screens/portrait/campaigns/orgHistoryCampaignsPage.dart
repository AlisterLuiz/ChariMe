import 'package:ChariMe/utilities/index.dart';

class OrgHistoryCampaigns extends StatefulWidget {
  @override
  _OrgHistoryCampaignsState createState() => _OrgHistoryCampaignsState();
}

class _OrgHistoryCampaignsState extends State<OrgHistoryCampaigns> {
  List<String> viewBy = ['Day', 'Week', 'Month'];
  int selectedViewIndex = 0;
  List<bool> isSelected = [true, false, false];

  Widget build(BuildContext context) {
    List<Campaigns> campaigns = Provider.of<List<Campaigns>>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'History',
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
                  searchLabel: 'Search Previous Campaigns',
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
                          return getCampaignCard(context, campaigns[index]);
                        }),
                  ),
                  filter: (filter) => [],
                  builder: (filter) => getCampaignsList(
                    context,
                    () {
                      setState(() {});
                    },
                    campaigns,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            sizedBox(10, 0),
            Center(
              child: ToggleButtons(
                selectedColor: Theme.of(context).accentColor,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Hourly',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Weekly',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Monthly',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                onPressed: (int index) {
                  selectedViewIndex = index;
                  setState(() {
                    for (int buttonIndex = 0;
                        buttonIndex < isSelected.length;
                        buttonIndex++) {
                      if (buttonIndex == index) {
                        isSelected[buttonIndex] = true;
                      } else {
                        isSelected[buttonIndex] = false;
                      }
                    }
                  });
                },
                isSelected: isSelected,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Container(
                      height: 250.0,
                      child: LineChartHistory(viewBy[selectedViewIndex], 5, 49),
                    ),
                  ),
                  sizedBox(10, 0),
                  getHomeHeader(context, 'Past Campaigns',
                      'Campaigns previously run by you!'),
                  sizedBox(5, 0),
                  GridView.builder(
                      shrinkWrap: true,
                      itemCount: 5,
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
