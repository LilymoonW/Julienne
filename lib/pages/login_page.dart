import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/utilities/my_button2.dart';
import 'package:pomodoro/utilities/my_divider.dart';
import 'package:pomodoro/utilities/my_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();

  //displays error message

  //sign user in
  void signUserIn() async {
    //show a loading screen
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2D5F32))),
          );
        });
    // tries logging in user, if user is not found display error messages
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      Navigator.pop(context);
      //if user is not found.
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      if (e.code == 'user-not-found') {
        //displays error message
        print('user is wrong');
        //if password is wrong
      } else if (e.code == 'wrong-password') {
        //displays error message
        print('password is wrong');
      }
    }
  }

// displays error messages
  void errorMsgUser() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('No user found for that email.'),
          );
        });
  }

  // displays error messages
  void errorMsgPassword() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Wrong password provided for that user.'),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //app bar with back feature
      appBar: AppBar(
        backgroundColor: Color(0xFFFAF9F6),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: Color(0xFF2D5F32), size: 30, weight: 4),
          onPressed: () {
            Navigator.of(context)
                .pop(); // This will pop the current page off the navigation stack
          },
        ),
      ),

      //the screen
      backgroundColor: Color(0xFFFAF9F6),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // welcome text
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Align(
                    alignment: AlignmentDirectional(-1, 0),
                    child: Text(
                      'Log In.',
                      textAlign: TextAlign.start,
                      style: GoogleFonts.peddana(
                        color: Color(0xFF2D5F32),
                        fontSize: 85,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),

                //gap
                const SizedBox(
                  height: 25,
                ),

                //input userLoginPage
                MyTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  obscureText: false,
                ),

                //gap
                const SizedBox(
                  height: 15,
                ),

                // input password
                MyTextField(
                  hintText: 'Password',
                  controller: _passwordController,
                  obscureText: true,
                ),

                //gap
                const SizedBox(
                  height: 10,
                ),

                //forgot password
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 25.0),
                      child: Text(
                        "Forgot Password?",
                        style:
                            TextStyle(color: Color(0xFF2D5F32), fontSize: 15),
                      ),
                    ),
                  ],
                ),

                //gap
                const SizedBox(height: 15),

                // button Sign in
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MyButton2(
                        text: 'Log in',
                        textColor: Colors.white,
                        buttonColor: Color(0xFF88A28B),
                        onPressed: signUserIn,
                        width: 150,
                        height: 50)
                  ],
                ),

                //gap
                const SizedBox(height: 25),

                //Divider and text
                MyDivider(),

                //gap
                //const SizedBox(height: 25),
                /*
                //Icons
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SquareTile(imagePath: 'lib/images/Google.png'),
                    SizedBox(width: 20),
                    SquareTile(imagePath: 'lib/images/apple.png'),
                  ],
                ),

                //gap
                const SizedBox(height: 20),
                //Text
                const Text(
                  "Don't Have an account? Register Now",
                  style: TextStyle(
                      color: Color(0xFF2D5F32),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                )
                */
              ],
            ),
          ),
        ),
      ),
    );
  }
}
