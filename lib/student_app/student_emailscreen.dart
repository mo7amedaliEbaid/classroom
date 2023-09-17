import 'package:classroom/components.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/spaces.dart';

class StudentEmailScreen extends StatefulWidget {
  const StudentEmailScreen({super.key});

  @override
  State<StudentEmailScreen> createState() => _StudentEmailScreenState();
}

class _StudentEmailScreenState extends State<StudentEmailScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            TopContainer(
                Text(
                  "Send Email to Us",
                  style: hb3,
                ),
                context,
                h * .065,
                w * .2),
            Container(
              height: h * .3,
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.black, width: 1)),
              child: TextField(
                controller: _controller,
                /* onSubmitted: (String value){
                  _controller.clear();
                },*/
                decoration: InputDecoration(
                    border: UnderlineInputBorder(borderSide: BorderSide.none)),
              ),
            ),
            h1,
            GestureDetector(
                onTap: () {
                  setState(() {
                    _controller.clear();
                  });
                  CommonSacafoldMessenger(context, "Message Send Successfuly");
                },
                child: GreenButton("Send", h * .06, w * .7))
          ],
        ),
      ),
    );
  }
}
