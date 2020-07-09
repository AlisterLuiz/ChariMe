import 'package:ChariMe/utilities/index.dart';

currentTheme(BuildContext context) {
  return Provider.of<ThemeModel>(context).currentTheme;
}
