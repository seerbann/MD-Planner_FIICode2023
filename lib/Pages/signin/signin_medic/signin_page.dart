import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'medic_components.dart';

class SignInPage_medic extends StatefulWidget {
  const SignInPage_medic({super.key});

  @override
  State<SignInPage_medic> createState() => _SignInPage_medicState();
}

class _SignInPage_medicState extends State<SignInPage_medic> {
  @override
  Widget build(BuildContext context) {
    return const signinpagemedicComponent();
  }
}
