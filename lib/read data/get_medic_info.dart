import 'dart:async';
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

var db = FirebaseFirestore.instance;

class Medic {
  final String firstName;
  final String lastName;
  final String city;
  final String email;
  final String phone;
  final String fullName;

  Medic({
    required this.firstName,
    required this.lastName,
    required this.city,
    required this.email,
    required this.phone,
    required this.fullName,
  });

  Map<String, dynamic> toFirestore() {
    return {
      if (firstName != null) "name": firstName,
      if (lastName != null) "lastName": lastName,
      if (city != null) "city": city,
      if (email != null) "email": email,
      if (phone != null) "123": phone
    };
  }
}
