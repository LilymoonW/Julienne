import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
          Stack(
            children: [
              //background box
              Padding(
                padding: EdgeInsets.only(top: 48, left: 24, right: 24),
                child: Container(
                  width: MediaQuery.sizeOf(context).width * 0.9,
                  height: 128,
                  decoration: BoxDecoration(
                    color: Color(0xFFC5D0C5), // Change the color here
                    borderRadius: BorderRadius.circular(
                        12), // Adjust the radius as needed
                  ),
                ),
              ),

              //info inside container

              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //the cat and the days left inside a col
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 2, 0),
                    child: Column(mainAxisSize: MainAxisSize.max, children: [
                      //cat image
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(2, 2, 2, 0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            'lib/images/chimaek.png', // Adjust the path to match your image asset
                            width: 110,
                            height: 110,
                            fit: BoxFit.contain,
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      // text countdown days
                      Text(
                        '28 Days Left',
                        style: GoogleFonts.redHatText(
                          color: Color(0xFF2D5F32), // dark green
                          letterSpacing: 0,
                          fontSize: 18,
                        ),
                      ),
                    ]),
                  ),

                  //box of information
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(8, 60, 0, 12),
                    //container that sits in the back
                    child: Container(
                      width: 200,
                      height: 104,
                      decoration: BoxDecoration(
                        color: Color(0xFFFAF9F6), // background color
                        borderRadius: BorderRadius.circular(12),
                      ),
                      alignment: AlignmentDirectional(0, 0),
                      child: Column(children: [
                        // the name of the goal
                        Padding(
                          padding:
                              EdgeInsetsDirectional.fromSTEB(12, 12, 12, 12),
                          child: Container(
                            width: 200,
                            height: 50,
                            child: Text(
                              'Study for midterms',
                              softWrap: true, // Allow text to wrap
                              textAlign: TextAlign.center,
                              style: GoogleFonts.redHatText(
                                color: Color(0xFF626B98),
                                letterSpacing: 0,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),

                        //progress bar
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(2, 0, 10, 2),
                          child: LinearProgressIndicator(
                            value: 0.5,
                            minHeight:
                                10, // Optional: Set minimum height for the progress indicator
                            backgroundColor: Colors
                                .grey[200], // Optional: Set background color
                            valueColor:
                                AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                        )
                      ]),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
