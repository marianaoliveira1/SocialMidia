import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class DefaultButtonIcon extends StatelessWidget {
  void Function()? onTap;
  final IconData? icon;
  DefaultButtonIcon({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: Colors.grey,
        size: 18.h,
      ),
    );
  }
}
