import 'package:ChariMe/utilities/index.dart';

Column getSettingsTile(
      BuildContext context, String title, String secondaryTitle) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  secondaryTitle,
                  style: TextStyle(
                    fontSize: 11,
                    color: Theme.of(context).secondaryHeaderColor,
                  ),
                ),
              ],
            ),
            Icon(
              FontAwesomeIcons.chevronRight,
              color: Theme.of(context).secondaryHeaderColor,
              size: 15,
            ),
          ],
        ),
        Divider(
          color: Theme.of(context).primaryColor,
        ),
      ],
    );
  }
