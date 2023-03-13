import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/Pages/login/login_page.dart';
import 'package:health_hub/Pages/medicprofile/main_medicprofile.dart';
import 'package:health_hub/Pages/signin/este_medic.dart';
import 'package:health_hub/Pages/userprofile/main_userprofile.dart';

class MainPage extends StatelessWidget {
  MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return EsteMedic();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
