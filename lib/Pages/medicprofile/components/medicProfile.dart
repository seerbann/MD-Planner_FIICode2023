import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_hub/dynamic_link.dart';
import 'package:share_plus/share_plus.dart';
import 'package:table_calendar/table_calendar.dart';

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);

class MedicProfile extends StatefulWidget {
  const MedicProfile({super.key});

  @override
  State<MedicProfile> createState() => _MedicProfileState();
}

FirebaseAuth auth = FirebaseAuth.instance;

String finalString = "";

Future getName() async {
  bool procesTerminat = false;
  await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: auth.currentUser?.email)
      .get()
      .then(
        (snapshot) => snapshot.docs.forEach((document) {
          print(document.reference.id);
          Map<String, dynamic> data = document.data();
          String firstname = data['first name'];
          String lastname = data['last name'];
          procesTerminat = true;
          finalString = 'Dr. ' + firstname + ' ' + lastname;
        }),
      );
  return procesTerminat;
}

CalendarFormat _calendarFormat = CalendarFormat.month;
DateTime _focusedDay = DateTime.now();
DateTime? _selectedDay;
final user = FirebaseAuth.instance.currentUser;

class _MedicProfileState extends State<MedicProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE2E3E3), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Image.asset('assets/images/defaultUser.png'),
                            Column(
                              children: [
                                FutureBuilder(
                                  future: getName(),
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(finalString);
                                    } else {
                                      return Center(
                                          child: CircularProgressIndicator());
                                    }
                                  },
                                ),
                                Text('Orar',
                                    style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                        color: Colors.black.withOpacity(0.7)))
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100,
                        ),
                        SizedBox(
                          height: 50,
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE2E3E3), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Text('Calendar',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.black,
                          )),
                      Container(
                        width: 300,
                        child: TableCalendar(
                          firstDay: kFirstDay,
                          lastDay: kLastDay,
                          focusedDay: _focusedDay,
                          calendarFormat: _calendarFormat,
                          selectedDayPredicate: (day) {
                            // Use `selectedDayPredicate` to determine which day is currently selected.
                            // If this returns true, then `day` will be marked as selected.

                            // Using `isSameDay` is recommended to disregard
                            // the time-part of compared DateTime objects.
                            return isSameDay(_selectedDay, day);
                          },
                          onDaySelected: (selectedDay, focusedDay) {
                            if (!isSameDay(_selectedDay, selectedDay)) {
                              // Call `setState()` when updating the selected day
                              setState(() {
                                _selectedDay = selectedDay;
                                _focusedDay = focusedDay;
                              });
                            }
                          },
                          onFormatChanged: (format) {
                            if (_calendarFormat != format) {
                              // Call `setState()` when updating calendar format
                              setState(() {
                                _calendarFormat = format;
                              });
                            }
                          },
                          onPageChanged: (focusedDay) {
                            // No need to call `setState()` here
                            _focusedDay = focusedDay;
                          },
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE2E3E3), width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Email',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black),
                                ),
                                Text(
                                  'serban.chiriac@gmail.com',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black.withOpacity(0.7)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Telefon',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black),
                                ),
                                Text(
                                  '076545785',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black.withOpacity(0.7)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Oras',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black),
                                ),
                                Text(
                                  'Iasi',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black.withOpacity(0.7)),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'CNP',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black),
                                ),
                                Text(
                                  '5046578564345',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Outfit',
                                      color: Colors.black.withOpacity(0.7)),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 450,
                  height: 300,
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE2E3E3), width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Center(
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
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(child: const Text('Pacienti')),
                ),
                Container(
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(child: const Text('Asistenti')),
                ),
                Container(
                  height: 50,
                  width: 90,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 5),
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(67, 123, 255, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onPressed: () async {
                        if (!kIsWeb) {
                          DynamicLinkProvider()
                              .createLink(finalString)
                              .then((value) {
                            Share.share(value);
                          });
                        }
                      },
                      child: Text('Trimite o invitatie',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2,
                            fontSize: 20,
                          )),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Text('signed in as: ${user?.email}',
                style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                  fontSize: 20,
                )),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 255, 205, 67),
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
              ),
              onPressed: (() => FirebaseAuth.instance.signOut()),
              child: Text('Sign Out',
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
    );
  }
}
