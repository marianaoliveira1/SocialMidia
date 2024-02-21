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
    return Padding(
      padding: EdgeInsets.only(
        top: 15.h,
        bottom: 5.h,
        right: 20.h,
        left: 20.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            user,
            style: GoogleFonts.raleway(
              color: DefaultColors.branco,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            message,
            style: GoogleFonts.raleway(
              color: DefaultColors.branco,
              fontSize: 13.sp,
              fontWeight: FontWeight.w300,
            ),
          )
        ],
      ),
    );
  }
}
