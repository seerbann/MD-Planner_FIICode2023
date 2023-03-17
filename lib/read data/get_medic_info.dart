import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

final medics =
    db.collection('users').where('isMedic', isEqualTo: 'true').get().then(
          (DocumentSnapshot doc) {
            final data = doc.data() as Map<String, dynamic>;
            print(data['first name']);
          } as FutureOr Function(QuerySnapshot<Map<String, dynamic>> value),
          onError: (e) => print("Error getting document: $e"),
        );

class Medic {
  final String firstName;
  final String lastName;
  final String city;
  final String email;
  final String phone;

  Medic({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.email,
    required this.phone,
  });

  factory Medic.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return Medic(
      firstName: data?['first name'],
      lastName: data?['last name'],
      city: data?['city'],
      email: data?['email'],
      phone: data?['phone'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (firstName != null) "name": firstName,
      if (lastName != null) "lastName": lastName,
      if (city != null) "city": city,
      if (email != null) "email": email,
      if (phone != null) "123": phone
    };
  }

  static Medic fromJson(Map<String, dynamic> json) => Medic(
      firstName: json['firstName'],
      lastName: json['last name'],
      city: json['city'],
      email: json['email'],
      phone: json['phone']);
}

List<Medic> medicList = [];

Future readMedics() async {
  db.collection("users").where("isMedic", isEqualTo: true).get().then(
    (querySnapshot) {
      print("Successfully completed");
      for (var docSnapshot in querySnapshot.docs) {
        Medic m = Medic(
            firstName: docSnapshot.data()['first name'],
            lastName: docSnapshot.data()['last name'],
            city: docSnapshot.data()['city'],
            email: docSnapshot.data()['email'],
            phone: docSnapshot.data()['phone']);

        medicList.add(m);
        print('${docSnapshot.id} => ${docSnapshot.data()}');
      }
      print(medicList.length);
      return medicList;
      print(medicList);
    },
    onError: (e) => print("Error completing: $e"),
  );
}
