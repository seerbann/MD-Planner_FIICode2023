import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class firstPageComponent extends StatefulWidget {
  const firstPageComponent({super.key});

  @override
  State<firstPageComponent> createState() => _firstPageComponentState();
}

class _firstPageComponentState extends State<firstPageComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF4D4B4B),
            ),
            child: const Text('About'),
          ),
          //change
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF4D4B4B),
            ),
            child: const Text('Contact'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: Color(0xFF4D4B4B),
            ),
            child: const Text('Policy'),
          )
        ],
        backgroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
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
                      SizedBox(
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
                                  color:
                                      const Color(0xFF505050).withOpacity(0.8),
                                  letterSpacing: 1,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                )),
                          ),
                          SizedBox(
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
                              const SizedBox(width: 10),
                              Text("sau",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                    color:
                                        const Color.fromRGBO(186, 186, 186, 1),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2,
                                  )),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    side: const BorderSide(
                                        width: 5,
                                        color: Color.fromRGBO(67, 123, 255, 1)),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    backgroundColor: const Color.fromARGB(
                                        255, 255, 255, 255),
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
                        ],
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/logo2.png',
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
