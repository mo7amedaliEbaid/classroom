import 'dart:io';
import 'dart:typed_data';

import 'package:classroom/helpers/generatePdf_helper.dart';
import 'package:classroom/utils/assets.dart';
import 'package:classroom/components.dart';
import 'package:classroom/utils/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

import '../utils/colors.dart';
import '../utils/spaces.dart';

class StudentReport extends StatelessWidget {
  StudentReport({super.key, required this.className, required this.createdBy});

  final String? className;
  final String? createdBy;
  ScreenshotController screenshotController = ScreenshotController();

  Future saveAndShare(Uint8List bytes) async {
    final directry = await getApplicationDocumentsDirectory();
    final image = File('${directry.path}/flutter.png');
    image.writeAsBytesSync(bytes);
    await Share.shareFiles([image.path]);
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    final isDialOpen = ValueNotifier(false);

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

    return Screenshot(
      controller: screenshotController,
      child: Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,

        floatingActionButton: SpeedDial(
          direction: SpeedDialDirection.down,
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: deepgreen,
          overlayColor: Colors.black.withOpacity(0.04),
          spacing: 4,
          spaceBetweenChildren: 12,
          openCloseDial: isDialOpen,
          children: [
            SpeedDialChild(
              child: Icon(Icons.share),
              label: "Share",
              backgroundColor: green,
              onTap: () {},
            ),
            SpeedDialChild(
              child: Icon(Icons.star),
              label: "Rate App",
              backgroundColor: green,
              onTap: () {},
            ),
            SpeedDialChild(
              child: Icon(Icons.screenshot),
              label: "Take Snap",
              backgroundColor: green,
              onTap: () async {
                final image = await screenshotController.capture();

                saveAndShare(image!);
                // final result = await saveImage(image);
                // print(result);
              },
            ),
            SpeedDialChild(
              child: Icon(Icons.picture_as_pdf),
              label: "Export Pdf",
              backgroundColor:green,
              onTap: PDfHelper().generatePdf,
            ),
          ],
        ),
        bottomNavigationBar: Container(
          height: h * .1,
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Center(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
                  child: _rowItem(_icons[index], _labels[index]),
                );
              },
            ),
          ),
        ),
        body: WillPopScope(
          onWillPop: () async {
            if (isDialOpen.value) {
              isDialOpen.value = false;
              return false;
            } else {
              return true;
            }
          },
          child: SafeArea(
            child: SingleChildScrollView(
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
                  CommonRow(FontAwesomeIcons.circleCheck, "Present", h * .06,
                      tex1: "32"),
                  GreyDivider(),
                  CommonRow(FontAwesomeIcons.circleXmark, "Absent", h * .06,
                      tex1: "2"),
                  GreyDivider(),
                  CommonRow(Icons.timelapse, "Late", h * .06, tex1: "1"),
                  GreyDivider(),
                  CommonRow(Icons.timeline, "Left early", h * .06, tex1: "0"),
                  GreyContainer("Behavior Out of 100%", h * .06, hb3),
                  CommonRow(FontAwesomeIcons.circleCheck, "TeamWork", h * .06,
                      isgrades: true, grade: "85"),
                  GreyDivider(),
                  CommonRow(
                      FontAwesomeIcons.circleCheck, "Presistance", h * .06,
                      isgrades: true, grade: "95"),
                  GreyDivider(),
                  CommonRow(
                      FontAwesomeIcons.circleCheck, "Participation", h * .06,
                      isgrades: true, grade: "75"),
                  GreyContainer("Grades For ${className} Class", h * .06, hb3),
                  CommonRow(FontAwesomeIcons.circleCheck, "Mid Term", h * .06,
                      tex1: "80 / 100"),
                  GreyDivider(),
                  CommonRow(FontAwesomeIcons.circleCheck, "Final Exam", h * .06,
                      tex1: "90 / 100"),
                  GreyDivider(),
                  CommonRow(FontAwesomeIcons.circleCheck, "Project", h * .06,
                      tex1: "40 / 50"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
