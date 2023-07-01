import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

class UsefulFunction {
  static String currencyConverter({required var price}) {
    final currencyFormatter = NumberFormat("#,##0.00", "en_US");
    return currencyFormatter.format(price);
  }
  static dynamic calculateDiscountedPrice({required int price}){
    final discountPrice=price*0.02;
    return price-discountPrice;
  }
    static dynamic calculateDiscount({required int price}){
   
    return price*0.02;
  }
  static double sizeAble(
      {required double size, required BuildContext context}) {
    if (MediaQuery.of(context).size.width < 810) {
      return size;
    } else {
      return size * 0.8;
    }
  }

  static String greetings() {
    return (DateFormat("hh:mm a").format(DateTime.now())).contains("AM")
        ? "Morning"
        : "Good Day";
  }


  static successMessage({transactionType}){
    const airtimeTitle="Airtime Top-up Successful";
    const airtimeDesc="08029533423 will be credited Shortly.\nThanks for using Swift Access";
  

  }

}
