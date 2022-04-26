// Flutter: Existing Libraries
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// NoInternetPage: StatelessWidget Class
class NoInternetPage extends StatelessWidget {
  // Final: Class Properties
  final String _imageLink = "assets/images/stip_logo_with_text.png";
  final String _text = "Please make sure to connect the internet.";

  // Constructor
  const NoInternetPage({
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                _imageLink,
                width: 200.0,
                height: 100.0,
              ),
              Text(
                _text,
                style: GoogleFonts.lato(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
