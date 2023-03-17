import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_hub/Pages/listpage/components/people.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/profileDecider.dart';

import '../../../read data/get_medic_info.dart';

class ListAndPacientDetails extends StatefulWidget {
  ListAndPacientDetails({
    Key? key,
  }) : super(key: key);

  @override
  _ListAndPacientDetailsState createState() => _ListAndPacientDetailsState();
}

class _ListAndPacientDetailsState extends State<ListAndPacientDetails> {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool esteMedicLista = false;

  Future isMedic() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            print(document.reference.id);
            Map<String, dynamic> data = document.data();
            if (data['isMedic']) {
              esteMedicLista = true;
              print('Acest utilizator este medic');
            } else {
              esteMedicLista = false;
              print('Acest utilizator nu este medic');
            }
          }),
        );
    return esteMedicLista;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: isMedic(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (esteMedicLista == true) {
              if (MediaQuery.of(context).size.width > 800) {
                return WideLayoutwithUsers();
              } else {
                return NarrowLayoutwithUsers();
              }
            } else {
              if (MediaQuery.of(context).size.width > 800) {
                return WideLayoutwithMedics();
              } else {
                return NarrowLayoutwithMedics();
              }
            }
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        },
      ),
    );
  }
}

Person _person = Person(name: 'default', phone: 'default', picture: 'default');
Medic _medic = Medic(
    firstName: 'default',
    lastName: 'default',
    city: 'default',
    email: 'default',
    phone: 'default',
    fullName: 'default');

class WideLayoutwithUsers extends StatefulWidget {
  @override
  _WideLayoutwithUsersState createState() => _WideLayoutwithUsersState();
}

class _WideLayoutwithUsersState extends State<WideLayoutwithUsers> {
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
                    }))),
        Expanded(
          flex: 3,
          child:
              _person.name == 'default' ? EmptyView() : PersonDetail(_person),
        ),
      ],
    );
  }
}

class NarrowLayoutwithUsers extends StatelessWidget {
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

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///medic
class MedicList extends StatelessWidget {
  final void Function(Medic) onMedicTap;
  MedicList({required this.onMedicTap});

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
                          TextButton(
                            child: Padding(
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
                            onPressed: () => onMedicTap(medicList[i]),
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

class MedicDetail extends StatelessWidget {
  final Medic medic;

  const MedicDetail(this.medic);

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
                            medic.fullName,
                            style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(medic.phone)
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

class WideLayoutwithMedics extends StatefulWidget {
  @override
  _WideLayoutwithMedicsState createState() => _WideLayoutwithMedicsState();
}

class _WideLayoutwithMedicsState extends State<WideLayoutwithMedics> {
  @override
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: MedicList(
                onMedicTap: (medic) => setState(() {
                      _medic = medic;
                    }))),
        Expanded(
          flex: 3,
          child:
              _person.name == 'default' ? EmptyView() : PersonDetail(_person),
        ),
      ],
    );
  }
}

class NarrowLayoutwithMedics extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MedicList(
      onMedicTap: (medic) => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
            ),
            body: MedicDetail(medic),
          ),
        ),
      ),
    );
  }
}
