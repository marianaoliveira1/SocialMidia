import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';

class DefaultTitlePrincipal extends StatelessWidget {
  final String text;
  const DefaultTitlePrincipal({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: DefaultColors.branco,
        fontSize: 30.sp,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
