import 'package:erpnext_viewer/utils/size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextField extends StatelessWidget {
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final FocusNode? requestFocus;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool obscureText;
  final int? maxLength;
  final int? maxLines;
  final bool? enabled;
  final double? radius;
  final String? hint;
  final Widget? suffixIcon;
  final String? suffixText;
  final Widget? prefixIcon;
  final Function? onChanged;

  const LoginTextField({
    Key? key,
    this.focusNode,
    this.keyboardType,
    this.textInputAction,
    this.requestFocus,
    this.validator,
    this.controller,
    required this.obscureText,
    this.maxLength,
    this.maxLines,
    this.enabled,
    this.radius,
    this.hint,
    this.suffixIcon,
    this.suffixText,
    this.prefixIcon,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48 * UISize.autoSize,
      width: Get.width,
      child: TextFormField(
        enabled: enabled,
        cursorColor: Colors.black,
        focusNode: focusNode,
        keyboardType: keyboardType,
        textInputAction: textInputAction,
        onFieldSubmitted: (v) {
          if (requestFocus != null) {
            FocusScope.of(context).requestFocus(requestFocus);
          }
        },
        controller: controller,
        obscureText: obscureText,
        maxLines: maxLines ?? 1,
        validator: validator,
        style: TextStyle(color: Colors.black, fontSize: UISize.autoSize * 14, fontWeight: FontWeight.w400),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 15.5 * UISize.autoSize),
          hintText: hint,
          isDense: true,
          hintStyle: TextStyle(
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            fontSize: UISize.autoSize * 13,
          ),
          errorStyle: const TextStyle(color: Colors.red),
          fillColor: Colors.transparent,
          filled: true,
          suffixIcon: suffixIcon,
          suffixStyle: const TextStyle(color: Colors.grey),
          prefixIcon: prefixIcon,
          suffixText: suffixText,
          border: InputBorder.none,
          focusedBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(UISize.autoSize * 15), borderSide: const BorderSide(color: Colors.orange)),
          labelStyle: const TextStyle(color: Colors.black54),
          focusColor: Colors.orange,
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UISize.autoSize * 15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UISize.autoSize * 15),
            borderSide: const BorderSide(color: Colors.black),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UISize.autoSize * 15),
            borderSide: const BorderSide(
              color: Colors.red,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(UISize.autoSize * 15),
            borderSide: const BorderSide(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
