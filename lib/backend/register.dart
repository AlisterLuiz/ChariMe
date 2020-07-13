import 'package:dbcrypt/dbcrypt.dart';
// import 'package:mysql1/mysql1.dart';



// Future<void> dbConnect() async {

//   var settings = new ConnectionSettings(
//       host: 'localhost',
//       port: 3306,
//       user: 'peanut',
//       password: 'willywonka',
//       db: 'data'
//   );
//   var conn = await MySqlConnection.connect(settings);



// }



bool register(String firstName, String emailID, String password) {

}

String hashPassword(String plainPassword) {
  var hashedPassword = new DBCrypt().hashpw(plainPassword, new DBCrypt().gensalt());
  print('PASSWORD' + hashedPassword);
  return hashedPassword;
}




