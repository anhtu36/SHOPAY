import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class InputField extends StatelessWidget {
  final Size size;
  final TextEditingController text;
  final String hint;
  final bool obscureText;
  const InputField(
      {super.key,
      required this.size,
      required this.text,
      required this.hint,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height / 14,
      width: size.width / 1.2,
       padding: EdgeInsets.symmetric(horizontal: size.width / 13),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(40),
      ),
      child: Container(
        width: size.width / 1.5,
        child: Center(
          child: TextField(
            controller: text,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: hint,
              hintStyle: GoogleFonts.quicksand(color: Colors.grey),
            ),
          ),
        ),
      ),
    );
  }
}
