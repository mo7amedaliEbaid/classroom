import 'package:classroom/components.dart';
import 'package:flutter/material.dart';

import '../utils/spaces.dart';
import '../utils/textstyles.dart';

class StudentSettingScreen extends StatelessWidget {
  const StudentSettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TopContainer(
              Text(
                "Settings",
                style: hb3,
              ),
              context,
              h * .05,
              w * .28),
          h3,
          GreyContainer("Recieve notifications", h * .06, hb3),
          WhiteTextContainer(
            "When Teachers Markes Student as",
            hn3,
          ),
          GreyDivider(),
          SettingsRow("Present", hb3, context),
          GreyDivider(),
          SettingsRow("Absent - excused", hb3, context),
          GreyDivider(),
          SettingsRow("Absent - unexcused", hb3, context),
          GreyDivider(),
          SettingsRow("Tardy / Late", hb3, context),
          GreyDivider(),
          SettingsRow("Left Early", hb3, context),
          GreyDivider(),
          SettingsRow("When Teacher assigns points", hb3, context),
          GreyDivider(),
          SettingsRow("When Teacher schedules an event", hb3, context),

        ],
      ),
    );
  }
}
