import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_hub/Pages/listpage/lista_oameni.dart';
import 'package:health_hub/responsive.dart';

class MainListPage extends StatefulWidget {
  @override
  State<MainListPage> createState() => _MainListPageState();
}

class _MainListPageState extends State<MainListPage> {
  @override
  Widget build(BuildContext context) {
    // It provide us the width and height
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        // Let's work on our mobile part
        mobile: ListaOameni(),
        tablet: Row(
          children: [
            Expanded(
              flex: 6,
              child: ListaOameni(),
            ),
            Expanded(
              flex: 9,
              child: Placeholder(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            // Once our width is less then 1300 then it start showing errors
            // Now there is no error if our width is less then 1340
            Expanded(
              flex: _size.width > 1340 ? 2 : 4,
              child: Placeholder(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 3 : 5,
              child: ListaOameni(),
            ),
            Expanded(
              flex: _size.width > 1340 ? 8 : 10,
              child: Placeholder(),
            ),
          ],
        ),
      ),
    );
  }
}
