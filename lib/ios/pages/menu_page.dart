// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Pages
import './ios_home_page.dart';
import './wto_gats_page.dart';
import './asean_regional_page.dart';
import './horizontal_sectors_page.dart';
import 'services_sectors_page.dart';

// Widgets
import '../widgets/menu_button_widget.dart';

// MenuPage: StatelessWidget Class
class MenuPage extends StatelessWidget {
  // Static & Constant: Class Properties
  static const String title = "Menu";
  static const String routeName = "/menu";

  // Constructor
  const MenuPage({Key? key}) : super(key: key);

  // Future Class Methods
  Future<bool> _onWillPop(BuildContext context) async {
    return (await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Are you sure?'),
            content: const Text('Do you want to exit the app.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: const Text(
                  'No',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 49, 110, 1),
                  ),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: const Text(
                  'Yes',
                  style: TextStyle(
                    color: Color.fromRGBO(30, 49, 110, 1),
                  ),
                ),
              ),
            ],
          ),
        )) ??
        false;
  }

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: Scaffold(
        // appBar: AppBar(
        //   centerTitle: true,
        //   title: const Text(
        //     "MSTIP",
        //   ),
        // ),
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 5.0,
                  ),
                  child: GestureDetector(
                    onTap: () =>
                        Navigator.of(context).pushNamed(IOSHomePage.routeName),
                    child: Image.asset(
                      "assets/images/stip_logo_with_text.png",
                      width: 300.0,
                      height: 150.0,
                    ),
                  ),
                ),
                MenuButtonWidget(
                  title: WtoGatsPage.title,
                  routeName: WtoGatsPage.routeName,
                ),
                MenuButtonWidget(
                  title: AseanRegionalPage.title,
                  routeName: AseanRegionalPage.routeName,
                ),
                MenuButtonWidget(
                  title: HorizontalSectorsPage.title,
                  routeName: HorizontalSectorsPage.routeName,
                ),
                MenuButtonWidget(
                  title: ServicesSectorsPage.title,
                  routeName: ServicesSectorsPage.routeName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
