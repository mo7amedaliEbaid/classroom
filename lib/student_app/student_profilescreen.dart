import 'package:classroom/components.dart';
import 'package:classroom/utils/assets.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

class StudentProfileScreen extends StatelessWidget {
  const StudentProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double h=MediaQuery.sizeOf(context).height;
    double w=MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TopContainer(Text("Mohamed Ali",style: hb2,), context, h*.06, w*.28),
            Spacer(),
            Image.asset(profileimage),
            Spacer(),
            SingleIconBottomBar(h*.1, Icons.share, "Share/Print ")
          ],

        ),

      ),
    );
  }
}
