import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

class DefaultUserEmail extends StatelessWidget {
  const DefaultUserEmail({
    super.key,
    required this.currentUser,
  });

  final User? currentUser;

  @override
  Widget build(BuildContext context) {
    return Text(
      currentUser!.email!,
      style: GoogleFonts.poppins(
        color: DefaultColors.branco,
        fontSize: 13.sp,
        fontWeight: FontWeight.w300,
      ),
      textAlign: TextAlign.center,
    );
  }
}
