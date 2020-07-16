import 'package:ChariMe/utilities/index.dart';

class UserNameProvider extends ChangeNotifier {
  String _username = "";

  setUsername(String username) {
    _username = username;
    notifyListeners();
  }

  String getUsername() => _username;
}
