//<==================File for all Text based extracted widget=====================>

import 'package:flutter/material.dart';
import 'package:spotify_clone/view/core/color/colors.dart';

Widget buildText({required String text, double fontSize = 26}) {
  return Text(
    text,
    style: TextStyle(
      color: AppColor.colorWhite,
      fontSize: fontSize,
      fontWeight: FontWeight.w600,
    ),
  );
}

Widget buildSubText({required String text}) {
  return Text(
    text,
    style: TextStyle(
      color: AppColor.colorWhite,
    ),
  );
}
