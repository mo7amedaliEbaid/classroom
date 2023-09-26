import 'package:classroom/common_screens/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components.dart';
import '../utils/spaces.dart';
import '../utils/textstyles.dart';

class AddClassScreen extends StatefulWidget {
  const AddClassScreen({super.key});

  @override
  State<AddClassScreen> createState() => _AddClassScreenState();
}

class _AddClassScreenState extends State<AddClassScreen> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TopContainer(
              Text(
                "Class Info",
                style: hb3,
              ),
              context,
              h * .05,
              w * .28),
          h2,
          Icon(Icons.school_rounded,size: 100,color: Colors.blue,),
          h1,
          h1,
          ProfileContainer("Class Name", "Math", h, w * .6),
          h1,
          ProfileContainer("School Term", "2023 - 2024", h, w * .6),
          h1,
          ProfileContainer("Teacher Name", "Mohamed Ahmed", h, w * .6),
          h1,
          ProfileContainer("Description", "Optional", h, w * .6),
        ],
      ),
    );
  }
}
