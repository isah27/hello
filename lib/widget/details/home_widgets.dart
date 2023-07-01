import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/models/user_model.dart';
import 'package:swift_access/page%20route/page_route.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/uitils/images.dart';
import 'package:swift_access/widget/app_widget.dart';
import 'package:clipboard/clipboard.dart';
import '../../uitils/strings.dart';
import '../../uitils/usefull_function.dart';

class AcctBalance extends StatefulWidget {
  const AcctBalance({
    super.key,
    required this.size,
    required this.user,
  });

  final Size size;

  final Users user;

  @override
  State<AcctBalance> createState() => _AcctBalanceState();
}

class _AcctBalanceState extends State<AcctBalance> {
  bool visible = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: widget.size.width * 0.03,
          vertical: widget.size.height * 0.02),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAssets.acctDetailsBgIcon),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Wallet Balance",
                    size: 10.sp,
                    fontWeight: FontWeight.w600,
                    textColor: AppColors.whiteColor,
                  ),
                  SizedBox(height: widget.size.height * 0.008),
                  AppText(
                    text: !visible
                        ? "***"
                        : "${Strings.nairaign}${UsefulFunction.currencyConverter(price: double.parse(widget.user.acctBalance != "" ? widget.user.acctBalance! : "0"))}",
                    size: 25.sp,
                    fontWeight: FontWeight.w700,
                    textColor: AppColors.whiteColor,
                  ),
                ],
              ),
              Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.transactions);
                    },
                    child: AppText(
                      text: "View History",
                      textColor: AppColors.lightYellowColor,
                    ),
                  ),
                  SizedBox(height: widget.size.height * 0.02),
                  InkWell(
                    onTap: () {
                      setState(() {
                        visible = !visible;
                      });
                    },
                    child: Icon(
                      !visible ? Icons.visibility : Icons.visibility_off,
                      size: 20.sp,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(height: widget.size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widget.size.width * 0.4,
                child: AppButton(
                  buttonRadius: widget.size.width * 0.03,
                  textSize: 10,
                  validated: true,
                  size: widget.size,
                  text: "FUND WALLET",
                  textColor: AppColors.blackColor,
                  onTap: () {
                    customShowDialog(
                        context: context,
                        size: widget.size,
                        child: ComminSoon(size: widget.size));
                  },
                ),
              ),
              SizedBox(
                width: widget.size.width * 0.4,
                child: AppButton(
                  buttonRadius: widget.size.width * 0.03,
                  textSize: 10,
                  validated: true,
                  size: widget.size,
                  bgColor: AppColors.darkYellowColor,
                  textColor: AppColors.blackColor,
                  text: "ACCOUNT DETAILS",
                  onTap: () {
                    final size = widget.size;
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return Container(
                            padding: EdgeInsets.all(size.width * 0.03),
                            decoration: BoxDecoration(
                              color: AppColors.whiteColor,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(size.width * 0.03),
                                topRight: Radius.circular(size.width * 0.03),
                              ),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    AppText(
                                      text: "Account Details",
                                      fontWeight: FontWeight.w600,
                                      size: 16.sp,
                                      textColor: AppColors.blackColor,
                                    ),
                                  ],
                                ),
                                SizedBox(height: size.height * 0.02),
                                ColumnFillContainer(
                                  size: size,
                                  title: widget.user.acctNumber ?? "",
                                  subTitle: "Account Number",
                                  copyVisible: true,
                                ),
                                SizedBox(height: size.height * 0.02),
                                ColumnFillContainer(
                                  size: size,
                                  title: widget.user.acctName ?? "",
                                  subTitle: "Account Name",
                                  copyVisible: true,
                                ),
                                SizedBox(height: size.height * 0.02),
                                ColumnFillContainer(
                                  size: size,
                                  title: widget.user.bankName ?? "",
                                  subTitle: "Bank Name",
                                  copyVisible: true,
                                ),
                                SizedBox(height: size.height * 0.02),
                              ],
                            ),
                          );
                        });
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ColumnFillContainer extends StatelessWidget {
  const ColumnFillContainer({
    super.key,
    required this.size,
    required this.title,
    required this.subTitle,
    this.copyVisible = false,
  });

  final Size size;
  final String title;
  final String subTitle;
  final bool copyVisible;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      padding: EdgeInsets.all(size.width * 0.02),
      decoration: BoxDecoration(
        color: AppColors.textBorderColor,
        borderRadius: BorderRadius.circular(size.width * 0.03),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(width: copyVisible ? size.width * 0.1 : 0),
          Column(
            children: [
              AppText(
                text: title,
                fontWeight: FontWeight.w600,
                size: 14.sp,
                textColor: AppColors.blackColor,
              ),
              AppText(
                text: subTitle,
                fontWeight: FontWeight.w400,
                size: 10.sp,
                textColor: AppColors.blackColor,
              ),
            ],
          ),
          SizedBox(width: size.width * 0.04),
          Visibility(
            visible: copyVisible,
            child: InkWell(
              onTap: () {
                FlutterClipboard.copy("title").then(
                    (value) => Fluttertoast.showToast(msg: "copied"));
              },
              child: Icon(
                Icons.copy_outlined,
                color: AppColors.darkYellowColor,
                size: 18.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    required this.size,
    this.bgColor,
    required this.text,
    required this.imgUrl,
    required this.onTap,
  });

  final Size size;
  final Color? bgColor;
  final String text;
  final String imgUrl;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: size.width * 0.4,
        height: size.width >= 1070 ? size.height * 0.26 : size.height * 0.2,
        alignment: Alignment.center,
        padding: EdgeInsets.all(size.width * 0.04),
        decoration: BoxDecoration(
          color: bgColor ?? Colors.red.shade900,
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: Column(
          children: [
            SizedBox(height: size.height * 0.02),
            Image.asset(
              imgUrl,
              height: size.width * 0.15,
              width: size.width * 0.2,
              fit: BoxFit.fill,
              color: Colors.white,
            ),
            SizedBox(height: size.height * 0.01),
            AppText(
              text: text,
              size: 14.sp,
              // textColor: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: size.width * 0.9,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue.shade900,
              Colors.black,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
            tileMode: TileMode.clamp,
          ),
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: size.height * 0.02),
                Image.asset(
                  "assets/swift-access.png",
                  width: size.width * 0.7,
                  height: size.height * 0.22,
                  fit: BoxFit.fill,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        DrawerMenu(
                          size: size,
                          text: "Transactions",
                          icon: Icons.history,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.transactions),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Settings",
                          icon: Icons.settings,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.setting),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "About us",
                          icon: Icons.person,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.aboutUs),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Contact us",
                          icon: Icons.contact_phone_rounded,
                          onTap: () => Navigator.popAndPushNamed(
                              context, AppRoute.contactUs),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Sign out",
                          icon: Icons.logout,
                          onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context, AppRoute.login, (route) => false),
                        ),
                        DrawerMenu(
                          size: size,
                          text: "Close",
                          icon: Icons.chevron_left,
                          onTap: () => Navigator.pop(context),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * 0.45,
                      width: size.width * 0.1,
                      child: Column(
                        children: [
                          const Spacer(),
                          InkWell(
                            onTap: () => Navigator.pop(context),
                            child: Icon(
                              Icons.chevron_left,
                              color: Colors.white,
                              size: 25.sp,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({
    super.key,
    required this.size,
    this.onTap,
    required this.text,
    required this.icon,
    this.textSize,
    this.color,
  });

  final Size size;
  final Function()? onTap;
  final String text;
  final IconData icon;
  final double? textSize;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        }
      },
      child: Padding(
        padding: EdgeInsets.only(
            left: size.width * 0.02, bottom: size.height * 0.03),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              icon,
              size: 25.sp,
              color: color ?? Colors.white,
            ),
            SizedBox(width: size.width * 0.08),
            AppText(
              text: text,
              textColor: color ?? Colors.white,
              size: textSize ?? 15.sp,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}

// payment options button
// it accept ontap,mediaquery size, image path and text

class PaymentoptionBtn extends StatelessWidget {
  const PaymentoptionBtn({
    super.key,
    required this.size,
    required this.onTap,
    required this.imgPath,
    required this.text,
    this.subTitle,
    this.trailingImgUrl,
    this.bgColor,
    this.trailingText,
    this.secondSubText,
    this.firstSubTextColor,
  });

  final Size size;
  final Function() onTap;
  final String imgPath;
  final String text;
  final String? trailingText;
  final String? secondSubText;
  final Color? firstSubTextColor;
  final String? subTitle;
  final String? trailingImgUrl;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.01),
        decoration: BoxDecoration(
          color: bgColor ?? AppColors.textBorderColor,
          borderRadius: BorderRadius.circular(size.width * 0.03),
        ),
        child: Row(
          children: [
            Visibility(
              visible: imgPath != "",
              child: Image.asset(
                imgPath,
                height: size.width * 0.1,
                width: size.width * 0.1,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: size.width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: text,
                  fontWeight: FontWeight.w500,
                  size: 14.sp,
                  textColor: AppColors.blackColor,
                ),
                Row(
                  children: <Widget>[
                    Visibility(
                      visible: subTitle != null,
                      child: AppText(
                        text: subTitle ?? "",
                        fontWeight: FontWeight.w500,
                        size: 10.sp,
                        textColor:secondSubText!=null?Colors.red: AppColors.blackColor,
                      ),
                    ),
                     Visibility(
                      visible: secondSubText != null,
                      child: AppText(
                        text: String.fromCharCode(8358)+ "     ₦",
                        fontWeight: FontWeight.w500,
                        size: 10.sp,
                        textColor:AppColors.blackColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Expanded(child: Container()),
            Visibility(
              visible: trailingImgUrl != null,
              child: Image.asset(
                trailingImgUrl ?? "",
                height: size.width * 0.1,
                width: size.width * 0.1,
                fit: BoxFit.fill,
              ),
            ),
            Visibility(
              visible: trailingText != null,
              child: AppText(
                text: "Duration  $trailingText",
                fontWeight: FontWeight.w500,
                size: 9.sp,
                textColor: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// data package option widget


class DataPackageOptionBtn extends StatelessWidget {
  const DataPackageOptionBtn({
    super.key,
    required this.size,
    required this.onTap,
    required this.imgPath,
    required this.text,
    required this.subTitle,
    this.bgColor,
    required this.trailingText,
    this.secondSubText,
  });

  final Size size;
  final Function() onTap;
  final String imgPath;
  final String text;
  final String trailingText;
  final String? secondSubText;
  final int subTitle;
  final Color? bgColor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        width: size.width,
        margin: EdgeInsets.symmetric(vertical: size.height * 0.01),
        padding: EdgeInsets.symmetric(
            horizontal: size.width * 0.03, vertical: size.height * 0.01),
        decoration: BoxDecoration(
          color:bgColor??  AppColors.textBorderColor,
          borderRadius: BorderRadius.circular(size.width * 0.03),
        ),
        child: Row(
          children: [
            Visibility(
              visible: imgPath != "",
              child: Image.asset(
                imgPath,
                height: size.width * 0.1,
                width: size.width * 0.1,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: size.width * 0.04),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  text: text,
                  fontWeight: FontWeight.w500,
                  size: 14.sp,
                  textColor: AppColors.blackColor,
                ),
                Row(
                  children: <Widget>[
                    AppText(
                      text: "${Strings.nairaign}$subTitle",
                      fontWeight: FontWeight.w500,
                      size: 10.sp,
                      textColor:Colors.red,
                    ),
                     AppText(
                       text: "  Pay ${Strings.nairaign}${UsefulFunction.calculateDiscountedPrice(price: subTitle)}",
                       fontWeight: FontWeight.w500,
                       size: 10.sp,
                       textColor:AppColors.blackColor,
                     ),
                  ],
                ),
              ],
            ),
            Expanded(child: Container()),
           
            Visibility(
              visible: trailingText != null,
              child: AppText(
                text: "Duration  $trailingText",
                fontWeight: FontWeight.w500,
                size: 9.sp,
                textColor: AppColors.blackColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// bottom navigation button
// it accept icon data and text
class BottomNavButton extends StatelessWidget {
  const BottomNavButton({
    super.key,
    required this.size,
    required this.text,
    required this.icon,
    this.elevation,
    required this.onTap,
  });

  final Size size;
  final String text;
  final IconData icon;
  final double? elevation;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Card(
        // padding: EdgeInsets.all(size.width * 0.02),
        elevation: elevation,
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: size.height * 0.005, horizontal: size.width * 0.05),
          child: Column(
            children: [
              Icon(
                icon,
                color: AppColors.blackColor,
                size: 20.sp,
              ),
              AppText(
                text: text,
                textColor: AppColors.blackColor,
                fontWeight: FontWeight.w600,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

customShowDialog(
    {required BuildContext context,
    required Size size,
    required Widget child}) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: size.height * 0.2),
            Container(
              margin: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              padding: EdgeInsets.all(size.width * 0.04),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(size.width * 0.04),
              ),
              child: child,
            ),
          ],
        );
      });
}

class ComminSoon extends StatelessWidget {
  const ComminSoon({super.key, required this.size});
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppText(
          text: "COMING SOON!",
          textColor: AppColors.blackColor,
          fontWeight: FontWeight.w600,
          size: 14.sp,
        ),
        Image.asset(
          ImageAssets.successIcon,
          height: size.width * 0.2,
          width: size.width * 0.2,
        ),
        SizedBox(height: size.height * 0.02),
        SizedBox(
          width: size.width * 0.5,
          height: size.height * 0.05,
          child: AppButton(
            padding: size.width * 0.001,
            validated: true,
            bgColor: AppColors.lightYellowColor,
            size: size,
            textSize: 10,
            text: "Alright.",
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
