import 'package:flutter/material.dart';
import 'package:health_hub/Pages/login/login_componenets.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ListaOameni extends StatefulWidget {
  const ListaOameni({super.key});

  @override
  State<ListaOameni> createState() => _ListaOameniState();
}

class _ListaOameniState extends State<ListaOameni> {
  @override
  //variabiles
  String searchValue = '';
  final List<String> _suggestions = [
    'Albu Dorian',
    'Deaconu Aurel',
    'Albu Dorian',
    'Deaconu Aurel',
    'Brazil',
    'German',
    'Madagascar',
    'Mozambique',
    'Portugal',
    'Zambia'
  ];
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Buna ziua, Dr. \$nume",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                color: const Color.fromRGBO(40, 78, 166, 1),
                                letterSpacing: 1,
                                fontSize: 26,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  Color.fromRGBO(51, 122, 255, 1),
                                  Color.fromRGBO(122, 162, 255, 1),
                                ],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                topRight: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                                bottomRight: Radius.circular(15),
                              )),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 30),
                                      child: Text("Pacienti",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                              color: const Color.fromARGB(
                                                  255, 255, 255, 255),
                                              letterSpacing: 1,
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 30),
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color.fromRGBO(
                                              41, 90, 204, 1),
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 0),
                                        ),
                                        onPressed: () {},
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Text("Adauga",
                                                textAlign: TextAlign.center,
                                                style: GoogleFonts.roboto(
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    letterSpacing: 1,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight
                                                        .w500)), // <-- Text
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Image.asset(
                                              'assets/images/addUser.png',
                                              scale: 7,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    height: 44,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromRGBO(151, 182, 255, 1),
                                          Color.fromRGBO(125, 164, 255, 1),
                                        ],
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            width: 0.5, color: Colors.white),
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        minimumSize: const Size.fromHeight(50),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/user.png',
                                            scale: 5,
                                          ),

                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text("Albu Dorian",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.outfit(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  //letterSpacing: 1,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight
                                                      .w500)), // <-- Text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    height: 44,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromRGBO(100, 146, 255, 1),
                                          Color.fromRGBO(125, 164, 255, 1),
                                        ],
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            width: 0.3, color: Colors.white),
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        minimumSize: const Size.fromHeight(50),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/user.png',
                                            scale: 5,
                                          ),

                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text("Deaconu Aurel",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.outfit(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  //letterSpacing: 1,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight
                                                      .w500)), // <-- Text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    height: 44,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromRGBO(151, 182, 255, 1),
                                          Color.fromRGBO(125, 164, 255, 1),
                                        ],
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            width: 0.5, color: Colors.white),
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        minimumSize: const Size.fromHeight(50),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/user.png',
                                            scale: 5,
                                          ),

                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text("Albu Dorian",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.outfit(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  //letterSpacing: 1,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight
                                                      .w500)), // <-- Text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30),
                                  child: Container(
                                    height: 44,
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black.withOpacity(0.2),
                                          spreadRadius: 4,
                                          blurRadius: 10,
                                          offset: Offset(0, 3),
                                        )
                                      ],
                                      gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          Color.fromRGBO(100, 146, 255, 1),
                                          Color.fromRGBO(125, 164, 255, 1),
                                        ],
                                      ),
                                    ),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        side: BorderSide(
                                            width: 0.3, color: Colors.white),
                                        backgroundColor: Colors.transparent,
                                        shadowColor: Colors.transparent,
                                        minimumSize: const Size.fromHeight(50),
                                      ),
                                      onPressed: () {},
                                      child: Row(
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Image.asset(
                                            'assets/images/user.png',
                                            scale: 5,
                                          ),

                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text("Deaconu Aurel",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.outfit(
                                                  color: Color.fromARGB(
                                                      255, 0, 0, 0),
                                                  //letterSpacing: 1,
                                                  fontSize: 20,
                                                  fontWeight: FontWeight
                                                      .w500)), // <-- Text
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 50,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Align(
                      alignment: FractionalOffset.bottomCenter,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/Vector 2.png',
                            ),
                          ),
                        ),
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}
