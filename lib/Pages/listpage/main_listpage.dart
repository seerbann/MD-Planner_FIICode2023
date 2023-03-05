import 'package:flutter/material.dart';

import 'package:health_hub/Pages/listpage/components/ListAndPacientDetails.dart';
import 'package:health_hub/commonComponents/navBar_desktop.dart';
import 'package:health_hub/responsive.dart';
import 'components/appbar.dart';
import '../../commonComponents/navBar_desktop.dart';

class MainListPage extends StatefulWidget {
  @override
  State<MainListPage> createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Responsive(
      // Let's work on our mobile part
      mobile: Scaffold(
        appBar: CustomAppBar(),
        body: ListAndPacientDetails(),
      ),
      tablet: Scaffold(
        appBar: CustomAppBar(),
        body: Row(
          children: [
            Expanded(flex: 6, child: ListAndPacientDetails()),
          ],
        ),
      ),
      desktop: SafeArea(
        child: Row(
          children: [
            Expanded(flex: 1, child: CustomNavBar()),
            Expanded(flex: 15, child: ListAndPacientDetails()),
          ],
        ),
      ),
    );
  }
}
