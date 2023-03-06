import 'package:flutter/material.dart';

class MedicProfile extends StatefulWidget {
  const MedicProfile({super.key});

  @override
  State<MedicProfile> createState() => _MedicProfileState();
}

class _MedicProfileState extends State<MedicProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      children: [
                        Image.asset('assets/images/defaultUser.png'),
                        Column(
                          children: [
                            const Text(
                              'Prof. Dr. Daniel Leon',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30,
                                  color: Colors.black),
                            ),
                            Text('no description',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black.withOpacity(0.7)))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.white,
                  ),
                  child: const Text('Calendar',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.black,
                      )),
                )
              ],
            ),
            Center(
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Text('Pacienti'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Text('Asistenti'),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 30,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Text('Trimite invitatie'),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
