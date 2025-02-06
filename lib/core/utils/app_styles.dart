import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppStyles {
  // Utility method to create styles
  static TextStyle _createStyle({
    required String fontFamily,
    required double fontSize,
    required FontWeight fontWeight,
  }) {
    return GoogleFonts.getFont(
      fontFamily,
      fontSize: fontSize.sp,
      fontWeight: fontWeight,
    );
  }

  // Roboto Font
  static final roboto10SemiBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.w600,
  );
  static final roboto10Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 10,
    fontWeight: FontWeight.w400,
  );
  static final roboto11Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 11,
    fontWeight: FontWeight.w400,
  );
  static final roboto11Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 11,
    fontWeight: FontWeight.w700,
  );
  static final roboto12Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w400,
  );
  static final roboto12Medium = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 12,
    fontWeight: FontWeight.w500,
  );
  static final roboto13Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 13,
    fontWeight: FontWeight.w700,
  );
  static final roboto14Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w400,
  );
  static final roboto14Medium = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w500,
  );
  static final roboto14SemiBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static final roboto15SemiBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 15,
    fontWeight: FontWeight.w600,
  );
  static final roboto16Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w400,
  );
  static final roboto16Medium = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final roboto18SemiBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w600,
  );
  static final roboto18Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w400,
  );
  static final roboto18Medium = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static final roboto20Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w400,
  );
  static final roboto20SemiBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w600,
  );
  static final roboto20Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static final roboto20Medium = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
  static final roboto24Regular = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w400,
  );
  static final roboto24Medium = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
  static final roboto24SemiBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w600,
  );
  static final roboto24Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 24,
    fontWeight: FontWeight.w700,
  );
  static final roboto26Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 26,
    fontWeight: FontWeight.w700,
  );
  static final roboto32Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    fontWeight: FontWeight.w700,
  );
  static final roboto32SeminBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    fontWeight: FontWeight.w600,
  );

  static final roboto32Medium = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 32,
    fontWeight: FontWeight.w500,
  );
  static final roboto36SemiBold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 36,
    fontWeight: FontWeight.w600,
  );
  static final roboto36Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 36,
    fontWeight: FontWeight.w700,
  );
  static final roboto40Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 40,
    fontWeight: FontWeight.w700,
  );
  static final roboto48Bold = _createStyle(
    fontFamily: 'Roboto',
    fontSize: 48,
    fontWeight: FontWeight.w700,
  );

  // Rubik Font
  static final rubik14Light = _createStyle(
    fontFamily: 'Rubik',
    fontSize: 14,
    fontWeight: FontWeight.w300,
  );
  static final rubik16Medium = _createStyle(
    fontFamily: 'Rubik',
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );
  static final rubik18Medium = _createStyle(
    fontFamily: 'Rubik',
    fontSize: 18,
    fontWeight: FontWeight.w500,
  );
  static final rubik20Medium = _createStyle(
    fontFamily: 'Rubik',
    fontSize: 20,
    fontWeight: FontWeight.w500,
  );
}
