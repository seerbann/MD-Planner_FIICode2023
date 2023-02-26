import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class SigninpagemedicComponent extends StatefulWidget {
  const SigninpagemedicComponent({super.key});

  @override
  State<SigninpagemedicComponent> createState() =>
      _SigninpagemedicComponentState();
}

class _SigninpagemedicComponentState extends State<SigninpagemedicComponent> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset('assets/images/logo2.png'),
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
          child: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color.fromRGBO(122, 162, 255, 1),
            Color.fromRGBO(51, 112, 255, 1),
          ],
        )),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text("Bine ai venit",
                      style: GoogleFonts.outfit(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        //letterSpacing: 2,
                        fontSize: 18,
                      )),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.white,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 30, right: 30, top: 50, bottom: 30),
                    child: Column(
                      children: [
                        Container(
                          width: 500,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: const [
                                BoxShadow(
                                    color: Color.fromRGBO(122, 162, 255, 0.5),
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
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: const TextField(
                                  obscureText: true,
                                  decoration: InputDecoration(
                                      hintText: "Parola",
                                      hintStyle: TextStyle(color: Colors.grey),
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
                                      hintStyle: TextStyle(color: Colors.grey),
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
                                      hintStyle: TextStyle(color: Colors.grey),
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
                                      hintStyle: TextStyle(color: Colors.grey),
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
                                      hintStyle: TextStyle(color: Colors.grey),
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
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                              Container(
                                padding: const EdgeInsets.all(10),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText:
                                          "Poza ce certifica ca sunteti medic",
                                      hintStyle: TextStyle(color: Colors.grey),
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
                          onPressed: (() => context.push('/login')),
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
              ],
            ),
          ),
        ),
      )),
    );
  }
}
