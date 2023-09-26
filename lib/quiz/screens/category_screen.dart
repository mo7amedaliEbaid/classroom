import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../global/global_data.dart';
import '../global/gradient_decoration.dart';
import '../shared/card_category.dart';
import 'login_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Stack(
        children: [
          Container(
            decoration: blueGradient,
          ),
          Positioned(
            left: 20,
            top: 25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.waving_hand_outlined,
                      color: Colors.white,
                      size: 15,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Hello ${userNameTextCont.text}',
                      style: GoogleFonts.quicksand(
                        fontSize: 17.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Please Select A Category",
                      style: GoogleFonts.quicksand(
                          fontSize: 17.0,
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.arrow_circle_right_outlined,
                      color: Colors.white,
                      size: 22,
                    )
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * .82,
              decoration: const BoxDecoration(
                color: Color(0xFFE1F1FF),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(25),
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CardCategory(
                      images: "assets/images/biology_badge.png",
                      testName: "Biology",
                      brief:
                          "cover topics such as cell structure and function, genetics, ecology, and evolution",
                      numOfQuestions: biologyTest.length,
                      time: 4,
                    ),
                    CardCategory(
                      images: "assets/images/history_badge.png",
                      testName: "History",
                      brief:
                          "typically covers topics related to past events and civilizations, such as ancient Greece and Rome",
                      numOfQuestions: historyTest.length,
                      time: 2,
                    ),
                    CardCategory(
                      images: "assets/images/maths_badge.png",
                      testName: "Maths",
                      brief:
                          "covers topics related to mathematics, including algebra, geometry, trigonometry, and calculus",
                      numOfQuestions: mathsTest.length,
                      time: 1,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    ));
  }
}
