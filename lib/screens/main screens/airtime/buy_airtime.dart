import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/uitils/images.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../../uitils/strings.dart';
import '../../../uitils/usefull_function.dart';
import '../../../widget/details/airtime_widget.dart';
import '../../../widget/details/utility_bills_widget.dart';

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
  var prices=[
    50,100,200,300,
    400,500,600,700,
  ];
  int currentIndex = 0;
  final networkController = TextEditingController(text: "Select Network");
  final amountController=TextEditingController(text: "0");
  final phoneNumberController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: ListView(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(text: "Buy Airtime", size: size),
          Padding(
            padding: EdgeInsets.all(size.width * 0.04),
           
            child: SizedBox(
              height: size.height*0.95,
              width: size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                   FieldDescription(desc: "Choose Network Provider",color: AppColors.blackColor,),
                    SizedBox(height: size.height * 0.005),           
                  InkWell(
                    onTap: () async{
                   final index=await   optionsDialog(context:context,
                    size:size,names: networkNames,images: networkImg,
                    currentIndex: currentIndex);
                      log(index.toString());
                      setState(() {
                        currentIndex=index;
                        networkController.text=networkNames[currentIndex];
                      });
                    
                    },
                    child: SelectionButton(size: size, text: networkController.text,),
                    
                  ),
                  SizedBox(height: size.height * 0.03),
                  FieldDescription(desc: "Enter Mobile Number",color: AppColors.blackColor,),
                    SizedBox(height: size.height * 0.005),
                  AppTextField(
                    borderColor: AppColors.blackColor,
                    size: size,
                    fillColor: Colors.white,
                    hintText: "+234",
                    controller:phoneNumberController ,
                    keyboardType: TextInputType.number,
                  ),
                
                  Wrap(      
                    children: List.generate(prices.length,
                     (index) => AirtimePriceRoundContainer(
                      selected: amountController.text==prices[index].toString(),
                      size: size,
                     amount: '${prices[index]}', 
                     discountAmount: '${UsefulFunction.calculateDiscountedPrice(price: prices[index])}',
                      onTap: () { 
                        setState(() {
                          amountController.text=prices[index].toString();
                        });
                       },),
                      ),
                  ),
                  SizedBox(height: size.height * 0.03),
                   FieldDescription(desc: "Preferred Amount",color: AppColors.blackColor,),
                    SizedBox(height: size.height * 0.005),
                  AppTextField(
                     borderColor: AppColors.blackColor,
                    size: size,
                    fillColor: Colors.white,
                    hintText: "Enter amount",
                    controller: amountController,
                    keyboardType: TextInputType.phone,
                    onChange: () {
                       setState(() {
                         
                        });
                    },
                  ),
                  const Spacer(),
                  AppButton(
                    size: size,
                    text: "TOP-UP",
                    bgColor: AppColors.lightYellowColor,
                    validated: true,
                    textColor: AppColors.blackColor,
                    onTap: () {
                      confirmTransaction(context, size,
                         productPrice: amountController.text,
                         productTitle: "${Strings.nairaign}${amountController.text}",
                         productSubTitle: "Airtime"
                         );
                    },
                  ),
                   SizedBox(height: size.height * 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  
}
