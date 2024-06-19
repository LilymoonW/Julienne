import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/utilities/my_button2.dart';
import 'package:pomodoro/utilities/my_divider.dart';
import 'package:pomodoro/utilities/my_textfield.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({super.key});

  @override
  Widget build(BuildContext context) {
    final _passwordController = TextEditingController();
    final _emailController = TextEditingController();
    final _nameController = TextEditingController();
    final _passwordConfirmController = TextEditingController();

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
                      onPressed: () {},
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
