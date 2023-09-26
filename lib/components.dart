import 'dart:developer';

import 'package:classroom/paymob/modules/register/register.dart';
import 'package:classroom/quiz/screens/login_screen.dart';
import 'package:classroom/utils/colors.dart';
import 'package:classroom/utils/spaces.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'map/findteachers/findteachers_screen.dart';

NavigateTo(Widget Screen, BuildContext context) {
  log("nav func invoked");
  return Navigator.of(context)
      .push(MaterialPageRoute(builder: (context) => Screen));
}

Widget GreyContainer(String text, double height, TextStyle? style) {
  return Container(
    height: height,
    width: double.infinity,
    color: grey,
    padding: EdgeInsets.symmetric(horizontal: 15),
    child: Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: style ?? TextStyle(),
      ),
    ),
  );
}

Widget TopContainer(Widget title, BuildContext context, double h, double w) {
  return Container(
    height: h,
    color: grey,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        w2,
        GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              FontAwesomeIcons.solidCircleLeft,
              color: Colors.green,
            )),
        SizedBox(
          width: w,
        ),
        title
      ],
    ),
  );
}

Widget CommonRow(IconData icon, String text, double height,
    {String tex1 = "", bool isgrades = false, String grade = ""}) {
  return Container(
    height: height,
    width: double.infinity,
    margin: EdgeInsets.only(right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            w1,
            Icon(
              icon,
              color: Colors.blue,
              size: 35,
            ),
            w3,
            Text(
              text,
              style: hn3,
            ),
          ],
        ),
        Row(
          children: [
            Text(
              "${tex1}",
              style: hb3,
            ),
            w3,
            isgrades
                ? Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.green),
                    child: Center(
                      child: Text(
                        grade,
                        style: hn3_white,
                      ),
                    ),
                  )
                : Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.green,
                  ),
          ],
        ),
      ],
    ),
  );
}

Widget GreyDivider() {
  return Divider(
    color: Colors.grey.shade800,
  );
}

Widget ProfileContainer(String tex1, String text2, double h, double w) {
  return Container(
    // height: 100,
    margin: EdgeInsets.symmetric(horizontal: 15),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          tex1,
          style: hb3,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(text2),
            h4,
            Container(
              height: 2,
              width: w,
              color: Colors.black,
            )
          ],
        )
      ],
    ),
  );
}

Widget GreenButton(String text, double h, double w) {
  return Container(
    height: h,
    width: w,
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(7)),
    child: Center(
      child: Text(
        text,
        style: hb_white,
      ),
    ),
  );
}

Widget SettingsRow(String text, TextStyle style, BuildContext context) {
  bool _value = true;
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: StatefulBuilder(builder: (context, setState) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: style,
            ),
            Switch(
              value: _value,
              onChanged: (bool value) {
                setState(() {
                  _value = !_value;
                });
              },
              activeColor: Colors.green,
            )
          ],
        );
      }));
}

ScaffoldFeatureController<SnackBar, SnackBarClosedReason>
    CommonSacafoldMessenger(BuildContext context, String message) {
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
  ));
}

Widget WhiteTextContainer(String text, TextStyle? style) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
    child: Text(
      text,
      style: style ?? TextStyle(),
    ),
  );
}

Widget BottomBar(double h, BuildContext context) {
  return Container(
    height: h,
    color: Colors.blue,
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              NavigateTo(const LoginScreen(), context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.quora,
                  color: Colors.white,
                  size: 30,
                ),
                Text(
                  "Quiz",
                  style: hn2_white,
                )
              ],
            ),
          ),
          w1,
          GestureDetector(
            onTap: () {
              NavigateTo(RegisterScreen(), context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.payments,
                  color: Colors.white,
                  size: 40,
                ),
                Text(
                  "Payment",
                  style: hn2_white,
                )
              ],
            ),
          ),
          w1,
          GestureDetector(
            onTap: () {
              NavigateTo(FindTeachersScreen(), context);
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.mapLocation,
                  color: Colors.white,
                ),
                Text(
                  "Map",
                  style: hn2_white,
                )
              ],
            ),
          ),
          w1,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.question_mark,
                color: Colors.white,
                size: 40,
              ),
              Text(
                "Help",
                style: hn2_white,
              )
            ],
          ),
        ],
      ),
    ),
  );
}

Widget SingleIconBottomBar(double h, IconData iconData, String label) {
  return Container(
    height: h,
    color: Colors.blue,
    child: Center(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 30,
            ),
            Text(
              label,
              style: hb_white,
            )
          ]),
    ),
  );
}
