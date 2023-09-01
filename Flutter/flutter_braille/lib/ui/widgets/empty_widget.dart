import 'package:flutter/material.dart';
import 'package:flutter_braille/ui/utils/responsive.dart';
import 'package:flutter_braille/ui/widgets/jetz_text.dart';
import 'package:flutter_braille/ui/widgets/primary_button.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EmptyHomeWidget extends StatelessWidget {
  const EmptyHomeWidget({
    Key? key,
    required this.title,
    this.titleButton,
    this.urlSvg,
    this.func,
    this.withButton = true,
    this.fontWeight,
    this.fontSize,
  }) : super(key: key);
  final String title;
  final String? titleButton;
  final String? urlSvg;
  final Function()? func;
  final bool withButton;
  final FontWeight? fontWeight;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: <Widget>[
        Expanded(
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset(urlSvg ?? "assets/svg/icon_empty.svg"),
                  SizedBox(height: size.height * 0.02),
                  JetzText(
                    title,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  withButton
                      ? Container(
                          padding: EdgeInsets.symmetric(horizontal: size.height * .1),
                          child: PrimaryButton(onPressed: func ?? () => Navigator.pop(context), text: titleButton ?? 'Regresar'),
                        )
                      : const SizedBox.shrink(),
                ],
              ),
            ),
          ),
        ),
        // Quote button
      ],
    );
  }
}

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    Key? key,
    required this.title,
    this.urlSvg,
  }) : super(key: key);
  final String title;
  final String? urlSvg;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: Responsive.of(context).hp(28)),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(urlSvg ?? "assets/svg/icon_empty.svg"),
            SizedBox(height: size.height * 0.02),
            Text(title),
            SizedBox(
              height: size.height * 0.02,
            ),
          ],
        ),
      ),
    );
  }
}
