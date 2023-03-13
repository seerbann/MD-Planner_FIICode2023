import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text("MD Planner",
          style: GoogleFonts.roboto(
            color: const Color.fromARGB(255, 255, 255, 255),
            letterSpacing: 3,
            fontSize: 24,
          )),
      elevation: 0,
      backgroundColor: Colors.black,
    );
  }
}

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key});

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.black,
      child: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.only(top: 50),
              child: Column(
                children: <Widget>[
                  DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Image.asset(
                        'assets/images/logo2.png',
                        scale: 6,
                      )),
                  ListTile(
                      leading: Image.asset(
                        'assets/images/user.png',
                        scale: 5,
                      ),
                      title: Text(
                        "Profil",
                        style: TextStyle(color: Colors.white),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          context.go('/medicprofile');
                        });
                      }),

                  ListTile(
                      leading: Image.asset(
                        'assets/images/list.png',
                        scale: 3,
                      ),
                      title:
                          Text("Lista", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          context.go('/list');
                        });
                      }),

                  ListTile(
                      leading: Image.asset(
                        'assets/images/calendar.png',
                        scale: 3,
                      ),
                      title: Text("Calendar",
                          style: TextStyle(color: Colors.white)),
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          context.go('/calendar');
                        });
                      }),

                  ListTile(
                      leading: Image.asset(
                        'assets/images/logout.png',
                        scale: 5,
                      ),
                      title:
                          Text("Logout", style: TextStyle(color: Colors.white)),
                      onTap: () {
                        setState(() {
                          FirebaseAuth.instance.signOut();
                          Navigator.pushNamed(context, '/');
                        });
                      })

                  //add more drawer menu here
                ],
              ))),
    );
  }
}
