import 'package:ChariMe/models/userModel.dart';
import 'package:ChariMe/providers/usernameProvider.dart';
import 'package:ChariMe/utilities/index.dart';

class NavigationBarPortrait extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBarPortrait> {
  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final currentIndex = Provider.of<CurrentIndexProvider>(context);

    final List<Widget> _children = [
      HomeScreenPortrait(),
      CampaignsScreenPortrait(),
      CharitiesScreenPortrait(),
      ProfileScreenPortrait(),
    ];

    return MultiProvider(
      providers: [
        FutureProvider<User>.value(
          value: getUserInfo(
              Provider.of<UserNameProvider>(context, listen: false)
                  .getUsername()),
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          body: _children[currentIndex.getIndex()],
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
                  FontAwesomeIcons.handHoldingHeart,
                  semanticLabel: 'Charity',
                ),
                title: Text(
                  'Charities',
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
