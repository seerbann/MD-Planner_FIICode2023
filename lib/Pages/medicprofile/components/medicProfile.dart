import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_hub/commonComponents/vectors/vector_top_right.dart';
import 'package:health_hub/dynamic_link.dart';
import 'package:share_plus/share_plus.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../commonComponents/vectors/vector_center_right.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class MedicProfile extends StatefulWidget {
  const MedicProfile({super.key});

  @override
  State<MedicProfile> createState() => _MedicProfileState();
}

CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime _focusedDay = DateTime.now();
DateTime? _selectedDay;
final user = FirebaseAuth.instance.currentUser;

class _MedicProfileState extends State<MedicProfile> {
  FirebaseAuth auth = FirebaseAuth.instance;
  String fullNameMedic = "";
  String phoneMedic = "";
  String cityMedic = "";
  String emailMedic = "";

  Future getInfoMedic() async {
    bool procesTerminat = false;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            //print(document.reference.id);
            Map<String, dynamic> data = document.data();
            String firstname = data['first name'];
            String lastname = data['last name'];
            cityMedic = data['city'];
            emailMedic = data['email'];
            phoneMedic = data['phone'];
            procesTerminat = true;
            fullNameMedic = 'Dr. ' + firstname + ' ' + lastname;
          }),
        );
    return procesTerminat;
  }

  void initState() {
    super.initState();
    getInfoMedic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment(1.0, -1.1),
              child: RotatedBox(
                quarterTurns: 3,
                child: ClipPath(
                  clipper: BlueVector(),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [
                        Color.fromRGBO(51, 112, 255, 1).withOpacity(0.7),
                        Color.fromRGBO(122, 162, 255, 1).withOpacity(0.7),
                      ],
                    )),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0.3, -0.2),
              child: ClipPath(
                clipper: BlueVector_center(),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft,
                    colors: [
                      Color.fromRGBO(51, 112, 255, 1).withOpacity(0.7),
                      Color.fromRGBO(122, 162, 255, 1).withOpacity(0.7),
                    ],
                  )),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFE2E3E3), width: 5),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/defaultUser.png'),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Column(
                                        children: [
                                          FutureBuilder(
                                            future: getInfoMedic(),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return Text(fullNameMedic,
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20,
                                                        color: Colors.black));
                                              } else {
                                                return Center(
                                                    child:
                                                        CircularProgressIndicator());
                                              }
                                            },
                                          ),
                                          Text('Orar',
                                              style: TextStyle(
                                                  fontFamily: 'Roboto',
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  color: Colors.black
                                                      .withOpacity(0.7)))
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          width: 350,
                          height: 150,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Color(0xFFE2E3E3), width: 5),
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Consultatii recente',
                              style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 25,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: const Text('Pacienti')),
                            ),
                            Container(
                              height: 50,
                              width: 90,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.grey, width: 1),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                              ),
                              child: Center(child: const Text('Asistenti')),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                            width: 360,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: Color(0xFFE2E3E3), width: 5),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Email',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Outfit',
                                              color: Colors.black),
                                        ),
                                        FutureBuilder(
                                          future: getInfoMedic(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                emailMedic,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Outfit',
                                                    color: Colors.black
                                                        .withOpacity(0.7)),
                                              );
                                            } else {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Telefon',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Outfit',
                                              color: Colors.black),
                                        ),
                                        FutureBuilder(
                                          future: getInfoMedic(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                phoneMedic,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Outfit',
                                                    color: Colors.black
                                                        .withOpacity(0.7)),
                                              );
                                            } else {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Oras',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Outfit',
                                              color: Colors.black),
                                        ),
                                        FutureBuilder(
                                          future: getInfoMedic(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                cityMedic,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontFamily: 'Outfit',
                                                    color: Colors.black
                                                        .withOpacity(0.7)),
                                              );
                                            } else {
                                              return Center(
                                                  child:
                                                      CircularProgressIndicator());
                                            }
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF323741),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 45, vertical: 25),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                          ),
                          onPressed: () async {
                            if (!kIsWeb) {
                              DynamicLinkProvider()
                                  .createLink(fullNameMedic)
                                  .then((value) {
                                Share.share(value);
                              });
                            } else {
                              final Uri emailLaunchUri = Uri(
                                scheme: 'mailto',
                                path: 'smith@example.com',
                                query: encodeQueryParameters(<String, String>{
                                  'subject': 'Invitatie MD Planner',
                                  'body':
                                      'Buna! Sunt ${fullNameMedic} si te invit in aplicatia MD Planner. Apasa pe urmatorul link pentru a te inregistra: https://mdplanner.page.link/singin_iGuj'
                                }),
                              );
                              launchUrl(emailLaunchUri);
                            }
                          },
                          child: Text('Trimite o invitatie',
                              style: GoogleFonts.outfit(
                                color: Colors.white,
                                letterSpacing: 2,
                                fontSize: 20,
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }
}
