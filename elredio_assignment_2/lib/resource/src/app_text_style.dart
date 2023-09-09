import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../resource.dart';

class AppTextStyle {
  ///
  static TextStyle questionTextStyle = GoogleFonts.poppins(
    fontSize: 28.0,
    color: AppColors.questionColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle appBarTextStyle = GoogleFonts.roboto(
    fontSize: 16.0,
    color: AppColors.black,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle blueTextStyle = GoogleFonts.roboto(
    fontSize: 16.0,
    color: AppColors.darkBlue,
    fontWeight: FontWeight.w600,
  );

  ///
  static TextStyle cameraGalleryTextStyle = GoogleFonts.poppins(
    fontSize: 14.0,
    color: AppColors.black,
    fontWeight: FontWeight.w400,
  );

  ///
  static TextStyle headingWhiteTextStyle = GoogleFonts.poppins(
    fontSize: 30.0,
    color: AppColors.headerColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle smallWhiteTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.headerColor,
    fontWeight: FontWeight.w400,
  );

  ///
  static TextStyle bigWhiteTextStyle = GoogleFonts.roboto(
    fontSize: 34.0,
    color: AppColors.headerColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle smallBlackTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.paleBlack,
    fontWeight: FontWeight.w400,
  );

  ///
  static TextStyle blackTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.paleBlack,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle buttonTextStyle = GoogleFonts.cabin(
    fontSize: 20.0,
    color: AppColors.white,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle redButtonTextStyle = GoogleFonts.cabin(
    fontSize: 20.0,
    color: AppColors.enabledButtonColor,
    fontWeight: FontWeight.w500,
  );

  ///
  static TextStyle hintTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.hintTextColor,
    fontWeight: FontWeight.w400,
  );

  ///
  static TextStyle textfieldTextStyle = GoogleFonts.poppins(
    fontSize: 16.0,
    color: AppColors.textfieldTextColor,
    fontWeight: FontWeight.w400,
  );

  ///
  static TextStyle underLineTextStyle = GoogleFonts.poppins(
      fontSize: 16.0,
      color: AppColors.textfieldTextColor,
      fontWeight: FontWeight.w400,
      decoration: TextDecoration.underline);
}
