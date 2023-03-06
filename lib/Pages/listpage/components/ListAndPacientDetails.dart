import 'package:google_fonts/google_fonts.dart';
import 'package:health_hub/Pages/listpage/components/people.dart';
import 'package:flutter/material.dart';

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
          child: PersonDetail(_person),
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
                    height: 250,
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
                        height: 50,
                        decoration: BoxDecoration(
                            color: Color(0xFF9DBAFE),
                            border: Border.all(color: Colors.black)),
                        child: TextButton(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/images/user.png',
                                scale: 5,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(person.name),
          Text(person.phone),
        ],
      ),
    );
  }
}
