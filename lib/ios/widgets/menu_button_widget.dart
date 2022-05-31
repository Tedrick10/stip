// Flutter: Existing Libraries
import 'package:flutter/material.dart';

// MenuButtonWidget: StatelessWidget Class
class MenuButtonWidget extends StatelessWidget {
  // Final & Parameter: Class Properties
  final String title;
  final String routeName;

  // Constructor
  const MenuButtonWidget({
    required this.title,
    required this.routeName,
    Key? key,
  }) : super(key: key);

  // Build: Override Class Method
  @override
  Widget build(BuildContext context) {
    // Returning Widgets
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: InkWell(
        onTap: () => Navigator.of(context).pushNamed(routeName),
        borderRadius: BorderRadius.circular(50.0),
        child: Container(
          width: 300.0,
          height: 60.0,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(27, 160, 220, 1.0),
            border: Border.all(
              width: 2.0,
              color: const Color.fromRGBO(58, 98, 140, 1.0),
            ),
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
