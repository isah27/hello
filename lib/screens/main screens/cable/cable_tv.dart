import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

class CableSubscriptionPage extends StatefulWidget {
  const CableSubscriptionPage({super.key});

  @override
  State<CableSubscriptionPage> createState() => _CableSubscriptionPageState();
}

class _CableSubscriptionPageState extends State<CableSubscriptionPage> {
  var vendorImg = [
    "assets/startimes.png",
    "assets/dstv.png",
    "assets/gotv.png",
  ];
  var vendorNames = ["Startimes", "DSTV", "GOTV"];
  int currentIndex = 0;
  final cableController = TextEditingController();
  final planController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(
              text: "Cable Subscription",
              size: Size(size.width * 0.5, size.height)),
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
                  SizedBox(height: size.height * 0.1),
                  InkWell(
                    onTap: () {
                      modalBottomOptions(
                        context: context,
                        size: size,
                        names: vendorNames,
                        imgUrl: vendorImg,
                        description: "Select the cable provider",
                        currentIndex: currentIndex,
                        onChange: (index) {
                          setState(() {
                            cableController.text = vendorNames[index];
                            currentIndex = index;
                          });
                        },
                      );
                    },
                    child: AppTextField(
                      icon: Icons.arrow_drop_down,
                      size: size,
                      fillColor: Colors.white,
                      hintText: "Select Cable",
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
                        names: vendorNames,
                        imgUrl: [],
                        description: "Select the plan",
                        currentIndex: currentIndex,
                        onChange: (index) {
                          setState(() {
                            planController.text = vendorNames[index];
                            currentIndex = index;
                          });
                        },
                      );
                    },
                    child: AppTextField(
                      size: size,
                      fillColor: Colors.white,
                      enable: false,
                      hintText: "Select Plan",
                      controller: planController,
                      keyboardType: TextInputType.number,
                      icon: Icons.arrow_drop_down,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AppTextField(
                    size: size,
                    fillColor: Colors.white,
                    hintText: "IUC/Smartcard Number",
                    controller: TextEditingController(),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: AppButton(
                      size: size,
                      text: "Validate Cable Number",
                      bgColor: Colors.blue.shade900,
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
