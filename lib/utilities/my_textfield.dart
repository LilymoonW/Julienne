import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTextField extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureText;

  const MyTextField(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.obscureText});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText:
          obscureText, //if it hides the text, if it is a password it will hide text
      textCapitalization: TextCapitalization.none,
      textInputAction: TextInputAction.next,
    
      decoration: InputDecoration(
        labelText: hintText,
        //what color is the hint text
        labelStyle: GoogleFonts.redHatMono(
          color: const Color(0xFF87A687),
          letterSpacing: 0,
        ),
        //normally green
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF88A28B),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
    
        //clicked on the color will be darker
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(0xFF2D5F32),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
    
        //color of background
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.all(24),
        hintText: hintText,
      ),
      //style of text
      style: GoogleFonts.redHatMono(
        color: const Color(0xFF2D5F32),
        letterSpacing: 0,
      ),
      //Type of input
      keyboardType: TextInputType.name,
      cursorColor: const Color(0xFF2D5F32),
     /* inputFormatters: [
        FilteringTextInputFormatter.allow(RegExp('[a-zA-Z]'))
      ],
      */
    );
  }
}
