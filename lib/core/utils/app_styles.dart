import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  // textStyle + Size + Weight
  // 18
  static final roboto18SemiBold = GoogleFonts.roboto(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
  );
  static final roboto18Regular = GoogleFonts.roboto(
    fontSize: 18.sp,
    fontWeight: FontWeight.w400,
  );
  // 10
  static final roboto10SemiBold = GoogleFonts.roboto(
    fontSize: 10.sp,
    fontWeight: FontWeight.w600,
  );
  // 12
  static final roboto12Regular = GoogleFonts.roboto(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  // 32
  static final roboto32Bold = GoogleFonts.roboto(
    fontSize: 32.sp,
    fontWeight: FontWeight.w700,
  );
  // 36
  static final roboto36SemiBold = GoogleFonts.roboto(
    fontSize: 36.sp,
    fontWeight: FontWeight.w600,
  );
  // 48
  static final roboto48Bold = GoogleFonts.roboto(
    fontSize: 48.sp,
    fontWeight: FontWeight.w700,
  );
  // 40
  static final roboto40Bold = GoogleFonts.roboto(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
  );
  // 24
  static final roboto24Regular = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w400,
  );
  static final roboto24SemiBold = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w600,
  );
  static final roboto24Bold = GoogleFonts.roboto(
    fontSize: 24.sp,
    fontWeight: FontWeight.w700,
  );

  // 20
  static final roboto20Regular = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w400,
  );
  static final roboto20Bold = GoogleFonts.roboto(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );
  // 16
  static final roboto16Regular = GoogleFonts.roboto(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
  );
  // 14
  static final roboto14Regular = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );
  static final roboto14SemiBold = GoogleFonts.roboto(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
  );
  // 26
  static final roboto26Bold = GoogleFonts.roboto(
    fontSize: 26.sp,
    fontWeight: FontWeight.w700,
  );

  // rubic font
  static final rubik16Medium = GoogleFonts.rubik(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );
  static final rubik14Light = GoogleFonts.rubik(
    fontSize: 14.sp,
    fontWeight: FontWeight.w300,
  );
  static final rubik18Medium = GoogleFonts.rubik(
    fontSize: 18.sp,
    fontWeight: FontWeight.w500,
  );
  static final rubik20Medium = GoogleFonts.rubik(
    fontSize: 20.sp,
    fontWeight: FontWeight.w500,
  );
}
