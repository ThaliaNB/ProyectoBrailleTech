import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_braille/ui/prediction/prediction_view_model.dart';
import 'package:flutter_braille/ui/utils/constants.dart';
import 'package:flutter_braille/ui/utils/responsive.dart';
import 'package:flutter_braille/ui/widgets/custom_appbar.dart';
import 'package:flutter_braille/ui/widgets/primary_button.dart';

class PreviewDocumentView extends StatelessWidget {
  const PreviewDocumentView({Key? key, required this.fileResponse, required this.title, required this.isCircle}) : super(key: key);
  final File fileResponse;

  final String title;
  final bool isCircle;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Builder(builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: <Widget>[
                CustomAppBar(
                  title: title,
                  hasElevation: true,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: _Content(
                    fileResponse: fileResponse,
                    isPDF: false,
                    isCircle: isCircle,
                  ),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(
                    context,
                    DocumentAction.tryItAgain,
                  ),
                  child: Text(
                    'Volver a seleccionar archivo',
                    style: TextStyle(color: Constants.grayColor),
                  ),
                ),
                const SizedBox(height: 5),
                PrimaryButton(
                  text: 'Guardar y continuar',
                  onPressed: () => Navigator.pop(context, DocumentAction.confirm),
                  buttonColor: Constants.lightBlueColor,
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content({
    Key? key,
    required this.fileResponse,
    this.isPDF = false,
    required this.isCircle,
  }) : super(key: key);
  final File fileResponse;
  final bool isPDF;
  final bool isCircle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Responsive.of(context).hp(65),
      child: isCircle
          ? Column(
              children: [
                const SizedBox(height: 50),
                ClipRRect(
                  borderRadius: BorderRadius.circular(getpropScreenWidth(200, context)),
                  clipBehavior: Clip.hardEdge,
                  child: FadeInImage(
                    image: FileImage(fileResponse),
                    placeholder: const AssetImage('assets/images/loading.png'),
                    fit: BoxFit.cover,
                    width: getpropScreenWidth(250, context),
                    height: getpropScreenWidth(250, context),
                  ),
                ),
              ],
            )
          : FadeInImage(
              image: FileImage(fileResponse),
              placeholder: AssetImage('assets/images/loading.png'),
            ),
    );
  }
}
