
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';

import '../../uitils/images.dart';
import '../../uitils/strings.dart';
import 'app_button.dart';

class AirtimePriceRoundContainer extends StatelessWidget {
  const AirtimePriceRoundContainer({
    super.key,
    required this.size, required this.amount,
     required this.discountAmount
     , required this.onTap, this.selected=false,
  });

  final Size size;
  final String amount;
  final String discountAmount;
  final Function() onTap;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        height: size.width*0.2,
        width: size.width*0.2,
        padding: EdgeInsets.all(size.width*0.02),
        margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.03),
        decoration: BoxDecoration(
          color: selected?AppColors.blackColor:null,
          border: Border.all(
            color: AppColors.blackColor,
          ),
          borderRadius: BorderRadius.circular(size.width*0.03)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(text: "${Strings.nairaign}$amount",
            textColor:selected?AppColors.lightYellowColor: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            size: 14.sp,
            ),
            SizedBox(height: size.height*0.005),
            FittedBox(
              child: AppText(text:"Pay ${Strings.nairaign}$discountAmount",
              textColor:selected?AppColors.lightYellowColor:  AppColors.blackColor,
              fontWeight: FontWeight.w500,
              size: 10.sp,
              
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectionButton extends StatelessWidget {
  const SelectionButton({
    super.key,
    required this.size, required this.text,
  });

  final Size size;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: size.width*0.02,
      vertical: size.width*0.04,
      ),
      decoration: BoxDecoration(
        color: AppColors.textBorderColor,
        border: Border.all(
          color: AppColors.blackColor
        ),
        borderRadius: BorderRadius.circular(size.width*0.02),
      ),
      child: Row(
        children: [
        SizedBox(width: size.width*0.05),
        AppText(text: text,size: 12.sp,
        textColor: AppColors.blackColor,
        ),
        Expanded(child: Container()),
        Image.asset(ImageAssets.circleArrowDownIcon,
        height: size.width*0.06,width: size.width*0.06,),
      ]),
    );
  }
}
