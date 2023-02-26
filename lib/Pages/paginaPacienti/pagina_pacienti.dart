import 'package:flutter/material.dart';
import 'package:health_hub/Pages/login/login_componenets.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class PaginaPacienti extends StatefulWidget {
  const PaginaPacienti({super.key});

  @override
  State<PaginaPacienti> createState() => _PaginaPacientiState();
}

class _PaginaPacientiState extends State<PaginaPacienti> {
  @override
  //variabiles

  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          appBar: AppBar(
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
          ),
          body: Center(
            child: Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Center(
                child: Column(
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
                            SizedBox(
                              height: 50,
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Text("Buna ziua, Dr. \$nume",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.outfit(
                                        color: const Color.fromRGBO(
                                            40, 78, 166, 1),
                                        letterSpacing: 1,
                                        fontSize: 26,
                                        fontWeight: FontWeight.bold,
                                      )),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                child: Column(
                                  children: <Widget>[
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30),
                                          child: Text("Pacienti",
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.roboto(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  letterSpacing: 1,
                                                  fontSize: 28,
                                                  fontWeight: FontWeight.w500)),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          boxShadow: const [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    122, 162, 255, 0.5),
                                                blurRadius: 20,
                                                offset: Offset(0, 10))
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                          "Datele au fost trimise spre verificare",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                            letterSpacing: 1,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Text(
                                          "In maxim 3 zile lucratoare informatiile vor fi verificate de catre administratori si veti primi un email cand contul va fi creat",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.outfit(
                                            color: const Color.fromRGBO(
                                                0, 0, 0, 1),
                                            letterSpacing: 1,
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
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        tablet: const loginComponent(),
        //committ
        desktop: const loginComponent());
  }
}
