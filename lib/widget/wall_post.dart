import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:socialmidia/utils/colors.dart';
import 'package:socialmidia/widget/like_button.dart';

class WallPost extends StatefulWidget {
  final String message;
  final String user;

  const WallPost({
    super.key,
    required this.message,
    required this.user,
  });

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.message,
                  style: GoogleFonts.poppins(
                    color: DefaultColors.branco,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(
                  height: 7.h,
                ),
                Text(
                  widget.user,
                  style: GoogleFonts.poppins(
                    color: DefaultColors.branco,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w300,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Column(
            children: [
              LikeButton(
                isLiked: false,
                onTap: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
