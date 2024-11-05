import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../screens/bottom_nav_bar_screens/bottom_nav_bar_ui.dart';
import '../../services/shared_pref/shared_pref.dart';

part 'onboard_state.dart';

class OnboardCubit extends Cubit<OnboardState> {
  OnboardCubit() : super(WaitingState());

  void onPageChange(int val) {
    if (val == 0) {
      emit(OnboardInitial(isLast: false, isFirst: true));
    }
    if (val == 2) {
      emit(OnboardInitial(isLast: true, isFirst: false));
    }
    if (val != 2 && val != 0) {
      emit(OnboardInitial(isLast: false, isFirst: false));
    }
  }

  Future<void> onboardOrMainApp({required BuildContext context}) async {
    emit(WaitingState());
    bool isFirstRunOnboard = await SharedPrefFunctions.isFirstRunOnboard();
    if (isFirstRunOnboard) {
      await SharedPrefFunctions.setFirstRunBoolOnboardFalse();
      emit(OnboardInitial(isLast: false, isFirst: true));
    } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) =>
              BlocProvider(
                create: (context) => OnboardCubit(),
                child: BottomNavBarUi(initialPageIndex: 0,),
              )),
              (Route<dynamic> route) => false);
      // navigateToMainApp();
      // return MainApp(isRTL: false);
      // emit(OnboardInitial(isLast: false, isFirst: true));
    }
  }

  void navigateToMainApp() {
    print('hello');
  }
}
