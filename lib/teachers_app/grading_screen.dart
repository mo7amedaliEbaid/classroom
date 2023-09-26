import 'package:classroom/components.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/spaces.dart';

class GradingScreen extends StatefulWidget {
  const GradingScreen(
      {super.key, required this.studentname, required this.studentimage});

  final String studentname;
  final String studentimage;

  @override
  State<GradingScreen> createState() => _GradingScreenState();
}

class _GradingScreenState extends State<GradingScreen> {
  final List<String> _types = [
    "Daily HomeWork",
    "Pop Quiz",
    "Class Exam",
    "Team Project"
  ];

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            TopContainer(
                Text(
                  widget.studentname,
                  style: hb3,
                ),
                context,
                h * .06,
                w * .3),
            h3,
            CircleAvatar(
              foregroundImage: AssetImage(widget.studentimage),
              radius: 70,
            ),
            h3,
            Text(
              "Sunday, 12/8/2023",
              style: hb_blue,
            ),
            h3,
            Text(
              "Grading",
              style: hb3,
            ),
            h3,
            GreyDivider(),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              separatorBuilder: (BuildContext context, int index) {
                return GreyDivider();
              },
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.grade_outlined,size: 35,), w1,
                          Text(
                            _types[index],
                            style: hb3,
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Container(
                            height: h * .03,
                            width: w * .1,
                            color: grey,
                            child: TextField(),
                          ),w3,
                          Text("%",style: hb2,)
                        ],
                      ),

                    ],
                  ),
                );
              },
              itemCount: _types.length,
            )
          ],
        ),
      )),
    );
  }
}
