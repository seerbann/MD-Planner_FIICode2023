import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_hub/Pages/listpage/components/lista_oameni.dart';
import 'package:health_hub/Pages/listpage/components/searchable_listview.dart';
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
        body: ListaOameni(),
      ),
      tablet: Scaffold(
        appBar: CustomAppBar(),
        body: Row(
          children: [
            Expanded(flex: 6, child: ListaOameni()),
            Expanded(
              flex: 9,
              child: Placeholder(),
            ),
          ],
        ),
      ),
      desktop: Row(
        children: [
          // Once our width is less then 1300 then it start showing errors
          // Now there is no error if our width is less then 1340
          Expanded(
            flex: _size.width > 1340 ? 1 : 2,
            child: Container(color: Colors.black),
          ),
          Expanded(
            flex: _size.width > 1340 ? 3 : 5,
            child: Searchable_Listview(),
          ),
          Expanded(
            flex: _size.width > 1340 ? 8 : 10,
            child: Placeholder(),
          ),
        ],
      ),
    );
  }
}
