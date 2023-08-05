

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_pallete.dart';

extension Scale on BuildContext {
  double get textScale => MediaQuery.of(this).textScaleFactor;
}

class Styles {
  static double _textScale(
    BuildContext context,
  ) {
     //print(MediaQuery.of(context).textScaleFactor);
    return MediaQuery.of(context).textScaleFactor > 1.0
        ? 0.9
        : MediaQuery.of(context).textScaleFactor;
  }

  // static TextStyle plusJakartaSansBlack(BuildContext context,
  //     {double? fontSize, Color? color}) {
  //   return TextStyle(
  //     fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
  //     color: color ?? AppColors.blackColor,
  //     fontFamily: "Lato Black",
  //   );
  // }

  static TextStyle circularStdBold(BuildContext context,
      {double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
      color: color ?? AppColors.blackColor,
      fontFamily: "circularStd Bold",
    );
  }

  // static TextStyle plusJakartaSansLight(BuildContext context,
  //     {double? fontSize, Color? color}) {
  //   return TextStyle(
  //     fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
  //     color: color ?? AppColors.blackColor,
  //     fontFamily: "PlusJakartaSans Light",
  //   );
  // }

  static TextStyle circularStdRegular(BuildContext context,
      {double? fontSize, Color? color, double height = 1.4}) {
    return TextStyle(
      fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
      color: color ?? AppColors.blackColor,

      fontFamily: "circularStd Regular",
      height: height,
    );
  }

  static TextStyle circularStdMedium(BuildContext context,
      {double? fontSize, Color? color}) {
    return TextStyle(
      fontSize: (fontSize ?? 14.0.sp) * _textScale(context),
      color: color ?? AppColors.blackColor,
      fontFamily: "circularStd Medium",
    );
  }
}
