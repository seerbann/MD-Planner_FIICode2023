import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

class loginComponent extends StatefulWidget {
  const loginComponent({super.key});

  @override
  State<loginComponent> createState() => _loginComponentState();
}

class _loginComponentState extends State<loginComponent> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF4D4B4B),
            ),
            child: const Text('About'),
          ),
          //change
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF4D4B4B),
            ),
            child: const Text('Contact'),
          ),
          TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFF4D4B4B),
            ),
            child: const Text('Policy'),
          )
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomRight,
          end: Alignment.topLeft,
          colors: [
            Color.fromRGBO(122, 162, 255, 1),
            Color.fromRGBO(51, 112, 255, 1),
          ],
        )),
        child: Center(
          child: Text('aa'),
        ),
      )),
    );
  }
}
