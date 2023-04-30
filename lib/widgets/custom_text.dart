import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Wrapper widget for [Text] to support custom [GoogleFonts.caveat] font
class CustomText extends StatelessWidget {
  const CustomText(this.text,{Key? key, this.style}) : super(key: key);
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.caveat(textStyle: style), textAlign: TextAlign.start,);
  }
}
