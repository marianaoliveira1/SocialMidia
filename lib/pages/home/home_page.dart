import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/controller/auth_controller.dart';
import 'package:socialmidia/pages/home/widgtes/input_digitar_texto.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/wall_post.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final authService = Get.find<AuthController>();

    final currentUser = FirebaseAuth.instance.currentUser;

    final textController = TextEditingController();

    return Scaffold(
      backgroundColor: DefaultColors.preto,
      appBar: AppBar(
        title: Text(
          "The Wall",
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
                stream: FirebaseFirestore.instance.collection('User Posts').orderBy("Timestamp", descending: false).snapshots(),
                builder: (context, snapshots) {
                  if (snapshots.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final posts = snapshots.data!.docs;
                        return WallPost();
                      },
                    );
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
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
              child: InputDigitarTexto(textController: textController),
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
