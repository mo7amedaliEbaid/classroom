
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global_data.dart';
import '../screens/quiz_screen.dart';

class CardCategory extends StatelessWidget {
  final String? images;
  final String testName;
  final String? brief;
  final int? numOfQuestions;
  final int time;

  final Map<String, List<dynamic>> qlist = {
    'Biology': biologyTest,
    'History': historyTest,
    'Maths': mathsTest
  };

  CardCategory(
      {Key? key,
      this.images,
      required this.testName,
      this.brief,
      this.numOfQuestions,
      required this.time})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => QuizScreen(
                      test: testName,
                      questionsList: qlist[testName] as List,
                      time: time,
                    )),
          );
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            children: [
              Row(
                children: [
                  Image.asset(
                    images!,
                    width:
                        80

                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          testName,
                          style: GoogleFonts.quicksand(
                            fontSize: 18,
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          brief!,
                          style: GoogleFonts.quicksand(
                            fontSize: 12,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.info_outline,
                        color: Theme.of(context).primaryColor, size: 20.0),
                    SizedBox(width: 10),
                    Text(
                      "${numOfQuestions!} quizzes",
                      style: GoogleFonts.quicksand(fontSize: 13),
                    ),
                    SizedBox(width: 10),
                    Icon(Icons.timer_outlined,
                        color: Theme.of(context).primaryColor, size: 20.0),
                    SizedBox(width: 10),
                    Text(
                      "$time mins",
                      style: GoogleFonts.quicksand(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
