import 'package:flutter/material.dart';
import 'package:flutter_braille/navigator_utils.dart';
import 'package:flutter_braille/ui/splash/splash_view_model.dart';
import 'package:provider/provider.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SplashViewModel()..init(),
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
  @override
  void initState() {
    super.initState();
  }

  void _goToOverviewView(BuildContext context, {int initialTab = 0}) async {
    Future.delayed(Duration.zero, () async {
      pushAndReplaceToPage(
        context,
        '/new-overview',
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Selector<SplashViewModel, bool>(
      builder: (_, resultConnectionState, __) {
        if (resultConnectionState) {
          _goToOverviewView(context);
        }
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
    return const Scaffold(
      body: Stack(
        children: [
          Image(
            image: AssetImage("assets/images/splash-image.png"),
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
        ],
      ),
    );
  }
}
