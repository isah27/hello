// import 'package:flutter/material.dart';
// import 'package:swift_access/widget/app_widget.dart';

// class ChangePasswordPage extends StatelessWidget {
//   const ChangePasswordPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return Scaffold(
//       backgroundColor: Colors.amber.shade900,
//       body: Column(
//         children: [
//           DescAndBackNav(text: "Password", size: size),
//           Expanded(
//             child: Container(
//               padding: EdgeInsets.all(size.width * 0.04),
//               decoration: BoxDecoration(
//                 color: Colors.grey.shade100,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(size.width * 0.1),
//                   topRight: Radius.circular(size.width * 0.1),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: size.height * 0.06),
//                   AuthTextField(
//                     size: size,
//                     fillColor: Colors.white,
//                     hintText: "Old Password",
//                     controller: TextEditingController(),
//                   ),
//                   SizedBox(height: size.height * 0.03),
//                   AuthTextField(
//                     hintText: "New Password",
//                     size: size,
//                     fillColor: Colors.white,
//                     controller: TextEditingController(),
//                   ),
//                   SizedBox(height: size.height * 0.03),
//                   AuthTextField(
//                     hintText: "Confirm Password",
//                     size: size,
//                     fillColor: Colors.white,
//                     controller: TextEditingController(),
//                   ),
//                   SizedBox(height: size.height * 0.03),
//                   Padding(
//                     padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
//                     child: AppButton(
//                       size: size,
//                       text: "Reset",
//                       bgColor: Colors.amber.shade900,
//                       onTap: () {},
//                     ),
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
