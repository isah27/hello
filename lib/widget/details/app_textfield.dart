import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:swift_access/auth%20bloc/auth_bloc.dart';
import 'package:swift_access/uitils/app_colors.dart';

class AppTextField extends StatelessWidget {
  AppTextField({
    Key? key,
    required this.size,
    this.hintText = "",
    this.maxLine = 1,
    this.borderRadius = 0,
    this.fillColor,
    this.enable = true,
    this.keyboardType = TextInputType.text,
    required this.controller,
    this.align = TextAlign.left,
    this.textSize = 10,
    this.icon,
    this.onChange,
    this.borderColor=Colors.white,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final int maxLine;
  final double borderRadius;
  final double textSize;
  final TextEditingController controller;
  final bool enable;
  final Color? fillColor;
  final Color borderColor;
  final TextAlign align;
  final TextInputType keyboardType;
  final IconData? icon;
  final Function()? onChange;
  late final border = OutlineInputBorder(
      borderSide:  BorderSide(color: borderColor),
      borderRadius: BorderRadius.circular(
        borderRadius == 0 ? size.width * 0.02 : borderRadius,
      ));
  late final activeBorder = OutlineInputBorder(
      borderSide: BorderSide(color: AppColors.darkYellowColor),
      borderRadius: BorderRadius.circular(
        borderRadius == 0 ? size.width * 0.02 : borderRadius,
      ));
  @override
  Widget build(BuildContext context) {
    return SizedBox(
     
      width: size.width,
     
      child: TextFormField(
        enabled: enable,
        controller: controller,
        validator: (value) {
          if (value == "") {
            return "This is a required field";
          }
          return null;
        },
        onChanged: (value) {
          if (onChange != null) {
            onChange!();
          }
        },
        keyboardType: keyboardType,
        textAlign: align,
        style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w500,
            fontSize: textSize.sp),
        maxLines: maxLine,
        decoration: InputDecoration(
          labelStyle: TextStyle(
              color: AppColors.textFadeColor,
              fontWeight: FontWeight.w500,
              fontSize: textSize.sp),
          labelText: hintText,
          filled: true,
          fillColor: fillColor ?? Colors.grey.shade100,
          focusedBorder: activeBorder,
          enabledBorder: border,
          suffixIcon: icon != null
              ? Icon(
                  icon,
                  size: 25.sp,
                  color: Colors.black54,
                )
              : null,
        ),
      ),
    );
  }
}

class AuthTextField extends StatefulWidget {
  const AuthTextField({
    Key? key,
    required this.size,
    this.hintText = "Password",
    this.maxLine = 1,
    this.borderRadius = 0,
    this.enable = true,
    required this.controller,
    this.fillColor,
    this.onChange,
  }) : super(key: key);

  final Size size;
  final String hintText;
  final int maxLine;
  final double borderRadius;
  final TextEditingController controller;
  final bool enable;
  final Color? fillColor;
  final Function()? onChange;

  @override
  State<AuthTextField> createState() => _AuthTextFieldState();
}

class _AuthTextFieldState extends State<AuthTextField> {
  bool obscureText = true;
  late final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white),
      borderRadius: BorderRadius.circular(
        widget.borderRadius == 0
            ? widget.size.width * 0.02
            : widget.borderRadius,
      ));

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width,
      child: TextFormField(
        obscureText: obscureText,
        obscuringCharacter: "*",
        enabled: widget.enable,
        controller: widget.controller,
        validator: (value) {
          if (value == "" || value == null) {
            return "This is a required field";
          }
          return null;
        },
        onChanged: (value) {
          if (widget.onChange != null) {
            widget.onChange!();
          }
        },
        textAlign: TextAlign.center,
        style: TextStyle(
            color: AppColors.blackColor,
            fontWeight: FontWeight.w600,
            fontSize: 14.sp),
        maxLines: widget.maxLine,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.key,
            color: Colors.grey.shade400,
            size: 16.sp,
          ),
          suffix: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Icon(
                obscureText ? Icons.visibility : Icons.visibility_off,
                size: 16.sp,
                color: Colors.grey.shade400,
              )),
          // contentPadding: EdgeInsets.only(bottom: 10, top: 20),
          filled: true,
          fillColor: widget.fillColor ?? Colors.grey.shade100,
          hintText: widget.hintText,
          focusedBorder: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
