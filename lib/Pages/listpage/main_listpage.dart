import 'package:flutter/material.dart';

import 'package:health_hub/Pages/listpage/components/ListAndPacientDetails.dart';
import 'package:health_hub/responsive.dart';
import 'components/appbar.dart';

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
      desktop: Row(
        children: [
          // Once our width is less then 1300 then it start showing errors
          // Now there is no error if our width is less then 1340
          Expanded(
            flex: 1,
            child: Container(color: Colors.black),
          ),
          Expanded(
            flex: 12,
            child: ListAndPacientDetails(),
          ),
        ],
      ),
    );
  }
}
