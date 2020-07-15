import 'package:ChariMe/utilities/index.dart';

class OrgProfileScreenPortrait extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                'Haris Foley',
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
              sizedBox(5, 0),
              Text(
                '\$2350 Donated',
                style: TextStyle(
                  color: Theme.of(context).accentColor,
                  fontSize: 23,
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
