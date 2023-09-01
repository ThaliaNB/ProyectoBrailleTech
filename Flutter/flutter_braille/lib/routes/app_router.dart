import 'package:flutter/material.dart';
import 'package:flutter_braille/domain/models/route_arguments.dart';
import 'package:flutter_braille/navigator_utils.dart';
import 'package:flutter_braille/ui/overview/overview_view.dart';
import 'package:flutter_braille/ui/prediction/document/preview_document_view.dart';
import 'package:flutter_braille/ui/prediction/prediction_view.dart';
import 'package:flutter_braille/ui/splash/splash_view.dart';
import 'package:flutter_braille/ui/write/write_view.dart';

class AppRouter {
  Route<dynamic>? onGenerateRoute(settings) {
    switch (settings.name) {
      case '/':
        return _goToRoute(const SplashView(), const RouteSettings(name: "/splash-view"));

      case '/splash-view':
        return _goToRoute(const SplashView(), settings);

      case '/new-overview':
        return _goToRoute(const OverviewView());

      case '/write-view':
        return _goToRoute(const WriteView());

      case '/prediction':
        return _goToRoute(const PredictionView());

      case '/document-preview':
        final arguments = settings.arguments as PreviewDocumentArguments;
        return _goToRoute(
            PreviewDocumentView(
              fileResponse: arguments.fileResponse,
              title: arguments.title,
              isCircle: arguments.isCircle,
            ),
            settings);

      default:
        return MaterialPageRoute(builder: (context) => const ErrorView());
    }
  }

  MaterialPageRoute<dynamic> _goToRoute(Widget widget, [RouteSettings? settings]) {
    return MaterialPageRoute(settings: settings, builder: (context) => widget);
  }
}

class ErrorView extends StatelessWidget {
  const ErrorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        popAllAndPush(context, '/overview');
        return Future.value(false);
      },
      child: const Scaffold(
        body: Center(child: Text('esta vista no existe')),
      ),
    );
  }
}
