import 'dart:developer';

import 'package:classroom/student_app/calender_screen.dart';
import 'package:classroom/student_app/classrooms_screen.dart';
import 'package:classroom/student_app/messages_screen.dart';
import 'package:classroom/student_app/student_profilescreen.dart';
import 'package:classroom/utils/assets.dart';
import 'package:classroom/components.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../utils/colors.dart';
import '../utils/spaces.dart';

class TeachersMainScreen extends StatefulWidget {
  const TeachersMainScreen({super.key});

  @override
  State<TeachersMainScreen> createState() => _TeachersMainScreenState();
}

class _TeachersMainScreenState extends State<TeachersMainScreen> {

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
                        "Welcome",
                        style: hb3,
                      ),
                      Text(
                        "Teacher",
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
              GestureDetector(
                  onTap: () {
                    NavigateTo(MessagesScreen(), context);
                  },
                  child: CommonRow(
                      FontAwesomeIcons.solidMessage, "Messages", h * .06)),
              GreyDivider(),
              GestureDetector(
                  onTap: () {
                    NavigateTo(MessagesScreen(), context);
                  },
                  child: CommonRow(
                      FontAwesomeIcons.peopleGroup, "Students", h * .06)),
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
                    NavigateTo(AvailabeClassesScreen(), context);
                  },
                  child: CommonRow(
                      FontAwesomeIcons.fileCircleCheck, "Attendence", h * .06)),
              GreyDivider(),
              GestureDetector(
                onTap: () {},
                child: CommonRow(FontAwesomeIcons.personMilitaryPointing,
                    "Behavior Points", h * .06),
              ),
              GreyDivider(),
              GestureDetector(
                onTap: () {},
                child: CommonRow(FontAwesomeIcons.graduationCap,
                    "Grading", h * .06),
              ),
              GreyDivider(),
              GestureDetector(
                onTap: () {},
                child: CommonRow(FontAwesomeIcons.folderOpen,
                    "Student Report", h * .06),
              ),

            ],
          ),
        ));
  }
}
