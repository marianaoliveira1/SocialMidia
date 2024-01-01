import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:socialmidia/controller/auth_controller.dart';
import 'package:socialmidia/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthController>();

    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        actions: [
          IconButton(
            onPressed: authService.signOut,
            icon: const Icon(
              Icons.logout,
              color: DefaultColors.preto,
            ),
          )
        ],
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
