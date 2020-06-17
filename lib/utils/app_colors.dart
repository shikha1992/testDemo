import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



//define color codes to be used throughout app........
class AppColors {
  static const colorWhite     = Color(0xffffffff);
  static const colorBlack     = Color(0xff000000);

}


class Style {
  static var topOrderStyle = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  static var middleStyleSel = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.white,
    fontStyle: FontStyle.normal,
  );

  static var middleStyleUnSel = GoogleFonts.lato(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    color: Colors.orange,
    fontStyle: FontStyle.normal,
  );

  static var instantStyle = GoogleFonts.lato(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Colors.black,
    fontStyle: FontStyle.normal,
  );
}