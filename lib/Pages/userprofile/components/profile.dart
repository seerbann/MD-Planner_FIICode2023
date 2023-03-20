import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../commonComponents/vectors/vector_center_right.dart';
import '../../../commonComponents/vectors/vector_top_right.dart';
import '../../../responsive.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class _ProfileState extends State<Profile> {
  FirebaseAuth auth = FirebaseAuth.instance;

  String fullName = "";
  String phone = "";
  String city = "";
  String cnp = "";
  String email = "";
  Future getInfo() async {
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
            city = data['city'];
            cnp = data['cnp'];
            email = data['email'];
            phone = data['phone'];
            procesTerminat = true;
            fullName = firstname + ' ' + lastname;
          }),
        );
    return procesTerminat;
  }

  void initState() {
    super.initState();
    getInfo();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 780
        ? Container(
            height: double.infinity,
            child: Stack(children: [
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
                alignment: Alignment(0.3, -0.4),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFE2E3E3), width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            children: [
                                              Image.asset(
                                                'assets/images/defaultUser.png',
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text('editeaza date',
                                                  style: TextStyle(
                                                      fontFamily: 'Roboto',
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 17,
                                                      color: Colors.black))
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            FutureBuilder(
                                              future: getInfo(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    fullName,
                                                    style: TextStyle(
                                                        fontFamily: 'Roboto',
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 20),
                                                  );
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              },
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            FutureBuilder(
                                              future: getInfo(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(phone,
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.7)));
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              },
                                            ),
                                            FutureBuilder(
                                              future: getInfo(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(city,
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 15,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.7)));
                                                } else {
                                                  return Center(
                                                      child:
                                                          CircularProgressIndicator());
                                                }
                                              },
                                            ),
                                          ],
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
                              width: 300,
                              height: 300,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Color(0xFFE2E3E3), width: 5),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20)),
                                color: Colors.white,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Istoric Medical',
                                  style: TextStyle(
                                    fontFamily: 'Outfit',
                                    fontSize: 25,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Container(
                            width: 400,
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
                                          future: getInfo(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                email,
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
                                          future: getInfo(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                phone,
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
                                          'Oras',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Outfit',
                                              color: Colors.black),
                                        ),
                                        FutureBuilder(
                                          future: getInfo(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                city,
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
                                          'CNP',
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Outfit',
                                              color: Colors.black),
                                        ),
                                        FutureBuilder(
                                          future: getInfo(),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(
                                                cnp,
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
                              ],
                            )),
                      ],
                    ),
                    SizedBox(
                      height: 100,
                    ),
                  ]),
            ]),
          )
        : Center(
            child: Container(
              height: double.infinity,
              child: Stack(children: <Widget>[
                Align(
                  alignment: Alignment(1.0, -0.7),
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
                  alignment: Alignment(-1.2, 0.7),
                  child: RotatedBox(
                    quarterTurns: 1,
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
                ),
                SingleChildScrollView(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFE2E3E3), width: 5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(25.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/defaultUser.png',
                                                  ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  Text('editeaza date',
                                                      style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 17,
                                                          color: Colors.black))
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                FutureBuilder(
                                                  future: getInfo(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      return Text(
                                                        fullName,
                                                        style: TextStyle(
                                                            fontFamily:
                                                                'Roboto',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20),
                                                      );
                                                    } else {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  },
                                                ),
                                                SizedBox(
                                                  height: 20,
                                                ),
                                                FutureBuilder(
                                                  future: getInfo(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      return Text(phone,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.7)));
                                                    } else {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  },
                                                ),
                                                FutureBuilder(
                                                  future: getInfo(),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      return Text(city,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Roboto',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 15,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.7)));
                                                    } else {
                                                      return Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  },
                                                ),
                                              ],
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
                                  width: 300,
                                  height: 300,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color(0xFFE2E3E3), width: 5),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                    color: Colors.white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Istoric Medical',
                                      style: TextStyle(
                                        fontFamily: 'Outfit',
                                        fontSize: 25,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                                width: 400,
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
                                              future: getInfo(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    email,
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
                                              future: getInfo(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    phone,
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
                                              'Oras',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Outfit',
                                                  color: Colors.black),
                                            ),
                                            FutureBuilder(
                                              future: getInfo(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    city,
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
                                              'CNP',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontFamily: 'Outfit',
                                                  color: Colors.black),
                                            ),
                                            FutureBuilder(
                                              future: getInfo(),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Text(
                                                    cnp,
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
                                  ],
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                      ]),
                ),
              ]),
            ),
          );
  }
}
