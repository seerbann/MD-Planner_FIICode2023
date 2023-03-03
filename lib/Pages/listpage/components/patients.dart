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
          if (constraints.maxWidth > 600) {
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          for (var person in people)
            Container(
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
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
