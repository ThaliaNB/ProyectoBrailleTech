import 'package:flutter/material.dart';
import 'package:flutter_braille/navigator_utils.dart';
import 'package:flutter_braille/ui/overview/overview_view_model.dart';
import 'package:flutter_braille/ui/utils/constants.dart';
import 'package:flutter_braille/ui/utils/responsive.dart';
import 'package:flutter_braille/ui/widgets/jetz_text.dart';
import 'package:provider/provider.dart';

class OverviewView extends StatelessWidget {
  const OverviewView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => OverviewViewModel()..init(),
      child: Scaffold(
        backgroundColor: Constants.grayLightColor,
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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Selector<OverviewViewModel, bool>(
      builder: (_, resultConnectionState, __) {
        return const _LoadingSplash();
      },
      selector: (_, vm) => vm.changeScreen,
    );
  }
}

class _LoadingSplash extends StatelessWidget {
  const _LoadingSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 10),
              JetzText(
                'Braille',
                fontSize: Responsive.of(context).dp(3),
                fontWeight: FontWeight.bold,
              ),
              const SizedBox(height: 20),
              Image.asset(
                "assets/images/over.png",
              ),
              const SizedBox(height: 10),
              const Padding(
                padding: EdgeInsets.all(10),
                child: JetzText(
                  "En 1825, Luis Braille ideó su sistema de puntos en relieve: el sistema braille, también conocido como cecografía, aporta a las personas ciegas una herramienta válida y eficaz para leer, escribir, acceder a la educación, a la cultura y a la información sin necesidad de ver, guiándose solo por el tacto.",
                  textAlign: TextAlign.justify,
                ),
              ),
              const SizedBox(height: 20),
              _ItemWidget(
                title: 'Escribe',
                subTitle: 'Obten el texto en braille',
                iconData: Icons.text_fields_rounded,
                onPressed: () {
                  pushToPage(context, '/write-view');
                },
              ),
              const SizedBox(height: 10),
              _ItemWidget(
                title: 'Sube imagen',
                subTitle: 'Obten el caracter con un modelo de CNN',
                iconData: Icons.upload_outlined,
                onPressed: () {
                  pushToPage(context, '/prediction');
                },
              ),
              const SizedBox(height: 10),
              // _ItemWidget(
              //   title: 'Escribe',
              //   subTitle: 'Simula un teclado braille',
              //   iconData: Icons.keyboard_alt_rounded,
              //   onPressed: () {},
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ItemWidget extends StatelessWidget {
  const _ItemWidget({
    required this.title,
    required this.subTitle,
    required this.iconData,
    this.onPressed,
  });

  final String title;
  final String subTitle;
  final IconData iconData;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Constants.lightBlueColor,
          foregroundColor: Colors.white,
          disabledForegroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 0,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: 0,
          leading: Icon(
            iconData,
            color: Colors.white,
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          subtitle: Text(
            subTitle,
            style: const TextStyle(
              fontWeight: FontWeight.normal,
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
