import 'package:classroom/utils/assets.dart';
import 'package:classroom/components.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import 'utils/colors.dart';
import 'utils/spaces.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key, required this.accountType});
final String accountType;
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
          CircleAvatar(
            foregroundImage: AssetImage(profileimage),
            radius: 60,
          ),
          h1,
          ProfileContainer("First Name", "Mohamed", h, w * .6),
          h1,
          ProfileContainer("Last Name", "Ali", h, w * .6),
          h1,
          ProfileContainer("Email", "mo7amedaliebaid@gmail.com", h, w * .6),
          h1,
          ProfileContainer("Account Type", accountType, h, w * .6),
          SizedBox(height: h*.08,),
          GreenButton("Change email", h*.06,w*.7),
          h2,
          GreenButton("Change email", h*.06,w*.7),
          h2,
          GreenButton("Change email", h*.06,w*.7),
          h2,
        ],
      ),
    );
  }
}
