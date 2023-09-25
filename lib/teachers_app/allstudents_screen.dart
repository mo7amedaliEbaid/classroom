import 'package:classroom/common_screens/messages_screen.dart';
import 'package:classroom/components.dart';
import 'package:classroom/utils/assets.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/spaces.dart';

class AllStudentsScreen extends StatelessWidget {
   AllStudentsScreen({super.key, required this.destination});
   final Widget destination;

  final List<String> avatars=[avatar1,avatar2,avatar3,avatar4,avatar5,avatar6,avatar7];
  final List<String> students=["Mohamed Ali","mo ali","Mo Khalil","Robert Bresson","Godard","Fav Student","Flutter Lover"];
  final List<String> emails=["mo7amedaliebaid@gmail.com","mo@gmail.com","khalil@gmail.com","mahomoud@gmail.com","ali@gmail.com","avatar@gmail.com","godard@gmail.com"];

  @override
  Widget build(BuildContext context) {
  double  h=MediaQuery.sizeOf(context).height;
   double w=MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SafeArea(child: Column(
        children: [
          TopContainer(Text("All Students", style: hb2,), context, h*.06, w*.2),
          ListView.builder(
              itemCount: 7,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder:(context,index){
                return GestureDetector(
                  onTap: (){
                    NavigateTo(destination, context);
                  },
                  child: Container(
                    color: grey,
                    margin: EdgeInsets.symmetric(vertical: 5),
                    padding: EdgeInsets.symmetric(horizontal: 15,vertical: 5),
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
                              Text(students[index]),
                              Text(emails[index])
                            ],
                          ),
                        ],
                      ),

                      Icon(Icons.arrow_forward_ios)
                    ],
                    ),
                  ),
                );
              })

        ],
      )),
    );
  }
}
