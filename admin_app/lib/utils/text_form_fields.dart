


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:admin_app/utils/assets.dart';
import 'package:admin_app/utils/color_constant.dart';
import 'package:admin_app/utils/image_assets.dart';
import 'package:admin_app/utils/text_utils.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EnsoTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String hint;
  final String? suffixText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final GestureTapCallback? onTap;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final bool readOnly;
  final bool isBorder;
  final int maxLines;
  final bool autoFocus;
  final Color? color;
  final Color? filledColor;
  final double? borderRadius;
  final bool isDecoration;
  final int? maxLength;
  final double fontSize;
  final double verticalContentPadding;
  final FocusNode? focusNode;
  final bool hidden;
  final FormFieldValidator<String>? validator;

  const EnsoTextFormField(
      {super.key,
      this.controller,
      this.textInputAction = TextInputAction.next,
      this.keyboardType = TextInputType.name,
      this.prefixIcon,
      this.suffixText,
      this.filledColor,
      this.color,
      this.hint = "",
      this.onTap,
      this.onChanged,
      this.maxLines = 1,
      this.onSubmitted,
      this.readOnly = false,
      this.inputFormatters,
      this.borderRadius,
      this.verticalContentPadding = 0,
      required this.fontSize,
      this.isBorder = true,
      this.autoFocus = false,
      this.isDecoration = true,
      this.focusNode,
      this.hidden = false,
      this.validator,
      this.suffixIcon,
      this.maxLength});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: hidden,
      validator: validator,
      onFieldSubmitted: onSubmitted,
      onTap: onTap,
      focusNode: focusNode,
      onChanged: onChanged,
      readOnly: readOnly,
      controller: controller,
      maxLines: maxLines,
      textInputAction: textInputAction,
      keyboardType: keyboardType,
      cursorColor: ColorConstant.lightGreyColor,
      cursorWidth: 1,
      maxLength: maxLength,
      inputFormatters: inputFormatters,
      autofocus: autoFocus,
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
          fontSize: fontSize, color: color ?? ColorConstant.lightGreyColor),
      decoration: isDecoration
          ? InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.appHintTextColor),
              filled: true,
              prefixIcon: prefixIcon,
              suffix: suffixIcon,
              suffixText: suffixText,
              fillColor: isDecoration
                  ? filledColor ?? ColorConstant.appWhite
                  : filledColor ?? Colors.transparent,
              prefixIconConstraints:
                  BoxConstraints(minWidth: 40.px, maxHeight: 23.px),
              contentPadding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: verticalContentPadding),
              border: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 0),
                      borderSide: BorderSide(
                          color: ColorConstant.textFieldBorderColor
                              .withOpacity(0.5)),
                    )
                  : InputBorder.none,
              disabledBorder: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 0),
                      borderSide: BorderSide(
                          color: ColorConstant.textFieldBorderColor
                              .withOpacity(0.5)),
                    )
                  : InputBorder.none,
              enabledBorder: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 0),
                      borderSide: BorderSide(
                          color: ColorConstant.textFieldBorderColor
                              .withOpacity(0.5)),
                    )
                  : InputBorder.none,
              errorBorder: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 0),
                      borderSide: BorderSide(
                          color: ColorConstant.textFieldBorderColor
                              .withOpacity(0.5)),
                    )
                  : InputBorder.none,
              focusedBorder: isBorder
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(borderRadius ?? 0),
                      borderSide: BorderSide(
                          color: ColorConstant.textFieldBorderColor
                              .withOpacity(0.5)),
                    )
                  : InputBorder.none,
            )
          : InputDecoration(
              hintText: hint,
              hintStyle: Theme.of(context).textTheme.titleSmall!.copyWith(
                  fontSize: fontSize,
                  fontWeight: FontWeight.w500,
                  color: ColorConstant.appHintTextColor),
              border: InputBorder.none,
              fillColor: isDecoration
                  ? ColorConstant.appWhite
                  : filledColor ?? Colors.transparent,
              suffix: suffixIcon,
            ),
    );
  }
}

class RoundedTextFormField extends StatelessWidget {
  final GestureTapCallback? onTap;
  final double? radius;
  final Widget? prefixIcon;
  final TextEditingController controller;
  final ValueChanged<String>? onChanged;
  final String hintText;
  final TextInputType keyboardType;
  final bool readOnly;
  final bool isNumber;
  final int? maxLines;
  final double? height;
  final bool? haveBorder;
  final bool showSuffix;
  final bool showSuffixText;
  final bool obscureText;
  final int length;
  final String? suffixIcon;
  final Color hintTextColor;
  final Color? textBoxColor;
  final GestureTapCallback? onSuffixTap;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final bool? useOnchange;

  const RoundedTextFormField(
      {super.key,
      this.onTap,
      this.radius,
      this.onChanged,
      this.prefixIcon,
      required this.controller,
      required this.hintText,
      this.textBoxColor,
      this.keyboardType = TextInputType.text,
      this.readOnly = false,
      this.isNumber = false,
      this.maxLines,
      this.height,
      this.haveBorder = true,
      this.showSuffix = false,
      this.obscureText = false,
      this.showSuffixText = false,
      this.length = 10,
      this.hintTextColor = ColorConstant.appHintTextColor,
      this.suffixIcon,
      this.onSuffixTap,
      this.inputFormatters,
      this.validator,
      this.useOnchange});

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: height ?? 48.px,
      // padding: EdgeInsets.symmetric(horizontal: 12.px),
      // decoration: BoxDecoration(
      //     color: textBoxColor,
      //     borderRadius: BorderRadius.circular(radius ?? 8.px),
      //     border: haveBorder
      //         ? Border.all(width: 1, color: ColorConstant.activityBorder)
      //         : null),
      child: Row(
        children: [
          if (prefixIcon != null) SizedBox(width: 66.px, child: prefixIcon),
          Expanded(
            child: TextFormField(
              validator: validator,
              onTap: onTap,
              controller: controller,
              maxLines: maxLines ?? 1,
              textInputAction: TextInputAction.newline,
              onChanged: useOnchange == true
                  ? (value) {
                      String newValue = value;
                      List<String> words = newValue.split(" ");
                      for (int i = 0; i < words.length; i++) {
                        if (words[i].isNotEmpty) {
                          words[i] =
                              "${words[i][0].toUpperCase()}${words[i].substring(1).toLowerCase()}";
                        }
                      }
                      newValue = words.join(" ");
                      controller.value = controller.value.copyWith(
                        text: newValue,
                        selection: TextSelection.fromPosition(
                            TextPosition(offset: newValue.length)),
                        composing: TextRange.empty,
                      );
                    }
                  : onChanged,
              style: TextStyle(
                fontFamily: CooeeAsset.defaultFont,
                fontSize: 14.px,
                fontWeight: FontWeight.w600,
                color: readOnly == false
                    ? ColorConstant.appBlue
                    : ColorConstant.appBlack.withOpacity(0.4),
              ),
              readOnly: readOnly,
              obscureText: obscureText,
              keyboardType: TextInputType.multiline,
              //  keyboardType: keyboardType,
              cursorColor: ColorConstant.appBlue,
              inputFormatters: inputFormatters ??
                  [
                    FilteringTextInputFormatter.deny(RegExp('^\\s')),
                    if (isNumber) FilteringTextInputFormatter.digitsOnly,
                    if (isNumber) LengthLimitingTextInputFormatter(length),
                  ],
              decoration: InputDecoration(
                disabledBorder: haveBorder ?? true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color: textBoxColor ??
                                Color(0xFF000000).withOpacity(0.12)),
                        borderRadius: BorderRadius.circular(radius ?? 8.px),
                      )
                    : InputBorder.none,
                enabledBorder: haveBorder ?? true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color: textBoxColor ??
                                ColorConstant.appBlack.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(radius ?? 8.px),
                      )
                    : InputBorder.none,
                focusedErrorBorder: haveBorder ?? true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                textBoxColor?.withOpacity(0.12) ?? Colors.red),
                        borderRadius: BorderRadius.circular(radius ?? 8.px),
                      )
                    : InputBorder.none,

                errorBorder: haveBorder ?? true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color:
                                textBoxColor?.withOpacity(0.12) ?? Colors.red),
                        borderRadius: BorderRadius.circular(radius ?? 8.px),
                      )
                    : InputBorder.none,

                border: haveBorder ?? true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color: textBoxColor?.withOpacity(0.12) ??
                                Color(0xFF000000).withOpacity(0.12)),
                        borderRadius: BorderRadius.circular(radius ?? 8.px),
                      )
                    : InputBorder.none,
                focusedBorder: haveBorder ?? true
                    ? OutlineInputBorder(
                        borderSide: BorderSide(
                            color: textBoxColor?.withOpacity(0.12) ??
                                ColorConstant.appBlack.withOpacity(0.1)),
                        borderRadius: BorderRadius.circular(radius ?? 8.px),
                      )
                    : InputBorder.none,

                //     border: haveBorder
                //         ? Border.all(width: 1, color: ColorConstant.activityBorder) //todo it
                //         : null),

                // focusedBorder: InputBorder.none,
                hintText: hintText,
                hintStyle: TextStyle(
                  fontFamily: CooeeAsset.defaultFont,
                  fontSize: 14.px,
                  fontWeight: FontWeight.w400,
                  color: hintTextColor,
                ),
              ),
            ),
          ),
          if (showSuffix)
            InkWell(
              onTap: onTap,
              child: Container(
                height: 46.px,
                padding: EdgeInsets.only(left: 10.px),
                child: CooeeImageAsset(
                  image: suffixIcon ??
                      (!obscureText
                          ? CooeeAsset.icNotShowPass
                          : CooeeAsset.icShowPass),
                  height: 18.px,
                  width: 18.px,
                ),
              ),
            ),
          if (showSuffixText)
            InkWell(
              onTap: onTap,
              child: Container(
                height: 46.px,
                padding: EdgeInsets.only(left: 10.px),
                alignment: Alignment.center,
                child: EnsoText(suffixIcon!,
                    color: ColorConstant.appPurple,
                    fontWeight: FontWeight.w600),
              ),
            ),
        ],
      ),
    );
  }
//   BorderSide? determineBorderSide() {
//   if (haveBorder) {
//     return BorderSide(
//       width: 1,
//       color: ColorConstant.activityBorder,
//       // You can also specify other properties like style, if needed
//       // style: BorderStyle.solid,
//     );
//   } else {
//     return null;
//   }
// }
}

// class OtpRoundedTextFormField extends StatelessWidget {
//   final GestureTapCallback? onTap;
//   final ValueChanged<String>? onChanged;
//   final double? radius;
//   final Widget? prefixIcon;
//   final TextEditingController controller;
//   final String hintText;
//   final bool readOnly;
//   final bool isNumber;
//   final bool showSuffix;
//   final int length;
//   final int counterValue;
//   final String? suffixIcon;
//   // final OtpStatus? otpStatus;
//   final GestureTapCallback? onSuffixTap;

//   const OtpRoundedTextFormField({
//     super.key,
//     this.onTap,
//     this.onChanged,
//     this.radius,
//     this.prefixIcon,
//     required this.controller,
//     required this.hintText,
//     this.readOnly = false,
//     this.isNumber = true,
//     this.showSuffix = true,
//     this.length = 6,
//     this.suffixIcon,
//     // this.otpStatus,
//     this.onSuffixTap,
//     this.counterValue = 20,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 48.px,
//       padding: EdgeInsets.symmetric(horizontal: 12.px),
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(radius ?? 8.px),
//         color: ColorConstant.appSuggestionBorder,
//       ),
//       child: Row(
//         children: [
//           if (prefixIcon != null) SizedBox(width: 66.px, child: prefixIcon),
//           Expanded(
//             child: TextFormField(
//               onTap: onTap,
//               onChanged: onChanged,
//               controller: controller,
//               style: TextStyle(
//                 fontFamily: EnsoAsset.defaultFont,
//                 fontSize: 14.px,
//                 fontWeight: FontWeight.w600,
//                 color: ColorConstant.appBlue,
//               ),
//               readOnly: readOnly,
//               keyboardType: const TextInputType.numberWithOptions(),
//               cursorColor: ColorConstant.appBlue,
//               inputFormatters: [
//                 if (isNumber) FilteringTextInputFormatter.digitsOnly,
//                 if (isNumber) LengthLimitingTextInputFormatter(length),
//               ],
//               decoration: InputDecoration(
//                 border: InputBorder.none,
//                 focusedBorder: InputBorder.none,
//                 hintText: hintText,
//                 hintStyle: TextStyle(
//                   fontFamily: EnsoAsset.defaultFont,
//                   fontSize: 14.px,
//                   fontWeight: FontWeight.w600,
//                   color: ColorConstant.appHintTextColor,
//                 ),
//               ),
//             ),
//           ),
//           EnsoImageAsset(image: EnsoAsset.dividerIcon, width: 2.px),
//           InkWell(
//             onTap: onSuffixTap,
//             child: Padding(
//               padding: EdgeInsets.only(left: 12.px),
//               child: otpStatus == OtpStatus.Initial
//                   ? EnsoText(
//                       S.of(context).sendOtp,
//                       color: ColorConstant.appPurple.withOpacity(0.2),
//                       fontWeight: FontWeight.w600,
//                     )
//                   : otpStatus == OtpStatus.Send
//                       ? EnsoText(
//                           S.of(context).sendOtp,
//                           color: ColorConstant.appPurple,
//                           fontWeight: FontWeight.w600,
//                         )
//                       : otpStatus == OtpStatus.Sent
//                           ? EnsoText(
//                               'Resend OTP in $counterValue sec',
//                               color: ColorConstant.appPurple,
//                               fontWeight: FontWeight.w600,
//                             )
//                           : otpStatus == OtpStatus.Resend
//                               ? EnsoText(
//                                   S.of(context).resendOtp,
//                                   color: ColorConstant.appPurple,
//                                   fontWeight: FontWeight.w600,
//                                 )
//                               : otpStatus == OtpStatus.Verified
//                                   ? EnsoImageAsset(
//                                       image: EnsoAsset.successTickIcon,
//                                       height: 20.px,
//                                       width: 20.px)
//                                   : Row(
//                                       children: [
//                                         EnsoText(S.of(context).resendOtp,
//                                             color: ColorConstant.appPurple,
//                                             fontWeight: FontWeight.w600),
//                                         SizedBox(width: 6.px),
//                                         EnsoImageAsset(
//                                           image: EnsoAsset
//                                               .circleCloseTransparentIcon,
//                                           color: ColorConstant
//                                               .lightErrorRedColor,
//                                           height: 20.px,
//                                           width: 20.px,
//                                         )
//                                       ],
//                                     ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
