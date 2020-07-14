import 'package:dbcrypt/dbcrypt.dart';
import 'package:mysql1/mysql1.dart';







Future<bool> verify(String username, String password) async {
  bool isCorrect = false;
  String hashed = '';

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data'
  );
  var conn = await MySqlConnection.connect(settings);

  try{
    var results = await conn.query('select password from login where username = ?', [username]);
    for (var row in results) {
      hashed = '${row[0]}';
      print(hashed);
      isCorrect = new DBCrypt().checkpw(password, hashed);
      print(isCorrect);

    }
  }

  catch(e){
    print(e);
  }

  conn.close();
  if (isCorrect){
    print("True hai bhai");
  }
  return isCorrect;


}

