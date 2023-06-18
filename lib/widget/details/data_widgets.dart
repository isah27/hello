import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/widget/app_widget.dart';

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
    {required String text}) async {
  return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: EdgeInsets.all(size.width * 0.08),
              child: AppText(
                text: text,
                textColor: Colors.black,
                size: 12.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: size.width * 0.3,
                  child: AppButton(
                      size: size,
                      text: "Cancel",
                      bgColor: Colors.red.shade900,
                      textSize: 12.sp,
                      textColor: Colors.white,
                      onTap: () {
                        Navigator.pop(context);
                      }),
                ),
                SizedBox(
                  width: size.width * 0.3,
                  child: AppButton(
                      size: size,
                      text: "Proceed",
                      bgColor: Colors.blue.shade900,
                      textSize: 12.sp,
                      textColor: Colors.white,
                      onTap: () {}),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.1),
          ],
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
        return Column(
          children: [
            AppText(
              text: description,
              size: 14.sp,
              textColor: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
            SingleChildScrollView(
              child: Column(
                children: List.generate(
                    names.length,
                    (index) => NetWorks(
                          index: index,
                          currentIndex: currentIndex,
                          size: size,
                          imgUrl: imgUrl.isEmpty ? "" : imgUrl[index],
                          name: names[index],
                          onTap: () => onChange(index),
                        )),
              ),
            ),
          ],
        );
      });
}
