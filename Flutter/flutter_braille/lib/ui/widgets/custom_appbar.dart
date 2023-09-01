import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
    this.title,
    this.actionButton,
    this.leadingOnPressed,
    this.fontSize,
    this.hasElevation = false,
    this.textAlign,
  }) : super(key: key);
  final String? title;
  final Widget? actionButton;
  final Function()? leadingOnPressed;
  final double? fontSize;
  final bool hasElevation;
  final TextAlign? textAlign;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: hasElevation ? 4 : 0,
      shadowColor: Colors.black26,
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            IconButton(
              icon: Image.asset('assets/images/back_button.png'),
              iconSize: 25,
              onPressed: () async {
                leadingOnPressed != null
                    ? //
                    leadingOnPressed!()
                    : Navigator.of(context).pop();
              },
            ),
            if (title != null)
              Expanded(
                child: Text(
                  title!,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 0.36,
                  ),
                  textAlign: textAlign,
                ),
              ),
            if (actionButton != null)
              actionButton!
            //Ya que en algunos casos esta centrado el texto, entonces
            //si no se tiene un action button, validamos que el texto este centrado
            //para equiparar su espacio en left y right
            else if (textAlign == TextAlign.center)
              const SizedBox(width: 25),
          ],
        ),
      ),
    );
  }
}
