import 'package:flutter/material.dart';
import 'package:flutter_braille/ui/widgets/icon_message.dart';
import 'package:flutter_braille/ui/widgets/primary_button.dart';

class UnexpectedError extends StatelessWidget {
  const UnexpectedError({Key? key, this.onTryAgain, this.errorDescription = 'Ha ocurrido un error inesperado', this.titleMessage}) : super(key: key);

  final Function? onTryAgain;
  final String errorDescription;
  final String? titleMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key('errorView'),
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconMessage(
              title: titleMessage ?? 'Lo sentimos',
              subtitle: errorDescription,
              icon: const Icon(Icons.error, size: 150, color: Colors.grey),
            ),
            if (onTryAgain != null)
              PrimaryButton(
                onPressed: () => onTryAgain!(),
                text: 'Reintentar',
              ),
          ],
        ),
      ),
    );
  }
}
