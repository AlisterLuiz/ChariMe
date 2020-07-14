import 'package:dbcrypt/dbcrypt.dart';
import 'package:mysql1/mysql1.dart';







Future<void> register(String name, String emailID, String username, String password) async {

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data'
  );
  var conn = await MySqlConnection.connect(settings);

  try{
    await conn.query('insert into login (username, password) values (?, ?)', [username, hashPassword(password)]);
    await conn.query('insert into users (username, name, emailID) values (?, ?, ?)', [username, name, emailID]);

    print("NAME: " + name + " USERNAME: " + username + " successfully registered in the database.");
  }

  catch(e){
    print(e);
  }

  conn.close();


}

Future<void> registerNPO(String name, String emailID, String username, String password, String region) async {

  var settings = new ConnectionSettings(
      host: 'app-db.cdslhq2tdh2f.us-east-2.rds.amazonaws.com',
      port: 3306,
      user: 'peanut',
      password: 'willywonka',
      db: 'data'
  );
  var conn = await MySqlConnection.connect(settings);

  try{
    await conn.query('insert into login (username, password) values (?, ?)', [username, hashPassword(password)]);
    await conn.query('insert into non_profit (username, name, emailID, country) values (?, ?, ?, ?)', [username, name, emailID, region]);


    print("NAME: " + name + " USERNAME: " + username + " successfully registered in the database.");
  }

  catch(e){
    print(e);
  }

  conn.close();


}
String hashPassword(String plainPassword) {
  var hashedPassword = new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
  return hashedPassword;
}




