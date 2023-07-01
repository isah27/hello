import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../../widget/details/utility_bills_widget.dart';

class BuyDataPage extends StatefulWidget {
  const BuyDataPage({super.key});

  @override
  State<BuyDataPage> createState() => _BuyDataPageState();
}

class _BuyDataPageState extends State<BuyDataPage> {
  var networkImg = [
    "assets/mtn.png",
    "assets/glo.png",
    "assets/airtel.png",
    "assets/9mobile.png"
  ];

  var networkNames = ["MTN", "GLO", "AIRTEL", "9MOBILE"];
  String currentPackage = "";
  var prices = [
    50,
    100,
    200,
    300,
    400,
    500,
    600,
    700,
  ];
  var dataTypes = ["SME", "GIFTING"];
  var dataPackages = ["50MB", "100MB", "200MB"];
  var dataDuration = ["1 day", "2 days", "3 days"];
  int currentIndex = 0;

  final networkController = TextEditingController(text: "Select Network");

  final dataTypeController = TextEditingController();

  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(text: "Buy Data", size: size),
          Container(
            height: size.height,
            width: size.width,
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: ListView(
              children: [
                SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Choose Network Provider",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                InkWell(
                  onTap: () async {
                    final index = await optionsDialog(
                        context: context,
                        size: size,
                        names: networkNames,
                        images: networkImg,
                        currentIndex: currentIndex);
                    log(index.toString());
                    setState(() {
                      currentIndex = index;
                      networkController.text = networkNames[currentIndex];
                    });
                  },
                  child: SelectionButton(
                    size: size,
                    text: networkController.text,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                FieldDescription(
                  desc: "Choose Data Type",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                InkWell(
                  onTap: () async {
                    final index = await optionsDialog(
                        context: context,
                        desc: "Choose Data type",
                        size: size,
                        names: dataTypes,
                        currentIndex: currentIndex);
                    log(index.toString());
                    setState(() {
                      currentIndex = index;
                      dataTypeController.text = dataTypes[currentIndex];
                    });
                  },
                  child: SelectionButton(
                    size: size,
                    text: dataTypeController.text,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                FieldDescription(
                  desc: "Select Plan",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                InkWell(
                  onTap: () async {
                    final index = await optionsBottomModal(
                        context: context,
                        desc: "Select data plan",
                        size: size,
                        names: dataPackages,
                        images: networkImg,
                        prices: prices,
                        duration: dataDuration,
                        currentIndex: currentIndex);
                    log(index.toString());
                    setState(() {
                      currentIndex = index;
                      currentPackage = dataPackages[currentIndex];
                    });
                  },
                  child: SelectionButton(
                    size: size,
                    text: currentPackage,
                  ),
                ),
                SizedBox(height: size.height * 0.02),
                FieldDescription(
                  desc: "Enter your Phone Number",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                AppTextField(
                  size: size,
                  fillColor: AppColors.textBorderColor,
                  hintText: "+234",
                  textSize: 12,
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.03),
                // Expanded(child: Container()),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: AppButton(
                    size: size,
                    text: "Buy Data",
                    validated: true,
                    textColor: AppColors.blackColor,
                    bgColor: AppColors.lightYellowColor,
                    onTap: () {
                      confirmTransaction(context, size,
                          productPrice: "300",
                          productTitle: "300MB",
                          productSubTitle: "Data plan- 1 Day");
                    },
                  ),
                ),
                SizedBox(height: size.height * 0.03),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
