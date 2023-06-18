import 'package:flutter/cupertino.dart';
import 'package:swift_access/screens/Auth/change_password.dart';
import 'package:swift_access/screens/Auth/forget_password.dart';
import 'package:swift_access/screens/Auth/signup.dart';
import 'package:swift_access/screens/main%20screens/about_us.dart';
import 'package:swift_access/screens/main%20screens/airtime/buy_airtime.dart';
import 'package:swift_access/screens/main%20screens/contact_us.dart';
import 'package:swift_access/screens/main%20screens/data/buy_data.dart';
import 'package:swift_access/screens/main%20screens/data/data_home.dart';
import 'package:swift_access/screens/main%20screens/homePage/home_page.dart';
import 'package:swift_access/screens/main%20screens/setting.dart';
import 'package:swift_access/splash_screen.dart';
import 'package:swift_access/widget/details/acct_opening_loading.dart';

import '../../screens/Auth/login.dart';
import '../../screens/main screens/cable/cable_tv.dart';
import '../../screens/main screens/electricity/electricity_bill.dart';
import '../../screens/main screens/transactions.dart';
import 'custom_page_route.dart';

class AppRoute {
  static const String login = '/login';
  static const String register = '/sign-up';
  static const String resetPassword = '/password-reset';
  static const String home = '/home-page';
  static const String contactUs = '/contact-us-page';
  static const String aboutUs = '/about-us-page';
  static const String setting = '/setting-page';
  static const String changePassword = '/change-password-page';
  static const String dataHome = '/data-home-page';
  static const String buyData = '/buy-data-page';
  static const String buyAirtime = '/buy-airtime-page';
  static const String cableTv = '/cable-tv-page';
  static const String electrictyBill = '/electricity-bill-page';
  static const String transactions = '/transactions-page';
  static const String splash = '/';
  static const String lencoLoadingPage = '/lenco loading screen';

  static Route onGeneratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case login:
        return CustomPageRoute(child: const LoginPage());
      case register:
        return CustomPageRoute(
            direction: AxisDirection.right, child: SignUpPage());
      case resetPassword:
        return CustomPageRoute(
            direction: AxisDirection.up, child: PasswordResetPage());
      case home:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const HomePage());
      case contactUs:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const ContactUsPage());
      case aboutUs:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const AboutUsPage());
      case setting:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const SettingPage());
      case changePassword:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const ChangePasswordPage());
      case dataHome:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const DataHomePage());
      case buyData:
        return CustomPageRoute(
            direction: AxisDirection.up, child: const BuyDataPage());
      case buyAirtime:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const BuyAirtimePage());
      case cableTv:
        return CustomPageRoute(
            direction: AxisDirection.left,
            child: const CableSubscriptionPage());
      case electrictyBill:
        return CustomPageRoute(
            direction: AxisDirection.left, child: const ElectricityBillPage());
      case transactions:
        return CustomPageRoute(
            direction: AxisDirection.down, child: const TransactionsPage());
      case splash:
        return CustomPageRoute(
            direction: AxisDirection.up, child: const SplashScreen());
      case lencoLoadingPage:
        return CustomPageRoute(
            direction: AxisDirection.left,
            child: const LencoAccountOpeningLoading());

      default:
        return CustomPageRoute(child: const LoginPage());
    }
  }
}
