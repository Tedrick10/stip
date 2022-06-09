// Dart: Existing Libraries
import 'dart:io' show Platform;

// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Flutter: External Libraries
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Providers
import 'package:stip/theme_provider.dart';

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
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider()),
        ],
        child: MyApp(),
      ),
    );
  });
}

// App ID Prefix (SKU): FH4F75KHBD
// MyApp StatelessWidget Class
class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Lifecycle Hook Methods
  @override
  void initState() {
    // initializeTheme();
    super.initState();
  }

  // Actions: Class Methods
  void initializeTheme() {
    // Final: Class Properties
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);

    // Init Theme
    _themeProvider.initTheme();
  }

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: SystemUiOverlay.values,
    );

    // Final: Class Properties
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);

    // Init Theme
    _themeProvider.initTheme();

    // Returning Widgets
    return AdaptiveTheme(
      light: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.lightBlue,
      ),
      dark: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.red,
        accentColor: Colors.amber,
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        title: "Myanmar Services Trade & Investment Portal",
        debugShowCheckedModeBanner: false,
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: AndroidHomePage.routeName,
        // initialRoute: (Platform.isAndroid)
        //     ? AndroidHomePage.routeName
        //     : IOSWelcomePage.routeName,
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
      ),
    );
  }
}
