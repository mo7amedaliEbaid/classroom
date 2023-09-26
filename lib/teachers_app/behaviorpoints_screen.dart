import 'package:classroom/components.dart';
import 'package:classroom/utils/colors.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/constants.dart';
import '../utils/spaces.dart';

class BehaviorScreen extends StatefulWidget {
  const BehaviorScreen({super.key});

  @override
  State<BehaviorScreen> createState() => _BehaviorScreenState();
}

class _BehaviorScreenState extends State<BehaviorScreen> {
  // int pressedAttentionIndex = -1;

  TextEditingController _controller = TextEditingController();
  List<String> grades = ["95", "91", "85", "75", "79", "97", "98"];

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
                    "Behavior",
                    style: hb3,
                  ),
                  Text(
                    "Points",
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
                  //   final pressAttention = pressedAttentionIndex == index;
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
                            Container(
                              height: h * .03,
                              width: w * .1,
                              padding: EdgeInsets.only(top: 8, left: 5),
                              decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Colors.black, width: 1)),
                              child: Center(
                                child: TextField(
                                  controller: _controller,
                                  onSubmitted: (String value) {
                                    setState(() {
                                      grades[index] = _controller.text;
                                    });
                                  },
                                  decoration:
                                      InputDecoration(hintText: grades[index]),
                                ),
                              ),
                            ),
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
        ),
      )),
    );
  }
}
