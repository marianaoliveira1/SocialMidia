import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';

class DefaultTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String labelText;
  final bool obscureText;
  final IconData? icon;

  const DefaultTextField({
    super.key,
    this.controller,
    required this.labelText,
    required this.obscureText,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h, top: 10.h),
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: GoogleFonts.raleway(
          color: DefaultColors.branco,
          fontSize: 20.sp,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          prefixIconColor: DefaultColors.branco,
          labelText: labelText,
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
