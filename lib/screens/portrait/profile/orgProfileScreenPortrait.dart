import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/utilities/index.dart';

class OrgProfileScreenPortrait extends StatefulWidget {
  @override
  _OrgProfileScreenPortraitState createState() =>
      _OrgProfileScreenPortraitState();
}

class _OrgProfileScreenPortraitState extends State<OrgProfileScreenPortrait> {
  @override
  Widget build(BuildContext context) {
    NPO npo = Provider.of<NPO>(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 20,
      ),
      child: ListView(
        children: [
          getHeader(2, false, 'Profile', () {
            Navigator.pop(context);
          }),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              sizedBox(30, 0),
              Container(
                padding: EdgeInsets.all(4.0),
                decoration: new BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  shape: BoxShape.circle,
                ),
                child: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://avatars3.githubusercontent.com/u/5159405?s=400&u=09c788de985a0e08509f69ab307344fcc47b0af6&v=4'),
                  maxRadius: 65,
                ),
              ),
              sizedBox(10, 0),
              Text(
                npo.name,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBox(10, 0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  getCharityDetailsCard(context, 'Successful Campaigns', '${npo.numInactiveCampaigns}'),
                  getCharityDetailsCard(context, 'Current Campaigns', '${npo.numActiveCampaigns}'),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    getHomeHeader(
                      context,
                      'About',
                      'Get to know more about Charity Name',
                    ),
                    sizedBox(10, 0),
                    Column(
                      children: [
                        FittedBox(
                          fit: BoxFit.fitWidth,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              getRichText(
                                  context, 'Country of Origin: ', npo.region),
                              sizedBox(0, 2),
                              getRichText(context, 'Founded: ', '1985'),
                            ],
                          ),
                        ),
                        sizedBox(10, 0),
                        getRichText(context, 'Founders: ', 'John Doe'),
                      ],
                    ),
                    sizedBox(10, 0),
                    Text(
                      npo.npoDescription,
                    ),
                  ],
                ),
              ),
              sizedBox(30, 0),
            ],
          ),
          ListView(
            shrinkWrap: true,
            children: [
              getSettingsTile(
                context,
                'Payment Information',
                'View your payment credentials',
              ),
              sizedBox(15, 0),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    Routes.settingsPortrait,
                  );
                },
                child: getSettingsTile(
                  context,
                  'Settings',
                  'View and update your settings',
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
