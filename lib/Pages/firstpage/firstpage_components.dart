import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class FirstpageComponent extends StatefulWidget {
  const FirstpageComponent({super.key});

  @override
  State<FirstpageComponent> createState() => _FirstpageComponentState();
}

class _FirstpageComponentState extends State<FirstpageComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF4D4B4B),
            ),
            child: const Text('About'),
          ),
          //change
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF4D4B4B),
            ),
            child: const Text('Contact'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF4D4B4B),
            ),
            child: const Text('Policy'),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("MD Planner",
                            style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(40, 78, 166, 1),
                              letterSpacing: 5,
                              fontSize: 50,
                              fontWeight: FontWeight.w500,
                            )),
                        Text("Stay healthy.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              letterSpacing: 1,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                        Text("Stay connected.",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.roboto(
                              color: const Color.fromRGBO(0, 0, 0, 1),
                              letterSpacing: 1,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            )),
                        const SizedBox(
                          height: 100,
                        ),
                        Column(
                          children: [
                            Container(
                              width: 545,
                              child: Text(
                                  "MD Planner este facut pentru a ajuta oameni de pretutindeni sa isi menegerieze programarile la medic intr-o maniera cat mai usoara.",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    color: const Color(0xFF505050)
                                        .withOpacity(0.8),
                                    letterSpacing: 1,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                        const Color.fromRGBO(67, 123, 255, 1),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 25, vertical: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
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
                                const SizedBox(width: 10),
                                Text("sau",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.roboto(
                                      color: const Color.fromRGBO(
                                          186, 186, 186, 1),
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                    )),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      side: const BorderSide(
                                          width: 5,
                                          color:
                                              Color.fromRGBO(67, 123, 255, 1)),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      backgroundColor: const Color.fromARGB(
                                          255, 255, 255, 255),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15, horizontal: 30)),
                                  onPressed: () {
                                    return context.push('/signin/medic');
                                  },
                                  child: Text('Inregistreaza-te\nca medic',
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.roboto(
                                        fontWeight: FontWeight.bold,
                                        color:
                                            const Color.fromARGB(255, 0, 0, 0),
                                        fontSize: 16,
                                        letterSpacing: 1,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    Image.asset(
                      'assets/images/logo2.png',
                    ),
                  ],
                ),
                SizedBox(
                  height: 150,
                ),
                Row(
                  children: [
                    const Spacer(
                      flex: 1,
                    ),
                    Expanded(
                      flex: 6,
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(color: const Color(0xFF437BFF)),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(10)),
                            color: const Color(0xFF437BFF)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/check.png',
                                    scale: 8,
                                  ),
                                  Container(
                                    width: 200,
                                    child: Column(
                                      children: [
                                        Text('Programare online',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFFFFFFFF),
                                              fontSize: 20,
                                            )),
                                        Text(
                                            'Un sistem simpu de programari pe care oricine il poate folosi',
                                            textAlign: TextAlign.center,
                                            style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.bold,
                                              color: const Color(0xFFFFFFFF)
                                                  .withOpacity(0.5),
                                              fontSize: 15,
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/check.png',
                                  scale: 8,
                                ),
                                Container(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Text('Istoric medical',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 20,
                                          )),
                                      Text('Retinerea fiecarei vizite medicale',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFFFFFFFF)
                                                .withOpacity(0.5),
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/check.png',
                                  scale: 8,
                                ),
                                Container(
                                  width: 200,
                                  child: Column(
                                    children: [
                                      Text('Pacienti & Medici',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFFFFFFFF),
                                            fontSize: 20,
                                          )),
                                      Text(
                                          'Atat medicii cat si pacientii pot folosi aplicatia',
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.roboto(
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xFFFFFFFF)
                                                .withOpacity(0.5),
                                            fontSize: 15,
                                          )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(
                      flex: 1,
                    )
                  ],
                ),
              ]),
        ),
      ),
    );
  }
}
