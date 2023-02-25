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
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          body: SingleChildScrollView(
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/images/topRight.png',
                          scale: 0.75,
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Image.asset(
                      'assets/images/logo2.png',
                      scale: 3.75,
                    ),
                    const SizedBox(height: 25),
                    Text("MD Planner",
                        style: GoogleFonts.roboto(
                          color: const Color.fromRGBO(40, 78, 166, 1),
                          letterSpacing: 5,
                          fontSize: 38,
                          fontWeight: FontWeight.w500,
                        )),
                    const SizedBox(height: 35),
                    Text("Stay healthy.\nStay connected.",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: const Color.fromRGBO(0, 0, 0, 1),
                          letterSpacing: 1,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        )),
                    const SizedBox(height: 75),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(67, 123, 255, 1),
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
                    const SizedBox(height: 10),
                    Text("sau",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.roboto(
                          color: const Color.fromRGBO(186, 186, 186, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2,
                        )),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          side: const BorderSide(
                              width: 5, color: Color.fromRGBO(67, 123, 255, 1)),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50)),
                          backgroundColor:
                              const Color.fromARGB(255, 255, 255, 255),
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 30)),
                      onPressed: () {
                        return context.push('/login');
                      },
                      child: Text('Inregistreaza-te\nca medic',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: const Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                            letterSpacing: 1,
                          )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        tablet: Scaffold(
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/logo2.png',
                              scale: 2,
                            ),
                            Text("MD Planner",
                                style: GoogleFonts.audiowide(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 32,
                                )),
                            Text("Stay healthy.\nStay connected.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.electrolize(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                          ],
                        )),
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 600,
                            child: Text(
                              "MD Planner este facut pentru a ajuta oameni de pretutindeni sa isi menegerieze programarile la medic intr-o maniera cat mai usoara. Cu MD Planner poti face programari la medicul de familie si sa primesti remindere pentru a nu uita de acestea. Totodata, aplicatia noastra iti tine minte si istoricul medical. ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF284EA6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 50, vertical: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            onPressed: (() => context.go('/login')),
                            child: Text('Login',
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 24,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
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
                            width: 600,
                            child: Text(
                              "MD Planner este facut pentru a ajuta oameni de pretutindeni sa isi menegerieze programarile la medic intr-o maniera cat mai usoara. Cu MD Planner poti face programari la medicul de familie si sa primesti remindere pentru a nu uita de acestea. Totodata, aplicatia noastra iti tine minte si istoricul medical. ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF284EA6),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 70, vertical: 30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onPressed: (() => context.go('/login')),
                                child: Text('Login',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 24,
                                    )),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Text('sau',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 24,
                                  )),
                              const SizedBox(
                                width: 5,
                              ),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xFF284EA6),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 30),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(50)),
                                ),
                                onPressed: (() => context.go('/signin/medic')),
                                child: Text('Inregistreaza-te ca medic',
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: 24,
                                    )),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                        flex: 5,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/logo2.png'),
                            Text("MD Planner",
                                style: GoogleFonts.audiowide(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  letterSpacing: 2,
                                  fontSize: 32,
                                )),
                            Text("Stay healthy.\nStay connected.",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.electrolize(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 20,
                                )),
                          ],
                        ))
                  ]),
            ),
          ),
        ));
  }
}
