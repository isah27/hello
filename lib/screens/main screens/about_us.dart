import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              BackNavigation(size: size),
              SizedBox(width: size.width * 0.1),
              AppText(
                text: "About Swift Access",
                textColor: Colors.blue.shade900,
                size: 16.sp,
                fontWeight: FontWeight.w800,
              ),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
            child: AppText(
              text:
                  "This sector of the telecommunications business is heavily involved in distribution, offering the cheapest and least expensive data, airtime, Dstv, GoTV, Startimes, and electricity subscriptions.\nSwift Access enables you to pay for services from the convenience of your own home or office.",
              size: 14.sp,
              textColor: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      )),
    );
  }
}
