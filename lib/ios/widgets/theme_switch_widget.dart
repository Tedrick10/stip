// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// Flutter: External Libraries
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Providers
import '../../theme_provider.dart';

// ThemeSwitchWidget: StatefulWidget Class
class ThemeSwitchWidget extends StatefulWidget {
  // Constructor
  const ThemeSwitchWidget({Key? key}) : super(key: key);

  // createState: Override Class Method
  @override
  State<ThemeSwitchWidget> createState() => _ThemeSwitchWidgetState();
}

// _ThemeSwitchWidgetState: State Class
class _ThemeSwitchWidgetState extends State<ThemeSwitchWidget> {
  // Normal: Class Properties
  bool _switchValue = false;
  IconData _themeIconData = Icons.light_mode;

  // build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Final: Method Properties
    final ThemeProvider _themeProvider = Provider.of<ThemeProvider>(context);

    // Returning Widgets
    return Container(
      height: 50.0,
      alignment: Alignment.center,
      color: (_themeProvider.getTheme) ? Colors.black12 : Colors.white12,
      child: Row(
        children: [
          const SizedBox(width: 5.0),
          Switch(
            value: _themeProvider.getTheme,
            onChanged: (bool value) {
              setState(() {
                _themeIconData = value ? Icons.dark_mode : Icons.light_mode;
                _themeProvider.setTheme = value;
                if (value) {
                  // sets theme mode to dark
                  AdaptiveTheme.of(context).setDark();
                } else {
                  // sets theme mode to light
                  AdaptiveTheme.of(context).setLight();
                }
              });
            },
          ),
          const SizedBox(width: 5.0),
          Icon(
            _themeIconData,
            size: 30.0,
          ),
        ],
      ),
    );
  }
}
