import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';

class DefaultComment extends StatelessWidget {
  final String text;
  final String user;
  final String time;
  const DefaultComment({
    super.key,
    required this.text,
    required this.user,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: DefaultColors.backgroundComment,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.all(10.sp),
      child: Column(
        children: [
          Text(
            text,
            style: GoogleFonts.poppins(
              color: DefaultColors.branco,
              fontSize: 14.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                user,
                style: GoogleFonts.poppins(
                  color: DefaultColors.branco.withOpacity(
                    .6,
                  ),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                " - ",
                style: GoogleFonts.poppins(
                  color: DefaultColors.branco.withOpacity(
                    .6,
                  ),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Text(
                time,
                style: GoogleFonts.poppins(
                  color: DefaultColors.branco.withOpacity(
                    .6,
                  ),
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
