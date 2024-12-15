import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  // textStyle + Size + Weight
  // 32
  static final textStyle32B = GoogleFonts.roboto(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
  );
  // 36
  static final textStyle36SB = GoogleFonts.roboto(
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
  );
  // 48
  static final textStyle48B = GoogleFonts.roboto(
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
  );
  // 40
  static final textStyle40B = GoogleFonts.roboto(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
  );
  // 24
  static final textStyle24R = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );
  static final textStyle24SB = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
  static final textStyle24B = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  // 20
  static final textStyle20R = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
  static final textStyle20B = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  // 16
  static final textStyle16R = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  // 14
  static final textStyle14R = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final textStyle14SB = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  // 26
  static final textStyle26B = GoogleFonts.roboto(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
  );
}
