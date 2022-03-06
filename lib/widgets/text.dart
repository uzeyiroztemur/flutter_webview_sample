import 'package:flutter/material.dart';

class TextBasic extends StatelessWidget {
  final String text;
  final Color? color;
  final String? fontFamily;
  final double? fontSize;
  final double? lineHeight;
  final bool? underline;
  final TextAlign? textAlign;
  final int? maxLines;
  final FontWeight? fontWeight;

  const TextBasic({
    Key? key,
    required this.text,
    this.color,
    this.fontFamily,
    this.fontSize,
    this.lineHeight,
    this.underline = false,
    this.textAlign,
    this.maxLines,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      maxLines: maxLines ?? 999,
      textScaleFactor: 1.0,
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: fontSize,
        decoration: underline! ? TextDecoration.underline : null,
        fontWeight: fontWeight ?? FontWeight.w400,
        height: lineHeight ?? 1.2,
      ),
    );
  }
}

class RichTextBasic extends StatelessWidget {
  final List<TextSpan> texts;
  final TextAlign? textAlign;

  const RichTextBasic({Key? key, required this.texts, this.textAlign}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign ?? TextAlign.center,
      text: TextSpan(
        children: texts,
      ),
    );
  }
}
