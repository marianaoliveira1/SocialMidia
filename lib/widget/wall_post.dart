import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';

class WallPost extends StatelessWidget {
  final String message;
  final String user;

  const WallPost({
    super.key,
    required this.message,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.background,
        borderRadius: BorderRadius.circular(
          10.r,
        ),
      ),
      margin: EdgeInsets.only(
        top: 25.h,
        left: 25.h,
        right: 25.h,
      ),
      padding: EdgeInsets.all(
        25.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            user,
            style: GoogleFonts.raleway(
              color: DefaultColors.branco,
              fontSize: 16.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            message,
            style: GoogleFonts.raleway(
              color: DefaultColors.branco,
              fontSize: 12.sp,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
