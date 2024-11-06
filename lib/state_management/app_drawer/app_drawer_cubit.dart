import 'package:android_intent_plus/android_intent.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import 'package:url_launcher/url_launcher.dart';

part 'app_drawer_state.dart';

class AppDrawerCubit extends Cubit<AppDrawerState> {
  AppDrawerCubit() : super(AppDrawerInitial());
  late ZoomDrawerController zoomDrawerController;

  void initialize_zoom_drawer_controller({required ZoomDrawerController controller}){
    zoomDrawerController = controller;
  }

  void aboutMeButton() {
    // Builder(
    //   builder: (context) {
    //     return context.read<BottomNavBarCubit>().changePage(index: 0);
    //   },
    // );
  }

  void carrierButton() {
    // controlle.setPageIndex(1);
  }

  void projectButton() {
    // controlle.setPageIndex(2);
  }

  void certificateButton() {
    // controlle.setPageIndex(3);
  }

  Future<void> contributeButton() async {
    Future<bool> isGithubInInstalled() async {
      Uri url = Uri.parse('github://');
      if (await canLaunchUrl(url)) {
        return true;
      } else {
        return false;
      }
    }

    String dt =
        'https://github.com/Prashant-ranjan-singh-123/PrashantSkillscape';
    bool isInstalled = await isGithubInInstalled();
    if (isInstalled != false) {
      AndroidIntent intent = AndroidIntent(action: 'action_view', data: dt);
      await intent.launch();
    } else {
      Uri url = Uri.parse(dt);
      if (await canLaunchUrl(url)) {
        await launchUrl(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  Future<void> rateUsButton() async {
    final InAppReview inAppReview = InAppReview.instance;

    if (await inAppReview.isAvailable()) {
      inAppReview.requestReview();
    } else {
      String dt =
          'https://play.google.com/store/apps/details?id=com.prashant.project.portfolio';
      Uri url = Uri.parse(dt);
      try {
        await launchUrl(url);
      } catch (e) {
        throw 'Could not launch $url';
      }
    }
  }
}
