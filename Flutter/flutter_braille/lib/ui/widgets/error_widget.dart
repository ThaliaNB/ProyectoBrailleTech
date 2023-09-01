import 'package:flutter/material.dart';
import 'package:flutter_braille/ui/utils/constants.dart';
import 'package:flutter_braille/ui/utils/responsive.dart';
import 'package:flutter_braille/ui/widgets/jetz_text.dart';
import 'package:flutter_braille/ui/widgets/primary_button.dart';

class ErrorJetzWidget extends StatelessWidget {
  const ErrorJetzWidget({
    super.key,
    required this.func,
    this.code,
    this.message,
  });
  final Function() func;
  final String? code;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            child: Column(
              children: [
                _Content(
                  code: code,
                  message: message,
                ),
                const SizedBox(height: 5),
                PrimaryButton(
                  text: 'Volver al inicio',
                  buttonColor: Constants.lightBlueColor,
                  onPressed: () => func(),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    this.code,
    this.message,
  }) : super(key: key);
  final String? code;
  final String? message;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              image: const AssetImage("assets/images/error.png"),
              width: Responsive.of(context).wp(70),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: Responsive.of(context).dp(3.5)),
              child: JetzText(
                "Parece que algo falló aquí, trabajaremos para arreglar las cosas, vuelva más tarde.",
                fontSize: 16,
                textColor: Constants.blackColor,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 15),
            code != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: Responsive.of(context).dp(3.5)),
                    child: JetzText(
                      'Código de error: ${code}',
                      fontSize: 14,
                      textColor: Constants.blackColor,
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 5),
            message != null
                ? Padding(
                    padding: EdgeInsets.symmetric(horizontal: Responsive.of(context).dp(3.5)),
                    child: JetzText(
                      'Mensaje: ${message}',
                      fontSize: 14,
                      textColor: Constants.blackColor,
                      textAlign: TextAlign.center,
                    ),
                  )
                : const SizedBox.shrink(),
            const SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}
