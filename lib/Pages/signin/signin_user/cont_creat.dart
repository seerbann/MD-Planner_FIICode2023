import 'package:flutter/material.dart';

import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class ContCreat extends StatefulWidget {
  const ContCreat({super.key});

  @override
  State<ContCreat> createState() => _ContCreatState();
}

class _ContCreatState extends State<ContCreat> {
  @override
  //variabiles

  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(51, 122, 255, 1),
                    Color.fromRGBO(122, 162, 255, 1),
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color.fromRGBO(51, 122, 255, 1),
                    Color.fromRGBO(122, 162, 255, 1),
                  ])),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60),
                              )),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 80,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              122, 162, 255, 0.5),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Contul a fost creat cu succes",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing: 1,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Acum te poti autentifica",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.outfit(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing: 1,
                                      fontSize: 20,
                                    )),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(67, 123, 255, 1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onPressed: (() => context.push('/login')),
                                child: Text('Autentificare',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    )),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        tablet: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(51, 122, 255, 1),
                    Color.fromRGBO(122, 162, 255, 1),
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color.fromRGBO(51, 122, 255, 1),
                    Color.fromRGBO(122, 162, 255, 1),
                  ])),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 500,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60),
                              )),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 80,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              122, 162, 255, 0.5),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Contul a fost creat cu succes",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing: 1,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Acum te poti autentifica",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.outfit(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing: 1,
                                      fontSize: 20,
                                    )),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(67, 123, 255, 1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onPressed: (() => context.push('/login')),
                                child: Text('Autentificare',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    )),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        //committ
        desktop: Scaffold(
          appBar: AppBar(
            elevation: 0,
            flexibleSpace: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color.fromRGBO(51, 122, 255, 1),
                    Color.fromRGBO(122, 162, 255, 1),
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child: Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Color.fromRGBO(51, 122, 255, 1),
                    Color.fromRGBO(122, 162, 255, 1),
                  ])),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Container(
                          width: 500,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60),
                                bottomLeft: Radius.circular(60),
                                bottomRight: Radius.circular(60),
                              )),
                          child: Column(
                            children: <Widget>[
                              const SizedBox(
                                height: 80,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Color.fromRGBO(
                                              122, 162, 255, 0.5),
                                          blurRadius: 20,
                                          offset: Offset(0, 10))
                                    ]),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Contul a fost creat cu succes",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing: 1,
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text("Acum te poti autentifica",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.outfit(
                                      color: const Color.fromRGBO(0, 0, 0, 1),
                                      letterSpacing: 1,
                                      fontSize: 20,
                                    )),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromRGBO(67, 123, 255, 1),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25, vertical: 20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onPressed: (() => context.push('/login')),
                                child: Text('Autentificare',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    )),
                              ),
                              const SizedBox(
                                height: 80,
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
