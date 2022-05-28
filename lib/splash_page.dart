// Dart: Existing Libraries
import 'dart:io';

// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';

// SplashPage StatelessWidget Class
class SplashPage extends StatelessWidget {
  // Final: Class Properties
  final String _logoOnlyString = "assets/images/stip_logo.png";
  final String _logoWithTitleString = "assets/images/stip_logo_with_text.png";
  final String _mobileSplashPageString = "assets/images/mobile_splash_page.jpg";
  final String _tabletSplashPageString = "assets/images/tablet_splash_page.jpg";
  final String _titleString = "Myanmar Services Trade & Investment Portal";

  // Build Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final double _screenWidth = MediaQuery.of(context).size.width;
    final double _screenHeight = MediaQuery.of(context).size.height;
    final String _backgroundImageString = (_screenWidth > 640.0)
        ? _tabletSplashPageString
        : _mobileSplashPageString;
    final double _titleFontSize =
        (_screenWidth < 640.0 && Platform.isIOS) ? 14.0 : 15.0;

    // Returning Widgets
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(_backgroundImageString),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  _logoWithTitleString,
                  width: 200,
                  height: 100,
                ),
                Text(
                  _titleString.toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                    fontSize: _titleFontSize,
                    fontWeight: FontWeight.bold,
                    // color: const Color.fromRGBO(27, 160, 220, 1.0),
                  ),
                ),
                const SizedBox(height: 20.0),
                Container(
                  child: LoadingAnimationWidget.threeRotatingDots(
                    color: const Color.fromRGBO(27, 160, 220, 1.0),
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
