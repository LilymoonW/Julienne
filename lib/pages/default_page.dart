import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/pages/login_page.dart';
import 'package:pomodoro/pages/signup_page.dart';

class DefaultPage extends StatelessWidget {
  const DefaultPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF9F6),
      body: Padding(
        padding: const EdgeInsets.only(top: 50, bottom: 50),
        child: Column(
          children: [
            //title
            Align(
              alignment: const AlignmentDirectional(0, 0),
              //title
              child: Padding(
                padding: const EdgeInsets.only(left: 25, top: 75, right: 25),
                child: Text(
                  'Julienne.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.peddana(
                    textStyle: const TextStyle(
                      color: Color(0xFF2D5F32),
                      fontSize: 110,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),
            ),

            //Mascot cat
            Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(25, 25, 25, 0),
              child: Image.asset(
                'lib/images/chimaek.png',
                width: 250,
              ),
            ),

            // Buttons
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: CustomRoundedButton(
                text: 'Log In',
                textColor: Colors.white,
                buttonColor: const Color(0xFF88A28B),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 15),
              child: CustomRoundedButton(
                  text: 'Sign Up',
                  textColor: const Color(0xFF77917A),
                  buttonColor: const Color(0xFFD9E2DA),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

// creates a custom button for login and signup features
class CustomRoundedButton extends StatelessWidget {
  final String text;
  final Color textColor;
  final Color buttonColor;
  final VoidCallback onPressed;

  const CustomRoundedButton({
    super.key,
    required this.text,
    required this.textColor,
    required this.buttonColor,
    required this.onPressed,
  });

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
        minimumSize: const Size(300, 50),
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
