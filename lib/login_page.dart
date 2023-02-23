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
  final _formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Responsive(
        mobile: Scaffold(
          backgroundColor: const Color.fromARGB(255, 0, 0, 0),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 0, 0, 0),
            elevation: 0,
          ),
          body: SafeArea(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(45, 58, 90, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  height: 600,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 25),
                        Text("Login",
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 2,
                              fontSize: 32,
                            )),
                        const SizedBox(height: 25),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 60),
                          child: Text(
                              "Hey, enter your details to login to your account",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 20,
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 30),
                          child: TextField(
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(32, 42, 66, 1),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 59, 85, 255),
                                    width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 2.0),
                              ),
                              hintText: 'Email',
                              hintStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 20),
                          child: TextField(
                            obscureText: true,
                            style: const TextStyle(color: Colors.white),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromRGBO(32, 42, 66, 1),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 59, 85, 255),
                                    width: 2.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(
                                    color: Color.fromARGB(255, 0, 0, 0),
                                    width: 2.0),
                              ),
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
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
                  ),
                ),
              ),
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xFF405380)),
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Login',
                            style: GoogleFonts.roboto(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 34,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                              'Hey, enter your details to login to your account',
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                fontSize: 15,
                              )),
                          SizedBox(
                            height: 50,
                          ),
                          Form(
                              key: _formKey,
                              child: Column(children: [
                                Container(
                                  width: 400,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter some text';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 2, color: Color(0xFF202A42)),
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.4),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 400,
                                  child: TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your password';
                                      }
                                      return null;
                                    },
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10)),
                                        borderSide: BorderSide(
                                            width: 2, color: Color(0xFF202A42)),
                                      ),
                                      hintText: 'Password',
                                      hintStyle: TextStyle(
                                        color:
                                            Color.fromRGBO(255, 255, 255, 0.4),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ])),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF284EA6),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 40, vertical: 20),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                context.go('/');
                              }
                            },
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
                ),
              )),
        ));
  }
}
