import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/providers/usernameProvider.dart';
import 'package:ChariMe/utilities/index.dart';

class OrgNavigationBarPortrait extends StatefulWidget {
  @override
  _OrgNavigationBarState createState() => _OrgNavigationBarState();
}

class _OrgNavigationBarState extends State<OrgNavigationBarPortrait> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final currentIndex = Provider.of<CurrentIndexProvider>(context);

    final List<Widget> _children = [
      OrgHomeScreenPortrait(),
      CampaignsScreenPortrait(),
      OrgHistoryCampaigns(),
      OrgProfileScreenPortrait(),
    ];

    return MultiProvider(
      providers: [
        FutureProvider<NPO>.value(
          value: getNpoInfo(
            Provider.of<UserNameProvider>(context, listen: false).getUsername(),
          ),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: (Provider.of<List<Campaigns>>(context) != null)
              ? _children[currentIndex.getIndex()]
              : Center(
                  child: CircularProgressIndicator(),
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: currentIndex.getIndex(),
            onTap: (index) {
              setState(() {
                currentIndex.setIndex(index);
              });
            },
            type: BottomNavigationBarType.fixed,
            showUnselectedLabels: true,
            selectedItemColor: Theme.of(context).accentColor,
            unselectedItemColor: Theme.of(context).secondaryHeaderColor,
            backgroundColor: Theme.of(context).backgroundColor,
            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.home,
                  semanticLabel: 'Home Page',
                ),
                title: Text(
                  'Home',
                  style: kNavigationBarTextStyle,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.peopleCarry,
                  semanticLabel: 'Campaigns',
                ),
                title: Text(
                  'Campaigns',
                  style: kNavigationBarTextStyle,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.history,
                  semanticLabel: 'History',
                ),
                title: Text(
                  'History',
                  style: kNavigationBarTextStyle,
                ),
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.solidUser,
                  semanticLabel: 'Profile',
                ),
                title: Text(
                  'Profile',
                  style: kNavigationBarTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
