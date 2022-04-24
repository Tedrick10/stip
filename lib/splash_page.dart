// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:google_fonts/google_fonts.dart';

// SplashPage StatelessWidget Class
class SplashPage extends StatelessWidget {
  // Build Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage(
            "assets/images/stip_mobile_splash_image.jpg",
          ),
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Center(
            child: Container(
              width: double.infinity,
              height: 150.0,
              alignment: Alignment.center,
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/stip_logo.png",
                    width: 200,
                    height: 100,
                  ),
                  Text(
                    "Myanmar Services Trade & Investment Portal",
                    style: GoogleFonts.lato(
                      fontSize: 18.0,
                    ),
                  ),
                  // const SizedBox(height: 10.0),
                  // LoadingAnimationWidget.staggeredDotsWave(
                  //   color: Colors.lightBlue,
                  //   size: 50.0,
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
