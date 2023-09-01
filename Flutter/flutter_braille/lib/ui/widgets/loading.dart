import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = [
      const Color(0xffF3022E),
      const Color(0xffFB5800),
      const Color(0xffF3C600),
      const Color(0xff00B7F7),
    ];

    return Center(
      key: const Key('loading'),
      child: Container(
          margin: const EdgeInsets.all(16),
          child: SpinKitWave(
            duration: const Duration(milliseconds: 1000),
            itemBuilder: (context, i) {
              return Container(
                color: colors[i],
              );
            },
            itemCount: 4,
          )),
    );
  }
}
