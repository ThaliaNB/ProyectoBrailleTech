import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    this.onPressed,
    required this.text,
    this.alignment,
    this.height = 50,
    this.width = double.infinity,
    this.radius = 10,
    this.textStyle,
    this.buttonColor,
    this.elevation,
    this.borderColor,
    this.textAlign,
    this.iconPreffixName,
    this.iconSuffixName,
  }) : super(key: key);

  final void Function()? onPressed;
  final String text;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  final double height;
  final double width;
  final double radius;
  final Color? buttonColor;
  final double? elevation;
  final Color? borderColor;
  final TextAlign? textAlign;
  final String? iconPreffixName;
  final String? iconSuffixName;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: buttonColor ?? Theme.of(context).primaryColor,
        minimumSize: Size(width, height),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
          side: borderColor != null ? BorderSide(color: borderColor!) : BorderSide.none,
        ),
        alignment: alignment,
        elevation: elevation,
      ),
      onPressed: onPressed,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (iconPreffixName != null)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SvgPicture.asset(
                iconPreffixName!,
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
            ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w700).merge(textStyle),
              textAlign: textAlign ?? TextAlign.center,
            ),
          ),
          if (iconSuffixName != null)
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: SvgPicture.asset(
                iconSuffixName!,
                width: 25,
                height: 20,
                fit: BoxFit.contain,
                color: Colors.white,
              ),
            ),
        ],
      ),
    );
  }
}
