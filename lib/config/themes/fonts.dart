import 'package:flutter/material.dart';
import 'package:test_app/config/themes/colors.dart';

abstract class AppFonts {
  static final appBar = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontSize: 18, 
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w500, 
    color: Colors.black
  );

  static final body = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w400, 
    fontSize: 16, 
    fontStyle: FontStyle.normal,
    color: Colors.black
  );

  static final bodyBold = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w500, 
    fontSize: 16, 
    fontStyle: FontStyle.normal,
    color: Colors.black
  );

  static final button = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w500, 
    fontSize: 16, 
    fontStyle: FontStyle.normal,
    color: Colors.black,
    letterSpacing: 0.1
  );

  static final hint = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w400, 
    fontSize: 17, 
    fontStyle: FontStyle.normal,
    color: AppColors.hint,
    letterSpacing: 0.17,
  );

  static final large = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w600, 
    fontSize: 30, 
    fontStyle: FontStyle.normal,
    color: Colors.black
  );

  static final title = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w500, 
    fontSize: 22, 
    fontStyle: FontStyle.normal,
    color: Colors.black
  );

  static final smallBold = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w500, 
    fontSize: 14, 
    fontStyle: FontStyle.normal,
    color: Colors.black
  );

  static final small = TextStyle(
    fontFamily: 'SF-Pro-Display', 
    fontWeight: FontWeight.w400, 
    fontSize: 14, 
    fontStyle: FontStyle.normal,
    color: AppColors.grey
  );
}