import 'package:classroom/components.dart';
import 'package:classroom/utils/colors.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/spaces.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  int pressedAttentionIndex = -1;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopContainer(
              Text(
                "Attendence",
                style: hb2,
              ),
              context,
              h * .06,
              w * .25),
          h3,
          Container(
            height: h * .12,
            width: double.infinity,
            color: lightgrey,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Sunday, 28/9/2023",
                  style: hb_blue,
                ),
                Text(
                  "Attendence",
                  style: hb3,
                ),
                Text(
                  "Check In",
                  style: hb3,
                ),
              ],
            ),
          ),
          ListView.builder(
              shrinkWrap: true,
              itemCount: 7,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final pressAttention = pressedAttentionIndex == index;
                return Container(
                  color: grey,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            foregroundImage: AssetImage(avatars[index]),
                            //radius: 5,
                          ),
                          w3,
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                students[index],
                                style: hb3,
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  pressedAttentionIndex = index;
                                });
                              },
                              child: pressAttention
                                  ? Icon(
                                      Icons.check_circle,
                                      size: 35,
                                      color: Colors.green,
                                    )
                                  : Icon(
                                      Icons.change_circle_sharp,
                                      size: 35,
                                    )),
                          w3,
                          Icon(
                            Icons.arrow_forward_ios,
                            color: deepgreen,
                          ),
                        ],
                      )
                    ],
                  ),
                );
              })
        ],
      )),
    );
  }
}
