import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:health_hub/Pages/login/login_page.dart';
import 'package:health_hub/Pages/signin/pending.dart';
import 'package:health_hub/Pages/signin/signin_medic/signin_page.dart';
import 'package:health_hub/Pages/firstpage/first_page.dart';
import 'package:health_hub/Pages/signin/signin_user/cont_creat.dart';
import 'Pages/signin/signin_user/signin_page_user.dart';
import 'Pages/listpage/main_listpage.dart';

void main() {
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
      builder: (context, state) => const LoginPage(),
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
      path: '/pacienti',
      builder: (context, state) => MainListPage(),
    ),
  ],
);
