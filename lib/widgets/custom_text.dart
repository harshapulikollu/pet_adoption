import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  const CustomText(this.text,{Key? key, this.style}) : super(key: key);
  final String text;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.caveat(textStyle: style),);
  }
}
