///not used
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:health_hub/Pages/login/login_page.dart';
import 'package:health_hub/profileDecider.dart';
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
              return ProfileDecider();
            } else {
              return LoginPage();
            }
          }),
    );
  }
}
