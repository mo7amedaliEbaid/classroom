import 'dart:developer';

import 'package:classroom/common_screens/account_screen.dart';
import 'package:classroom/common_screens/calender_screen.dart';
import 'package:classroom/common_screens/studentreport_screen.dart';
import 'package:classroom/student_app/classrooms_screen.dart';
import 'package:classroom/common_screens/messages_screen.dart';
import 'package:classroom/student_app/student_profilescreen.dart';
import 'package:classroom/teachers_app/allstudents_screen.dart';
import 'package:classroom/teachers_app/attendence_screen.dart';
import 'package:classroom/teachers_app/behaviorpoints_screen.dart';
import 'package:classroom/teachers_app/grading_screen.dart';
import 'package:classroom/components.dart';
import 'package:classroom/utils/constants.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "dart:math";
import '../utils/assets.dart';
import '../utils/spaces.dart';

class ParentMainScreen extends StatefulWidget {
  ParentMainScreen({super.key});

  @override
  State<ParentMainScreen> createState() => _ParentMainScreenState();
}

class _ParentMainScreenState extends State<ParentMainScreen> {
  final random = new Random();

  Widget build(BuildContext context) {
    String element1 = students[random.nextInt(students.length)];
    String element2 = avatars[random.nextInt(avatars.length)];

    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Container(
        child: Column(
          children: [
            TopContainer(
                Column(
                  children: [
                    h4,
                    Text(
                      "Welcome",
                      style: hb3,
                    ),
                    Text(
                      "Parent",
                      style: hb3,
                    )
                  ],
                ),
                context,
                h * .07,
                w * .26),
            Container(
              color: Colors.blue,
              height: h * .08,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "2022 - 2023",
                      style: hb_white,
                    ),
                    w3,
                    Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            h2,
            CircleAvatar(
              foregroundImage: AssetImage(avatar3),radius: 70,
            ),
            h1,
            h1,
            GestureDetector(
                onTap: () {
                  NavigateTo(MessagesScreen(), context);
                },
                child: CommonRow(
                    FontAwesomeIcons.solidMessage, "Messages", h * .06)),
            GreyDivider(),
            GestureDetector(
                onTap: () {
                  NavigateTo(CalenderScreen(), context);
                },
                child: CommonRow(
                    FontAwesomeIcons.solidCalendarDays, "Calender", h * .06)),
            GreyDivider(),
            GestureDetector(
              onTap: () {
                NavigateTo(
                   StudentReport(className: "English", createdBy: "Mohamed Ali"),
                    context);
              },
              child: CommonRow(
                  FontAwesomeIcons.folderOpen, "Student Report", h * .06),
            ),
          ],
        ),
      ),
    );
  }
}
