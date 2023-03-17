import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_hub/Pages/listpage/components/people.dart';
import 'package:flutter/material.dart';

import '../../../read data/get_medic_info.dart';

class ListAndPacientDetails extends StatefulWidget {
  ListAndPacientDetails({
    Key? key,
  }) : super(key: key);

  @override
  _ListAndPacientDetailsState createState() => _ListAndPacientDetailsState();
}

class _ListAndPacientDetailsState extends State<ListAndPacientDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return WideLayout();
          } else {
            return NarrowLayout();
          }
        },
      ),
    );
  }
}

Person _person = Person(name: 'default', phone: 'default', picture: 'default');

class WideLayout extends StatefulWidget {
  @override
  _WideLayoutState createState() => _WideLayoutState();
}

class _WideLayoutState extends State<WideLayout> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 2,
          child: PeopleList(
              onPersonTap: (person) => setState(() {
                    _person = person;
                  })),
        ),
        Expanded(
          flex: 3,
          child:
              _person.name == 'default' ? EmptyView() : PersonDetail(_person),
        ),
      ],
    );
  }
}

class NarrowLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PeopleList(
      onPersonTap: (person) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: PersonDetail(person),
          ),
        ),
      ),
    );
  }
}

class PeopleList extends StatelessWidget {
  final void Function(Person) onPersonTap;

  const PeopleList({required this.onPersonTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.centerRight,
        end: Alignment.centerLeft,
        colors: [
          Color.fromRGBO(122, 162, 255, 1),
          Color.fromRGBO(51, 112, 255, 1),
        ],
      )),
      child: Row(
        children: [
          Spacer(
            flex: 1,
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 150,
                  ),
                  Row(
                    children: [
                      Text("Pacienti",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              color: const Color.fromARGB(255, 255, 255, 255),
                              letterSpacing: 1,
                              fontSize: 40,
                              fontWeight: FontWeight.w500)),
                      SizedBox(
                        width: 30,
                      ),
                      InkWell(child: Image.asset('assets/images/add.png'))
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  for (var person in people)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: Color(0xFF9DBAFE),
                            border: Border.all(color: Colors.black)),
                        child: TextButton(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/images/user.png',
                                scale: 5,
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(
                                person.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Outfit',
                                    color: Colors.black),
                              )
                            ],
                          ),
                          onPressed: () => onPersonTap(person),
                        ),
                      ),
                    ),
                ],
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

class PersonDetail extends StatelessWidget {
  final Person person;

  const PersonDetail(this.person);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Color(0xFFFAFBFF),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset('assets/images/defaultUser.png'),
                      Column(
                        children: [
                          Text(
                            person.name,
                            style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(person.phone)
                        ],
                      ),
                    ],
                  ),
                  Text(
                    'trimite altui medic',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 200,
            ),
            Container(
              color: Color(0xFFFAFBFF),
              child: Text('Fisa Medicala'),
            ),
            SizedBox(height: 400),
            Container(
              color: Color(0xFFFAFBFF),
              child: Text('Istoric Medical'),
            ),
          ],
        ),
      ),
    );
  }
}

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(
          'Hei, momentan nu ai selectat niciun pacient.',
          style: TextStyle(
              fontFamily: 'Outfit', fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

class MedicList extends StatefulWidget {
  final void Function(Medic) onMedicTap;

  MedicList({required this.onMedicTap});

  @override
  State<MedicList> createState() => _MedicListState();
}

class _MedicListState extends State<MedicList> {
  List<Medic> medicList = [];
  bool fetchMedici2 = false;
  Future readMedics() async {
    await db.collection("users").where("isMedic", isEqualTo: true).get().then(
      (querySnapshot) {
        print("Successfully completed");
        if (fetchMedici2 == false)
          for (var docSnapshot in querySnapshot.docs) {
            Medic m = Medic(
              firstName: docSnapshot.data()['first name'],
              lastName: docSnapshot.data()['last name'],
              city: docSnapshot.data()['city'],
              email: docSnapshot.data()['email'],
              phone: docSnapshot.data()['phone'],
              fullName: docSnapshot.data()['fullName'],
            );

            medicList.add(m);
            print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        fetchMedici2 = true;
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: readMedics(),
        builder: (context, snapshot) {
          return Container(
            height: double.infinity,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
              colors: [
                Color.fromRGBO(122, 162, 255, 1),
                Color.fromRGBO(51, 112, 255, 1),
              ],
            )),
            child: Row(
              children: [
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 5,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text("Medici",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.roboto(
                                    color: const Color.fromARGB(
                                        255, 255, 255, 255),
                                    letterSpacing: 1,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w500)),
                            SizedBox(
                              width: 30,
                            ),
                            InkWell(child: Image.asset('assets/images/add.png'))
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        for (int i = 0; i < medicList.length; i++)
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 70,
                              decoration: BoxDecoration(
                                  color: Color(0xFF9DBAFE),
                                  border: Border.all(color: Colors.black)),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Image.asset(
                                    'assets/images/user.png',
                                    scale: 5,
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  Text(
                                    medicList[i].fullName,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: 'Outfit',
                                        color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
          );
        });
  }
}
