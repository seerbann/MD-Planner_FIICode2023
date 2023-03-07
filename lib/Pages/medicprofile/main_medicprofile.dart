import 'package:flutter/material.dart';
import 'package:health_hub/Pages/medicprofile/components/medicProfile.dart';
import 'package:health_hub/commonComponents/navBar_desktop.dart';
import 'package:health_hub/responsive.dart';
import 'package:health_hub/commonComponents/appbar.dart';

class MainMedicProfile extends StatefulWidget {
  @override
  State<MainMedicProfile> createState() => _MainMedicProfileState();
}

class _MainMedicProfileState extends State<MainMedicProfile> {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Responsive(
      // Let's work on our mobile part
      mobile: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: MedicProfile(),
      ),
      tablet: Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: Row(
          children: const [
            Expanded(flex: 6, child: MedicProfile()),
          ],
        ),
      ),
      desktop: SafeArea(
        child: Row(
          children: const [
            Expanded(flex: 1, child: CustomNavBar()),
            Expanded(flex: 15, child: MedicProfile()),
          ],
        ),
      ),
    );
  }
}
