import 'package:flutter/material.dart';
import 'package:swift_access/widget/app_widget.dart';

class BuyDataPage extends StatelessWidget {
  const BuyDataPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.amber.shade900,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(text: "Buy Data", size: size),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.1),
                  topRight: Radius.circular(size.width * 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.1),
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
                      text: "Buy Data",
                      bgColor: Colors.amber.shade900,
                      onTap: () {
                        confirmTransaction(
                          context,
                          size,
                          text:
                              "You are about to purchase 20.GB(30days) ₦20,000 data for 08029533423",
                        );
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
