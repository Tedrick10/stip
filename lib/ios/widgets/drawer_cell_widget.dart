// Flutter: Existing Libraries
import 'package:flutter/material.dart';

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

    // Returning Widgets
    return ListTile(
      tileColor: (currentRoute == routeName) ? Colors.grey : Colors.white12,
      title: Text(
        title,
        style: TextStyle(
          color: (currentRoute == routeName) ? Colors.white : Colors.black,
        ),
      ),
      onTap: () {
        Navigator.of(context).pushReplacementNamed(routeName);
      },
    );
  }
}
