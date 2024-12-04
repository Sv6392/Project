import 'package:flutter/material.dart';
import 'package:perfect_photo_frame/utils/color_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';


class ShimmerEffectView extends StatelessWidget {
  final double? height;
  final double? width;
  final double? borderRadius;

  const ShimmerEffectView(
      {Key? key, this.height, this.width, this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorConstant.appWhite100,
      highlightColor: ColorConstant.appGrey,
      child: Container(
        height: height ?? 30.px,
        width: width ?? 50.px,
        decoration: BoxDecoration(
          color: ColorConstant.wishListProduct,
          borderRadius: BorderRadius.circular(borderRadius ?? 4.px),
        ),
      ),
    );
  }
}
