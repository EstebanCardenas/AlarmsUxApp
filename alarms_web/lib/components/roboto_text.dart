import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RobotoText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const RobotoText({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.roboto(textStyle: style));
  }
}
