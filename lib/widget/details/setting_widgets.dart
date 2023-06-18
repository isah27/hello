import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

class DescAndBackNav extends StatelessWidget {
  const DescAndBackNav({
    super.key,
    required this.size,
    required this.text,
  });

  final Size size;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Icon(
              Icons.chevron_left,
              color: Colors.white,
              size: 35.sp,
            ),
          ),
          SizedBox(width: size.width * 0.24),
          AppText(
            text: text,
            size: 18.sp,
            textColor: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ],
      ),
    );
  }
}
