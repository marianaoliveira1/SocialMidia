import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/default_user_email.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      backgroundColor: DefaultColors.preto,
      appBar: AppBar(
        backgroundColor: DefaultColors.background,
        title: Text(
          'Perfil',
          style: GoogleFonts.poppins(
            color: DefaultColors.branco,
            fontSize: 18.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 50.h,
          ),
          Icon(
            Icons.person,
            size: 72.h,
            color: DefaultColors.branco,
          ),
          DefaultUserEmail(currentUser: currentUser),
        ],
      ),
    );
  }
}
