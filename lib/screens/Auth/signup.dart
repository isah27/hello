import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/detail/route.dart';
import 'package:swift_access/uitils/app_colors.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../auth bloc/auth_bloc.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final watchBloc = context.watch<AuthBloc>();
    final readBloc = context.read<AuthBloc>();
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.08),
            const AppBackNavigation(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
              child: SafeArea(
                child: BlocListener<AuthBloc, SwiftAccessStates>(
                  listener: (context, state) {
                    if (state is AuthErrorsState) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(state.error)));
                    } else if (state is SignedUpState) {
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoute.lencoLoadingPage, (route) => false);
                    }
                  },
                  child: Form(
                    key: formkey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SizedBox(height: size.height * 0.05),
                        AppText(
                          text: "Create an account",
                          size: 20.sp,
                          fontWeight: FontWeight.w600,
                          textColor: Colors.black87,
                        ),
                        SizedBox(height: size.height * 0.01),
                        AppText(
                          text: "Please complete the form below.",
                          size: 14.sp,
                          fontWeight: FontWeight.w400,
                          textColor: Colors.black87,
                        ),
                        SizedBox(height: size.height * 0.04),
                        AppTextField(
                          hintText: "Full name",
                          fillColor: AppColors.idleColor,
                          size: size,
                          controller: watchBloc.fullNameController,
                        ),

                        SizedBox(height: size.height * 0.015),
                        AppTextField(
                          hintText: "Username",
                          fillColor: AppColors.idleColor,
                          size: size,
                          controller: watchBloc.usernameController,
                        ),

                        SizedBox(height: size.height * 0.015),
                        AppTextField(
                          hintText: "Email",
                          fillColor: AppColors.idleColor,
                          size: size,
                          controller: watchBloc.emailController,
                        ),

                        SizedBox(height: size.height * 0.015),
                        AppTextField(
                          hintText: "Phone number",
                          fillColor: AppColors.idleColor,
                          size: size,
                          controller: watchBloc.phoneNoController,
                        ),

                        SizedBox(height: size.height * 0.015),
                        AppTextField(
                          hintText: "Password",
                          fillColor: AppColors.idleColor,
                          size: size,
                          controller: watchBloc.passwordController,
                        ),

                        SizedBox(height: size.height * 0.03),
                        AppButton(
                          size: size,
                          isLoading: watchBloc.state is AuthLoadingState,
                          textSize: 14,
                          bgColor: Colors.amber.shade900,
                          text: "SIGNUP",
                          onTap: () {
                            if (formkey.currentState!.validate()) {
                              readBloc.sgnUpEvent();
                            }
                          },
                        ),
                        SizedBox(height: size.height * 0.03),
                        LoginSignUpSwitch(size: size, isLogin: false),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
