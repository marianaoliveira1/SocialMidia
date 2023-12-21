import 'package:flutter/material.dart';
import 'package:socialmidia/widget/default_gradiend.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          DefaultGradientBackground(),
          Column()
        ],
      ),
    );
  }
}
