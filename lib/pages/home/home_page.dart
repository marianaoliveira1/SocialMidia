import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/controller/auth_controller.dart';

import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/wall_post.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthController>();

    final currentUser = FirebaseAuth.instance.currentUser;

    final textController = TextEditingController();

    void pstMessage() {
      if (textController.text.isNotEmpty) {
        FirebaseFirestore.instance.collection('User Posts').add({
          'Message': currentUser!.email,
          'UserEmail': textController.text,
          'Timestamp': DateTime.now(),
        });
        textController.clear();
      }
    }

    return Scaffold(
      backgroundColor: DefaultColors.preto,
      appBar: AppBar(
        title: Text(
          "Inicio",
          style: GoogleFonts.raleway(
            color: DefaultColors.branco,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: DefaultColors.background,
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
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore.instance.collection('User Posts').orderBy("TimeStamp", descending: false).snapshots(),
                builder: (context, snapshots) {
                  if (snapshots.hasData) {
                    return ListView.builder(
                      itemCount: snapshots.data!.docs.length,
                      itemBuilder: (context, index) {
                        final post = snapshots.data!.docs[index];
                        return WallPost(
                          message: post['Message'],
                          user: post['UserEmail'],
                        );
                      },
                    );
                  } else if (snapshots.hasError) {
                    return const Text("Erro ao carregar os dados");
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
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
                      style: GoogleFonts.raleway(
                        color: DefaultColors.branco,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w500,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: DefaultColors.background,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(
                            color: DefaultColors.background,
                          ),
                        ),
                        filled: true,
                        fillColor: DefaultColors.background,
                        hintStyle: const TextStyle(
                          color: DefaultColors.cinzaClaro,
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
                color: DefaultColors.branco,
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
