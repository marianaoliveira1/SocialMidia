import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/controller/auth_controller.dart';
import 'package:socialmidia/utils/colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthController>();

    final currentUser = FirebaseAuth.instance.currentUser;

    final textController = TextEditingController();

    void pstMessage() {}

    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "The Wall",
          style: GoogleFonts.raleway(
            color: DefaultColors.branco,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: Colors.grey[900],
        actions: [
          IconButton(
            onPressed: authService.signOut,
            icon: const Icon(
              Icons.logout,
              color: DefaultColors.branco,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 15,
                bottom: 5,
                right: 20,
                left: 20,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                        filled: true,
                        fillColor: Theme.of(context).colorScheme.primary,
                        hintStyle: TextStyle(
                          color: Colors.grey[500],
                        ),
                        hintText: 'Digite o que esta pensando',
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: pstMessage,
                    icon: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
            Text(
              currentUser!.email!,
              style: GoogleFonts.raleway(
                color: DefaultColors.preto,
                fontSize: 13.sp,
                fontWeight: FontWeight.w300,
              ),
            )
          ],
        ),
      ),
    );
  }
}
