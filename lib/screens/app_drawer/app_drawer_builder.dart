import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/state_management/app_drawer/app_drawer_cubit.dart';
import 'package:prashant_portfolio/utils/app_color.dart';

import '../bottom_nav_bar_screens/bottom_nav_bar_ui.dart';
import 'drawer_menu.dart';

class AppDrawerBuilder extends StatefulWidget {
  final bool isRTL;

  const AppDrawerBuilder({Key? key, required this.isRTL}) : super(key: key);

  @override
  _AppDrawerBuilderState createState() => _AppDrawerBuilderState();
}

class _AppDrawerBuilderState extends State<AppDrawerBuilder> {
  final ZoomDrawerController _zoomDrawerController = ZoomDrawerController();
  late AppDrawerCubit cubit;

  @override
  void initState() {
    cubit = context.read<AppDrawerCubit>();
    cubit.initialize_zoom_drawer_controller(controller: _zoomDrawerController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(
      controller: _zoomDrawerController,
      menuScreen: DrawerMenu(
        controller: _zoomDrawerController,
        cubit: cubit,
      ),
      mainScreen: BottomNavBarUi(),
      mainScreenTapClose: true,
      menuScreenWidth: MediaQuery.of(context).size.width,
      menuBackgroundColor: AppColor.instance().background.withBlue(35),
      borderRadius: 24.0,
      showShadow: true,
      angle: -5,
      isRtl: widget.isRTL,
      mainScreenScale: 0.25,
      drawerShadowsBackgroundColor:
          AppColor.instance().background.withBlue(10).withRed(7),
      slideWidth: MediaQuery.of(context).size.width * 0.5,
      style: DrawerStyle.defaultStyle,
      disableDragGesture: false,
    );
  }
}
