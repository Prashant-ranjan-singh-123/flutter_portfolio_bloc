import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/state_management/splash/splash_cubit.dart';

import '../reusable/background.dart';
import '../utils/app_assets.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    context.read<SplashCubit>().showOnboard(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, snapshot) {
      return Scaffold(
        backgroundColor: Colors.black,
        body: Background(
          child: myCustomColumn(children: [
            Lottie.asset(AppAssets.instance().lottieHello, repeat: false)
          ]),
        ),
      );
    });
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
