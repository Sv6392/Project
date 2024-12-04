

import 'package:flutter/material.dart';
import 'package:perfect_photo_frame/utils/color_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CooeeCustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final String text;
  double? width;
  double? height;
  bool showBorder;

  CooeeCustomElevatedButton(
      {Key? key,
      required this.onPressed,
      required this.backgroundColor,
      required this.text,
      required this.textColor,
      this.height,
      this.width,
      this.showBorder = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        maximumSize: Size(width ?? 80.w, height ?? 60),
        minimumSize: Size(width ?? 80.w, height ?? 60),
        backgroundColor: backgroundColor, // Custom background color
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: showBorder
              ? const BorderSide(
                  color: ColorConstant.appGrey,
                  width: 1.0,
                )
              : BorderSide.none,
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 14.px,
          color: textColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}





