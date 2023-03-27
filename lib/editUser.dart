import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/firebase_options.dart';
import 'package:health_hub/responsive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:textfield_search/textfield_search.dart';
import 'package:searchfield/searchfield.dart';

class Medic {
  final String firstName;
  final String lastName;
  final String city;
  final String email;
  final String phone;
  final String fullName;

  Medic({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.email,
    required this.phone,
    required this.fullName,
  });
}

class Update_user extends StatefulWidget {
  const Update_user(
      {Key? key,
      required this.prenume,
      required this.nume,
      required this.telefon,
      required this.oras})
      : super(key: key);
  final String prenume;
  final String nume;
  final String telefon;
  final String oras;
  @override
  State<Update_user> createState() => _Update_userState();
}

class _Update_userState extends State<Update_user> {
  late final TextEditingController _firstName;
  late final TextEditingController _lastName;
  late final TextEditingController _phone;
  late final TextEditingController _city;

  var label = "Some Label";
  var dummyList = ['Item 1', 'Item 2', 'Item 3', 'Item 4', 'Item 5'];

  TextEditingController myController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    print(widget.nume);
    print(widget.prenume);
    print(widget.oras);
    print(widget.telefon);
    _firstName = TextEditingController();
    _firstName.text = widget.prenume;
    _lastName = TextEditingController();
    _lastName.text = widget.nume;
    _phone = TextEditingController();
    _phone.text = widget.telefon;
    _city = TextEditingController();
    _city.text = widget.oras;
    myController.addListener(_printLatestValue);
    super.initState();
  }

  @override
  void dispose() {
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

  Future<String> getMedicId(String numeMedic) async {
    String idDoctor = "aaaa";
    print(idDoctor);
    await FirebaseFirestore.instance
        .collection('users')
        .where('fullName', isEqualTo: numeMedic)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              idDoctor = document.id;
            }));
    print(idDoctor);
    return idDoctor;
  }

  Future addUserToMedic(String numePacient, String numeMedic) async {
    var list = [numePacient];
    var idDoctor = await getMedicId(numeMedic);
    FirebaseFirestore.instance
        .collection('users')
        .doc(idDoctor)
        .update({"pacienti": FieldValue.arrayUnion(list)});
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
              //print(document.reference.id);
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
                            child: Text("Modifica datele",
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
                          // Padding(
                          //   padding: const EdgeInsets.only(left: 30),
                          //   child: Text("Ai fost invitat de catre \$medic",
                          //       style: GoogleFonts.outfit(
                          //         color:
                          //             const Color.fromARGB(255, 255, 255, 255),
                          //         //letterSpacing: 2,
                          //         fontSize: 18,
                          //       )),
                          // ),
                        ],
                      ),
                      const SizedBox(height: 40),
                      Container(
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
                                  child: Form(
                                    key: formKey,
                                    child: Column(
                                      //form_mobile
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
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
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
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
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
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
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
                                          child: FutureBuilder(
                                            future: getDocId(),
                                            builder: (context, snapshot) {
                                              return SearchField(
                                                searchInputDecoration:
                                                    InputDecoration(
                                                        border:
                                                            InputBorder.none),
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
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                  ),
                                  onPressed: () async {
                                    await ModificaDate(
                                        widget.prenume + ' ' + widget.nume);
                                    Navigator.pop(context);

                                    /// Navigator
                                  },
                                  child: Text('Modifica datele',
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
                      child: Text("Modifica datele",
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    const SizedBox(height: 5),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30),
                    //   child: Text("Ai fost invitat de catre numemedic",
                    //       style: GoogleFonts.outfit(
                    //         color: const Color.fromARGB(255, 255, 255, 255),
                    //         //letterSpacing: 2,
                    //         fontSize: 18,
                    //       )),
                    // ),
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
                                  //form_mobile
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
                                            return 'Please enter some text';
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
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: FutureBuilder(
                                        future: getDocId(),
                                        builder: (context, snapshot) {
                                          return SearchField(
                                            searchInputDecoration:
                                                InputDecoration(
                                                    border: InputBorder.none),
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
                                await ModificaDate(
                                    widget.prenume + ' ' + widget.nume);
                                Navigator.pop(context);
                              },
                              child: Text('Modifica',
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
                      child: Text("Modifica datele",
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            letterSpacing: 2,
                            fontSize: 30,
                            fontWeight: FontWeight.w500,
                          )),
                    ),
                    const SizedBox(height: 5),
                    // Padding(
                    //   padding: const EdgeInsets.only(left: 30),
                    //   child: Text("Ai fost invitat de catre numemedic",
                    //       style: GoogleFonts.outfit(
                    //         color: const Color.fromARGB(255, 255, 255, 255),
                    //         //letterSpacing: 2,
                    //         fontSize: 18,
                    //       )),
                    // ),
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
                                  //form_mobile
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
                                            return 'Please enter some text';
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
                                    Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)))),
                                      child: FutureBuilder(
                                        future: getDocId(),
                                        builder: (context, snapshot) {
                                          return SearchField(
                                            searchInputDecoration:
                                                InputDecoration(
                                                    border: InputBorder.none),
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
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 40,
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
                                await ModificaDate(
                                    widget.prenume + ' ' + widget.nume);
                                Navigator.pop(context);
                              },
                              child: Text('Modifica',
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

  Future<String> getUserId(String numeMedic) async {
    String idDoctor = "aaaa";
    print(idDoctor);
    await FirebaseFirestore.instance
        .collection('users')
        .where('fullName', isEqualTo: numeMedic)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              idDoctor = document.id;
            }));
    print(idDoctor);
    return idDoctor;
  }

  Future ModificaDate(String fullName) async {
    //var list = [numePacient];
    print(fullName);

    String prenume = _firstName.text.trim();
    print(prenume);
    String nume = _lastName.text.trim();
    String telefon = _phone.text.trim();
    String oras = _city.text.trim();

    var idDoctorVechi = await getUserId(fullName);
    FirebaseFirestore.instance.collection('users').doc(idDoctorVechi).update(
      {
        "fullName": prenume + " " + nume,
        "first name": prenume,
        "last name": nume,
        "phone": telefon,
        "city": oras
      },
    );
  }
}
