import 'package:flutter/material.dart';

import 'login_page.dart';
import 'sign_up.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  // initially, show login page
  bool showlogin = true;

  // toggle between Login and Register Page
  void togglePages() {
    setState(() {
      showlogin = !showlogin;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showlogin) {
      return LoginPage(onTap: togglePages);
    } else {
      return SignUpPage(onTap: togglePages,);
    }
  }
}
