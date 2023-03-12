import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:table_calendar/table_calendar.dart';

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
            finalString = firstname + ' ' + lastname;
          }),
        );
    return procesTerminat;
  }

  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Responsive(
      desktop: Container(
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                              Column(
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black))
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder(
                                    future: getName(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          finalString,
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        );
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('0734532568',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  Text(
                                      'Strada Cristea Mateescu nr. 6-68,10,Brasov',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                ],
                              ),
                            ],
                          ),
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
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 400,
                height: 100,
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
            ]),
      ),
      tablet: Container(
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 450,
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFE2E3E3), width: 5),
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Column(
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      color: Colors.black))
                            ],
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FutureBuilder(
                                future: getName(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      finalString,
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20),
                                    );
                                  } else {
                                    return Center(
                                        child: CircularProgressIndicator());
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text('0734532568',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.7))),
                              Text('Strada Cristea Mateescu nr. 6-68,10,Brasov',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                      color: Colors.black.withOpacity(0.7))),
                            ],
                          ),
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
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 400,
                height: 100,
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
            ]),
      ),
      mobile: Container(
        height: double.infinity,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
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
                              Column(
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
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17,
                                          color: Colors.black))
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  FutureBuilder(
                                    future: getName(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          finalString,
                                          style: TextStyle(
                                              fontFamily: 'Roboto',
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20),
                                        );
                                      } else {
                                        return Center(
                                            child: CircularProgressIndicator());
                                      }
                                    },
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('0734532568',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                  Text(
                                      'Strada Cristea Mateescu nr. 6-68,10,Brasov',
                                      style: TextStyle(
                                          fontFamily: 'Roboto',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color:
                                              Colors.black.withOpacity(0.7))),
                                ],
                              ),
                            ],
                          ),
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
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 400,
                height: 100,
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
            ]),
      ),
    );
  }
}
