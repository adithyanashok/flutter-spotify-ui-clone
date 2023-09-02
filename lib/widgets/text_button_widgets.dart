import 'package:flutter/material.dart';
import 'package:spotify_clone/view/core/color/colors.dart';

Widget buildTextButton({required String text}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: TextButton(
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll(
          AppColor.colorBlack1,
        ),
      ),
      onPressed: () {},
      child: Text(
        text,
        style: TextStyle(color: AppColor.colorWhite),
      ),
    ),
  );
}
