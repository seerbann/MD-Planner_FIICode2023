import 'package:flutter/material.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 0, 0),
            elevation: 0,
          ),
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
                    SizedBox(height: 25),
                    Text("MD Planner",
                        style: GoogleFonts.audiowide(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                          fontSize: 32,
                        )),
                    const SizedBox(height: 25),
                    Text("Stay healthy.\nStay connected...",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.electrolize(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        )),
                    const SizedBox(
                      height: 100,
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
                child: Container(
                  color: Colors.blue,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Login'),
                        Text(
                            'Hey, enter your details to login to your account'),
                        Form(
                            child: Column(children: [
                          Text('Email'),
                          Text('Password'),
                        ])),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF284EA6),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
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
                      ]),
                ),
              )),
        ));
  }
}
