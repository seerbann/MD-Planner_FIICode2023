import 'package:flutter/material.dart';
import 'package:health_hub/Pages/userprofile/components/profile.dart';
import 'package:health_hub/commonComponents/navBar_desktop.dart';
import 'package:health_hub/responsive.dart';
import 'package:health_hub/commonComponents/appbar.dart';
import '../../commonComponents/navBar_desktop.dart';

class MainProfile extends StatefulWidget {
  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Responsive(
      // Let's work on our mobile part
      mobile: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: Profile(),
      ),
      tablet: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: Row(
          children: [
            Expanded(flex: 6, child: Profile()),
          ],
        ),
      ),
      desktop: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 1, child: CustomNavBar()),
            Expanded(flex: 15, child: Profile()),
          ],
        ),
      ),
    );
  }
}
