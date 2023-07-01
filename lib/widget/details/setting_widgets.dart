import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/widget/app_widget.dart';

class DescAndBackNav extends StatelessWidget {
  const DescAndBackNav({
    super.key,
    required this.size,
    required this.text,
    this.fontColor=Colors.black87,
  });

  final Size size;
  final String text;
  final Color fontColor;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              color: fontColor,
              size: 35.sp,
            ),
          ),
          SizedBox(width: size.width * 0.04),
          AppText(
            text: text,
            size: 18.sp,
            textColor:fontColor,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
