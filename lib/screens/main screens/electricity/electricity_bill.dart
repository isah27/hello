import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

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
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.red.shade900,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(
              text: "Electricity Bill Payment",
              size: Size(size.width * 0.3, size.height)),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.1),
                  // topRight: Radius.circular(size.width * 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.03),
                  InkWell(
                    onTap: () {
                      modalBottomOptions(
                        context: context,
                        size: size,
                        names: companyNames,
                        imgUrl: [],
                        description: "Select the disco company",
                        currentIndex: currentIndex,
                        onChange: (index) {
                          setState(() {
                            cableController.text = companyNames[index];
                            currentIndex = index;
                          });
                        },
                      );
                    },
                    child: AppTextField(
                      icon: Icons.arrow_drop_down,
                      size: size,
                      fillColor: Colors.white,
                      hintText: "Select disco company",
                      enable: false,
                      controller: cableController,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  InkWell(
                    onTap: () {
                      modalBottomOptions(
                        context: context,
                        size: size,
                        names: meterTypes,
                        imgUrl: [],
                        description: "Select the meter type",
                        currentIndex: currentIndex,
                        onChange: (index) {
                          setState(() {
                            meterController.text = meterTypes[index];
                            currentIndex = index;
                          });
                        },
                      );
                    },
                    child: AppTextField(
                      size: size,
                      fillColor: Colors.white,
                      enable: false,
                      hintText: "Select meter type",
                      controller: meterController,
                      keyboardType: TextInputType.number,
                      icon: Icons.arrow_drop_down,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AppTextField(
                    size: size,
                    fillColor: Colors.white,
                    hintText: "Meter Number",
                    controller: TextEditingController(),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: size.height * 0.03),
                  AppTextField(
                    size: size,
                    fillColor: Colors.white,
                    hintText: "Amount",
                    controller: TextEditingController(),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: size.height * 0.03),
                  AppTextField(
                    size: size,
                    fillColor: Colors.white,
                    hintText: "Customer Phone",
                    controller: TextEditingController(),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: AppButton(
                      size: size,
                      text: "Validate Meter",
                      bgColor: Colors.red.shade900,
                      onTap: () {
                        confirmTransaction(context, size,
                            text:
                                "You are about to purchase ₦200 airtime for 03083527825");
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
