import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:prashant_portfolio/utils/app_color.dart';
import '../../reusable/motion.dart';
import '../../state_management/app_drawer/app_drawer_cubit.dart';
import '../../state_management/bottom_nav_bar/bottom_nav_bar_cubit.dart';
import '../../utils/app_assets.dart';

class DrawerMenu extends StatefulWidget {
  ZoomDrawerController controller;
  AppDrawerCubit cubit;
  DrawerMenu({super.key, required this.controller, required this.cubit});

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(builder: (context, snapshot) {
      return Scaffold(
        backgroundColor: AppColor.instance().background.withBlue(35),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      logoNameAndVersion(context: context),
                      DrawerButton(
                        icon: Iconsax.tag_user,
                        text: 'About Me',
                        context: context,
                        // fun: widget.cubit.aboutMeButton,
                        fun: (){
                          context.read<BottomNavBarCubit>().changePage(index: 0);
                        },
                      ),
                      DrawerButton(
                          icon: Iconsax.building,
                          text: 'Carrier',
                          context: context,
                          fun: (){
                            context.read<BottomNavBarCubit>().changePage(index: 1);
                          },),
                      DrawerButton(
                          icon: Iconsax.medal_star,
                          text: 'Projects',
                          context: context,
                          fun: (){
                            context.read<BottomNavBarCubit>().changePage(index: 2);
                          }),
                      DrawerButton(
                          icon: Iconsax.magic_star,
                          text: 'Certificate',
                          context: context,
                          fun: (){
                            context.read<BottomNavBarCubit>().changePage(index: 3);
                          }),
                      DrawerButton(
                          icon: MdiIcons.github,
                          text: 'Contribute',
                          context: context,
                          fun: widget.cubit.contributeButton),
                      DrawerButton(
                          icon: Iconsax.star,
                          text: 'Rate Us',
                          context: context,
                          fun: widget.cubit.rateUsButton),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AutoSizeText(
                    'You can’t help everyone, but everyone can help someone.',
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,
                      color: AppColor.instance().textBold,
                      fontFamily: 'Oswald',
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget logoNameAndVersion({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: [
          MyMotionWidget(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.3,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Image.asset(AppAssets.instance().iconMineCircular),
            ),
          ),
          const SizedBox(height: 10),
          AutoSizeText(
            'Portfolio',
            maxLines: 1,
            style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 30,
              color: AppColor.instance().textBold,
              fontFamily: 'Merriweather',
            ),
          ),
          AutoSizeText(
            'Version: 1.1.0',
            maxLines: 1,
            style: TextStyle(
                fontFamily: 'Oswald', color: AppColor.instance().textLight),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget DrawerButton(
      {required IconData icon,
      required String text,
      required BuildContext context,
      required Function fun}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: () {
          fun();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.instance().background.withBlue(20),
          foregroundColor: AppColor.instance().backgroundBubble,
          shadowColor: AppColor.instance().backgroundBubble,
          elevation: 30,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Row(
            children: [
              Icon(icon, color: AppColor.instance().textBold),
              const SizedBox(width: 10),
              Text(
                text,
                style: TextStyle(
                  color: AppColor.instance().textBold.withOpacity(0.7),
                  fontFamily: 'Oswald',
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
