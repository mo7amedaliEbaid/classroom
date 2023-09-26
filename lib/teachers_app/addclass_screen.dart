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
                "My Account",
                style: hb3,
              ),
              context,
              h * .05,
              w * .28),
          h4,
          Icon(FontAwesomeIcons.schoolFlag),
          h1,
          ProfileContainer("First Name", "Mohamed", h, w * .6),
          h1,
          ProfileContainer("Last Name", "Ali", h, w * .6),
          h1,
          ProfileContainer("Email", "mo7amedaliebaid@gmail.com", h, w * .6),
          h1,
          ProfileContainer("Account Type", "", h, w * .6),
          SizedBox(
            height: h * .08,
          ),
          GreenButton("Change email", h * .06, w * .7),
          h2,
          GreenButton("Change Paasword", h * .06, w * .7),
          h2,
          GestureDetector(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => OnBoardingScreen()),
                    (route) => false);
              },
              child: GreenButton("Singn Out", h * .06, w * .7)),
          h2,
        ],
      ),
    );
  }
}
