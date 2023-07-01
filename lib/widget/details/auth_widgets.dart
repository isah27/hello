import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/uitils/app_colors.dart';

import '../../auth bloc/auth_bloc.dart';
import '../../page route/detail/route.dart';
import 'app_text.dart';
import 'app_textfield.dart';

class LoginSignUpSwitch extends StatelessWidget {
  const LoginSignUpSwitch({
    super.key,
    required this.size,
    required this.isLogin,
  });

  final Size size;
  final bool isLogin;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          isLogin ? AppRoute.register : AppRoute.login,
        );
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppText(
            text: isLogin ? "Not yet a member ?" : "Already a member ?",
            textColor: Colors.black87,
            size: 12.sp,
            fontWeight: FontWeight.w700,
          ),
          SizedBox(width: size.width * 0.02),
          AppText(
            text: isLogin ? "Sign Up" : "Login",
            textColor: AppColors.lightYellowColor,
            size: 13.sp,
            fontWeight: FontWeight.w700,
          ),
        ],
      ),
    );
  }
}

class FingerprintButton extends StatelessWidget {
  const FingerprintButton({
    super.key,
    required this.size,
    required this.onTap,
  });

  final Size size;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Container(
        width: size.width * 0.9,
        padding: EdgeInsets.symmetric(vertical: size.height * 0.01),
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black45,
              width: 0.5,
            ),
            borderRadius: BorderRadius.circular(size.width * 0.03)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.fingerprint, size: 25.sp),
            AppText(
              text: "Fingerprint",
              size: 14.sp,
              textColor: Colors.black87,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> fingerPrint(AuthBloc readBloc, BuildContext context,
    GlobalKey<FormState> formkey) async {
  if (readBloc.localUser.password == null) {
    ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Login to access fingerprint")));
  } else {
    // readBloc.passwordController.text =
    //     localUser?.password ?? "";
    try {
      final LocalAuthentication auth = LocalAuthentication();
      await auth
          .authenticate(
        localizedReason: 'Please authenticate to access your account',
        options: const AuthenticationOptions(biometricOnly: true),
      )
          .then((value) {
        readBloc.passwordController.text = readBloc.localUser.password!;
        if (value && formkey.currentState!.validate()) {
          readBloc.loginEvent();
          Navigator.pushNamedAndRemoveUntil(
              context, AppRoute.home, (route) => false);
          return false;
        }
        return false;
      });
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Phone Not Supported")));
    }
  }
}

class SignUpTextField extends StatelessWidget {
  const SignUpTextField({
    super.key,
    required this.size,
    required this.controller,
  });

  final Size size;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return AppTextField(
      fillColor: AppColors.idleColor,
      size: size,
      textSize: 15,
      controller: controller,
    );
  }
}

class FieldDescription extends StatelessWidget {
  const FieldDescription({
    super.key,
    required this.desc, this.color,
  });
  final String desc;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppText(
          text: desc,
          size: 12.sp,
          fontWeight: FontWeight.w600,
          textColor:color?? Colors.black.withOpacity(0.6),
        ),
      ],
    );
  }
}

class BackNavigation extends StatelessWidget {
  const BackNavigation({
    super.key,
    required this.size,
    this.onTap,
  });

  final Size size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap == null ? Navigator.pop(context) : onTap!(),
      child: Container(
        margin: EdgeInsets.only(left: size.width * 0.02),
        padding: EdgeInsets.all(size.width * 0.02),
        decoration: BoxDecoration(
          color: Colors.amber.shade900,
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
        child: Icon(Icons.chevron_left, size: 30.sp, color: Colors.white),
      ),
    );
  }
}

class ResetPassword extends StatelessWidget {
  const ResetPassword({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, AppRoute.resetPassword);
      },
      child: Align(
        alignment: Alignment.centerRight,
        child: AppText(
          text: "Forgot Password ?",
          textColor: AppColors.darkYellowColor,
          size: 14.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class AppBackNavigation extends StatelessWidget {
  const AppBackNavigation({
    super.key,
    this.onTap,
  });
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap!();
        } else {
          Navigator.pop(context);
        }
      },
      child: Icon(
        Icons.chevron_left,
        size: 30.sp,
        color: AppColors.blackColor,
      ),
    );
  }
}

class WelcomeBackWidget extends StatelessWidget {
  const WelcomeBackWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: size.height * 0.4,
      width: size.width,
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.06),
            Image.asset(
              "assets/avatar.png",
              height: size.width * 0.3,
              width: size.width * 0.3,
              fit: BoxFit.fill,
            ),
            AppText(
              text: "Welcome Back",
              size: 25.sp,
              fontWeight: FontWeight.bold,
            ),
            AppText(
              text: "Buddy",
              size: 18.sp,
              fontWeight: FontWeight.w600,
            )
          ],
        ),
      ),
    );
  }
}
