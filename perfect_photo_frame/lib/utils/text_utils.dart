
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:perfect_photo_frame/utils/assets.dart';
import 'package:perfect_photo_frame/utils/color_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnsoText extends StatelessWidget {
  final String title;
  final Color? color;
  final FontWeight? fontWeight;
  final String? fontFamily;
  final double? fontSize;
  final TextAlign? textAlign;
  final double? height;
  final FontStyle? fontStyle;
  final TextOverflow? overflow;
  final int? maxLines;
  final TextDecoration? decoration;
  final double? letterSpacing;
  final bool isAnimateText;
  // final TextScaler? textScaler;

  const EnsoText(
    this.title, {
    Key? key,
    this.color,
    this.fontWeight,
    this.fontFamily,
    this.fontSize,
    this.textAlign,
    this.height,
    this.fontStyle,
    this.maxLines,
    this.overflow,
    this.decoration = TextDecoration.none,
    this.letterSpacing,
    this.isAnimateText = false,
    // this.textScaler,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return isAnimateText
        ? SizedBox(
            width: Device.width,
            child: DefaultTextStyle(
              style: TextStyle(
                color: color ?? ColorConstant.appPrimaryColor,
                fontFamily: CooeeAsset.defaultFont,
                fontWeight: fontWeight,
                fontSize: fontSize ?? 13.px,
                height: height,
                fontStyle: fontStyle,
                overflow: overflow,
                decoration: decoration,
                letterSpacing: letterSpacing,
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(title.toLowerCase(),
                      speed: const Duration(milliseconds: 400))
                ],
                repeatForever: true,
              ),
            ),
          )
        : Text(
            title,
            textAlign: textAlign,
            maxLines: maxLines,
            style: TextStyle(
              color: color ?? ColorConstant.appBlack,
              fontFamily: fontFamily,
              fontWeight: fontWeight,
              fontSize: fontSize ?? 13.px,
              height: height,
              fontStyle: fontStyle,
              overflow: overflow,
              decoration: decoration,
              letterSpacing: letterSpacing,
            ),
          );
  }
}
