
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

int _selectedIndex = 0;

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key, this.param});
  final int? param;

  @override
  State<CustomNavBar> createState() => _CustomNavBarState();
}

class _CustomNavBarState extends State<CustomNavBar> {
  NavigationRailLabelType labelType = NavigationRailLabelType.all;
  bool showLeading = false;
  bool showTrailing = false;
  double groupAligment = -1.0;

  @override
  Widget build(BuildContext context) {
    return NavigationRail(
      selectedLabelTextStyle: TextStyle(color: Colors.lightBlue),
      backgroundColor: Colors.black,
      selectedIndex: _selectedIndex,
      // groupAlignment: groupAligment,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      destinations: <NavigationRailDestination>[
        NavigationRailDestination(
          icon: Image.asset(
            'assets/images/user.png',
            scale: 5,
          ),
          //selectedIcon: Icon(Icons.favorite),
          label: Text('First'),
        ),
        NavigationRailDestination(
          icon: Image.asset(
            'assets/images/list.png',
            scale: 3,
          ),
          //selectedIcon: Icon(Icons.book),
          label: Text('Second'),
        ),
        NavigationRailDestination(
          icon: Image.asset(
            'assets/images/calendar.png',
            scale: 3,
          ),
          //selectedIcon: Icon(Icons.star),
          label: Text('Third'),
        ),
      ],
    );
  }
}
