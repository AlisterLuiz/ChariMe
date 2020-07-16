import 'package:mysql1/mysql1.dart';


Future<void> getAllCampaigns() async {
  List <Map> allCampaigns = [];
  print("started");


  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data'
  );
  var conn = await MySqlConnection.connect(settings);

  try{
    print("Trying to fetch data.");
    var results = await conn.query('select * from campaigns');
    for (var row in results) {
      var campDictionary = {
        'campTitle': '${row[1]}',
        'campDescription': '${row[2]}',
        'hostedByNPO': '${row[4]}',
      };
      allCampaigns.add(campDictionary);

    }
    print(allCampaigns);
  }

  catch(e){
    print(e);
  }

  conn.close();

}
