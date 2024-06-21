import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/pages/timer_page.dart';
import 'package:pomodoro/utilities/my_button2.dart';
import 'package:pomodoro/utilities/my_divider.dart';
import 'package:pomodoro/utilities/my_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _passwordConfirmController = TextEditingController();

  void signUp() async {
    showDialog(
        context: context,
        builder: (context) {
          return const Center(
            child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2D5F32))),
          );
        });

    try {
      if (_passwordController.text != _passwordConfirmController.text) {
        throw Exception('Password-Not-Equal');
      }

      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );
      Navigator.pop(context);
      
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TimerPage()),
      );
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      errorMsg(e.code);
    }
  }

  void errorMsg(String msg) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: Color(0xFF2D5F32),
            title: Center(
                child: Text(
              msg,
              style: TextStyle(color: Colors.white),
            )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Color(0xFFFAF9F6),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //title text "Sign Up"
              Padding(
                padding: const EdgeInsets.only(top: 2),
                child: Align(
                  alignment: AlignmentDirectional(-1, 0),
                  child: Text(
                    'Sign Up.',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.peddana(
                      color: Color(0xFF2D5F32),
                      fontSize: 85,
                      letterSpacing: 2,
                    ),
                  ),
                ),
              ),

              // enter information

              //name
              MyTextField(
                  hintText: 'Name',
                  controller: _nameController,
                  obscureText: false),

              const SizedBox(
                height: 15,
              ),
              //email
              MyTextField(
                  hintText: 'Email',
                  controller: _emailController,
                  obscureText: false),

              const SizedBox(
                height: 15,
              ),
              //password
              MyTextField(
                  hintText: 'Password',
                  controller: _passwordController,
                  obscureText: true),

              const SizedBox(
                height: 15,
              ),
              //Confirm Password
              MyTextField(
                  hintText: 'Confirm Password',
                  controller: _passwordConfirmController,
                  obscureText: true),
              const SizedBox(
                height: 25,
              ),

              //submit button
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  MyButton2(
                      text: 'Sign Up',
                      textColor: Colors.white,
                      buttonColor: Color(0xFF88A28B),
                      onPressed: signUp,
                      width: 150,
                      height: 50)
                ],
              ),
              //gap
              const SizedBox(height: 25),
              MyDivider(),

              // or sign up with..
            ],
          ),
        ),
      )),
    );
  }
}
