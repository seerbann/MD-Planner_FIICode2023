import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
          backgroundColor: Color.fromARGB(255, 0, 0, 0),
          body: SafeArea(
            child: Stack(
              alignment: Alignment.topCenter, // defult topLeft
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
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
                        decoration: BoxDecoration(
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
                    SizedBox(
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
                    SizedBox(
                      height: 200,
                    ),
                    ElevatedButton(
                      child: Text('Login',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 26,
                          )),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromRGBO(51, 112, 255, 0.75),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 85, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: (() => context.push('/')),
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
              child: const Text('About'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
            //change
            TextButton(
              onPressed: () {},
              child: const Text('Contact'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text('Policy'),
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
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
                          Container(
                            width: 500,
                            child: Text(
                              "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and ",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Login',
                              style: TextStyle(fontSize: 30),
                            ),
                            style: TextButton.styleFrom(
                              foregroundColor: Colors.white,
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
