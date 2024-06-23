import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pomodoro/utilities/my_goal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAF9F6),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFFAF9F6),
          title: Align(
            alignment: AlignmentDirectional(0, 0),
            child: Text(
              "Name's Kitchen",
              style:
                  GoogleFonts.peddana(fontSize: 36, color: Color(0xFF2D5F32)),
            ),
          )),
      body: ListView(
        scrollDirection: Axis.vertical,
        children: [
          //a single goal looks like
          MyGoal(),
          MyGoal(),
        ],
      ),
    );
  }
}
