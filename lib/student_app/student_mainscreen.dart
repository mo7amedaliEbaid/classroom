import 'package:classroom/student_app/calender_screen.dart';
import 'package:classroom/student_app/classrooms_screen.dart';
import 'package:classroom/student_app/messages_screen.dart';
import 'package:classroom/utils/assets.dart';
import 'package:classroom/utils/components.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/spaces.dart';

class StudentMainScreen extends StatelessWidget {
  const StudentMainScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                    "Mohamed Ali",
                    style: hb3,
                  ),
                  h4,
                  Text(
                    "Welcome",
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
          Center(
              child: Stack(
            children: [
              CircleAvatar(
                foregroundImage: AssetImage(profileimage),
                radius: 80,
              ),
              Positioned(
                  bottom: 10,
                  right: 50,
                  child: Icon(
                    FontAwesomeIcons.camera,
                    color: Colors.white,
                    size: 35,
                  ))
            ],
          )),
          GreyDivider(),
          GestureDetector(
              onTap: () {
                NavigateTo(MessagesScreen(), context);
              },
              child: CommonRow(
                  FontAwesomeIcons.solidMessage, "Messages", h * .08)),
          GreyDivider(),
          GestureDetector(
              onTap: () {
                NavigateTo(CalenderScreen(), context);
              },
              child: CommonRow(
                  FontAwesomeIcons.solidCalendarDays, "Calender", h * .08)),
          GreyDivider(),
          GestureDetector(
              onTap: () {
                NavigateTo(AvailabeClassesScreen(), context);
              },
              child: CommonRow(
                  FontAwesomeIcons.folderOpen, "Student Report", h * .08)),
          GreyDivider(),
          CommonRow(FontAwesomeIcons.fileCircleCheck, "Check to Today\'s class",
              h * .08)
        ],
      ),
    ));
  }
}
