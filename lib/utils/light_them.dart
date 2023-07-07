

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kgreyContainer = Color(0xFFD9D9D9);
const Color kscaffoldBackground = Color(0xFFF3F3F3);
const Color kwhiteContainer = Color(0xFFFFFFFF);
const Color kprimaryColor = Color(0xFF2DC0BE);
const Color kblueColor = Color(0xFF0094FF);
const Color kblackColor = Color(0xFF000000);

ThemeData light = ThemeData(
  fontFamily: GoogleFonts.nunito().fontFamily,
  scaffoldBackgroundColor: kscaffoldBackground,
  primaryColor: kprimaryColor,
  secondaryHeaderColor: kblackColor,
  hintColor: kgreyContainer,
  dividerColor: kgreyContainer

);

ThemeData dark = ThemeData(
  fontFamily: GoogleFonts.nunito().fontFamily,
  scaffoldBackgroundColor: const Color(0xFF1A1721),
  primaryColor: kprimaryColor,
  secondaryHeaderColor: kwhiteContainer,
  hintColor: kgreyContainer,
  dividerColor: kgreyContainer

);