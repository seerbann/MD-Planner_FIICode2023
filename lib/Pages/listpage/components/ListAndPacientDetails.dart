import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:health_hub/profileDecider.dart';
import '../../../commonComponents/vectors/vector_center_right.dart';
import '../../../read data/get_medic_info.dart';
import '../../../uploadpdf.dart';

class ListAndPacientDetails extends StatefulWidget {
  ListAndPacientDetails({
    Key? key,
  }) : super(key: key);

  @override
  _ListAndPacientDetailsState createState() => _ListAndPacientDetailsState();
}

class _ListAndPacientDetailsState extends State<ListAndPacientDetails> {
  @override
  void initState() {
    getPatients();
    getCurrMedicsPatients();
  }

  FirebaseAuth auth = FirebaseAuth.instance;

  bool esteMedicLista = false;

  Future isMedic() async {
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: auth.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            //print(document.reference.id);
            Map<String, dynamic> data = document.data();
            if (data['isMedic']) {
              esteMedicLista = true;
              print('Acest utilizator este medic ISMEDIC');
            } else {
              esteMedicLista = false;
              print('Acest utilizator nu este medic ISMEDIC');
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
              if (MediaQuery.of(context).size.width > 882) {
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

Medic _person = Medic(
    firstName: 'default',
    lastName: 'default',
    city: 'default',
    email: 'default',
    phone: 'default',
    fullName: 'default');
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
          child: _person.firstName == 'default'
              ? EmptyViewPacienti()
              : PersonDetail(_person),
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

List<String> pacienti = [];
bool fetchPatients = false;
//get patient list
Future getPatients() async {
  await db
      .collection("users")
      .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
      .get()
      .then(
    (querySnapshot) {
      print("Successfully completed");
      if (fetchPatients == false) {
        for (var docSnapshot in querySnapshot.docs) {
          for (int i = 0; i <= docSnapshot.data().length; i++) {
            print(docSnapshot.data()['pacienti'].length);
            if (docSnapshot.data()['pacienti'][i] != null)
              pacienti.add(docSnapshot.data()['pacienti'][i]);
          }
        }
        print('AM FACUT FETCH LA PACIENTI');
      }

      fetchPatients = true;
    },
    onError: (e) => print("Error completing: $e"),
  );
}

List<Medic> patientList = []; //obj list
bool random = false;
Future getCurrMedicsPatients() async {
  await db.collection("users").where("isMedic", isEqualTo: false).get().then(
    (querySnapshot) {
      //print("Successfully completed");
      if (random == false) {
        for (var docSnapshot in querySnapshot.docs) {
          if (pacienti.contains(docSnapshot.data()['fullName'])) {
            print('x');
            Medic p = Medic(
              firstName: docSnapshot.data()['first name'],
              lastName: docSnapshot.data()['last name'],
              city: docSnapshot.data()['city'],
              email: docSnapshot.data()['email'],
              phone: docSnapshot.data()['phone'],
              fullName: docSnapshot.data()['fullName'],
            );
            patientList.add(p);
          }
        }
        random = true;
        print('AM FACUT FETCH LA DOCTOR');
      }
    },
    onError: (e) => print("Error completing: $e"),
  );
  return random;
}

class PeopleList extends StatelessWidget {
  final void Function(Medic) onPersonTap;

  PeopleList({required this.onPersonTap});

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
                  //flag
                  FutureBuilder(
                      future: getCurrMedicsPatients(),
                      builder: ((context, snapshot) {
                        List<Widget> children = [];
                        if (snapshot.hasData) {
                          for (int i = 0; i < patientList.length; i++) {
                            children.add(
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextButton(
                                  child: Container(
                                    height: 70,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(25)),
                                        color:
                                            Color(0xFF9DBAFE).withOpacity(0.6),
                                        border:
                                            Border.all(color: Colors.black)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
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
                                          patientList[i].fullName,
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontFamily: 'Outfit',
                                              color: Colors.black),
                                        )
                                      ],
                                    ),
                                  ),
                                  onPressed: () {
                                    return onPersonTap(patientList[i]);
                                  },
                                ),
                              ),
                            );
                          }
                        } else if (snapshot.hasError) {
                          children = <Widget>[
                            const Icon(
                              Icons.error_outline,
                              color: Colors.red,
                              size: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16),
                              child: Text('Error: ${snapshot.error}'),
                            ),
                          ];
                        } else {
                          children = const <Widget>[
                            SizedBox(
                              width: 60,
                              height: 60,
                              child: CircularProgressIndicator(),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 16),
                              child: Text('Awaiting result...'),
                            ),
                          ];
                        }
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: children,
                          ),
                        );
                      })),
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
  final Medic person;

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
                      SizedBox(
                        width: 15,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            person.firstName,
                            style: TextStyle(
                                fontFamily: 'Outfit',
                                fontSize: 35,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            person.city,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SelectableText(person.email),
                          SelectableText(person.phone)
                        ],
                      ),
                    ],
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF323741),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 45, vertical: 25),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    onPressed: (() {
                      String numePacient = person.fullName;
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UploadPDF(
                                    numePacient: numePacient,
                                  )));
                    }),
                    child: Text('Incarca fisa medicala',
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
          ],
        ),
      ),
    );
  }
}

class EmptyViewPacienti extends StatelessWidget {
  const EmptyViewPacienti({super.key});

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
            //print('${docSnapshot.id} => ${docSnapshot.data()}');
          }
        fetchMedici2 = true;
        return medicList;
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
                              padding: const EdgeInsets.only(top: 8, bottom: 8),
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Color(0xFF9DBAFE).withOpacity(0.6),
                                    border: Border.all(color: Colors.black),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
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
                            onPressed: () {
                              Medic medic = medicList[i];
                              return onMedicTap(medic);
                            },
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

class MedicDetail extends StatefulWidget {
  final Medic medic;

  const MedicDetail(this.medic);

  @override
  State<MedicDetail> createState() => _MedicDetailState();
}

Future getCurrUsersMedic() async {
  String currentUsersMedic = "";
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
  return currentUsersMedic;
}

class _MedicDetailState extends State<MedicDetail> {
  var id;
  String? currentUserEmail = FirebaseAuth.instance.currentUser?.email;
  String? currentUsersName;

  Future getCurrUsersName() async {
    bool procesTerminat = false;
    await FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: FirebaseAuth.instance.currentUser?.email)
        .get()
        .then(
          (snapshot) => snapshot.docs.forEach((document) {
            Map<String, dynamic> data = document.data();
            currentUsersName = data['fullName'];
          }),
        );
    return procesTerminat;
  }

  Future<String> getCurrUserId(String? numeCurrUser) async {
    String idCurrUser = "aaaa";

    await FirebaseFirestore.instance
        .collection('users')
        .where('fullName', isEqualTo: numeCurrUser)
        .get()
        .then((snapshot) => snapshot.docs.forEach((document) {
              idCurrUser = document.id;
            }));
    print(idCurrUser);
    return idCurrUser;
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

  Future schimbaArray(
      String medicVechi, String medicNou, String? numePacient) async {
    var list = [numePacient];
    var idDoctorVechi = await getMedicId(medicVechi);
    FirebaseFirestore.instance
        .collection('users')
        .doc(idDoctorVechi)
        .update({"pacienti": FieldValue.arrayRemove(list)});
    var idDoctorNou = await getMedicId(medicNou);
    FirebaseFirestore.instance
        .collection('users')
        .doc(idDoctorNou)
        .update({"pacienti": FieldValue.arrayUnion(list)});
  }

  Future updateMedic(String medic) async {
    String medicVechi = await getCurrUsersMedic();
    print("Medicul vechi este ${medicVechi}");
    String medicNou = medic;
    print("Medicul nou este ${medicNou}");
    String? numePacient = currentUsersName;
    print("Pacientul curent se cheama ${numePacient}");

    await schimbaArray(medicVechi, medicNou, numePacient);
    await FirebaseFirestore.instance
        .collection('users')
        .doc(id)
        .update({"medic": medic}).then((value) => print('update succesful'));
  }

  void initState() {
    getCurrUsersName();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Align(
        alignment: Alignment(-0.9, -1.1),
        child: RotatedBox(
          quarterTurns: 2,
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
      Align(
        alignment: Alignment(0.9, 1.1),
        child: RotatedBox(
          quarterTurns: 4,
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
      Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/defaultUser.png'),
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.medic.fullName,
                              style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontSize: 35,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              widget.medic.city,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            SelectableText(widget.medic.email),
                            SelectableText(widget.medic.phone),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
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
                      child: Text(
                        'muta-te la acest medic',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () async {
                        id = await getCurrUserId(currentUsersName);
                        updateMedic(widget.medic.fullName);

                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text(
                            'Medic schimbat cu succes',
                          ),
                          duration: Duration(milliseconds: 1000),
                        ));
                        random = false;
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ]);
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
            flex: 3,
            child: MedicList(
                onMedicTap: (medic) => setState(() {
                      _medic = medic;
                    }))),
        Expanded(
          flex: 3,
          child: _medic.firstName == 'default'
              ? EmptyViewMedici()
              : MedicDetail(_medic),
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

class EmptyViewMedici extends StatelessWidget {
  const EmptyViewMedici({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      color: Colors.white,
      child: Center(
        child: Text(
          'Hei, momentan nu ai selectat niciun medic.',
          style: TextStyle(
              fontFamily: 'Outfit', fontSize: 35, fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
