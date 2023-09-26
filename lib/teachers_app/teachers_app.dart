import 'dart:developer';

import 'package:classroom/components.dart';
import 'package:classroom/student_app/student_emailscreen.dart';
import 'package:classroom/student_app/student_settingsscreen.dart';
import 'package:classroom/common_screens/account_screen.dart';
import 'package:classroom/teachers_app/addclass_screen.dart';
import 'package:classroom/teachers_app/teachers_mainscreen.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/spaces.dart';

class TeacherApp extends StatefulWidget {
  const TeacherApp({super.key});

  @override
  State<TeacherApp> createState() => _TeacherAppState();
}

class _TeacherAppState extends State<TeacherApp> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    return Scaffold(
      bottomNavigationBar: Container(
        height: h * .15,
        width: double.infinity,
        color: Colors.blue,
        child: Center(
          child: Column(
            children: [
              GreyContainer("Teacher 6.5", h*.03,null),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () {
                        log("index=000000000000000000000");
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            size: 40,
                            color: Colors.white,
                          ),
                          //   h4,
                          Text(
                            "Home",
                            style: hn3_white,
                          ),
                          //  h4,

                        ],
                      )),
                  w1,
                  GestureDetector(
                      onTap: () {
                        log("index=1111111111111111111111111111111111111");
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.account_box_outlined,
                            size: 40,
                            color: Colors.white,
                          ),
                          //   h4,
                          Text(
                            "My",
                            style: hn3_white,
                          ),
                          //  h4,
                          Text(
                            "Account",
                            style: hn3_white,
                          )
                        ],
                      )),
                  w1,
                  GestureDetector(
                      onTap: () {
                        log("index=22222222222222222");
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings,
                            color: Colors.white,
                            size: 30,
                          ),
                          h4,
                          Text(
                            "Settings",
                            style: hn3_white,
                          )
                        ],
                      )),
                  w1,
                  GestureDetector(
                      onTap: () {
                        log("index=33333333333333333333333333");
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.class_rounded,
                            color: Colors.white,
                            size: 40,
                          ),
                          //   h4,
                          Text(
                            "Add",
                            style: hn2_white,
                          ),
                          //   h3,
                          Text(
                            "Class",
                            style: hn2_white,
                          )
                        ],
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
      body: index == 0
          ? TeachersMainScreen()
          : index == 1
          ? AccountScreen(accountType: 'Teacher',)
          : index == 2
          ? StudentSettingScreen()
          : AddClassScreen(),
    );
  }
}
