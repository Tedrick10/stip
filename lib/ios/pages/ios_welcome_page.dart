// Flutter: Existing Libraries
import 'dart:async';

import 'package:flutter/material.dart';

// Pages
import '../../splash_page.dart';
import './ios_home_page.dart';
import './menu_page.dart';

// IOSWelcomePage: StatelessWidget Class
class IOSWelcomePage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Welcome";
  static const String routeName = "/ios-welcome";
  // Constructor
  const IOSWelcomePage({Key? key}) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    Timer(
      const Duration(seconds: 5),
      () {
        // Navigator.of(context).pushReplacementNamed(IOSHomePage.routeName);
        Navigator.of(context).pushReplacementNamed(MenuPage.routeName);
      },
    );

    // Returning Widgets
    return SplashPage();
  }
}
