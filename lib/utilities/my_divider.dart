import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDivider extends StatelessWidget {
  const MyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Color(0xFF2D5F32),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: Text(
                  "Or continue with",
                  style: GoogleFonts.redHatDisplay(
                      fontSize: 16, color: Color(0xFF2D5F32)),
                ),
              ),
              Expanded(
                child: Divider(
                  thickness: 1,
                  color: Color(0xFF2D5F32),
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          MyButton3(
              text: 'Continue with Google',
              buttonColor: Color(0xFF88A28B),
              imagePath: 'lib/images/Google.png',
              onPressed: () {}),
          const SizedBox(height: 15),
          MyButton3(
              text: 'Continue with Apple',
              buttonColor: Color(0xFF88A28B),
              imagePath: 'lib/images/apple.png',
              onPressed: () {}),
        ],
      ),
    );
  }
}

class MyButton3 extends StatelessWidget {
  final String text;
  final Color buttonColor;
  final String imagePath;
  final VoidCallback onPressed;

  const MyButton3({
    Key? key,
    required this.text,
    required this.buttonColor,
    required this.imagePath,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        //creates rounded edges
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(
            color: buttonColor,
            width: 2,
          ),
        ),
        elevation: 2,

        //sets color of button
        backgroundColor: Color(0xFFFAF9F6),
        minimumSize: Size(250, 55),
      ),

      //formates the text of button
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image.asset(
            imagePath,
            width: 25,
          ),
          Text(text,
              style: GoogleFonts.redHatDisplay(
                textStyle: TextStyle(
                  color: buttonColor,
                  fontSize: 18,
                  letterSpacing: 0,
                  fontWeight: FontWeight.bold,
                ),
              )),
        ],
      ),
    );
  }
}
