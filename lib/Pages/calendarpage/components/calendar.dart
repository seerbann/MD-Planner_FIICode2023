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
      body: Row(
        children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 35),
                            child: RichText(
                              text: TextSpan(
                                // Note: Styles for TextSpans must be explicitly defined.
                                // Child text spans will inherit styles from parent
                                style: const TextStyle(
                                  fontSize: 14.0,
                                  color: Colors.black,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Alege ',
                                      style: TextStyle(fontSize: 35)),
                                  TextSpan(
                                      text: 'data si ora ',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 35,
                                          color:
                                              Color.fromRGBO(67, 123, 255, 1))),
                                  TextSpan(
                                      text: 'potrivite pentru tine',
                                      style: TextStyle(
                                        fontSize: 35,
                                      )),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1.Alege data',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            Container(
                              // decoration: BoxDecoration(
                              //     border: Border.all(
                              //       color: Color.fromRGBO(67, 123, 255, 1),
                              //     ),
                              //     borderRadius: BorderRadius.all(Radius.circular(20))),
                              child: SfDateRangePicker(
                                controller: _controller,
                                view: DateRangePickerView.month,
                                minDate: _minDate,
                                onSelectionChanged: _onDateChanged,
                                selectionMode:
                                    DateRangePickerSelectionMode.single,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '2.Alege ora',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 23),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Container(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16.0),
                                              child: Text(
                                                'Selecteaza ora inceput',
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodyText2!
                                                    .copyWith(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 16),
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0,
                                                  left: 15.0,
                                                  top: 8.0),
                                              child: Icon(
                                                Icons.access_time,
                                                color: Color.fromRGBO(
                                                    67, 123, 255, 1),
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
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(67, 123, 255, 1),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        textStyle: const TextStyle(fontSize: 20),
                        foregroundColor: Colors.blue,
                      ),
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

                        addProgramareToMedic(
                            appointmentToAdd, currentUsersMedic);

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Programare realizata cu succes',
                          ),
                          duration: Duration(milliseconds: 1000),
                        ));
                      },
                      child: Text(
                        "Programeaza-ma",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      ),
    );
  }
}

class CalendarForMedic extends StatefulWidget {
  CalendarForMedic({super.key});

  @override
  State<CalendarForMedic> createState() => _CalendarForMedicState();
}

class _CalendarForMedicState extends State<CalendarForMedic> {
  List<Appointment> appList = [];
  Appointment? currMedicsAppts;

  var programs;

  HashMap<String, Appointment> appointmentsHashMap =
      new HashMap<String, Appointment>();

  Future getCurrMedicsAppts() async {
    DateTime today = DateTime.now().subtract(Duration(days: 1));
    bool procesTerminat = false;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            Map<String, dynamic> data = document.data();
            programs = data['programari'];
            for (var program in programs) {
              DateTime aux = DateTime(
                int.parse(program['year'] ?? "1"),
                int.parse(program['month'] ?? "1"),
                int.parse(program['day'] ?? "1"),
              );
              if (today.isBefore(aux)) {
                Appointment appToAdd = Appointment(
                    email: program['email'],
                    day: program['day'],
                    month: program['month'],
                    year: program['year'],
                    hour: program['hour'],
                    minutes: program['minutes']);

                appList.add(appToAdd);
              }
            }
          }),
        );
    return procesTerminat;
  }

  Widget? personList;
  String? text;
  List<Appointment> appoitnemtsChosenDate = [];
  void _onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    personList = null;
    appoitnemtsChosenDate = [];
    setState(() {
      for (int i = 0; i < appList.length; i++) {
        DateTime aux = DateTime(
          int.parse(appList[i].year ?? "1"),
          int.parse(appList[i].month ?? "1"),
          int.parse(appList[i].day ?? "1"),
        );
        if (aux == args.value) {
          appoitnemtsChosenDate.add(Appointment(
              email: appList[i].email,
              day: appList[i].day,
              month: appList[i].month,
              year: appList[i].year,
              hour: appList[i].hour,
              minutes: appList[i].minutes));
        }
      }

      buildList();
    });
  }

  void buildList() {
    personList = null;
    print(appoitnemtsChosenDate.length);
    personList = Container(
      child: Column(
        children: [
          RichText(
            text: TextSpan(
              // Note: Styles for TextSpans must be explicitly defined.
              // Child text spans will inherit styles from parent
              style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(text: 'Aveti ', style: TextStyle(fontSize: 25)),
                TextSpan(
                    text: '${appoitnemtsChosenDate.length} ',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Color.fromRGBO(67, 123, 255, 1))),
                TextSpan(
                    text: 'programari',
                    style: TextStyle(
                      fontSize: 25,
                    )),
              ],
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: appoitnemtsChosenDate.length,
            itemBuilder: (context, index) {
              final item = appoitnemtsChosenDate[index];
              return ListTile(
                title: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Email: ${item.email}"),
                    Text("Ora: ${item.hour}"),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                )),
              );
            },
          ),
        ],
      ),
    );
  }

  DateTime? _minDate;
  List<DateTime> _specialDates = [];

  void initState() {
    getCurrMedicsAppts();
    _minDate = DateTime.now();
  }

  final DateRangePickerController _controller = DateRangePickerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Row(
        children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 45),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Calendar',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Roboto',
                                  fontSize: 35,
                                  color: Colors.black)),
                          Text(
                              'Apasa pe o data pentru a vedea programarile din ziua respectiva',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 20,
                                  color: Colors.black.withOpacity(0.8))),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // decoration: BoxDecoration(
                          //     color: Colors.grey.withOpacity(0.4),
                          //     border: Border.all(
                          //       color: Colors.grey.withOpacity(0.4),
                          //     ),
                          //     borderRadius: BorderRadius.all(Radius.circular(20))),
                          child: SfDateRangePicker(
                            onSelectionChanged: _onSelectionChanged,
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
                              specialDatesTextStyle:
                                  const TextStyle(color: Colors.white),
                            ),
                            monthViewSettings: DateRangePickerMonthViewSettings(
                                specialDates: _specialDates),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.refresh,
                            ),
                            TextButton(
                                style: TextButton.styleFrom(
                                  textStyle: const TextStyle(fontSize: 15),
                                  foregroundColor: Colors.blue,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _specialDates = [];
                                    for (int i = 0; i < appList.length; i++) {
                                      _specialDates.add(DateTime(
                                        int.parse(appList[i].year ?? "1"),
                                        int.parse(appList[i].month ?? "1"),
                                        int.parse(appList[i].day ?? "1"),
                                      ));
                                      print(_specialDates);
                                    }
                                  });
                                },
                                child: Text(
                                  'Refresh',
                                  style: TextStyle(
                                      color: Color.fromRGBO(67, 123, 255, 1)),
                                )),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Container(
                          child: Center(child: personList),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Spacer(
            flex: 1,
          )
        ],
      )),
    );
  }
}
