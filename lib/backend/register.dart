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
  await conn.query('insert into login (username, password) values (?, ?)', [username, hashPassword(password)]);
  conn.close();

  print("NAME: " + name + " USERNAME: " + username + " successfully registered in the database.");

}

String hashPassword(String plainPassword) {
  var hashedPassword = new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
  return hashedPassword;
}




