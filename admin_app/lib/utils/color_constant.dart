import 'package:flutter/cupertino.dart';

class ColorConstant {
  //================== Cooee Colors ==================
  static const Color appPrimary = Color(0xff22E552);
  static const Color inActiveDanger = Color(0xFFFFA2A2);
  static const Color lightGreen = Color(0xFFC2CDD6);
  static const Color bottomNavigationBgColor = Color(0xff212121);
  static const Color appWhite = Color(0xffFFFFFF);
  static const Color appBlack = Color(0xFF000000);
  static const Color black87 = Color(0xFF1A1A1A);
  static const Color appPrimaryColor = Color(0xff0D6EFD);
    static const textFieldBorderColor = Color(0xff868686);
     static const Color appPurple = Color(0xff5D0D8B);
  static const Color appSecondaryColor = Color(0xff3A3D41);
  static const Color appRed = Color(0xFFC62828);
  static const Color appLightGreen = Color(0xFF05A687);
   static const Color darkLightGreyColor = Color(0xffA3A3A3);
    static const Color appBlue = Color(0xff172B4D);
  static const categoryBG2Color = Color(0xffF0516D);
  static const Color lightGreyColor = Color(0xff666C89);
  static const Color lightPink = Color(0xffFFF5F9);
  static const Color lightGreyColorBorder = Color(0xffE1E1E1);
  static const Color appGrey = Color(0xff868686);
  static const Color appGrey50 = Color(0xFF565050);
  static const Color appGrey100 = Color(0xff374248);
  static const Color appGrey200 = Color(0xff21262A);
  static const Color appHintTextColor = Color(0xffD1D3D4);
  static const Color appGrey300 = Color(0xFF202223);
  static const Color wishListProduct = Color(0xFFF2F2F2);
  static const Color appWhite50 = Color(0xFFF4F4F4);
  static const Color appWhite100 = Color(0xffF1F1F1);
  static const Color appWhite200 = Color(0xFFB7BFD2);
  static const Color appLightBlue = Color(0xff344663);
  static const Color appSuggestionBorder = Color(0xffF5F5F5);
  static const Color cardGreyBorderColor = Color(0xFF3E3E3E);
  static const Color lightYellowBG = Color(0xFFFFE2C6);
  static const List<Color> blackAndGreyGradient = [appBlack, appGrey100];
  static const Color warningColor = Color(0xFFF4C790);
  static const Color successColor = Color(0xFFA4F4E7);
  static const Color boxShadow = Color(0xFF606060);
  static const Color grey = Color(0xFF323F49);

  static const List<Color> cardGradientWhiteBlack = [appBlack, appGrey100];

  //================== Cooee Text Colors ==================
  static const Color dangerColor = Color(0xFFEF7985);
  static const Color greyTextFieldhintText = Color(0xFF5E6468);
  static const Color orangeText = Color(0xFFFF8005);
  static Color hex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }
}
