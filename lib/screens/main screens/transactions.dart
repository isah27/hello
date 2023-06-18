import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
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
      backgroundColor: Colors.blue.shade900,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(text: "Transactions", size: size),
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
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(size.width * 0.02),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black26,
                          width: 0.5,
                        ),
                        borderRadius: BorderRadius.circular(size.width * 0.02),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AppText(
                                text:
                                    "N100 AIRTEL Airtime Top Up with\n08029533425",
                                size: 12.sp,
                                textColor: Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                              Container(
                                padding: EdgeInsets.all(size.width * 0.01),
                                decoration: BoxDecoration(
                                  color: Colors.green.shade800,
                                  borderRadius:
                                      BorderRadius.circular(size.width * 0.02),
                                ),
                                child: AppText(
                                  text: "Successful",
                                  size: 11.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          AppText(
                            text: "2023-05-03 - 16:09 PM",
                            size: 12.sp,
                            textColor: Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
