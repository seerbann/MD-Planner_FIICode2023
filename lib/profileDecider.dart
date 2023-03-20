//fostul EsteMedic()
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'Pages/login/login_page.dart';
import 'Pages/medicprofile/main_medicprofile.dart';
import 'Pages/userprofile/main_userprofile.dart';
import 'package:go_router/go_router.dart';

class ProfileDecider extends StatelessWidget {
  ProfileDecider({super.key});

  FirebaseAuth auth = FirebaseAuth.instance;

  bool isRestricted() {
    bool esteRestrictionat = false;
    if (FirebaseAuth.instance.currentUser != null) {
      esteRestrictionat = false;
    } else {
      esteRestrictionat = true;
      print('Este restrictionat');
    }
    return esteRestrictionat;
  }

  bool esteMedic = false;

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
              esteMedic = true;
              print('Acest utilizator este medic');
            } else {
              esteMedic = false;
              print('Acest utilizator nu este medic');
            }
          }),
        );
    return esteMedic;
  }

  @override
  Widget build(BuildContext context) {
    bool esteRestrictionat = isRestricted();
    if (esteRestrictionat) {
      return LoginPage();
    } else
      return FutureBuilder(
          future: isMedic(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              if (esteMedic) {
                return MainMedicProfile();
              } else {
                return MainProfile();
              }
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }));
  }
}
