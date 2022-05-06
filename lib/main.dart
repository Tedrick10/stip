// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages
import './home_page.dart';

// Main Function
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp());
  });
}

// App ID Prefix: FH4F75KHBD
// MyApp StatelessWidget Class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    return MaterialApp(
      title: "Myanmar Services Trade & Investment Portal",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialRoute: HomePage.routeName,
      routes: {
        HomePage.routeName: (_) => const HomePage(),
      },
    );
  }
}
