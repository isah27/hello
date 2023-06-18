// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:local_auth/local_auth.dart';
// import 'package:swift_access/main.dart';
// import 'package:swift_access/page%20route/detail/route.dart';
// import 'package:swift_access/widget/app_widget.dart';

// import '../../auth bloc/auth_bloc.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final formkey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final watchBloc = context.watch<AuthBloc>();
//     final readBloc = context.read<AuthBloc>();
//     return Scaffold(
//       backgroundColor: Colors.amber.shade900,
//       body: BlocListener<AuthBloc, SwiftAccessStates>(
//         listener: (context, state) {
//           if (state is AuthErrorsState) {
//             ScaffoldMessenger.of(context)
//                 .showSnackBar(SnackBar(content: Text(state.error)));
//           } else if (state is AuthenticatedState) {
//             Navigator.pushNamedAndRemoveUntil(
//                 context, AppRoute.home, (route) => false);
//           }
//         },
//         child: Column(
//           children: [
//             WelcomeBackWidget(size: size),
//             SizedBox(height: size.height * 0.02),
//             Expanded(
//               child: Container(
//                 padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(size.width * 0.12),
//                   ),
//                 ),
//                 child: Form(
//                   key: formkey,
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(height: size.height * 0.08),
//                         // email text field
//                         AppTextField(
//                           hintText: "Email",
//                           size: size,
//                           textSize: 18,
//                           align: TextAlign.center,
//                           controller: watchBloc.emailController,
//                         ),
//                         SizedBox(height: size.height * 0.01),
//                         // password text field
//                         AuthTextField(
//                           size: size,
//                           controller: watchBloc.passwordController,
//                         ),
//                         const ResetPassword(),
//                         SizedBox(height: size.height * 0.02),
//                         FingerprintButton(
//                           size: size,
//                           onTap: () async {
//                             await fingerPrint(readBloc, context, formkey);
//                             // Navigator.pushNamed(
//                             //     context, AppRoute.lencoLoadingPage);
//                           },
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         AppButton(
//                           text: "Login",
//                           isLoading: watchBloc.state is AuthLoadingState,
//                           size: size,
//                           bgColor: Colors.amber.shade900,
//                           onTap: () async {
//                             if (formkey.currentState!.validate()) {
//                               readBloc.loginEvent();
//                             }
//                           },
//                         ),
//                         SizedBox(height: size.height * 0.02),
//                         LoginSignUpSwitch(size: size, isLogin: true),
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
