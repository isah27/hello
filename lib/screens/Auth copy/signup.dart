// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import 'package:swift_access/page%20route/detail/route.dart';
// import 'package:swift_access/widget/app_widget.dart';

// import '../../auth bloc/auth_bloc.dart';

// class SignUpPage extends StatelessWidget {
//   SignUpPage({super.key});
//   final formkey = GlobalKey<FormState>();
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final watchBloc = context.watch<AuthBloc>();
//     final readBloc = context.read<AuthBloc>();
//     return Scaffold(
//       backgroundColor: Colors.grey.shade200,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
//           child: SafeArea(
//             child: BlocListener<AuthBloc, SwiftAccessStates>(
//               listener: (context, state) {
//                 if (state is AuthErrorsState) {
//                   ScaffoldMessenger.of(context)
//                       .showSnackBar(SnackBar(content: Text(state.error)));
//                 } else if (state is SignedUpState) {
//                   Navigator.pushNamedAndRemoveUntil(
//                       context, AppRoute.lencoLoadingPage, (route) => false);
//                 }
//               },
//               child: Form(
//                 key: formkey,
//                 child: Column(
//                   children: [
//                     // SizedBox(height: size.height * 0.05),
//                     AppText(
//                       text: "Create Account",
//                       size: 18.sp,
//                       fontWeight: FontWeight.w600,
//                       textColor: Colors.black87,
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     const FieldDescription(desc: "Full Name"),
//                     SizedBox(height: size.height * 0.01),
//                     SignUpTextField(
//                       size: size,
//                       controller: watchBloc.fullNameController,
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     const FieldDescription(desc: "Username"),
//                     SizedBox(height: size.height * 0.01),
//                     SignUpTextField(
//                       size: size,
//                       controller: watchBloc.usernameController,
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     const FieldDescription(desc: "Email Address"),
//                     SizedBox(height: size.height * 0.01),
//                     SignUpTextField(
//                       size: size,
//                       controller: watchBloc.emailController,
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     const FieldDescription(desc: "Phone Number"),
//                     SizedBox(height: size.height * 0.01),
//                     SignUpTextField(
//                       size: size,
//                       controller: watchBloc.phoneNoController,
//                     ),
//                     SizedBox(height: size.height * 0.02),
//                     const FieldDescription(desc: "Home Address"),
//                     SizedBox(height: size.height * 0.01),
//                     SignUpTextField(
//                       size: size,
//                       controller: watchBloc.addressController,
//                     ),

//                     SizedBox(height: size.height * 0.02),
//                     const FieldDescription(desc: "Password"),
//                     SizedBox(height: size.height * 0.01),
//                     SignUpTextField(
//                       size: size,
//                       controller: watchBloc.passwordController,
//                     ),

//                     SizedBox(height: size.height * 0.03),
//                     AppButton(
//                       size: size,
//                       isLoading: watchBloc.state is AuthLoadingState,
//                       textSize: 16,
//                       bgColor: Colors.amber.shade900,
//                       text: "Sign Up",
//                       onTap: () {
//                         if (formkey.currentState!.validate()) {
//                           readBloc.sgnUpEvent();
//                         }
//                       },
//                     ),
//                     SizedBox(height: size.height * 0.03),
//                     LoginSignUpSwitch(size: size, isLogin: false),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
