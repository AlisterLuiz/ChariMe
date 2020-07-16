import 'package:dbcrypt/dbcrypt.dart';
import 'package:mysql1/mysql1.dart';







Future<bool> verify(String username, String password) async {
  bool isCorrect = false;
  String hashed = '';
  String type = '';
  print("username: " + username);

  if (username == "") {
    return false;
  }


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
    var checkAccountType = await conn.query('SELECT COUNT(name) FROM users WHERE username = ?', [username]);
    for (var r in checkAccountType){
      type = '${r[0]}';
    }
    print(type);
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


Future<bool> checkAccountType(String username) async {
  bool isNPO = false;
  String type = '';


  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data'
  );
  var conn = await MySqlConnection.connect(settings);

  try{
    var checkAccountType = await conn.query('SELECT COUNT(name) FROM users WHERE username = ?', [username]);
    for (var r in checkAccountType){
      type = '${r[0]}';
    }

  }

  catch(e){
    print(e);
  }


  isNPO = type == '1' ? isNPO = false : isNPO = true;

  conn.close();

  if (isNPO){
    print("Account type is NPO.");
  } else {
    print("Account type is User.");
  }

  return isNPO;


}
