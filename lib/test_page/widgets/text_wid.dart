

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CommonText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign? alignment;
  final TextDecoration? decoration;
  const CommonText({
    super.key,
    required this.text,
    this.size = 12,
    this.fontWeight = FontWeight.w500,
    this.color = Colors.black,
    this.alignment, this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      
      text,
      textAlign: alignment,
      style: TextStyle(
        decoration: decoration,
        color: color,
        fontWeight: FontWeight.w700,
        fontSize: size.sp,
      ),
    );
  }
}
