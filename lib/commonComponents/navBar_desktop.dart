import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/Pages/listpage/components/ListAndPacientDetails.dart';
import '../Pages/listpage/main_listpage.dart';
import '../Pages/userprofile/main_userprofile.dart';

int _selectedIndex = 0;

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

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
      leading: Image.asset(
        'assets/images/logo2.png',
        scale: 5,
      ),
      selectedLabelTextStyle: const TextStyle(color: Colors.lightBlue),
      backgroundColor: Colors.black,
      selectedIndex: _selectedIndex,
      labelType: NavigationRailLabelType.all,
      groupAlignment: groupAligment,
      onDestinationSelected: (int index) {
        setState(() {
          _selectedIndex = index;
          if (index == 0) Navigator.pushNamed(context, '/profile');
          if (index == 1) Navigator.pushNamed(context, '/list');
          if (index == 2) Navigator.pushNamed(context, '/calendar');
          if (index == 3)
            setState(() {
              random = false;
              fetchPatients = false;
              pacienti = [];
              patientList = [];
              FirebaseAuth.instance.signOut();
              Navigator.pushNamed(context, '/');
            });
        });
      },
      destinations: [
        NavigationRailDestination(
          selectedIcon: Image.asset(
            'assets/images/userSelectat.png',
            scale: 5,
          ),
          icon: Image.asset(
            'assets/images/user.png',
            scale: 5,
          ),
          //selectedIcon: Icon(Icons.favorite),
          label: const Text(
            'Profile',
            style: TextStyle(color: Colors.white),
          ),
        ),
        NavigationRailDestination(
          selectedIcon: Image.asset(
            'assets/images/listSelected.png',
            scale: 3,
          ),
          icon: Image.asset(
            'assets/images/list.png',
            scale: 3,
          ),
          //selectedIcon: Icon(Icons.book),
          label: const Text(
            'List',
            style: TextStyle(color: Colors.white),
          ),
        ),
        NavigationRailDestination(
          selectedIcon: Image.asset(
            'assets/images/calendarSelectat.png',
            scale: 3,
          ),
          icon: Image.asset(
            'assets/images/calendar.png',
            scale: 3,
          ),
          //selectedIcon: Icon(Icons.star),
          label: const Text(
            'Calendar',
            style: TextStyle(color: Colors.white),
          ),
        ),
        NavigationRailDestination(
          icon: Image.asset(
            'assets/images/logout.png',
            scale: 5,
          ),
          //selectedIcon: Icon(Icons.star),
          label: const Text(
            'Logout',
            style: TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
