import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/usefull_function.dart';

import '../../uitils/app_colors.dart';
import '../../uitils/strings.dart';
import 'app_button.dart';
import 'home_widgets.dart';

optionsDialog({
  required BuildContext context,
  required Size size,
  String desc = "Choose Network Provider",
  List images = const [],
  List names = const [],
  List prices = const [],
  List duration = const [],
  bool isDataPackages = false,
  required int currentIndex,
}) {
  return customShowDialog(
      context: context,
      size: size,
      child: SizedBox(
        height: size.height*0.6,
        width: size.width,
        child: ListView(
          children: [
            AppText(
              text: desc,
              fontWeight: FontWeight.w600,
              size: 14.sp,
              textColor: AppColors.blackColor,
            ),
            SizedBox(height: size.height * 0.004),
            Column(
              children: List.generate(
                names.length,
                (index) => isDataPackages
                    ? DataPackageOptionBtn(
                        size: size,
                        onTap: () {
                          Navigator.pop(context, index);
                        },
                        imgPath: images[index],
                        text: "text",
                        subTitle: 50,
                        trailingText: "Trailing text ₦",
                      )
                    : PaymentoptionBtn(
                        size: size,
                        bgColor: index == currentIndex
                            ? AppColors.lightYellowColor
                            : null,
                        trailingText: duration.isEmpty ? null : duration[index],
                        subTitle: prices.isEmpty
                            ? null
                            : Strings.nairaign + prices[index].toString(),
                        secondSubText: prices.isEmpty
                            ? null
                            : "  Pay${UsefulFunction.calculateDiscountedPrice(price: prices[index])}",
                        onTap: () {
                          Navigator.pop(context, index);
                        },
                        imgPath: images.isEmpty ? "" : images[index],
                        text: names[index]),
              ),
            ),
          ],
        ),
      ));
}

optionsBottomModal({
  required BuildContext context,
  required Size size,
  String desc = "Choose Network Provider",
  List images = const [],
  List names = const [],
  List prices = const [],
  List duration = const [],
  required int currentIndex,
}) {
  return showModalBottomSheet(
      isDismissible: false,
      isScrollControlled: true,
      backgroundColor: AppColors.whiteColor,
      context: context,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(size.width*0.04),
          color: AppColors.whiteColor,
          child: Column(
            children: [
              SizedBox(height: size.height * 0.03),
              AppText(
                text: desc,
                fontWeight: FontWeight.w600,
                size: 14.sp,
                textColor: AppColors.blackColor,
              ),
              SizedBox(height: size.height * 0.004),
              Column(
                children: List.generate(
                    names.length,
                    (index) => DataPackageOptionBtn(
                          size: size,
                          onTap: () {
                            Navigator.pop(context, index);
                          },
                          bgColor: currentIndex==index?AppColors.lightYellowColor:null,
                          imgPath: images[index],
                          text:names[index] ,
                          subTitle: prices[index],
                          trailingText: duration[index],
                        )),
              ),
            ],
          ),
        );
      });
}
