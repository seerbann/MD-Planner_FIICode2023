import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class GetCitiesName extends StatelessWidget {
  final String documentId;

  GetCitiesName({required this.documentId});
  @override
  Widget build(BuildContext context) {
    /// get the collection

    CollectionReference cities =
        FirebaseFirestore.instance.collection('cities');
    return const Placeholder();
  }
}
