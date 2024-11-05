import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../reusable/background.dart';
import '../utils/app_assets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
        builder: (context, snapshot) {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Background(
              child: myCustomColumn(children: [
                Lottie.asset(AppAssets.instance().lottieHello, repeat: false)
              ]),
            ),
          );
        }
    );
  }

  Widget myCustomColumn({required List<Widget> children}) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: children,
      ),
    );
  }
}
