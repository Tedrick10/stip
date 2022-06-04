// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:provider/provider.dart';

// Providers
import '../../theme_provider.dart';

// DrawerCellWidget: StatelessWidget Class
class DrawerCellWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String title;
  final String routeName;
  // Constructor
  const DrawerCellWidget({
    required this.title,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final String? currentRoute = ModalRoute.of(context)!.settings.name;
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);

    // Returning Widgets
    return ListTile(
      tileColor: (currentRoute == routeName)
          ? (_themeProvider.getTheme)
              ? Colors.white
              : Colors.grey
          : (_themeProvider.getTheme)
              ? Colors.black12
              : Colors.white12,
      title: Text(
        title,
        style: TextStyle(
          color: (currentRoute == routeName)
              ? (_themeProvider.getTheme)
                  ? Colors.black
                  : Colors.white
              : (_themeProvider.getTheme)
                  ? Colors.white
                  : Colors.black,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }
}
