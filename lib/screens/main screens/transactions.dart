import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/uitils/images.dart';
import 'package:swift_access/uitils/strings.dart';
import 'package:swift_access/widget/app_widget.dart';

class TransactionsPage extends StatefulWidget {
  const TransactionsPage({super.key});

  @override
  State<TransactionsPage> createState() => _TransactionsPageState();
}

class _TransactionsPageState extends State<TransactionsPage> {
  int currentIndex = 0;
  final cableController = TextEditingController();
  final meterController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(text: "Transaction History",fontColor: AppColors.blackColor, size: size),
          Padding(
            padding: EdgeInsets.all(size.width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PaymentoptionBtn(imgPath: ImageAssets.airtimeIcon,
                trailingImgUrl: ImageAssets.airtelIcon,text: "Airtime Purchased",
                subTitle:"${Strings.nairaign}2000  26:06:2023 (08029533423)" ,  size: size,onTap: () {
                  
                },),
              ]
            ),
          ),
        ],
      ),
    );
  }
}
