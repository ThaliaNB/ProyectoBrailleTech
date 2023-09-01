import 'package:flutter/material.dart';
import 'package:flutter_braille/ui/utils/responsive.dart';
import 'package:flutter_braille/ui/widgets/loading.dart';
import 'package:flutter_braille/ui/widgets/primary_button.dart';
import 'package:flutter_svg/svg.dart';

class DialogJetz {
  DialogJetz({required this.buildContext});
  final BuildContext buildContext;

  static DialogJetz of(BuildContext context) => DialogJetz(buildContext: context);

  void infoDialog({required String title, required String description, bool withButton = false, Function()? func, String? labelButton}) {
    showDialog(
        context: buildContext,
        builder: (ctx) {
          return AlertDialog(
            title: Icon(Icons.info_outline, color: Theme.of(ctx).primaryColor),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                ),
                const SizedBox(
                  height: 20,
                ),
                withButton
                    ? PrimaryButton(
                        onPressed: func!,
                        text: labelButton ?? "Ok",
                      )
                    : Container(),
              ],
            ),
          );
        });
  }

  void taxDialog({
    required String title,
    required String description,
  }) {
    showDialog(
        context: buildContext,
        builder: (ctx) {
          return AlertDialog(
            content: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/svg/tax_record.svg',
                        width: 50,
                      ),
                      Expanded(
                        child: Text(
                          title,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Responsive.of(buildContext).dp(1.8),
                          ),
                          maxLines: 2,
                          softWrap: true,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: Responsive.of(buildContext).dp(1.5),
                    ),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  PrimaryButton(
                    onPressed: () => Navigator.pop(buildContext),
                    text: "Cerrar",
                  )
                ],
              ),
            ),
          );
        });
  }

  void loadingDialog({required String title}) {
    showDialog(
        barrierDismissible: false,
        context: buildContext,
        builder: (ctx) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Loading(),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        });
  }
}
