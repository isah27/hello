import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/widget/app_widget.dart';
import 'package:swift_access/widget/details/utility_bills_widget.dart';

class ElectricityBillPage extends StatefulWidget {
  const ElectricityBillPage({super.key});

  @override
  State<ElectricityBillPage> createState() => _ElectricityBillPageState();
}

class _ElectricityBillPageState extends State<ElectricityBillPage> {
  var meterTypes = [
    "Prepaid",
    "Postpaid",
  ];
  var companyNames = [
    "Ikeja electric",
    "Eko electric",
    "Abuja electric",
    "Enugu Electric"
  ];
  int currentIndex = 0;
  final cableController = TextEditingController();
  final meterController = TextEditingController();
  final meterNumberController = TextEditingController();
  final amountController = TextEditingController();
  final phoneNumberController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:AppColors.whiteColor,
      body: ListView(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(
              text: "Electricity Bill Payment",
              size: Size(size.width * 0.3, size.height)),
          Container(
            height: size.height*0.88,
            width: size.width,
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Select Disco Company",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                InkWell(
                  onTap: ()async {
                   final index=await optionsDialog(
                      context: context,
                      size: size,
                      names: companyNames,
                      images: [],
                      desc: "Select Disco company",
                      currentIndex: currentIndex,
                     
                    );
                    setState(() {
                          cableController.text = companyNames[index];
                          currentIndex = index;
                        });
                  },
                  child:SelectionButton(size: size, text:cableController.text )
                ),
                 SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Select meter type",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                InkWell(
                  onTap: ()async {
                   final index=await optionsDialog(
                      context: context,
                      size: size,
                      names: meterTypes,
                      images: [],
                      desc: "Select Meter Type",
                      currentIndex: currentIndex,
                     
                    );
                    setState(() {
                          meterController.text = meterTypes[index];
                          currentIndex = index;
                        });
                  },
                  child:SelectionButton(size: size, text:meterController.text )
                ),
               
                  SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Enter Meter Number",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                AppTextField(
                  size: size,
                  fillColor: AppColors.textBorderColor,
                  hintText: "Meter Number",
                  controller:meterNumberController,
                  keyboardType: TextInputType.phone,
                ),
                                 SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Prefered Amount",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                AppTextField(
                  size: size,
                  fillColor: AppColors.textBorderColor,
                  hintText: "Amount",
                  controller:amountController,
                  keyboardType: TextInputType.phone,
                ),
                SizedBox(height: size.height * 0.03),
                FieldDescription(
                  desc: "Phone Number",
                  color: AppColors.blackColor,
                ),
                SizedBox(height: size.height * 0.005),
                AppTextField(
                  size: size,
                  fillColor: AppColors.textBorderColor,
                  hintText: "Phone number",
                  controller: phoneNumberController,
                  keyboardType: TextInputType.phone,
                ),
              const Spacer(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.02),
                  child: AppButton(
                    size: size,
                    text: "Validate Meter",
                    validated: true,
                    bgColor: AppColors.lightYellowColor,
                    onTap: () {
                      confirmTransaction(context, size,
                      productPrice: "2000",
                      productTitle: "Enugu Electricity",
                      productSubTitle: "Electricity",
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
