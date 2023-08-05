import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbkblanket/Presentation/Resources/colors_pallete.dart';

class CustomDialog {
  static Future<void> dialog(BuildContext context, Widget child) async {
    return showDialog<void>(
      context: context,
      barrierColor: Colors.black12,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: const EdgeInsets.all(15).r,
          elevation: 0.0,
          backgroundColor: AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10).r,
          ),
          child: child,
        );
      },
    );
  }



}
