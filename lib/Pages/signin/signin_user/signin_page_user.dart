import 'package:flutter/material.dart';
import 'package:health_hub/Pages/signin/signin_medic/medic_components.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class SignInPage_user extends StatefulWidget {
  const SignInPage_user({super.key});

  @override
  State<SignInPage_user> createState() => _SignInPage_userState();
}

class _SignInPage_userState extends State<SignInPage_user> {
  @override
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
                          child: Text("Inregistrare",
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
                          child: Text("Ai fost invitat de catre \$medic",
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
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText: "Prenume",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText: "Nume",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText: "Email",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: const TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            hintText: "Parola",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: const TextField(
                                        obscureText: true,
                                        decoration: InputDecoration(
                                            hintText: "Confirma Parola",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText: "Telefon",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText: "Oras",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText: "Cod Numeric Personal",
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
                                child: Text('Inregistrare',
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
        tablet: signinpagemedicComponent(),
        //committ
        desktop: signinpagemedicComponent());
  }
}
