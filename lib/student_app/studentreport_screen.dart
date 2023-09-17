import 'package:classroom/utils/assets.dart';
import 'package:classroom/utils/components.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/spaces.dart';

class StudentReport extends StatelessWidget {
  const StudentReport(
      {super.key, required this.className, required this.createdBy});

  final String? className;
  final String? createdBy;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;

    Widget _rowItem(IconData icon, String label) {
      return Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 35,
          ),
          Text(
            label,
            style: hn3_white,
          )
        ],
      );
    }

    List<IconData> _icons = [
      Icons.timelapse,
      Icons.calendar_month_sharp,
      Icons.grading,
      FontAwesomeIcons.folderOpen,
      FontAwesomeIcons.folderPlus,
    ];
    List<String> _labels = [
      "History",
      "Attendence",
      "Grading",
      "Export CSV",
      "Share/Print"
    ];

    return Scaffold(
      bottomNavigationBar: Container(
        height: h * .1,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        child: ListView.builder(
          itemCount: 5,
          scrollDirection: Axis.horizontal,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
              child: _rowItem(_icons[index], _labels[index]),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            TopContainer(
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      createdBy ?? "",
                      style: hb3,
                    ),
                    Text(
                      " / ${className}" ?? "",
                      style: hb3,
                    ),
                  ],
                ),
                context,
                h * 0.06,
                w * 0.15),
            h2,
            CircleAvatar(
              radius: 70,
              foregroundImage: AssetImage(profileimage),
            ),
            h3,
            CommonRow(FontAwesomeIcons.circleCheck, "Present", h * .06, tex1: "32"),
            GreyDivider(),
            CommonRow(FontAwesomeIcons.circleXmark, "Absent", h * .06, tex1: "2"),
            GreyDivider(),
            CommonRow(Icons.timelapse, "Late", h * .06, tex1: "1"),
            GreyDivider(),
            CommonRow(Icons.timeline, "Left early", h * .06, tex1: "0"),

          ],
        ),
      ),
    );
  }
}
