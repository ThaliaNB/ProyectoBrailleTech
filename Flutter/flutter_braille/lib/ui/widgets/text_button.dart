import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    Key? key,
    required this.onPressed,
    required this.text,
    this.backgroundColor = const Color(0xffF2F2F2),
    this.textColor = const Color(0xff242424),
  }) : super(key: key);

  final void Function() onPressed;
  final String text;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: textColor,
        ),
      ),
      onPressed: onPressed,
      style: TextButton.styleFrom(
        alignment: Alignment.centerLeft,
        backgroundColor: backgroundColor,
        minimumSize: const Size(double.infinity, 55),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        primary: const Color(0xff243443),
      ),
    );
  }
}
