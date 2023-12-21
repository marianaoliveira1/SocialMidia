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
          Container(
            margin: EdgeInsets.only(right: 20, left: 20),
            child: Column(
              children: [
                Text(
                  "fl,md ff",
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
