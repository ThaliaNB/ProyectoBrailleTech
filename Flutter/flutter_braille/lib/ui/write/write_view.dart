// ignore_for_file: use_build_context_synchronously

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_braille/domain/models/data_result.dart';
import 'package:flutter_braille/domain/usecases/braille_usecases.dart';
import 'package:flutter_braille/ui/utils/constants.dart';
import 'package:flutter_braille/ui/utils/dialog_jetz.dart';
import 'package:flutter_braille/ui/utils/error.dart';
import 'package:flutter_braille/ui/utils/speech_api.dart';
import 'package:flutter_braille/ui/widgets/custom_appbar.dart';
import 'package:flutter_braille/ui/widgets/loading.dart';
import 'package:flutter_braille/ui/widgets/primary_button.dart';
import 'package:flutter_braille/ui/write/write_view_model.dart';
import 'package:provider/provider.dart';

class WriteView extends StatelessWidget {
  const WriteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WriteViewModel(context.read<BrailleUseCases>())..init(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: _Content(),
      ),
    );
  }
}

class _Content extends StatefulWidget {
  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  bool isListening = false;
  String text = 'Presione el boton para hablar...';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(
              title: "Regresar",
              textAlign: TextAlign.center,
              hasElevation: true,
            ),
            Expanded(
              child: Material(
                elevation: 2,
                child: Container(
                  alignment: Alignment.center,
                  color: Constants.grayButtonColor,
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    text,
                    style: const TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            InkWell(
              onTap: toggleRecording,
              child: AvatarGlow(
                animate: isListening,
                endRadius: 75,
                glowColor: Theme.of(context).primaryColor,
                child: Icon(
                  isListening ? Icons.mic : Icons.mic_none,
                  size: 36,
                ),
              ),
            ),
            const SizedBox(height: 15),
            _RegisterUserInformationButton(onPressed: () async {
              DialogJetz.of(context).loadingDialog(title: 'Cargando..');
              final result = await context.read<WriteViewModel>().traduceText(text);
              Navigator.pop(context);
              if (result.state == ResultState.exception) return;
              DialogJetz.of(context).infoDialog(title: 'Texto traducido', description: result.data!);
              text = 'Presione el boton para hablar...';
            }),
          ],
        ),
      ),
    );
  }

  Future toggleRecording() => SpeechApi.toggleRecording(
        onResult: (text) => setState(() => this.text = text),
        onListening: (isListening) {
          setState(() => this.isListening = isListening);

          if (!isListening) {
            // Future.delayed(Duration(seconds: 1), () {
            //   //Utils.scanText(text);
            // });
          }
        },
      );
}

class _RegisterUserInformationButton extends StatelessWidget {
  const _RegisterUserInformationButton({Key? key, required this.onPressed}) : super(key: key);

  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Selector<WriteViewModel, DataResult<String>>(
          builder: (_, dataResult, child) {
            switch (dataResult.state) {
              case ResultState.exception:
              case ResultState.initial:
                if (dataResult.state == ResultState.exception) {
                  ErrorP().showToast(dataResult.exception!);
                }

                return child!;
              case ResultState.success:
                return child!;
              case ResultState.loading:
                return const Loading();
            }
          },
          selector: (_, vm) => vm.brailleResult,
          child: PrimaryButton(
            onPressed: onPressed,
            text: 'Traducir',
          )),
    );
  }
}
