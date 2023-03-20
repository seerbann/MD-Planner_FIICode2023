import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Appointment {
  final String? day;
  final String? month;
  final String? year;
  final String? hour;
  final String? minutes;

  Appointment({
    required this.day,
    required this.month,
    required this.year,
    required this.hour,
    required this.minutes,
  });
  Map<String, dynamic> toMap() {
    return {
      "day": day,
      "month": month,
      "year": year,
      "hour": hour,
      "minutes": minutes
    };
  }
}

class Calendar extends StatefulWidget {
  const Calendar({super.key});

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  String currentUsersMedic = "";
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
                      day: _meetingDate?.day.toString(),
                      month: _meetingDate?.month.toString(),
                      year: _meetingDate?.year.toString(),
                      hour: _meetingHour?.hour.toString(),
                      minutes: _meetingHour?.minute.toString());

                  print(appointmentToAdd.day);
                  print(appointmentToAdd.month);
                  print(appointmentToAdd.hour);
                  print(currentUsersMedic);

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
