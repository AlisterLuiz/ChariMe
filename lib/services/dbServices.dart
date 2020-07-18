import 'package:ChariMe/models/userModel.dart';
import 'package:ChariMe/utilities/index.dart';
import 'package:mysql1/mysql1.dart';

Future<List<Campaigns>> getAllCampaigns() async {
  Map<String, Campaigns> mapCampaigns = {};
  List<Campaigns> allCampaigns = [];

  print("started");

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data');
  var conn = await MySqlConnection.connect(settings);

  try {
    print("Trying to fetch data.");
    var results = await conn.query('select * from campaigns');
    for (var row in results) {
      print(row);
      var campDictionary = Campaigns(
          campTitle: '${row[1]}' ?? '',
          campDescription: '${row[2]}' ?? '',
          isActive: row[3] == 1 ? true : false,
          hostedByNPO: '${row[4]}' ?? '',
          bannerImage: '${row[5] ?? ''}');
      mapCampaigns['${row[1]}'] = campDictionary;
    }
    mapCampaigns.forEach((key, value) {
      allCampaigns.add(value);
    });
    print(allCampaigns);
  } catch (e) {
    print(e);
  }

  conn.close();
  return allCampaigns;
}

Future<User> getUserInfo(String username) async {
  User loggedInUser;

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data');
  var conn = await MySqlConnection.connect(settings);

  try {
    print("Trying to fetch data for the user information.");
    var results =
        await conn.query('select * from users where username = ?', [username]);
    for (var row in results) {
      loggedInUser = User(
        username: username ?? '',
        fullName: '${row[1]}' ?? '',
      );
    }
    var donations = await conn.query(
        'SELECT SUM(amount) FROM donations WHERE username = ?', [username]);
    for (var row in donations) {
      loggedInUser.totalDonated = row[0];
    }
  } catch (e) {
    print(e);
  }

  conn.close();
  return loggedInUser;
}
