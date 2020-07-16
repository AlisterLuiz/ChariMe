import 'package:ChariMe/providers/usernameProvider.dart';
import 'package:ChariMe/utilities/index.dart';
import 'package:device_preview/device_preview.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: DevicePreview(
        enabled: true,
        builder: (context) => MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<CurrentIndexProvider>(
          create: (context) => CurrentIndexProvider(),
        ),
        ChangeNotifierProvider<UserNameProvider>(
          create: (context) => UserNameProvider(),
        ),
      ],
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        title: 'ChariMe',
        theme: Provider.of<ThemeModel>(context).currentTheme,
        initialRoute: Routes.homeView,
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
