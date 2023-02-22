import 'package:flutter/material.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topCenter, // defult topLeft
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: RadialGradient(
                                center: Alignment.topLeft,
                                radius: 0.8,
                                colors: [
                              Color.fromRGBO(51, 112, 255, 0.75),
                              Color.fromARGB(255, 0, 0, 0),
                            ],
                                stops: [
                              0.1,
                              1,
                            ])),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                            gradient: RadialGradient(
                                center: Alignment.topRight,
                                radius: 0.8,
                                colors: [
                              Color.fromRGBO(51, 112, 255, 0.75),
                              Color.fromARGB(255, 0, 0, 0),
                            ],
                                stops: [
                              0.1,
                              1,
                            ])),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 200,
                    ),
                    Image.asset(
                      'assets/images/logo2.png',
                      scale: 2.5,
                    ),
                    Text("HealthFinder",
                        style: GoogleFonts.inknutAntiqua(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 32,
                        )),
                    Text("Stay healthy.\nStay connected.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.outfit(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 16,
                        )),
                    const SizedBox(
                      height: 200,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            const Color.fromRGBO(51, 112, 255, 0.75),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 85, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: (() => context.push('/')),
                      child: Text('Login',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 26,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        tablet: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
          ),
        ),
        //committ
        desktop: Scaffold(
          appBar: AppBar(actions: <Widget>[
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('About'),
            ),
            //change
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('Contact'),
            ),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              child: const Text('Policy'),
            )
          ], backgroundColor: Colors.black),
          body: Container(
            color: Colors.black,
            child: Center(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 500,
                            child: const Text(
                              "MD Planner este facut pentru a ajuta oameni de pretutindeni sa isi menegerieze programarile la medic intr-o maniera cat mai usoara. Cu MD Planner poti face programari la medicul de familie si sa primesti remindere pentru a nu uita de acestea. Totodata, aplicatia noastra iti tine minte si istoricul medical. ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 30),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Image.asset('assets/images/bigLogo.png'))
                  ]),
            ),
          ),
        ));
  }
}
