import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Appointment {
  String? email;
  String? day;
  String? month;
  String? year;
  String? hour;
  String? minutes;

  Appointment({
    required this.email,
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
    required this.minutes,
  });
  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "day": day,
      "month": month,
      "year": year,
      "hour": hour,
      "minutes": minutes
    };
  }
}

bool esteMedicCalendar = false;
Future isMedic() async {
  await FirebaseFirestore.instance
      .collection('users')
      .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
      .get()
      .then(
        (snapshot) => snapshot.docs.forEach((document) {
          //print(document.reference.id);
          Map<String, dynamic> data = document.data();
          if (data['isMedic']) {
            esteMedicCalendar = true;
            print('Acest utilizator este medic ISMEDIC');
          } else {
            esteMedicCalendar = false;
            print('Acest utilizator nu este medic ISMEDIC');
          }
        }),
      );
  return esteMedicCalendar;
}

class Calendar extends StatelessWidget {
  const Calendar({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: isMedic(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (esteMedicCalendar == true)
              return CalendarForMedic();
            else
              return CalendarForUser();
          } else {
            print('eroare');
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}

class CalendarForUser extends StatefulWidget {
  const CalendarForUser({super.key});

  @override
  State<CalendarForUser> createState() => _CalendarForUserState();
}

class _CalendarForUserState extends State<CalendarForUser> {
  String currentUsersMedic = "";
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  Future getCurrUsersMedic() async {
    bool procesTerminat = false;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            Map<String, dynamic> data = document.data();
            currentUsersMedic = data['medic'];
          }),
        );
    return procesTerminat;
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
    return idDoctor;
  }

  Future addProgramareToMedic(Appointment app, String numeMedic) async {
    List list = [app.toMap()];
    var idDoctor = await getMedicId(numeMedic);
    FirebaseFirestore.instance
        .collection('users')
        .doc(idDoctor)
        .update({"programari": FieldValue.arrayUnion(list)});
  }

  void _selectStartTime() async {
    final TimeOfDay? newTime = await showTimePicker(
      builder: (context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
      context: context,
      initialEntryMode: TimePickerEntryMode.inputOnly,
      initialTime: TimeOfDay(hour: DateTime.now().hour, minute: 0),
    );
    if (newTime != null) {
      setState(() {
        _meetingHour = newTime;
      });
      //time for db
    }
  }

  late DateTime _minDate;
  late List<DateTime> _specialDates;
  late String _date;
  final DateRangePickerController _controller = DateRangePickerController();
  DateTime? selectedDate;
  DateTime? _meetingDate;
  TimeOfDay? _meetingHour;
  void initState() {
    _minDate = DateTime.now();
    _meetingHour = TimeOfDay(hour: DateTime.now().hour, minute: 0);
    getCurrUsersMedic();

    super.initState();
  }

  void _onDateChanged(DateRangePickerSelectionChangedArgs args) {
    setState(() {
      _meetingDate = DateTime(
        int.parse(args.value.toString().substring(0, 4)),
        int.parse(args.value.toString().substring(5, 7)),
        int.parse(args.value.toString().substring(8, 10)),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SfDateRangePicker(
            controller: _controller,
            view: DateRangePickerView.month,
            minDate: _minDate,
            onSelectionChanged: _onDateChanged,
            selectionMode: DateRangePickerSelectionMode.single,
          ),
          Container(
            width: 150,
            height: 70,
            decoration: BoxDecoration(
              color: Theme.of(context).selectedRowColor,
              boxShadow: [
                BoxShadow(
                  color: Theme.of(context).shadowColor,
                  blurRadius: 2,
                ),
              ],
              borderRadius: BorderRadius.circular(16),
            ),
            child: _meetingHour == null
                ? InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: _selectStartTime,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16.0),
                          child: Text(
                            'Selecteaza ora inceput',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2!
                                .copyWith(
                                    fontWeight: FontWeight.w400, fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  )
                : InkWell(
                    focusColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    splashColor: Colors.transparent,
                    onTap: _selectStartTime,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 8.0, left: 15.0, top: 8.0),
                          child: Icon(
                            Icons.access_time,
                            color: Colors.brown,
                            size: 28,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            '${_meetingHour!.hour.toString().padLeft(2, '0')}:${_meetingHour!.minute.toString().padLeft(2, '0')}',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  selectedDate = _controller.selectedDate;

                  Appointment appointmentToAdd = Appointment(
                      email: currentUserEmail,
                      day: _meetingDate?.day.toString(),
                      month: _meetingDate?.month.toString(),
                      year: _meetingDate?.year.toString(),
                      hour: _meetingHour?.hour.toString(),
                      minutes: _meetingHour?.minute.toString());

                  print(appointmentToAdd.day);
                  print(appointmentToAdd.month);
                  print(appointmentToAdd.hour);
                  print(currentUserEmail);

                  addProgramareToMedic(appointmentToAdd, currentUsersMedic);

                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Selection Confirmed',
                    ),
                    duration: Duration(milliseconds: 500),
                  ));
                },
                child: Text("Confirm"),
              ),
              TextButton(
                onPressed: () {
                  _controller.selectedDate = selectedDate;
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text(
                      'Selection Cancelled',
                    ),
                    duration: Duration(milliseconds: 500),
                  ));
                },
                child: Text("Cancel"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CalendarForMedic extends StatelessWidget {
  Appointment? currMedicsAppts;
  var programs;
  HashMap<String, Appointment> appointmentsHashMap =
      new HashMap<String, Appointment>();
  Future getCurrMedicsAppts() async {
    bool procesTerminat = false;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            Map<String, dynamic> data = document.data();
            programs = data['programari'];
          }),
        );
    return procesTerminat;
  }

  DateTime? _minDate;
  void initState() {
    getCurrMedicsAppts();
    _minDate = DateTime.now();
  }

  CalendarForMedic({super.key});
  final DateRangePickerController _controller = DateRangePickerController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 500,
                child: SfDateRangePicker(
                  controller: _controller,
                  minDate: _minDate,
                  enablePastDates: false,
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    blackoutDatesDecoration: BoxDecoration(
                        color: Colors.red,
                        border: Border.all(
                            color: const Color(0xFFF44436), width: 1),
                        shape: BoxShape.circle),
                    weekendDatesDecoration: BoxDecoration(
                        color: const Color(0xFFDFDFDF),
                        border: Border.all(
                            color: const Color(0xFFB6B6B6), width: 1),
                        shape: BoxShape.circle),
                    specialDatesDecoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(
                            color: const Color(0xFF2B732F), width: 1),
                        shape: BoxShape.circle),
                    blackoutDateTextStyle: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.lineThrough),
                    specialDatesTextStyle: const TextStyle(color: Colors.white),
                  ),
                  monthViewSettings: DateRangePickerMonthViewSettings(
                      specialDates: [DateTime(2023, 3, 22)]),
                ),
              ),
              TextButton(
                  onPressed: () {
                    print(programs);
                  },
                  child: Text('Arata programari'))
            ],
          )),
        ));
  }
}
