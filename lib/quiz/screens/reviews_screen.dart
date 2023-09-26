
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../global/global_data.dart';
import '../global/gradient_decoration.dart';
import 'category_screen.dart';
import 'login_screen.dart';

class ReviewScreen extends StatelessWidget {
  final int index;
  final int score;
  const ReviewScreen({super.key, required this.index, required this.score});

  @override
  Widget build(BuildContext context) {
    double percentage =
        index < 0 ? (score / (index + 2)) * 100 : (score / (index + 1)) * 100;

    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: SafeArea(
        child: Scaffold(
            bottomNavigationBar: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              decoration: const BoxDecoration(
                color: Color(0xFFE1F1FF),
              ),
              child: Column(
                children: [
                  const Divider(
                    thickness: 1,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: Colors.grey,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CategoryScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Try again',
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            elevation: 0.0,
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10.0, vertical: 17),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ),
                            );
                          },
                          child: Text(
                            'Go to login',
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            body: Container(
                decoration: blueGradient,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        '$score out of ${index + 1} are correct',
                        style: GoogleFonts.quicksand(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 5),
                      decoration: const BoxDecoration(
                        color: Color(0xFFE1F1FF),
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(children: <Widget>[
                          CircularPercentIndicator(
                            radius: 85.0,
                            lineWidth: 10.0,
                            percent: percentage / 100,
                            center: Text(
                              "${double.parse(percentage.toStringAsFixed(2))}%",
                              style: TextStyle(
                                fontSize: 18,
                              ),
                            ),
                            progressColor: Theme.of(context).primaryColor,
                          ),
                          Text(
                            'Congratulations',
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          Text(
                            'You have got $score Points',
                            style: GoogleFonts.quicksand(
                              textStyle: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Wrap(alignment: WrapAlignment.center, children: [
                            for (int i = 0; i < (index + 1); i++)
                              if (numbers[i] == 0)
                                Padding(
                                  padding: EdgeInsets.all(.01),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 232, 65, 53),
                                    radius: 25,
                                    child: Text(
                                      '${i + 1}',
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              else
                                Padding(
                                  padding: EdgeInsets.all(.01),
                                  child: CircleAvatar(
                                    backgroundColor:
                                        const Color.fromARGB(255, 70, 162, 73),
                                    radius: 25,
                                    child: Text(
                                      '${i + 1}',
                                      style: GoogleFonts.quicksand(
                                        textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 17,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          ])
                        ]),
                      ),
                    )),
                  ],
                ))),
      ),
    );
  }
}

Future<bool> _onBackPressed(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text('Are you sure?'),
      content: const Text('Do you want to go back to the category section?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No',style: TextStyle(color:Color(0xFFFF7A00))),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes',style: TextStyle(color:Color(0xFFFF7A00))),
        ),
      ],
    ),
  ).then((value) => value ?? false);
}
