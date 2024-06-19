import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class MyButton2 extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;
  final double width;
  final double height;

  const MyButton2({
    Key? key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.onPressed,
    required this.width,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        //creates rounded edges
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        //sets color of button
        backgroundColor: buttonColor,
        minimumSize: Size(width, height),
      ),

      //formates the text of button
      child: Text(text,
          style: GoogleFonts.redHatDisplay(
            textStyle: TextStyle(
              color: textColor,
              fontSize: 30,
              letterSpacing: 0,
              fontWeight: FontWeight.w300,
            ),
          )),
    );
  }
}