import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';

class DefaultTextField extends StatelessWidget {
  const DefaultTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
      child: TextField(
        style: GoogleFonts.raleway(
          color: DefaultColors.branco,
          fontSize: 20.sp,
        ),
        decoration: InputDecoration(
          labelText: "exemplo@email.com",
          labelStyle: GoogleFonts.raleway(
            color: DefaultColors.branco,
            fontSize: 16.sp,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: const BorderSide(color: DefaultColors.branco),
          ),
        ),
      ),
    );
  }
}
