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

// MyApp StatelessWidget Class
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
