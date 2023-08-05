

import 'package:flutter/material.dart';
import 'package:hbkblanket/Presentation/Resources/colors_pallete.dart';


class AppShadow {
  static BoxShadow normal() => BoxShadow(
        blurRadius: 15,
        spreadRadius: 5,
        color: AppColors.lightGreyColor.withOpacity(0.1),
        offset: const Offset(0, 7),
      );

  static BoxShadow minimum() => BoxShadow(
        blurRadius: 7,
        spreadRadius: 2,
        color: AppColors.lightGreyColor.withOpacity(0.1),
        offset: const Offset(0, 3),
      );
}
