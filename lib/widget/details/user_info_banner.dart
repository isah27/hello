import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/custom_page_route.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/uitils/usefull_function.dart';

import '../app_widget.dart';

class UserInfoBanner extends StatelessWidget {
  const UserInfoBanner({
    super.key,
    required this.size,
    required this.username,
  });

  final Size size;
  final String username;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: size.height * 0.01),
      child: Row(
        children: [
          Image.asset(
            'assets/avatar.png',
            height: size.width * 0.12,
            width: size.width * 0.12,
          ),
          SizedBox(width: size.width * 0.02),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "${UsefulFunction.greetings()} $username",
                size: 14.sp,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
