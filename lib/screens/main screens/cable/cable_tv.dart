import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/widget/app_widget.dart';
import 'package:swift_access/widget/details/utility_bills_widget.dart';

import '../../../uitils/images.dart';

class CableSubscriptionPage extends StatefulWidget {
  const CableSubscriptionPage({super.key});

  @override
  State<CableSubscriptionPage> createState() => _CableSubscriptionPageState();
}

class _CableSubscriptionPageState extends State<CableSubscriptionPage> {
  var vendorImg = [
    ImageAssets.starTimeIcon,
    ImageAssets.dstvIcon,
    ImageAssets.gotvIcon, 
  ];
  var vendorNames = ["Startimes", "DSTV", "GOTV",];
  int currentIndex = 0;
  final cableController = TextEditingController(text: "Select cable provider");
  final planController = TextEditingController(text:"Select plan");
  final smartCardNoController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(
              text: "Cable Subscription",
              size: Size(size.width * 0.5, size.height)),
          Container(
            height: size.height*0.88,
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.04),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(size.width * 0.1),
                // topRight: Radius.circular(size.width * 0.1),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Choose the cable provider",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                InkWell(
                  onTap: () async {
                    final index = await optionsDialog(
                      context: context,
                      size: size,
                      names: vendorNames,
                      images: vendorImg,
                      desc: "Select cable provider.",
                      currentIndex: currentIndex,
                    );
                    setState(() {
                      cableController.text = vendorNames[index];
                      currentIndex = index;
                    });
                  },
                  child: SelectionButton(
                    size: size,
                    text: cableController.text,
                  ),
                ),
                SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Select Plan",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                InkWell(
                  onTap: () async {
                    final index = await optionsDialog(
                      context: context,
                      size: size,
                      names:vendorNames ,
                      images: vendorImg,
                      desc: "Select plan",
                      currentIndex: currentIndex,
                    );
                    setState(() {
                      planController.text = vendorNames[index];
                      currentIndex = index;
                    });
                  },
                  child: SelectionButton(
                    size: size,
                    text: planController.text,
                  ),
                ),
            
                
                 SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "IUC/Smartcard Number",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                AppTextField(
                  size: size,
                  fillColor: AppColors.textBorderColor,
                  hintText: "IUC/Smartcard Number",
                  controller: smartCardNoController,
                  keyboardType: TextInputType.phone,
                ),
               const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: AppButton(
                    size: size,
                    text: "Validate Cable Number",
                    bgColor:AppColors.lightYellowColor,
                    validated: true,
                    onTap: () {
                      confirmTransaction(context, size,
                      productPrice: "1000",
                      productTitle: "Dstv jumbo pack",
                      productSubTitle: "TV Subscription",
                      );
                    },
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
