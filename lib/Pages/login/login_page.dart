import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'login_componenets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  //variabiles

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("Autentificare",
                              style: GoogleFonts.roboto(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                letterSpacing: 2,
                                fontSize: 30,
                                fontWeight: FontWeight.w500,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 30),
                          child: Text("Bine ai revenit",
                              style: GoogleFonts.outfit(
                                color: const Color.fromARGB(255, 255, 255, 255),
                                //letterSpacing: 2,
                                fontSize: 18,
                              )),
                        ),
                      ],
                    ),
                    const SizedBox(height: 40),
                    Expanded(
                        child: Container(
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(60),
                              topRight: Radius.circular(60))),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
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
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: TextField(
                                        controller: _emailController,
                                        decoration: InputDecoration(
                                            hintText: "Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: TextField(
                                        controller: _passwordController,
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            hintText: "Parola",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              const Text(
                                "Ai uitat parola?",
                                style: TextStyle(color: Colors.grey),
                              ),
                              const SizedBox(
                                height: 40,
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
                                onPressed: (() => signIn()),
                                child: Text('Autentificare',
                                    style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      letterSpacing: 2,
                                      fontSize: 20,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ))
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
