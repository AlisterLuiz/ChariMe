import 'package:mysql1/mysql1.dart';

Future<void> addCampaign(String username, String title, String description) async {

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data'
  );
  var conn = await MySqlConnection.connect(settings);
  print(title);
  print(description);

  try{
    var result = await conn.query('insert into campaigns (username, title, description, isActive) values (?, ?, ?, ?)', [username, title, description, 1]);
  }

  catch(e){
    print(e);
  }

  conn.close();

}
