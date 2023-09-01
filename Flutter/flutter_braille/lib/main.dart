import 'dart:async';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_braille/core/env/config.dart';
import 'package:flutter_braille/di/dependencies.dart';
import 'package:flutter_braille/routes/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  runApp(const StartUp());
}

class StartUp extends StatelessWidget {
  const StartUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Config(baseUrl: 'https://7c29-190-63-238-70.ngrok.io');
    const primaryColor = Color(0xff00B7EE);
    // const _primaryColor = Color(0xFF36C5F0);
    final router = AppRouter();

    return MultiRepositoryProvider(
      providers: buildRepositories(),
      child: Builder(
        builder: (context) {
          return MaterialApp(
            theme: ThemeData(
              primaryColor: primaryColor,
              appBarTheme: const AppBarTheme(
                actionsIconTheme: IconThemeData(
                  color: Color(0xFF242424),
                ),
              ),
              unselectedWidgetColor: Colors.grey,
              fontFamily: 'Montserrat',
            ),
            // home: SplashView(),
            builder: BotToastInit(),
            navigatorObservers: [BotToastNavigatorObserver()],

            // supportedLocales: const [Locale('es')],

            onGenerateRoute: router.onGenerateRoute,
            //showPerformanceOverlay: true,
            initialRoute: "/",
          );
        },
      ),
    );
  }
}
