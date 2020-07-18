import 'dart:math';

import 'package:ChariMe/models/npoModel.dart';
import 'package:ChariMe/models/userModel.dart';
import 'package:ChariMe/utilities/index.dart';
import 'package:aws_s3/aws_s3.dart';
import 'package:mysql1/mysql1.dart';
import 'package:path/path.dart';

/// Used for AWS connection

/*
Uploads an image to the S3 bucket and links the file with the
associated table entry in the database
*/
Future<bool> uploadImage(File image) async {
  var aws_path = 'https://db-images-link.s3.us-east-2.amazonaws.com';
  var filename = basename(image.path);
  String result;
  var returnType = false;
  AwsS3 awsS3 = AwsS3(
      awsFolderPath: aws_path,
      file: image,
      fileNameWithExt: filename,
      poolId: "your aws pool id",
      region: Regions.US_EAST_2,
      bucketName: "db-images-link");

  try {
    try {
      result = await awsS3.uploadFile;
      debugPrint("Result :'$result'.");
    }
    on PlatformException {
      debugPrint("Result :'$result'.");
    }
  } on PlatformException catch (e) {
    debugPrint("Failed :'${e.message}'.");
  }

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data');
  var conn = await MySqlConnection.connect(settings);

  var image_s3_path = '$aws_path/$filename';
  try {
    var res = conn.query('insert into campaigns (bannerImage) values "$image_s3_path"');
    returnType = true;
  }
  catch (e) { print("error linking to db: $e"); }

  return returnType;
}

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
//      print(row);
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
//    print(allCampaigns);
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

Future<NPO> getNpoInfo(String username) async {
  print("NPO started");
  NPO loggedInNpo;

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data');
  var conn = await MySqlConnection.connect(settings);

  try {
    print("Trying to fetch data for the NPO information.");
    var results =
    await conn.query('select * from non_profit where username = ?', [username]);
    for (var row in results) {
      loggedInNpo = NPO(
        username: username ?? '',
        name: '${row[1]}' ?? '',
        region: '${row[2]}' ?? ''

      );
    }
    var donations = await conn.query(
        'select sum(donations.amount) from donations, campaigns where donations.campaignID = campaigns.campaignID and campaigns.username = ?', [username]);
    for (var row in donations) {
      loggedInNpo.totalMoneyRaised = row[0] ?? 0;
    }

    var activeCamps = await conn.query(
        'select count(campaignID) from campaigns where campaigns.isActive = 1 and campaigns.username = ?', [username]);
    for (var row in activeCamps) {
      print(row[0]);
      loggedInNpo.numActiveCampaigns = row[0] ?? 0;
    }

    var inactiveCamps = await conn.query(
        'select count(campaignID) from campaigns where campaigns.isActive = 0 and campaigns.username = ?', [username]);
    for (var row in inactiveCamps) {
      loggedInNpo.numInactiveCampaigns = row[0] ?? 0;
    }




  } catch (e) {
    print(e);
  }

  conn.close();
  print("info gathered: " +loggedInNpo.username + " " + loggedInNpo.region + " " + loggedInNpo.name);
  print(loggedInNpo.totalMoneyRaised);
  print((loggedInNpo.numActiveCampaigns));
  print((loggedInNpo.numInactiveCampaigns));
  return loggedInNpo;
}
