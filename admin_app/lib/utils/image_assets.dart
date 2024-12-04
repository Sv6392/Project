

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_fade/image_fade.dart';
import 'package:lottie/lottie.dart';
import 'package:admin_app/utils/assets.dart';
import 'package:admin_app/utils/shimmer_effect.dart';
import 'package:admin_app/utils/string_constant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CooeeImageAsset extends StatelessWidget {
  final String? image;
  final double? height;
  final double? webHeight;
  final double? width;
  final double? webWidth;
  final Color? color;
  final BoxFit? fit;
  final BoxFit? webFit;
  final String? imageFrom;
  final bool isRepeat;
  final double? borderRadius;

  const CooeeImageAsset({
    Key? key,
    @required this.image,
    this.webFit,
    this.fit,
    this.height,
    this.webHeight,
    this.width,
    this.webWidth,
    this.color,
    this.imageFrom,
    this.isRepeat = false,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: getViewWithFadeAnim(),
    );
  }

  getViewWithFadeAnim() {
    return image == null || image!.isEmpty
        ? Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(25.px),
            child: Image.network(
              imageFrom == StringConstant.userprofile
                  ? CooeeAsset.defaultUserProfile
                  : CooeeAsset.defaultProductImage,
              height: webHeight,
              width: webWidth,
              fit: webFit,
            ),
          )
        : image!.contains('http') || image!.contains('https')
            ? CachedNetworkImage(
                imageUrl: "$image",
                fadeInDuration: const Duration(milliseconds: 0),
                fadeOutDuration: const Duration(milliseconds: 0),
                imageBuilder: (context, imageProvider) => Container(
                  height: webHeight,
                  width: webWidth,
                  decoration: BoxDecoration(
                    borderRadius: borderRadius != null
                        ? BorderRadius.all(Radius.circular(borderRadius!))
                        : null,
                    image: DecorationImage(
                      //image size fill
                      image: imageProvider,
                      fit: webFit ?? BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, progress) => ShimmerEffectView(
                  height: webHeight ?? double.maxFinite,
                  width: webWidth ?? double.maxFinite,
                ), //show progress  while loading image
                errorWidget: (context, url, error) => imageFrom ==
                        StringConstant.userprofile
                    ? Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10.px),
                        child: Image.network(CooeeAsset.defaultUserProfile),
                      )
                    : Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(25.px),
                        child: Image.network(CooeeAsset.defaultProductImage),
                      ),
                //show no iamge availalbe image on error laoding
              )
            : image!.contains('product/') || image!.contains('public/')
                ? ImageFade(
                    image: NetworkImage(image!),
                    duration: const Duration(milliseconds: 900),
                    syncDuration: const Duration(milliseconds: 900),
                    height: webHeight,
                    width: webWidth,
                    fit: webFit ?? BoxFit.cover,
                    loadingBuilder: (context, progress, chunkEvent) =>
                        ShimmerEffectView(
                      height: webHeight ?? double.maxFinite,
                      width: webWidth ?? double.maxFinite,
                    ),
                    errorBuilder: (context, error) => imageFrom ==
                            StringConstant.userprofile
                        ? Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(10.px),
                            child: Image.network(CooeeAsset.defaultUserProfile),
                          )
                        : Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(25.px),
                            child:
                                Image.network(CooeeAsset.defaultProductImage),
                          ),
                  )
                : image!.split('.').last == 'json'
                    ? Lottie.asset(image!,
                        repeat: isRepeat, height: height, width: width)
                    : image!.split('.').last != 'svg'
                        ? Image.asset(
                            image!,
                            fit: fit,
                            height: height,
                            width: width,
                            color: color,
                            gaplessPlayback: true,
                          )
                        : SvgPicture.asset(
                            image!,
                            height: height,
                            width: width,
                            color: color,
                          );
  }
}
