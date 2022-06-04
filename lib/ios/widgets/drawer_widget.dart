// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Pages
import '../pages/ios_home_page.dart';
import '../pages/about_us_page.dart';
import '../pages/wto_gats_page.dart';
import '../pages/asean_regional_page.dart';
import '../pages/horizontal_sectors_page.dart';
import '../pages/services_sectors_page.dart';
import '../pages/library_page.dart';

// Widgets
import './drawer_cell_widget.dart';
import './theme_switch_widget.dart';

// Providers
import '../../theme_provider.dart';

// DrawerWidget: StatelessWidget Class
class DrawerWidget extends StatelessWidget {
  // Constructor
  const DrawerWidget({Key? key}) : super(key: key);

  // Final & Private: Class Properties
  final String _drawerTitle = "MSTIP";

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);

    // Returning Widgets
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color:
                  (_themeProvider.getTheme) ? Colors.black12 : Colors.white12,
            ),
            child: Center(
              child: Image.asset(
                "assets/images/stip_logo_with_text.png",
                width: 200.0,
                height: 100.0,
              ),
            ),
          ),
          DrawerCellWidget(
            title: IOSHomePage.title,
            routeName: IOSHomePage.routeName,
          ),
          DrawerCellWidget(
            title: AboutUsPage.title,
            routeName: AboutUsPage.routeName,
          ),
          DrawerCellWidget(
            title: WtoGatsPage.title,
            routeName: WtoGatsPage.routeName,
          ),
          DrawerCellWidget(
            title: AseanRegionalPage.title,
            routeName: AseanRegionalPage.routeName,
          ),
          DrawerCellWidget(
            title: HorizontalSectorsPage.title,
            routeName: HorizontalSectorsPage.routeName,
          ),
          DrawerCellWidget(
            title: ServicesSectorsPage.title,
            routeName: ServicesSectorsPage.routeName,
          ),
          DrawerCellWidget(
            title: LibraryPage.title,
            routeName: LibraryPage.routeName,
          ),
          const ThemeSwitchWidget(),
        ],
      ),
    );
  }
}
