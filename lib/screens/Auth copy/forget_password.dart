// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import 'package:swift_access/page%20route/detail/route.dart';
// import 'package:swift_access/widget/app_widget.dart';

// import '../../auth bloc/auth_bloc.dart';

// class PasswordResetPage extends StatelessWidget {
//   PasswordResetPage({super.key});
//   final formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final watchBloc = context.watch<AuthBloc>();
//     final readBloc = context.read<AuthBloc>();
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       body: BlocListener<AuthBloc, SwiftAccessStates>(
//         listener: (context, state) {
//           if (state is PasswordLinkSentState) {
//             emailSentPopUp(
//                 message: state.message, size: size, context: context);
//           }
//           if (state is AuthErrorsState) {
//             emailSentPopUp(message: state.error, size: size, context: context);
//           }
//         },
//         child: Column(
//           children: [
//             Container(
//               alignment: Alignment.topLeft,
//               height: size.height * 0.4,
//               width: size.width,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: AssetImage("assets/login_logo.png"),
//                   fit: BoxFit.fill,
//                 ),
//               ),
//               child: SafeArea(
//                 child: BackNavigation(size: size),
//               ),
//             ),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                 color: Colors.grey.shade200,
//                 child: Form(
//                   key: formkey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(height: size.height * 0.1),
//                         AppText(
//                           text: "Password Reset",
//                           size: 18.sp,
//                           fontWeight: FontWeight.w600,
//                           textColor: Colors.black87,
//                         ),
//                         SizedBox(height: size.height * 0.03),
//                         const FieldDescription(desc: "Email Address"),
//                         SizedBox(height: size.height * 0.01),
//                         SignUpTextField(
//                             size: size, controller: watchBloc.emailController),
//                         SizedBox(height: size.height * 0.03),
//                         AppButton(
//                           size: size,
//                           isLoading: watchBloc.state is AuthLoadingState,
//                           textSize: 16,
//                           bgColor: Colors.amber.shade900,
//                           text: "Reset Password",
//                           onTap: () {
//                             if (formkey.currentState!.validate()) {
//                               readBloc.resetPasswordEvent();
//                             }
//                           },
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// emailSentPopUp(
//     {required String message,
//     required Size size,
//     required BuildContext context}) {
//   return showDialog(
//       context: context,
//       barrierColor: Colors.white,
//       barrierDismissible: false,
//       builder: (context) {
//         return Container(
//             alignment: Alignment.bottomCenter,
//             child: Column(children: [
//               SizedBox(height: size.height * 0.3),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
//                 child: AppText(
//                   text: message,
//                   size: 16.sp,
//                   textAlign: TextAlign.center,
//                   fontWeight: FontWeight.w600,
//                   textColor: Colors.black87,
//                 ),
//               ),
//               SizedBox(height: size.height * 0.02),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.3),
//                 child: AppButton(
//                   size: size,
//                   textSize: 16,
//                   bgColor: Colors.amber.shade900,
//                   text: "Okay",
//                   onTap: () {
//                     Navigator.pushNamedAndRemoveUntil(
//                         context, AppRoute.login, (route) => false);
//                   },
//                 ),
//               ),
//             ]));
//       });
// }
