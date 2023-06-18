import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/route.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../auth bloc/auth_bloc.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final watchBloc = context.watch<AuthBloc>();
    final readBloc = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: Colors.amber.shade900,
      body: Column(
        children: [
          SizedBox(height: size.height * 0.02),
          DescAndBackNav(text: "Settings", size: size),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                  left: size.width * 0.02, top: size.width * 0.02),
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(size.width * 0.1),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: size.height * 0.02),
                  AppText(
                    text: "Account",
                    size: 14.sp,
                    textColor: Colors.blue.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: size.height * 0.02),
                  DrawerMenu(
                    color: Colors.black.withOpacity(0.6),
                    size: size,
                    text: "${watchBloc.user.fullname}",
                    icon: Icons.person,
                  ),
                  DrawerMenu(
                    color: Colors.black.withOpacity(0.6),
                    size: size,
                    text: "${watchBloc.user.username}",
                    icon: Icons.verified,
                  ),
                  DrawerMenu(
                    color: Colors.black.withOpacity(0.6),
                    size: size,
                    text: "${watchBloc.user.phonenumber}",
                    icon: Icons.call,
                  ),
                  DrawerMenu(
                    color: Colors.black.withOpacity(0.6),
                    size: size,
                    text: "${watchBloc.user.email}",
                    icon: Icons.email,
                  ),
                  AppText(
                    text: "Security",
                    size: 14.sp,
                    textColor: Colors.blue.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: size.height * 0.02),
                  DrawerMenu(
                    color: Colors.black.withOpacity(0.6),
                    size: size,
                    text: "Change password",
                    icon: Icons.lock,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoute.changePassword),
                  ),
                  DrawerMenu(
                    color: Colors.red.withOpacity(0.8),
                    size: size,
                    text: "Logout",
                    icon: Icons.logout,
                    onTap: () {
                      readBloc.sgnOutEvent();
                      return Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.login, (route) => false);
                    },
                  ),
                  AppText(
                    text: "About",
                    size: 14.sp,
                    textColor: Colors.blue.shade900,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: size.height * 0.02),
                  DrawerMenu(
                    color: Colors.black.withOpacity(0.6),
                    size: size,
                    text: "About us",
                    icon: Icons.person,
                    onTap: () => Navigator.pushNamed(context, AppRoute.aboutUs),
                  ),
                  DrawerMenu(
                    color: Colors.black.withOpacity(0.6),
                    size: size,
                    text: "Contact us",
                    icon: Icons.contact_phone_rounded,
                    onTap: () =>
                        Navigator.pushNamed(context, AppRoute.contactUs),
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
