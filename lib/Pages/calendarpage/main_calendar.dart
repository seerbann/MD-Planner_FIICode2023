import 'package:flutter/material.dart';
import 'package:health_hub/Pages/calendarpage/components/calendar.dart';
import 'package:health_hub/commonComponents/navBar_desktop.dart';
import 'package:health_hub/responsive.dart';
import 'package:health_hub/commonComponents/appbar.dart';

class CalendarPage extends StatefulWidget {
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Responsive(
      // Let's work on our mobile part
      mobile: const Scaffold(
        appBar: CustomAppBar(),
        drawer: CustomDrawer(),
        body: Calendar(),
      ),
      tablet: Scaffold(
        appBar: const CustomAppBar(),
        drawer: CustomDrawer(),
        body: Row(
          children: [
            const Expanded(flex: 6, child: Calendar()),
          ],
        ),
      ),
      desktop: SafeArea(
        child: Row(
          children: const [
            Expanded(flex: 1, child: CustomNavBar()),
            Expanded(flex: 15, child: Calendar()),
          ],
        ),
      ),
    );
  }
}
