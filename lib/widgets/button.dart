import 'package:erpnext_viewer/utils/size.dart';
import 'package:erpnext_viewer/widgets/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//Basic button
class ButtonBasic extends StatelessWidget {
  final String? buttonText;
  final Color? bgColor;
  final Color? textColor;
  final Function()? onTap;
  final int? flex;
  final double? radius;
  final double? height;
  final double? padding;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double elevation;
  final double? fontSize;

  // ignore: use_key_in_widget_constructors
  const ButtonBasic({
    this.buttonText,
    this.bgColor,
    this.textColor,
    this.onTap,
    this.flex,
    this.radius,
    this.height,
    this.padding,
    this.prefixIcon,
    this.suffixIcon,
    this.fontSize,
    this.elevation = 0,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? UISize.autoSize * 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bgColor ?? Colors.orange,
          borderRadius: BorderRadius.all(Radius.circular(UISize.autoSize * 15)),
        ),
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon!,
            Flexible(
              child: TextBasic(
                text: buttonText ?? "",
                color: textColor ?? Colors.white,
                fontSize: fontSize ?? UISize.autoSize * 16,
                fontWeight: FontWeight.w700,
                textAlign: TextAlign.center,
                maxLines: 1,
              ),
            ),
            if (suffixIcon != null) suffixIcon!,
          ],
        ),
      ),
    );
  }
}

//button with border
class ButtonBorder extends StatelessWidget {
  final String? buttonText;
  final Color borderColor;
  final Color? textColor;
  final Color? buttonColor;
  final Function()? onTap;
  final int? flex;
  final double? radius;
  final double? height;
  final double? padding;
  final Widget? prefixIcon;
  final double elevation;
  final double? fontSize;
  final String? fontFamily;
  final FontWeight? fontWeight;
  final TextAlign? textAlign;

  // ignore: use_key_in_widget_constructors
  const ButtonBorder(
      {this.buttonText,
      required this.borderColor,
      this.textColor,
      this.buttonColor,
      this.onTap,
      this.flex,
      this.radius,
      this.height,
      this.padding,
      this.prefixIcon,
      this.fontSize,
      this.fontFamily,
      this.fontWeight,
      this.textAlign,
      this.elevation = 0});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height ?? UISize.autoSize * 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: buttonColor ?? Colors.transparent,
          border: Border.all(color: borderColor, width: UISize.autoSize * 1),
          borderRadius: BorderRadius.all(
            Radius.circular(15 * UISize.autoSize),
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: padding ?? 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (prefixIcon != null) prefixIcon!,
            Flexible(
              child: TextBasic(
                text: buttonText ?? "",
                color: textColor,
                fontSize: fontSize ?? UISize.autoSize * 16,
                fontWeight: fontWeight ?? FontWeight.w700,
                textAlign: textAlign ?? TextAlign.center,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//back button
class GetBackButton extends StatelessWidget {
  final VoidCallback? onTap;
  const GetBackButton({Key? key, this.onTap}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap ?? Get.back(),
      behavior: HitTestBehavior.translucent,
      child: const Icon(Icons.arrow_back),
    );
  }
}
