// Dart: Existing Libraries
import 'dart:io' show Platform;

// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Pages
//// Android
import 'android/pages/android_home_page.dart';
//// iOS
import 'ios/pages/ios_welcome_page.dart';
import 'ios/pages/menu_page.dart';
import 'ios/pages/ios_home_page.dart';
import 'ios/pages/about_us_page.dart';
import 'ios/pages/wto_gats_page.dart';
import 'ios/pages/asean_regional_page.dart';
import 'ios/pages/horizontal_sectors_page.dart';
import 'ios/pages/services_sectors_page.dart';
import 'ios/pages/library_page.dart';

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
      initialRoute: (Platform.isAndroid)
          ? AndroidHomePage.routeName
          : IOSWelcomePage.routeName,
      routes: {
        // Android
        AndroidHomePage.routeName: (_) => const AndroidHomePage(),

        // iOS
        IOSWelcomePage.routeName: (_) => const IOSWelcomePage(),
        MenuPage.routeName: (_) => const MenuPage(),
        IOSHomePage.routeName: (_) => const IOSHomePage(),
        AboutUsPage.routeName: (_) => const AboutUsPage(),
        WtoGatsPage.routeName: (_) => const WtoGatsPage(),
        AseanRegionalPage.routeName: (_) => const AseanRegionalPage(),
        HorizontalSectorsPage.routeName: (_) => const HorizontalSectorsPage(),
        ServicesSectorsPage.routeName: (_) => const ServicesSectorsPage(),
        LibraryPage.routeName: (_) => const LibraryPage(),
      },
    );
  }
}
