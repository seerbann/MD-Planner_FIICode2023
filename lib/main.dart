import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_hub/Pages/calendarpage/components/calendar.dart';
import 'package:health_hub/Pages/listpage/components/ListAndPacientDetails.dart';

import 'package:health_hub/Pages/login/login_page.dart';
import 'package:health_hub/Pages/main_page.dart';
import 'package:health_hub/Pages/signin/pending.dart';
import 'package:health_hub/Pages/signin/signin_medic/signin_page.dart';
import 'package:health_hub/Pages/firstpage/first_page.dart';
import 'package:health_hub/Pages/signin/signin_user/cont_creat.dart';
import 'package:health_hub/Pages/userprofile/main_userprofile.dart';
import 'package:health_hub/firebase_options.dart';

import 'Pages/calendarpage/main_calendar.dart';
import 'Pages/medicprofile/main_medicprofile.dart';
import 'Pages/signin/signin_user/signin_page_user.dart';
import 'Pages/listpage/main_listpage.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
    );
  }
}

GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const FirstPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (context, state) => MainPage(),
    ),
    GoRoute(
      path: '/signin/medic',
      builder: (context, state) => const SignInPage_medic(),
    ),
    GoRoute(
      path: '/signin/user',
      builder: (context, state) => const SignInPage_user(),
    ),
    GoRoute(
      path: '/pending',
      builder: (context, state) => const Pending(),
    ),
    GoRoute(
      path: '/signin/user/contCreat',
      builder: (context, state) => const ContCreat(),
    ),
    GoRoute(
      path: '/list',
      builder: (context, state) => MainListPage(),
    ),
    GoRoute(
      path: '/profile',
      builder: (context, state) => MainProfile(),
    ),
    GoRoute(
      path: '/medicprofile',
      builder: (context, state) => MainMedicProfile(),
    ),
    GoRoute(
      path: '/calendar',
      builder: (context, state) => CalendarPage(),
    ),
  ],
);
