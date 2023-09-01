import 'package:flutter/material.dart';
import 'package:flutter_braille/ui/widgets/jetz_text.dart';

class ThirdButton extends StatelessWidget {
  const ThirdButton({
    Key? key,
    required this.title,
    this.iconLeading,
    this.iconTrailing,
    this.onPressed,
    this.colorButton,
    this.fontWeight,
    this.textColor,
    this.fontSize,
    this.elevation = 0,
    this.minLeadingWidth,
    this.textAlign,
  }) : super(key: key);

  final Function()? onPressed;
  final String title;
  final Widget? iconLeading;
  final Widget? iconTrailing;
  final Color? colorButton;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final double elevation;
  final double? minLeadingWidth;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevation,
      borderRadius: BorderRadius.circular(10),
      color: colorButton,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: InkWell(
          onTap: onPressed,
          child: ListTile(
            leading: iconLeading,
            trailing: iconTrailing,
            minLeadingWidth: minLeadingWidth,
            title: JetzText(
              title,
              fontWeight: fontWeight,
              textColor: textColor,
              fontSize: fontSize,
              textAlign: textAlign,
            ),
          ),
        ),
      ),
    );
  }
}
