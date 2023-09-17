import 'dart:ui';

import 'package:classroom/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ClassRooms {
  String className;
  String description;
  String creator;
  AssetImage bannerImg;
  Color? uiColor;
  List<double> clrs = [];

  ClassRooms(
      {required this.className,
        required this.description,
        required this.creator,
        required this.bannerImg,
        required this.clrs});
}

List<ClassRooms> classRoomList = [
  ClassRooms(
    className: "Math",
    description: "second year",
    creator: "Mohamed Ali",
    bannerImg: AssetImage(banner1),
    clrs: [255, 233, 116, 57],
  ),
  ClassRooms(
    className: "Arabic",
    description: "second year",
    creator: "Mohamed Khalil",
    bannerImg: AssetImage(banner2),
    clrs: [255, 101, 237, 153],
  ),
  ClassRooms(
    className: "Geometry",
    description: "second year",
    creator: "Mazen Ayman",
    bannerImg: AssetImage(banner3),
    clrs: [255, 111, 27, 198],
  ),
  ClassRooms(
      className: "English",
      description: "first year",
      creator: "Mahmoud Ali",
      bannerImg: AssetImage(banner4),
      clrs: [255, 0, 0, 0]),
  ClassRooms(
      className: "Thermodynamics",
      description: "first year",
      creator: "Mohamed Ali",
      bannerImg: AssetImage(banner5),
      clrs: [255, 102, 153, 204]),
  ClassRooms(
    className: "Fluid Mechanics",
    description: "first year",
    creator: "Mohamed Qasem",
    bannerImg: AssetImage(banner6),
    clrs: [255, 111, 27, 198],
  ),

];