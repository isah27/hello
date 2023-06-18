import 'package:flutter/material.dart';
import 'package:swift_access/widget/app_widget.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          Row(
            children: [
              BackNavigation(size: size),
            ],
          ),
          SizedBox(height: size.height * 0.05),
          Container(
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.05,
              vertical: size.height * 0.03,
            ),
            padding: EdgeInsets.fromLTRB(
              size.width * 0.05,
              size.height * 0.03,
              size.width * 0.05,
              0,
            ),
            decoration: BoxDecoration(
              color: Colors.amber.shade900,
              borderRadius: BorderRadius.circular(size.width * 0.02),
            ),
            child: Column(
              children: [
                DrawerMenu(
                  size: size,
                  text: "+2348029533423",
                  icon: Icons.call,
                ),
                DrawerMenu(
                  size: size,
                  text: "Lagos, Nigeria",
                  icon: Icons.location_on,
                ),
                DrawerMenu(
                  size: size,
                  text: "support@gmail.com",
                  icon: Icons.email,
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
