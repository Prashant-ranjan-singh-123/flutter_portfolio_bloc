import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/about_me/about_me_cubit.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/carrier/carrier_cubit.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/certificate/certificate_cubit.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/project/project_cubit.dart';

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
      // emit(OnboardInitial(isLast: false, isFirst: true));
      navigateToMainApp(context: context);
      // emit(OnboardInitial(isLast: false, isFirst: true));
    }
  }

  void navigateToMainApp({required BuildContext context}) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
            builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                      create: (context) => BottomNavBarCubit(),
                    ),
                    BlocProvider(
                      create: (context) => AboutMeCubit(),
                    ),
                    BlocProvider(
                      create: (context) => CarrierCubit(),
                    ),
                    BlocProvider(
                      create: (context) => ProjectCubit(),
                    ),
                    BlocProvider(
                      create: (context) => CertificateCubit(),
                    ),
                  ],
                  child: BottomNavBarUi(),
                )),
        (Route<dynamic> route) => false);
  }
}
