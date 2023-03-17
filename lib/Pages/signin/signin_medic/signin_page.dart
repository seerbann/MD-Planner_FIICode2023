import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:searchfield/searchfield.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';

class SignInPage_medic extends StatefulWidget {
  const SignInPage_medic({super.key});

  @override
  State<SignInPage_medic> createState() => _SignInPage_medicState();
}

class _SignInPage_medicState extends State<SignInPage_medic> {
  late final TextEditingController _email;
  late final TextEditingController _password;
  late final TextEditingController _confirmPassword;
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _phone;
  late final TextEditingController _city;

  TextEditingController myController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _email = TextEditingController();
    _password = TextEditingController();
    _confirmPassword = TextEditingController();
    _firstName = TextEditingController();
    _lastName = TextEditingController();
    _phone = TextEditingController();
    _city = TextEditingController();
    myController.addListener(_printLatestValue);
    super.initState();
  }

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    _confirmPassword.dispose();
    _firstName.dispose();
    _lastName.dispose();
    _phone.dispose();
    _city.dispose();
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Textfield value: ${myController.text}");
  }

  bool passwordConfirmed() {
    if (_password.text.trim() == _confirmPassword.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  Future addUserDetails(String firstName, String lastName, String email,
      String phone, String city, List<String> pacienti) async {
    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'email': email,
      'phone': phone,
      'city': city,
      'isMedic': true,
      'fullName': '$firstName $lastName',
      'pacienti': pacienti
    });
  }

  /// document IDs
  List<String> docIDs = [];
  bool fetchOrase = false;
  late List<String> cities = [];

  /// get doc IDs
  Future getDocId() async {
    await FirebaseFirestore.instance.collection('cities').get().then(
          (snapshot) => snapshot.docs.forEach((document) {
            if (fetchOrase == false) {
              print(document.reference.id);
              Map<String, dynamic> data = document.data();
              cities.add(data['nume']);
              docIDs.add(document.reference.id);
            }
          }),
        );
    fetchOrase = true;
    cities.sort();
  }

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
          body: SingleChildScrollView(
            child: Center(
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
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
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
                            child: Text("Bine ai venit",
                                style: GoogleFonts.outfit(
                                  color:
                                      const Color.fromARGB(255, 255, 255, 255),
                                  //letterSpacing: 2,
                                  fontSize: 18,
                                )),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(
                        decoration: const BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                topRight: Radius.circular(60))),
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
                                child: Form(
                                  key: formKey,
                                  child: Column(
                                    children: <Widget>[
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: const BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    color: Color.fromRGBO(
                                                        240, 240, 240, 1)))),
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ai uitat sa scrii aici.';
                                            }
                                            return null;
                                          },
                                          controller: _firstName,
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
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ai uitat sa scrii aici.';
                                            }
                                            return null;
                                          },
                                          controller: _lastName,
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
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ai uitat sa scrii aici.';
                                            }
                                            return null;
                                          },
                                          controller: _email,
                                          enableSuggestions: false,
                                          autocorrect: false,
                                          keyboardType:
                                              TextInputType.emailAddress,
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
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ai uitat sa scrii aici.';
                                            }
                                            return null;
                                          },
                                          controller: _password,
                                          obscureText: true,
                                          enableSuggestions: false,
                                          autocorrect: false,
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
                                        child: TextFormField(
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ai uitat sa scrii aici.';
                                            }
                                            return null;
                                          },
                                          controller: _confirmPassword,
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
                                        child: TextFormField(
                                          keyboardType: TextInputType.number,
                                          validator: (value) {
                                            if (value!.isEmpty) {
                                              return "Ai uitat sa scrii aici.";
                                            } else if (!RegExp(
                                                    r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$')
                                                .hasMatch(value)) {
                                              return "Acest numar nu este valid.";
                                            }
                                          },
                                          controller: _phone,
                                          decoration: InputDecoration(
                                              hintText: "Telefon",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                      FutureBuilder(
                                        future: getDocId(),
                                        builder: (context, snapshot) {
                                          return SearchField(
                                            hasOverlay: false,
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Ai uitat sa alegi un oras.';
                                              }
                                            },
                                            hint: 'Oras',
                                            controller: _city,
                                            suggestions: cities
                                                .map((e) =>
                                                    SearchFieldListItem(e))
                                                .toList(),
                                          );
                                        },
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(10),
                                        child: const TextField(
                                          decoration: InputDecoration(
                                              hintText:
                                                  "Poza ce certifica ca sunteti medic",
                                              hintStyle:
                                                  TextStyle(color: Colors.grey),
                                              border: InputBorder.none),
                                        ),
                                      ),
                                    ],
                                  ),
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
                                onPressed: () async {
                                  // print(cities);

                                  /// TODO: Initializare la inceput + future builder
                                  if (passwordConfirmed() &&
                                      formKey.currentState!.validate()) {
                                    /// initialize firebase

                                    final email = _email.text;
                                    final password = _password.text;

                                    /// create user
                                    final UserCredential = await FirebaseAuth
                                        .instance
                                        .createUserWithEmailAndPassword(
                                            email: email, password: password);

                                    /// add user details
                                    addUserDetails(
                                        _firstName.text.trim(),
                                        _lastName.text.trim(),
                                        _email.text.trim(),
                                        _phone.text.trim(),
                                        _city.text.trim(), []);

                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text('Ai fost inregistrat.')));

                                    Navigator.pushNamed(context, '/login');
                                  }
                                },
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
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        tablet: Scaffold(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
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
                                        color:
                                            Color.fromRGBO(122, 162, 255, 0.5),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _firstName,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _lastName,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _email,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _password,
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _confirmPassword,
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
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Ai uitat sa scrii aici.";
                                          } else if (!RegExp(
                                                  r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$')
                                              .hasMatch(value)) {
                                            return "Acest numar nu este valid.";
                                          }
                                        },
                                        controller: _phone,
                                        decoration: InputDecoration(
                                            hintText: "Telefon",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: getDocId(),
                                      builder: (context, snapshot) {
                                        return SearchField(
                                          hasOverlay: false,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ai uitat sa alegi un oras.';
                                            }
                                          },
                                          hint: 'Oras',
                                          controller: _city,
                                          suggestions: cities
                                              .map(
                                                  (e) => SearchFieldListItem(e))
                                              .toList(),
                                        );
                                      },
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText:
                                                "Poza ce certifica ca sunteti medic",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
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
                              onPressed: () async {
                                // print(cities);

                                /// TODO: Initializare la inceput + future builder
                                if (passwordConfirmed() &&
                                    formKey.currentState!.validate()) {
                                  /// initialize firebase

                                  final email = _email.text;
                                  final password = _password.text;

                                  /// create user
                                  final UserCredential = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);

                                  /// add user details
                                  addUserDetails(
                                      _firstName.text.trim(),
                                      _lastName.text.trim(),
                                      _email.text.trim(),
                                      _phone.text.trim(),
                                      _city.text.trim(), []);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Ai fost inregistrat.')));

                                  Navigator.pushNamed(context, '/login');
                                }
                              },
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
                  ],
                ),
              ),
            ),
          )),
        ),
        //committ
        desktop: Scaffold(
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
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
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
                                        color:
                                            Color.fromRGBO(122, 162, 255, 0.5),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Form(
                                key: formKey,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _firstName,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _lastName,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _email,
                                        enableSuggestions: false,
                                        autocorrect: false,
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _password,
                                        obscureText: true,
                                        enableSuggestions: false,
                                        autocorrect: false,
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
                                      child: TextFormField(
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Ai uitat sa scrii aici.';
                                          }
                                          return null;
                                        },
                                        controller: _confirmPassword,
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
                                      child: TextFormField(
                                        keyboardType: TextInputType.number,
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Ai uitat sa scrii aici.";
                                          } else if (!RegExp(
                                                  r'^(\+4|)?(07[0-8]{1}[0-9]{1}|02[0-9]{2}|03[0-9]{2}){1}?(\s|\.|\-)?([0-9]{3}(\s|\.|\-|)){2}$')
                                              .hasMatch(value)) {
                                            return "Acest numar nu este valid.";
                                          }
                                        },
                                        controller: _phone,
                                        decoration: InputDecoration(
                                            hintText: "Telefon",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                    FutureBuilder(
                                      future: getDocId(),
                                      builder: (context, snapshot) {
                                        return SearchField(
                                          hasOverlay: false,
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Ai uitat sa alegi un oras.';
                                            }
                                          },
                                          hint: 'Oras',
                                          controller: _city,
                                          suggestions: cities
                                              .map(
                                                  (e) => SearchFieldListItem(e))
                                              .toList(),
                                        );
                                      },
                                    ),
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      child: const TextField(
                                        decoration: InputDecoration(
                                            hintText:
                                                "Poza ce certifica ca sunteti medic",
                                            hintStyle:
                                                TextStyle(color: Colors.grey),
                                            border: InputBorder.none),
                                      ),
                                    ),
                                  ],
                                ),
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
                              onPressed: () async {
                                // print(cities);

                                /// TODO: Initializare la inceput + future builder
                                if (passwordConfirmed() &&
                                    formKey.currentState!.validate()) {
                                  /// initialize firebase

                                  final email = _email.text;
                                  final password = _password.text;

                                  /// create user
                                  final UserCredential = await FirebaseAuth
                                      .instance
                                      .createUserWithEmailAndPassword(
                                          email: email, password: password);

                                  /// add user details
                                  addUserDetails(
                                      _firstName.text.trim(),
                                      _lastName.text.trim(),
                                      _email.text.trim(),
                                      _phone.text.trim(),
                                      _city.text.trim(), []);

                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content:
                                              Text('Ai fost inregistrat.')));

                                  Navigator.pushNamed(context, '/login');
                                }
                              },
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
                  ],
                ),
              ),
            ),
          )),
        ));
  }
}
