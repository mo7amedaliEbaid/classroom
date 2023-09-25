import 'package:classroom/components.dart';
import 'package:classroom/utils/colors.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/spaces.dart';

class AttendenceScreen extends StatefulWidget {
  const AttendenceScreen({super.key});

  @override
  State<AttendenceScreen> createState() => _AttendenceScreenState();
}

class _AttendenceScreenState extends State<AttendenceScreen> {
  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.sizeOf(context).height;
    double w=MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          TopContainer(Text("Attendence",style: hb2,), context, h*.06, w*.25),
          h3,
          Container(
            height: h*.12,
            width: double.infinity,
            color: lightgrey,
            padding: EdgeInsets.symmetric(vertical: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Sunday, 28/9/2023",style: hb_blue,),
                Text("Attendence",style: hb3,),
                Text("Check In",style: hb3,),
              ],
            ),
          ),

        ],
      )),
    );
  }
}
