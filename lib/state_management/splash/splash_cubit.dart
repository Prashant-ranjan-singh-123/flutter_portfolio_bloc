import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prashant_portfolio/state_management/on_board/onboard_cubit.dart';

import '../../screens/on_borading_screens/on_board_screen.dart';

part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit() : super(SplashInitial());

  Future<void> showOnboard({required BuildContext context}) async {
    await Future.delayed(const Duration(milliseconds: 6000), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
              BlocProvider(
                create: (context) => OnboardCubit(),
                child: const OnBoardingScreen(),
              )),
              (Route<dynamic> route) => false);
      // Get.offAll(() => OnboardingOrMainScreen());
    });
  }
}
