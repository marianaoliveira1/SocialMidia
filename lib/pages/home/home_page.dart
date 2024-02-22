import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/default_drawer.dart';
import 'package:socialmidia/widget/wall_post.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    final textController = TextEditingController();

    void postMessage() {
      if (textController.text.isNotEmpty) {
        FirebaseFirestore.instance.collection('User Posts').add({
          'Message': currentUser!.email,
          'UserEmail': textController.text,
          'TimeStamp': DateTime.now(),
          'Likes': [],
        });
        textController.clear();
      }
      setState(() {
        textController.clear();
      });
    }

    return Scaffold(
      backgroundColor: DefaultColors.preto,
      appBar: AppBar(
        title: Text(
          "Inicio",
          style: GoogleFonts.poppins(
            color: DefaultColors.branco,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: DefaultColors.background,
      ),
      drawer: const DefaultDrawer(),
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
                          user: post['UserEmail'],
                          message: post['Message'],
                          postId: post.id,
                          likes: List<String>.from(post['Likes'] ?? []),
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
              padding: EdgeInsets.only(
                top: 15.h,
                bottom: 5.h,
                right: 20.h,
                left: 20.h,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      style: GoogleFonts.poppins(
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
                    onPressed: postMessage,
                    icon: const Icon(Icons.arrow_forward_ios),
                  )
                ],
              ),
            ),
            Text(
              currentUser!.email!,
              style: GoogleFonts.poppins(
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
