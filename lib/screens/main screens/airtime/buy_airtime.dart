import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

class BuyAirtimePage extends StatefulWidget {
  const BuyAirtimePage({super.key});

  @override
  State<BuyAirtimePage> createState() => _BuyAirtimePageState();
}

class _BuyAirtimePageState extends State<BuyAirtimePage> {
  var networkImg = [
    "assets/mtn.png",
    "assets/glo.png",
    "assets/airtel.png",
    "assets/9mobile.png"
  ];
  var networkNames = ["MTN", "GLO", "AIRTEL", "9MOBILE"];
  int currentIndex = 0;
  final networkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.green.shade900,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(text: "Buy Airtime", size: size),
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
                        names: networkNames,
                        imgUrl: networkImg,
                        currentIndex: currentIndex,
                        onChange: (index) {
                          setState(() {
                            networkController.text = networkNames[index];
                            currentIndex = index;
                          });
                        },
                      );
                    },
                    child: AppTextField(
                      icon: Icons.arrow_drop_down,
                      size: size,
                      fillColor: Colors.white,
                      hintText: "Select Network",
                      enable: false,
                      controller: networkController,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  AppTextField(
                    size: size,
                    fillColor: Colors.white,
                    hintText: "Amount",
                    controller: TextEditingController(),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: size.height * 0.03),
                  AppTextField(
                    size: size,
                    fillColor: Colors.white,
                    hintText: "Phone number",
                    controller: TextEditingController(),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
                    child: AppButton(
                      size: size,
                      text: "Buy Airtime",
                      bgColor: Colors.green.shade900,
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
