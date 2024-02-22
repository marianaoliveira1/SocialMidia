// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:socialmidia/utils/colors.dart';

class DefaultTextBox extends StatelessWidget {
  final String text;
  final String sectionName;
  void Function()? onPressed;
  DefaultTextBox({
    Key? key,
    required this.text,
    required this.sectionName,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.r,
        ),
        color: DefaultColors.background,
      ),
      margin: EdgeInsets.symmetric(
        vertical: 10.h,
        horizontal: 20.w,
      ),
      padding: EdgeInsets.only(
        left: 15.w,
        bottom: 15.h,
        top: 15.h,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                sectionName,
                style: GoogleFonts.poppins(
                  fontSize: 14.sp,
                  color: DefaultColors.branco.withOpacity(.8),
                ),
              ),
              IconButton(
                onPressed: onPressed,
                icon: Icon(
                  Icons.settings,
                  color: Colors.grey[400],
                ),
              )
            ],
          ),
          Text(
            text,
            style: GoogleFonts.poppins(
              color: DefaultColors.branco,
              fontSize: 16.sp,
            ),
          ),
        ],
      ),
    );
  }
}
