import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/route.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../uitils/images.dart';
import '../../uitils/strings.dart';
import '../../uitils/usefull_function.dart';

class DataPackage extends StatelessWidget {
  const DataPackage({
    super.key,
    required this.size,
    required this.bgColor,
    required this.price,
    required this.expireIn,
    required this.gb,
    required this.onTap,
  });

  final Size size;
  final Color bgColor;
  final String price;
  final int expireIn;
  final String gb;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: size.width * 0.45,
        height: size.height * 0.15,
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(size.width * 0.03)),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.022),
            AppText(
              text: "₦$price",
              size: UsefulFunction.sizeAble(size: 16.sp, context: context),
              fontWeight: FontWeight.w700,
            ),
            AppText(
              text: "$gb/${expireIn}days",
              size: UsefulFunction.sizeAble(size: 14.sp, context: context),
              fontWeight: FontWeight.w700,
            ),
          ],
        ),
      ),
    );
  }
}

class NetworkButton extends StatelessWidget {
  const NetworkButton({
    Key? key,
    required this.size,
    required this.onTap,
    required this.index,
    required this.imgUrl,
    this.selectedRegion = 0,
  }) : super(key: key);

  final Size size;
  final int index;
  final String imgUrl;
  final Function() onTap;
  final int selectedRegion;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        padding: EdgeInsets.all(
          size.width * 0.015,
        ),
        decoration: BoxDecoration(
          color: index == selectedRegion
              ? Colors.grey.shade600
              : Colors.grey.shade100,
          borderRadius: BorderRadius.circular(size.width * 0.02),
          border: Border.all(
              color: index == selectedRegion
                  ? Colors.grey.shade600
                  : Colors.grey.shade100,
              width: 1.5),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height:
              index == selectedRegion ? size.width * 0.18 : size.width * 0.15,
          width:
              index == selectedRegion ? size.width * 0.18 : size.width * 0.15,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgUrl),
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> confirmTransaction(BuildContext context, Size size,
    {required String productTitle,required String productSubTitle,
    required String productPrice}) async {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return  Container(
            padding: EdgeInsets.all(size.width*0.04),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(size.width*0.03),
              topRight: Radius.circular(size.width*0.03)
              ),
            ),
            child:   Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Confirm Purchase",
                      textColor: AppColors.blackColor,
                      size: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                    GestureDetector(
                      onTap: () {
                        
                      },
                      child:GestureDetector(
                        onTap: () => Navigator.pop(context),
                        child:  Icon(Icons.cancel,size: 20.sp,)))
                  ],
                ),
                SizedBox(height: size.height*0.02),
                Row(
                  children: [
                    AppText(text: "Product",
                    fontWeight: FontWeight.w500,size: 14.sp,
                    textColor: AppColors.blackColor,),
                  ],
                ),
                 SizedBox(height: size.height*0.02),
                 ColumnFillContainer(size: size, title:productTitle,
                  subTitle:productSubTitle),
                   SizedBox(height: size.height*0.02),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      AppText(text: "Price:",size: 14.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,),
                      AppText(text:"${Strings.nairaign}$productPrice",size: 14.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,),
                    ]
                   ),
                    SizedBox(height: size.height*0.01),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      AppText(text: "Discount:",size: 14.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,),
                      AppText(text: "-${Strings.nairaign}${UsefulFunction.calculateDiscount(price:int.parse(productPrice))}",
                      size: 14.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.darkYellowColor,),
                    ]
                   ),
                    SizedBox(height: size.height*0.01),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      AppText(text: "Amount to be paid:",size: 14.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,),
                      AppText(text: "${Strings.nairaign}${UsefulFunction.calculateDiscountedPrice(price: int.parse(productPrice))}",size: 14.sp,
                      fontWeight: FontWeight.w500,
                      textColor: AppColors.blackColor,),
                    ]
                   ),
                     SizedBox(height: size.height * 0.03),
               AppButton(
                          size: size,
                          text: "PAY ${UsefulFunction.calculateDiscountedPrice(price: int.parse(productPrice))}",
                          validated: true,
                          bgColor: AppColors.lightYellowColor,
                          textSize: 12.sp,
                          textColor: AppColors.blackColor,
                          onTap: () {

                            Navigator.pop(context);
                             transactionResponse(context, size, imgPath: ImageAssets.successIcon ,
                             title: "Top-up Successful",
                             description:productSubTitle=="TV Subscription"||productSubTitle=="Electricity"?"Thanks for using Swift Access":
                              "08029533423 will be credited Shortly.\nThanks for using Swift Access");
                            //  transactionResponse(context, size, imgPath: ImageAssets.failedIcon ,
                            //  title: "Airtime Top-up Failed",
                            //  description: "Error: Biller Inactive.\nPlease check back later");
                          }),
              
              ],
            ),
                   
          );
      });
}

Future<void> transactionResponse(BuildContext context, Size size,
    {required String imgPath ,required String title,
    required String description}) async {
  return showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return Container(
          padding: EdgeInsets.all(size.width*0.04),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
            topLeft: Radius.circular(size.width*0.03),
            topRight: Radius.circular(size.width*0.03)
            ),
          ),
          child:   Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AppText(
                    text: title,
                    textColor: AppColors.blackColor,
                    size: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () {
                      
                    },
                    child:GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child:  Icon(Icons.cancel,size: 20.sp,)))
                ],
              ),
              SizedBox(height: size.height*0.02),
               Image.asset(imgPath,height: size.width*0.4,fit: BoxFit.fill,),
                SizedBox(height: size.height*0.02),
                AppText(text: description,
                textAlign: TextAlign.center,
                fontWeight: FontWeight.w500,
                size: 14.sp,textColor: AppColors.blackColor,
                ),
                   SizedBox(height: size.height * 0.03),
             AppButton(
                        size: size,
                        text: "BACK TO HOME",
                        validated: true,
                        bgColor: AppColors.lightYellowColor,
                        textSize: 12.sp,
                        textColor: AppColors.blackColor,
                        onTap: () {
                          Navigator.pushNamedAndRemoveUntil(context, AppRoute.home,(route)=>false);
                        }),
            
            ],
          ),
                 
        );
      });
}
class NetWorks extends StatelessWidget {
  const NetWorks({
    super.key,
    required this.size,
    required this.onTap,
    required this.name,
    required this.imgUrl,
    required this.currentIndex,
    required this.index,
  });

  final Size size;
  final Function() onTap;
  final String name;
  final String imgUrl;
  final int currentIndex;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
        Navigator.pop(context);
      },
      child: Container(
        margin: EdgeInsets.all(size.width * 0.02),
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
          border: Border.all(
              color: currentIndex == index
                  ? Colors.amber.shade900
                  : Colors.black45,
              width: 0.5),
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: Row(
          children: [
            Visibility(
              visible: imgUrl.isNotEmpty,
              child: Image.asset(
                imgUrl,
                height: size.width * 0.2,
                width: size.width * 0.2,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: size.width * 0.05),
            AppText(
              text: name,
              textColor: Colors.black,
              size: imgUrl.isEmpty ? 14.sp : 18.sp,
              fontWeight: imgUrl.isEmpty ? FontWeight.w400 : FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}

dynamic modalBottomOptions({
  required BuildContext context,
  required Size size,
  required List names,
  required List imgUrl,
  required int currentIndex,
  String description = "Select the Netword provider",
  required Function(int index) onChange,
}) {
  showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView(
          children: [
            AppText(
              text: description,
              size: 14.sp,
              textColor: AppColors.blackColor,
              fontWeight: FontWeight.w600,
            ),
            Column(
              children: List.generate(
                  names.length,
                  (index) =>
                  PaymentoptionBtn(size: size, onTap: (){}, imgPath: imgUrl[index], text: names[index])
                  
                  //  NetWorks(
                  //       index: index,
                  //       currentIndex: currentIndex,
                  //       size: size,
                  //       imgUrl: imgUrl.isEmpty ? "" : imgUrl[index],
                  //       name: names[index],
                  //       onTap: () => onChange(index),
                  //     ),
                      ),
            ),
          ],
        );
      });
}
