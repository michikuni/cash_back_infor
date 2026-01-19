import 'package:cash_back_infor/features/theme/color_theme.dart';
import 'package:flutter/material.dart';

extension TextStyleDecoration on TextStyle {
  //Home
  TextStyle get homeAppBarTitle =>
      copyWith(color: AppColor.darkCharcoal, fontWeight: FontWeight.w900);
  TextStyle get homeActiveCodeTextButton => copyWith(
    decoration: TextDecoration.underline,
    decorationColor: AppColor.vividBlue,
    color: AppColor.vividBlue,
  );
  TextStyle get homeAddTextButton => copyWith(
    color: AppColor.lightGrey);
  TextStyle get homeUserCardText => copyWith(
    color: AppColor.darkCharcoal);

  //Signin
  TextStyle get signinActiveCodeText => copyWith(
    color: AppColor.slateGrey);
  TextStyle get signinActiveCodeTextButton => copyWith(
    color: AppColor.vividBlue,
    decoration: TextDecoration.underline,
    decorationColor: AppColor.vividBlue,
  );
  TextStyle get signinHintText =>
      copyWith(color: AppColor.mediumGrey);
  TextStyle get signinErrorText => copyWith(
    color: AppColor.brightRed);
  TextStyle get signinIdText => copyWith(
    color: AppColor.mediumGrey);
  TextStyle get signinForgotPasswordText => copyWith(
    color: AppColor.slateGrey);

  // Signup/BirthSelection
  TextStyle get signupBirthText => copyWith(
    color: AppColor.ebonyGrey);

  //Signup/EnglishLevel
  TextStyle get signupEnglishLevelText => copyWith(
    color: AppColor.ebonyGrey);

  //Signup/Load
  TextStyle get signupLoadTitleText => copyWith(
    color: AppColor.ebonyGrey);
  TextStyle get signupLoadText => copyWith(
    color: AppColor.skyBlue);

  //Signup/Welcome
  TextStyle get signupWelcomeText => copyWith(
    color: AppColor.skyBlue);
}
