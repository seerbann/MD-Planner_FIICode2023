import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../Pages/listpage/main_listpage.dart';
import '../Pages/userprofile/main_userprofile.dart';

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
      selectedLabelTextStyle: const TextStyle(color: Colors.lightBlue),
      backgroundColor: Colors.black,
      selectedIndex: _selectedIndex,
      labelType: NavigationRailLabelType.all,
      // groupAlignment: groupAligment,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
          if (index == 0) context.go('/profile');
          if (index == 1) context.go('/list');
        });
      },
      destinations: [
        NavigationRailDestination(
          icon: Image.asset(
            'assets/images/user.png',
            scale: 5,
          ),
          //selectedIcon: Icon(Icons.favorite),
          label: Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        NavigationRailDestination(
          icon: Image.asset(
            'assets/images/list.png',
            scale: 3,
          ),
          //selectedIcon: Icon(Icons.book),
          label: Text(
            'List',
            style: TextStyle(color: Colors.white),
          ),
        ),
        NavigationRailDestination(
          icon: Image.asset(
            'assets/images/calendar.png',
            scale: 3,
          ),
          //selectedIcon: Icon(Icons.star),
          label: Text(
            'Calendar',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
