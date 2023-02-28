import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 10),
          child: Icon(Icons.menu, size: 35),
        ),
      ],
      leading: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Image.asset(
          'assets/images/logo2.png',
          scale: 0.15,
        ),
      ),
      centerTitle: true,
      title: Text("MD Planner",
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 3,
            fontSize: 24,
          )),
      elevation: 0,
      backgroundColor: const Color.fromRGBO(51, 112, 255, 1),
    );
  }
}
