import 'package:flutter/material.dart';

class JetzText extends StatelessWidget {
  const JetzText(
    this.text, {
    Key? key,
    this.fontSize,
    this.textColor,
    this.fontWeight,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.softWrap,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final bool? softWrap;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: textColor,
        fontWeight: fontWeight,
      ),
      softWrap: softWrap,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
