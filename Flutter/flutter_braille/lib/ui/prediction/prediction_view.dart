// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_braille/domain/models/route_arguments.dart';
import 'package:flutter_braille/domain/usecases/braille_usecases.dart';
import 'package:flutter_braille/domain/usecases/upload_image_usecase.dart';
import 'package:flutter_braille/navigator_utils.dart';
import 'package:flutter_braille/ui/prediction/prediction_view_model.dart';
import 'package:flutter_braille/ui/utils/constants.dart';
import 'package:flutter_braille/ui/utils/dialog_jetz.dart';
import 'package:flutter_braille/ui/utils/responsive.dart';
import 'package:flutter_braille/ui/utils/toast.dart';
import 'package:flutter_braille/ui/widgets/custom_appbar.dart';
import 'package:flutter_braille/ui/widgets/jetz_text.dart';
import 'package:flutter_braille/ui/widgets/primary_button.dart';
import 'package:flutter_braille/ui/widgets/text_button.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class PredictionView extends StatelessWidget {
  const PredictionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ChangeNotifierProvider(
        create: (context) => PredictionViewModel(
          context.read<UploadImageUseCase>(),
          context.read<BrailleUseCases>(),
        )..init(),
        child: SafeArea(
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomAppBar(
                      title: 'Regresar',
                      hasElevation: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: EdgeInsets.all(Responsive.of(context).dp(3)),
                      child: Image.asset(
                        "assets/images/ia.jpeg",
                      ),
                    ),
                    const SizedBox(height: 10),
                    // Register your workshop title
                    const _WorkShopTitle(),
                    const SizedBox(height: 30),
                    const _Content(),
                    //const SizedBox(height: 30),
                    // Register form
                    //const _Form(),

                    const Spacer(),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryButton(
                          text: 'Finalizar',
                          onPressed: () => Navigator.pop(context),
                          buttonColor: Constants.lightBlueColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  const _Content({
    Key? key,
  }) : super(key: key);

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  //late Documentation _documentation;
  @override
  void initState() {
    //_documentation = context.read<SignOrRegisterViewModel>().tempRegisterDataItem!.documentation!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _ItemWidget(
          title: 'Predecir imagen',
          imageUrl: 'assets/svg/ine-front.svg',
          func: () => _showModalBottomSheet(
            context: context,
            title: 'Predicción',
            isDocument: false,
          ),
          isCompleted: false,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  Future<void> _takePhotoGalery(String title) async {
    final fileResponse = await context.read<PredictionViewModel>().pickGalery();
    if (fileResponse == null) {
      Toast.showErrorToast('El proceso no fue completado');
      return;
    }

    final result = await pushToPage(
      context,
      '/document-preview',
      PreviewDocumentArguments(fileResponse: fileResponse, title: title, isCircle: false),
    );

    if (result == null) {
      Toast.showErrorToast('El proceso no fue completado');
      return;
    }

    if (result == DocumentAction.confirm) {
      DialogJetz.of(context).loadingDialog(title: 'Estamos verificando y prediciendo la imagen....');
      final urlDocument = await context.read<PredictionViewModel>().saveDocumentMediaUser(
            file: fileResponse,
          );
      Navigator.pop(context);
      if (urlDocument == null) {
        Toast.showErrorToast('No se pudo procesar el archivo.');
        return;
      }

      context.read<PredictionViewModel>().speak('El cáracter predecido es: $urlDocument');

      DialogJetz.of(context).infoDialog(title: 'Texto predecido', description: urlDocument);

      return;
    }

    if (result == DocumentAction.tryItAgain) {
      _takePhotoGalery(title);
    }
  }

  Future<void> _showModalBottomSheet({
    required BuildContext context,
    required String title,
    required bool isDocument,
  }) async {
    final response = await showModalBottomSheet(
      context: context,
      builder: (bottomSheetContext) => _BottomSheetOptionContent(
        topContext: context,
        title: title,
        isDocument: isDocument,
      ),
      barrierColor: Colors.black.withOpacity(.67),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      backgroundColor: Colors.white,
    );
    if (response is DocumentOption) {
      if (response == DocumentOption.gallery) {
        _takePhotoGalery(title);
      } else {
        Toast.showInfoToast('Elija una opcion valida');
      }
    }
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    Key? key,
    required this.imageUrl,
    required this.title,
    this.subtitle,
    this.isCompleted = false,
    this.func,
  }) : super(key: key);

  final String imageUrl;
  final String title;
  final String? subtitle;
  final bool isCompleted;
  final Function()? func;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 3),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Constants.grayColor.withOpacity(.1)),
        boxShadow: [
          BoxShadow(
            blurRadius: 2,
            color: Colors.black.withOpacity(0.1),
          ),
        ],
        color: Colors.white,
      ),
      child: ListTile(
        leading: SizedBox(
          width: 25,
          child: SvgPicture.asset(imageUrl, fit: BoxFit.scaleDown),
        ),
        horizontalTitleGap: -5,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(fontSize: 12),
                  ),
              ],
            ),
            !isCompleted
                ? const SizedBox.shrink()
                : SizedBox(
                    width: 25,
                    height: 25,
                    child: SvgPicture.asset(
                      'assets/svg/check.svg',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
          ],
        ),
        trailing: SvgPicture.asset(
          'assets/svg/arrow-down.svg',
        ),
        onTap: func,
      ),
    );
  }
}

class _WorkShopTitle extends StatelessWidget {
  const _WorkShopTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Text(
        "Suba una imagen de un cáracter en braille y predice que letra es con nuestro algoritmo de IA (CNN)",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,

          // letterSpacing: 0.36,
        ),
        textAlign: TextAlign.justify,
      ),
    );
  }
}

class _BottomSheetOptionContent extends StatelessWidget {
  const _BottomSheetOptionContent({
    Key? key,
    required this.topContext,
    required this.title,
    this.isDocument = false,
  }) : super(key: key);
  final BuildContext topContext;
  final String title;
  final bool isDocument;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 36,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Tile
          JetzText(
            title,
            fontSize: 24,
            fontWeight: FontWeight.w800,
          ),
          const SizedBox(height: 20),
          // Options

          // Cancel quote
          TextButtonWidget(
            onPressed: () => Navigator.pop(topContext, isDocument ? DocumentOption.document : DocumentOption.gallery),
            text: 'Seleccionar archivo',
          ),
          const SizedBox(height: 2),
        ],
      ),
    );
  }
}
