import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pomodoro/pages/main_page.dart';
import 'package:pomodoro/utilities/my_button.dart';

class TimerPage extends StatefulWidget {
  const TimerPage({super.key});
  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
// variable
  int timeLeft = 30;
  int timeTotal = 30;

  // timer method
  void _startCountDown() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timeLeft > 0) {
        setState(() {
          timeLeft--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _setTime() {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext context) {
          return Container(
              height: 200,
              width: 600,
              color: CupertinoColors.extraLightBackgroundGray,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // item picker four the hours
                      Expanded(
                        child: CupertinoPicker.builder(
                          itemExtent: 40,
                          // limits the count to 60
                          childCount: 60,
                          scrollController: FixedExtentScrollController(
                              initialItem: timeTotal - 1),
                          onSelectedItemChanged: (value) {
                            setState(() {
                              timeLeft = value + 1;
                              timeTotal = value + 1;
                            });
                          },
                          itemBuilder: (context, index) {
                            // Adjust index to start from 1
                            int displayIndex = index + 1;
                            // Return text widget displaying the index
                            return Center(child: Text('$displayIndex' '  hrs'));
                          },
                        ),
                      ),
                    ],
                  )
                ],
              ));
        });
  }

  void _signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 153, 182, 205),
      appBar: AppBar(actions: [
        IconButton(onPressed: _signUserOut, icon: const Icon(Icons.logout)),
      ]),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: SizedBox(
              width: 200,
              height: 200,
              // overlays the circle progress bar and the number countdown
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Center(
                      //counter
                      child: Text(
                    timeLeft == 0 ? 'DONE' : timeLeft.toString(),
                    style: const TextStyle(fontSize: 60, color: Colors.white),
                  )),
                  //circular progress indicator
                  CircularProgressIndicator(
                    value: timeLeft / timeTotal,
                    valueColor: const AlwaysStoppedAnimation(Colors.white),
                    strokeWidth: 12,
                  ),
                ],
              ),
            ),
          ),
          // start timer button
          MaterialButton(
              onPressed: _startCountDown,
              color: const Color.fromARGB(255, 42, 61, 77),
              child: const Text(
                'S t a r t   T i m e r',
                style: TextStyle(fontSize: 20, color: Colors.white),
              )),
          //set time button
          MyButton(
              name: "S E T  T I M E",
              color: const Color.fromARGB(255, 42, 61, 77),
              onPressed: () {
                _setTime();
              }),
          MyButton(
              name: " Home Page ",
              color: const Color.fromARGB(255, 42, 61, 77),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MainPage()),
                );
              }),
        ]),
      ),
    );
  }
}
