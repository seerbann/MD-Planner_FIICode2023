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
                  color: const Color.fromRGBO(45, 58, 90, 1)),
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
                      const SizedBox(
                        height: 20,
                      ),
                      Text('Hey, introdu datele pentru a te putea autentifica.',
                          style: GoogleFonts.outfit(
                            color: Colors.white,
                            fontSize: 15,
                          )),
                      const SizedBox(
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
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(32, 42, 66, 1),
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
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 400,
                              child: TextFormField(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter some text';
                                  }
                                  return null;
                                },
                                style: const TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor:
                                      const Color.fromRGBO(32, 42, 66, 1),
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
                                    // fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ])),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'Remember me',
                            style: TextStyle(color: Colors.white),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF284EA6),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
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
    );
    ;
  }
}
