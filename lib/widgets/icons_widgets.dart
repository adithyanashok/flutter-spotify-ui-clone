// <===============File for Icon based widgets================>

import 'package:flutter/material.dart';
import 'package:spotify_clone/view/core/color/colors.dart';

Widget buildIcon({required IconData icon}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Icon(
      icon,
      size: 30,
      color: AppColor.colorWhite,
    ),
  );
}
