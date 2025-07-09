import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../utils/color.dart';
import '../utils/font_weight_helper.dart';
import '../utils/styles.dart';

class AppTextFormField extends StatefulWidget {
  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String hintText;
  final bool? isPassword;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  final Function(String?) validator;
  final Widget? prefixIcon;
  final int? maxLines;
  final void Function()? onTap;
  final void Function(PointerDownEvent)? onTapOutside;

  const AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isPassword,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    required this.validator,
    this.prefixIcon,
    this.maxLines = 1,
    this.onTap,
    this.onTapOutside,
  });

  @override
  State<AppTextFormField> createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool isObscureText = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTapOutside: widget.onTapOutside,
      onTap: widget.onTap,
      controller: widget.controller,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        isDense: true,
        contentPadding:
            widget.contentPadding ??
            EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        focusedBorder:
            widget.focusedBorder ?? outLineBorder(color: ColorManager.mainBlue),
        enabledBorder:
            widget.enabledBorder ?? outLineBorder(color: ColorManager.grayED),
        errorBorder: outLineBorder(color: Colors.red),
        focusedErrorBorder: outLineBorder(color: Colors.red),
        hintStyle:
            widget.hintStyle ??
            Styles.font14Regular.copyWith(color: ColorManager.grayC2),
        hintText: widget.hintText,
        suffixIcon: widget.isPassword == true
            ? isObscureWidget()
            : widget.suffixIcon,
        fillColor: widget.backgroundColor ?? ColorManager.grayFD,
        filled: true,
        prefixIcon: widget.prefixIcon,
      ),
      obscureText: isObscureText,
      style: Styles.font14Regular.copyWith(
        fontWeight: FontWeightHelper.medium,
        color: ColorManager.darkBlue,
      ),
      validator: (value) {
        return widget.validator(value);
      },
    );
  }

  OutlineInputBorder outLineBorder({required Color color}) {
    return OutlineInputBorder(
      borderSide: BorderSide(color: color, width: 1.3),
      borderRadius: BorderRadius.circular(16.0.r),
    );
  }

  Widget isObscureWidget() {
    return IconButton(
      onPressed: () {
        setState(() {
          isObscureText = !isObscureText;
        });
      },
      icon: Icon(
        isObscureText ? Icons.visibility_off : Icons.visibility,
        color: ColorManager.mainBlue,
        size: 18.r,
      ),
    );
  }
}
