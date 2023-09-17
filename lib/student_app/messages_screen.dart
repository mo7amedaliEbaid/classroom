import 'package:classroom/components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../utils/colors.dart';
import '../utils/spaces.dart';
import '../utils/textstyles.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  TextEditingController _controller = TextEditingController();
  String text =
      "How are you mr mohamed, i\'m sending you this message to ask abount the date of  the next exam";
  String text1 = "Send A message";

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          TopContainer(
              Row(
                children: [
                  Text(
                    "Lets Communicate",
                    style: hb3,
                  ),
                  w3,
                  Icon(
                    Icons.chat,
                    color: Colors.green,
                  ),
                ],
              ),
              context,
              h * .08,
              w * .22),
          Expanded(
              child: SizedBox(
                  //   height: h * .2,
                  )),
          Text(
              "${DateTime.now().day} / ${DateTime.now().month} / ${DateTime.now().year}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              w1,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: w * .7,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    //   height: h * .2,
                    decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(5))),
                    child: Center(
                      child: Text(text),
                    ),
                  ),
                  h3,
                  Text(DateTime.now().subtract(Duration(minutes: 5)).toString())
                ],
              )
            ],
          ),
          h1,
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: w * .7,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    //   height: h * .2,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(20),
                            bottomLeft: Radius.circular(5))),
                    child: Center(
                      child: Text(
                        text,
                        style: hn3_white,
                      ),
                    ),
                  ),
                  h3,
                  Text(DateTime.now().toString())
                ],
              ),
              w1,
            ],
          ),
          h1,
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              w1,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: w * .7,
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 7),
                    //   height: h * .2,
                    decoration: BoxDecoration(
                        color: grey,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(5))),
                    child: Center(
                      child: Text(text1),
                    ),
                  ),
                  h3,
                  Text(DateTime.now().subtract(Duration(minutes: 5)).toString())
                ],
              )
            ],
          ),
          h1,
          Container(
            //  height: h * .08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  FontAwesomeIcons.fileCirclePlus,
                  color: Colors.green,
                ),
                Container(
                  height: h * .05,
                  width: w * .7,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5)),
                  child: TextField(
                    controller: _controller,
                    onSubmitted: (String value) {
                      setState(() {
                        text1 = _controller.text.trim().toString();
                        _controller.clear();
                      });
                    },
                    decoration: InputDecoration(
                        border:
                            UnderlineInputBorder(borderSide: BorderSide.none)),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      text1 = _controller.text.trim().toString();
                      _controller.clear();
                    });
                  },
                  child: Icon(
                    FontAwesomeIcons.circleArrowRight,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
