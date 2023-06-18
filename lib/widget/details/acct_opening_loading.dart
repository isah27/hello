import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/page%20route/page_route.dart';
import 'package:swift_access/widget/app_widget.dart';

import '../../auth bloc/auth_bloc.dart';

class LencoAccountOpeningLoading extends StatelessWidget {
  const LencoAccountOpeningLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final watchBloc = context.watch<AuthBloc>();
    final readBloc = context.read<AuthBloc>();
    return Scaffold(
      body: BlocListener<AuthBloc, SwiftAccessStates>(
        listener: (context, state) {
          if (state is LencoLoadedState) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoute.login, (route) => false);
          }
        },
        child: Center(
          child: Column(
            children: [
              SizedBox(height: screenSize.height * 0.4),
              Visibility(
                visible: watchBloc.state is! AuthErrorsState,
                child: CircularProgressIndicator.adaptive(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation(Colors.amber.shade900),
                ),
              ),
              AppText(
                textAlign: TextAlign.center,
                text: watchBloc.state is AuthErrorsState
                    ? "Unable to set up your account. Try again!!"
                    : "Setting up your account...",
                size: 12.sp,
                textColor: watchBloc.state is AuthErrorsState
                    ? Colors.red
                    : Colors.black54,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: 10, horizontal: screenSize.width * 0.2),
                child: Visibility(
                  visible: true,
                  child: AppButton(
                    size: screenSize,
                    bgColor: Colors.amber.shade900,
                    text: "Retry",
                    onTap: () {
                      readBloc.createLencoAcctEvent();
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
