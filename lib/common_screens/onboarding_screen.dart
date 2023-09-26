import 'package:classroom/parent_app/parent_app.dart';
import 'package:classroom/student_app/student_app.dart';
import 'package:classroom/teachers_app/teachers_app.dart';
import 'package:classroom/teachers_app/teachers_mainscreen.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

import '../utils/assets.dart';
import '../components.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      bottomNavigationBar: BottomBar(h * .095,context),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * .09,
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Education",
                    style: hb1,
                  ),
                  // h4,
                  Text(
                    "Class Management",
                    style: hb3,
                  ),
                ],
              ),
            ),
            GreyContainer("Use our app as", h * .06, hb_blue),
            GestureDetector(
              onTap: () {
                CommonSacafoldMessenger(context, "Welcome as a Student");
                NavigateTo(StudentApp(), context);
              },
              child: CommonRow(
                Icons.school,
                "Student",
                h * .07,
              ),
            ),
            GreyDivider(),
            GestureDetector(
              onTap: () {
                CommonSacafoldMessenger(context, "Welcome as a Parent");
                NavigateTo(ParentApp(), context);
              },
              child: CommonRow(
                  FontAwesomeIcons.peopleGroup, "Guardian / Parent", h * .07),
            ),
            GreyDivider(),
            GestureDetector(
              onTap: (){
                NavigateTo(TeacherApp(), context);
                CommonSacafoldMessenger(context, "Welcome as a Teacher");

              },
              child: CommonRow(
                FontAwesomeIcons.person,
                "Teacher",
                h * .07,
              ),
            ),
            GreyDivider(),
            CommonRow(
              FontAwesomeIcons.personCircleQuestion,
              "Adminstrator",
              h * .07,
            ),
            Lottie.asset(mainlottie, height: h * .3, width: w * 8)
          ],
        ),
      ),
    );
  }
}
