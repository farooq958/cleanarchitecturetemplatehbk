

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbkblanket/Presentation/Resources/colors_pallete.dart';
import 'package:hbkblanket/Presentation/Resources/text_styles.dart';


import 'app_text.dart';
import 'image_widgets.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final Color bgColor;
  final Color textColor;
  final Color? iconColor;
  final double? horizontalPadding;
  final double? verticalPadding;
  final double? horizontalMargin;
  final double? verticalMargin;

  ///must be Asset Image
  final String? trailingIcon;

  ///must be Asset Image
  final String? leadingIcon;
  final double? imageWidth;
  final double? imageHeight;
  final bool isBorder;
  final Color? borderColor;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.text,
    this.bgColor = AppColors.primaryColor,
    this.textColor = AppColors.whiteColor,
    this.horizontalPadding = 10,
    this.verticalPadding = 10,
    this.horizontalMargin = 1,
    this.verticalMargin = 1,
    this.trailingIcon,
    this.iconColor,
    this.isBorder = true,
    this.leadingIcon,
    this.imageWidth = 22,
    this.imageHeight = 25,
    this.borderColor = AppColors.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
       // height: 70,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
        margin: EdgeInsets.symmetric(
          horizontal: horizontalMargin!,
          vertical: verticalMargin!,
        ).r,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding!,
          vertical: verticalPadding!,
        ).r,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10).r,
          border: isBorder
              ? Border.all(
                  color: borderColor!,
                  width: 1.w,
                )
              : null,
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              leadingIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: AssetImageWidget(
                        url: leadingIcon!,
                        color: iconColor,
                        width: imageWidth,
                        height: imageHeight,
                      ),
                    )
                  : Container(),
              AppText(
                text,
                style: Styles.circularStdRegular(
                  context,
                  color: textColor,
                  fontSize: 16.sp,
                ),
              ),
              trailingIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: AssetImageWidget(
                        url: trailingIcon!,
                        width: 22,
                        color: iconColor,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }
}


