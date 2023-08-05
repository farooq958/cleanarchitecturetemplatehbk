

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hbkblanket/Presentation/Resources/colors_pallete.dart';
import 'package:hbkblanket/Presentation/Resources/text_styles.dart';


import 'app_shadow.dart';
import 'app_text.dart';

class ScrollingTabs extends StatefulWidget {
  ///
  ///assign [list] of Strings  for tabs and List of [widgets] for TabView
  ///
  /// make sure the [list] length and [widgets] length might be same
  ///
  /// [tabStyle] for decorating Tabs
  ///

  const ScrollingTabs({
    super.key,
    required this.list,
    required this.widgets,
    this.width,
    this.buttonWidth,
    this.tabStyle = const ChipButtonStyle(),
    this.mainAxis = MainAxisAlignment.center,
    this.sizedBoxWidth = 0,
    required this.currentTab,
  }) : assert(list.length == widgets.length,
            'Tabs and Widgets length must be same');
  final List<String> list;
  final List<Widget> widgets;
  final ChipButtonStyle tabStyle;
  final double? width;
  final double? buttonWidth;
  final MainAxisAlignment? mainAxis;
  final double? sizedBoxWidth;

  ///return current tab Widget
  final void Function(Widget widget) currentTab;
  @override
  State<ScrollingTabs> createState() => _ScrollingTabsState();
}

class _ScrollingTabsState extends State<ScrollingTabs> {
  int currentTab = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: widget.width ?? double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.whiteColor,
          boxShadow: [AppShadow.minimum()]),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: widget.mainAxis!,
            children: [
              for (int index = 0; index < widget.list.length; index++) ...[
                Expanded(
                  child: ChipButton(
                    width: widget.buttonWidth,
                    unSelectedBorderColor: Colors.transparent,
                    onTap: () {
                      widget.currentTab(widget.widgets[index]);
                      setState(() {
                        currentTab = index;
                      });
                    },
                    text: widget.list[index],
                    isSelected: widget.list[index] == widget.list[currentTab]
                        ? true
                        : false,
                    radius: widget.tabStyle.radius,
                    hPadding: widget.tabStyle.hPadding,
                    vPadding: widget.tabStyle.vPadding,
                    fontSize: widget.tabStyle.fontSize,
                  ),
                ),
                SizedBox(width: widget.sizedBoxWidth),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
class ChipButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isSelected;
  final double? radius;
  final double? hPadding;
  final double? vPadding;
  final double? fontSize;
  final double? width;
  final Color? unSelectedBorderColor;
  const ChipButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.isSelected,
    this.radius = 18,
    this.hPadding = 14,
    this.vPadding = 9,
    this.fontSize = 13,
    this.width,
    this.unSelectedBorderColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: width,
        curve: Curves.fastOutSlowIn,
        padding: EdgeInsets.symmetric(
          horizontal: hPadding!,
          vertical: vPadding!,
        ).r,
        alignment: Alignment.center,
        //margin: const EdgeInsets.only(right: 8).r,
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryColor : AppColors.whiteColor,
          borderRadius: BorderRadius.circular(radius!).r,
          border: Border.all(
            color: isSelected
                ? Colors.transparent
                : unSelectedBorderColor ?? Colors.grey.shade200,
          ),
        ),
        child: AppText(
          text,
          style: Styles.circularStdRegular(
            context,
            fontSize: fontSize!.sp,
            color: isSelected ? AppColors.whiteColor : AppColors.lightGreyColor,
          ),
        ),
      ),
    );
  }
}

class ChipButtonStyle {
  const ChipButtonStyle({
    this.radius = 10,
    this.hPadding = 16,
    this.vPadding = 11,
    this.fontSize = 14,
  });
  final double radius;
  final double hPadding;
  final double vPadding;
  final double fontSize;
}