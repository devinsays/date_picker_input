import 'package:flutter/material.dart';

class Styles {

  static Color primary900 = Color(0xff2D2051);
  static Color primary800 = Color(0xff3B2F68);
  static Color primary700 = Color(0xff423974);
  static Color primary600 = Color(0xff4B4280);
  static Color primary500 = Color(0xff514A89);
  static Color primary400 = Color(0xff676499);
  static Color primary300 = Color(0xff807FAA);
  static Color primary200 = Color(0xffA2A3C3);
  static Color primary100 = Color(0xffC6C7DB);
  static Color primary50 = Color(0xffE8E9F0);
  static Color primary = primary900;

  static TextStyle defaultStyle = TextStyle(
    color: primary
  );

  static TextStyle p = defaultStyle.copyWith(
    fontSize: 14.0,
    height: 20 / 14,
  );

  static TextStyle label = defaultStyle.copyWith(
    fontSize: 14.0,
    fontWeight: FontWeight.w700,
  );

  static TextStyle formError = defaultStyle.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 11.0,
    height: 14 / 11,
    color: Colors.red,
  );

  static InputDecoration input = InputDecoration(
    fillColor: Colors.white,
    filled: true,
    focusColor: primary,
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        color: primary,
        width: 2.0,
      ),
    ),
    border: OutlineInputBorder(
      gapPadding: 1.0,
      borderSide: BorderSide(
        color: primary,
        width: 1.0,
      ),
    ),
    hintStyle: TextStyle(
      color: primary200,
    ),
  );
  
}
