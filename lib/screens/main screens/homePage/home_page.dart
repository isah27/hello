import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/route.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/uitils/images.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../../auth bloc/auth_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String currentPage = "home";
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final watchBloc = context.watch<AuthBloc>();
    final readBloc = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              UserInfoBanner(
                size: size,
                username: "${watchBloc.user.username}",
              ),
              SizedBox(height: size.height * 0.01),
              // acct balance
              AcctBalance(
                size: size,
                acctBallance: "${watchBloc.user.acctBalance}",
                user: watchBloc.user,
              ),

              SizedBox(height: size.height * 0.02),
              Row(
                children: [
                  AppText(
                    text: "Payment Options",
                    size: 14.sp,
                    textColor: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.01),
              PaymentoptionBtn(
                size: size,
                imgPath: ImageAssets.airtimeIcon,
                onTap: () {},
                text: 'Buy Airtime',
              ),
              PaymentoptionBtn(
                size: size,
                imgPath: ImageAssets.dataIcon,
                onTap: () {},
                text: 'Buy Data',
              ),
              PaymentoptionBtn(
                size: size,
                imgPath: ImageAssets.sportBetIcon,
                onTap: () {
                  customShowDialog(
                      context: context,
                      size: size,
                      child: ComminSoon(size: size));
                },
                text: 'Sport Betting',
              ),
              PaymentoptionBtn(
                size: size,
                imgPath: ImageAssets.tvSubIcon,
                onTap: () {},
                text: 'TV Subscription',
              ),
              PaymentoptionBtn(
                size: size,
                imgPath: ImageAssets.electricityIcon,
                onTap: () {},
                text: 'Electricity Bills',
              ),
              PaymentoptionBtn(
                size: size,
                imgPath: ImageAssets.airtimeIcon,
                onTap: () {
                  customShowDialog(
                      context: context,
                      size: size,
                      child: ComminSoon(size: size));
                },
                text: 'Internet Subscriptions',
              ),
              const Divider(),
              PaymentoptionBtn(
                size: size,
                imgPath: ImageAssets.airtimeIcon,
                onTap: () {},
                text: 'Refer & Earn Goodies',
                subTitle: "Make 100 bonus for every successful referal",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: size.height * 0.07,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            BottomNavButton(
              size: size,
              icon: Icons.home,
              elevation: currentPage == "home" ? 10 : 0,
              text: 'Home',
              onTap: () {
                setState(() {
                  currentPage = "home";
                });
              },
            ),
            BottomNavButton(
              size: size,
              icon: Icons.stars_outlined,
              elevation: currentPage == "Reward" ? 10 : 0,
              text: 'Reward',
              onTap: () {
                setState(() {
                  currentPage = "Reward";
                });
              },
            ),
            BottomNavButton(
              size: size,
              icon: Icons.account_circle_outlined,
              elevation: currentPage == "Profile" ? 10 : 0,
              text: 'Profile',
              onTap: () {
                setState(() {
                  currentPage = "Profile";
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
