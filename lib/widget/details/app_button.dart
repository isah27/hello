import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    Key? key,
    required this.size,
    this.bgColor = Colors.amber,
    this.textColor = Colors.white,
    this.textSize = 14,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.validated = false,
    this.buttonRadius,
    this.padding,
  }) : super(key: key);

  final Size size;
  final String text;
  final Color textColor;
  final Color bgColor;
  final Function() onTap;
  final double textSize;
  final bool isLoading;
  final bool validated;
  final double? padding;
  final double? buttonRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(buttonRadius ?? size.width * 0.01),
      child: MaterialButton(
        color: validated ? bgColor : AppColors.idleColor,
        minWidth: size.width * 0.9,
        padding: EdgeInsets.all(padding ?? size.height * 0.02),
        onPressed: () {
          if (!isLoading && validated) {
            onTap();
          } else {
            log("not validated");
          }
        },
        child: Center(
          child: isLoading
              ? const CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                )
              : AppText(
                  text: text,
                  size: textSize.sp,
                  textColor: validated ? textColor : AppColors.blackColor,
                  fontWeight: FontWeight.w700,
                ),
        ),
      ),
    );
  }
}

class AppText extends StatelessWidget {
  const AppText({
    Key? key,
    required this.text,
    this.size = 12,
    this.textColor = Colors.white,
    this.fontWeight = FontWeight.normal,
    this.textAlign,
  }) : super(key: key);

  final String text;
  final double size;
  final Color textColor;
  final FontWeight fontWeight;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: size,
          color: textColor,
          fontWeight: fontWeight,
          fontFamilyFallback:[ DefaultTextStyle.of(context).style.fontFamilyFallback?.first??"roboto"],
          decoration: TextDecoration.none),
    );
  }
}
