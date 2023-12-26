import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:socialmidia/pages/home/home_page.dart';
import 'package:socialmidia/services/auth/login_our_register.dart';

class AuthGade extends StatefulWidget {
  const AuthGade({super.key});

  @override
  State<AuthGade> createState() => _AuthGadeState();
}

class _AuthGadeState extends State<AuthGade> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else {
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
