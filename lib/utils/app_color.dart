import 'package:flutter/material.dart';

class AppColor{
  AppColor._();
  static AppColor instance ()=> AppColor._();

  // --Frequently Used Color--
  Color background=const Color.fromRGBO(4, 0, 20, 1);
  Color textBold= const Color.fromRGBO(255, 255, 255, 1);
  Color textLight= const Color.fromRGBO(108, 114, 122, 1);
  Color backgroundBubble= const Color.fromRGBO(65, 57, 248, 1.0);
  Color cardShadow= const Color.fromRGBO(65, 57, 248, 1.0);
  Color card= const Color.fromRGBO(4, 0, 20, 1);

  // --Home Screen Color--
  Color homeIconColor= const Color.fromRGBO(255, 255, 255, 1.0);
  Color homeSkillActive= const Color.fromRGBO(255, 255, 255, 1.0);
  Color homeSkillUnachieve= const Color.fromRGBO(108, 114, 122, 1);


  // --Carrier Screen Color--
  Color carrierTimeline= const Color.fromRGBO(255, 255, 255, 1.0);
  Color carrierTimelineDot= const Color.fromRGBO(255, 255, 255, 1.0);


  // --Project Screen Color--
  Color projectCursorSliderGradientTop= const Color.fromRGBO(65, 57, 248, 1.0);
  Color projectCursorSliderGradientDown= const Color.fromRGBO(255, 255, 255, 1.0);
  Color projectCursorSliderTextBold= const Color.fromRGBO(4, 0, 20, 1);
  Color projectCursorSliderTextLight= const Color.fromRGBO(
      51, 52, 58, 1.0);


  // --Bottom Sheet Color--
  Color bottomSheetHandle = const Color.fromRGBO(171, 169, 253, 1.0);
  Color bottomSheetIcon = const Color.fromRGBO(171, 169, 253, 1.0);


  // --Bottom Nav Color--
  Color bottomNavBackground = const Color.fromRGBO(4, 0, 20, 1);
  Color bottomNavCard = const Color.fromRGBO(255, 255, 255, 1);
  Color bottomNavCardShadow = const Color.fromRGBO(167, 165, 244, 1.0);
  Color bottomNavInactiveItem = const Color.fromRGBO(108, 114, 122, 1);
  Color bottomNavActiveIcon = const Color.fromRGBO(4, 0, 20, 1);
  Color bottomNavActiveText = const Color.fromRGBO(255, 255, 255, 1);
}