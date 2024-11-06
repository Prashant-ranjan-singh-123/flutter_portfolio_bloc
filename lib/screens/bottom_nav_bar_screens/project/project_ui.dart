import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/reusable/background.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/project/project_cubit.dart';

import '../../../reusable/motion.dart';
import '../../../state_management/app_drawer/app_drawer_cubit.dart';
import '../../../utils/app_color.dart';
import 'bottom_sheet_custom.dart';

class ProjectUi extends StatefulWidget {
  const ProjectUi({super.key});

  @override
  State<ProjectUi> createState() => _ProjectUiState();
}

class _ProjectUiState extends State<ProjectUi> {
  late ProjectCubit cubit;

  @override
  void initState() {
    cubit = context.read<ProjectCubit>();
    // cubit.initializeSliderItems(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Background(
        child: SafeArea(
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ZoomIn(
                      delay: const Duration(milliseconds: 200),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                      child: heading_and_subtitle_top()),
                  ZoomIn(
                      delay: const Duration(milliseconds: 500),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                      child: CustomCoursalSclider()),
                  ZoomIn(
                      delay: const Duration(milliseconds: 800),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                      child: types()),
                  ZoomIn(
                      delay: const Duration(milliseconds: 1100),
                      duration: const Duration(milliseconds: 400),
                      curve: Curves.decelerate,
                      child: grid_view_items(context: context))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget heading_and_subtitle_top() {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: IconButton(
              onPressed: () {
                context
                    .read<AppDrawerCubit>()
                    .zoomDrawerController
                    .toggle
                    ?.call();
                // drawerController.toggleDrawer();
              },
              icon: Icon(
                Iconsax.menu,
                size: 25,
                color: AppColor.instance().textBold,
              )),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'My Live Projects',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: AppColor.instance().textBold,
                    fontFamily: 'Oswald'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Github Link | Playstore Link',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 15,
                  fontFamily: 'OpenSans',
                  color: AppColor.instance().textLight,
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget CustomCoursalSclider() {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: MyMotionWidget(
        child: CarouselSlider(
          items: cubit.cursol_slider_item(context: context),
          options: CarouselOptions(
            aspectRatio: 16 / 7,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.3,
            onPageChanged: (page, _) {},
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  Widget types() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 45),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'My Live Projects',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: AppColor.instance().textBold,
                fontFamily: 'Oswald',
              ),
            ),
            Text(
              '---Feel Free to Contribute and expand---',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 15,
                fontFamily: 'OpenSans',
                color: AppColor.instance().textLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget grid_view_items({required BuildContext context}) {
    Widget first_item(int index) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            backgroundColor: Colors.transparent,
            barrierColor: Colors.black.withOpacity(0.8),
            elevation: 5,
            enableDrag: false,
            builder: (BuildContext context) {
              return BottomSheetCustom(
                heading: cubit.experience[index][0],
                imageLocation: cubit.experience[index][2],
                shortDiscription: cubit.experience[index][1],
                playstoreLink: cubit.experience[index][5]['Link'][0],
                githubLink: cubit.experience[index][5]['Link'][1],
                appStoreLink: cubit.experience[index][5]['Link'][2],
                shareText: cubit.shareText(
                  links: cubit.experience[index][5]['Link'],
                  nameOfApp: cubit.experience[index][0],
                ),
                parentContext: context,
              );
            },
          );
        },
        child: Column(
          children: [
            MyMotionWidget(
              child: Card(
                color: AppColor.instance().card,
                elevation: 50,
                shadowColor: AppColor.instance().cardShadow,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      cubit.experience[index][2],
                      fit: BoxFit.contain,
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: AutoSizeText('${cubit.experience[index][0]}',
                  maxLines: 1,
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: MediaQuery.sizeOf(context).width * 0.4,
                      color: AppColor.instance().textBold,
                      fontFamily: 'Poppins')),
            )
          ],
        ),
      );
    }

    Widget rest_item(int index) {
      return GestureDetector(
        onTap: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: false,
            backgroundColor: Colors.transparent,
            barrierColor: Colors.black.withOpacity(0.8),
            elevation: 5,
            enableDrag: false, // Prevents dismissal by dragging
            builder: (BuildContext context) {
              return BottomSheetCustom(
                heading: cubit.experience[index][0],
                imageLocation: cubit.experience[index][2],
                shortDiscription: cubit.experience[index][1],
                playstoreLink: cubit.experience[index][5]['Link'][0],
                githubLink: cubit.experience[index][5]['Link'][1],
                appStoreLink: cubit.experience[index][5]['Link'][2],
                shareText: cubit.shareText(
                  links: cubit.experience[index][5]['Link'],
                  nameOfApp: cubit.experience[index][0],
                ),
                parentContext: context,
              );
            },
          );
        },
        child: Column(
          children: [
            MyMotionWidget(
              child: Card(
                color: AppColor.instance().textBold,
                elevation: 50,
                shadowColor: AppColor.instance().cardShadow,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    cubit.experience[index][2],
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: AutoSizeText(
                        '${cubit.experience[index][0]}',
                        maxLines: 1,
                        style: TextStyle(
                          color: AppColor.instance().textBold,
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget build_grid_view(int index) {
      if (index == 0) {
        return first_item(index);
      } else {
        return rest_item(index);
      }
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 25.0, // spacing between columns
        ),
        itemBuilder: (context, index) {
          return build_grid_view(index);
        },
        itemCount: cubit.experience.length,
        // itemCount: 1, // Number of items you want to display
      ),
    );
  }

  String shareText({required List<String> links, required String nameOfApp}) {
    String playStoreLink = links[0];
    String githubLink = links[1];
    String appStoreLink = links[2];

    String result = 'Check out the newly redesigned $nameOfApp';

    if (playStoreLink.isNotEmpty &&
        appStoreLink.isNotEmpty &&
        githubLink.isNotEmpty) {
      result +=
          ' on Android, iOS, and GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n'
          '• App Store: $appStoreLink\n'
          '• GitHub: $githubLink\n\n';
    } else if (playStoreLink.isNotEmpty && appStoreLink.isNotEmpty) {
      result +=
          ' on Android and iOS! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n'
          '• App Store: $appStoreLink\n\n';
    } else if (playStoreLink.isNotEmpty && githubLink.isNotEmpty) {
      result +=
          ' on Android and GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n'
          '• GitHub: $githubLink\n\n';
    } else if (appStoreLink.isNotEmpty && githubLink.isNotEmpty) {
      result +=
          ' on iOS and GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• App Store: $appStoreLink\n'
          '• GitHub: $githubLink\n\n';
    } else if (playStoreLink.isNotEmpty) {
      result += ' on Android! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• Play Store: $playStoreLink\n\n';
    } else if (appStoreLink.isNotEmpty) {
      result += ' on iOS! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• App Store: $appStoreLink\n\n';
    } else if (githubLink.isNotEmpty) {
      result += ' on GitHub! If you like it, please leave a 5-star review.\n\n'
          '🔗 Download:\n\n'
          '• GitHub: $githubLink\n\n';
    }

    result += '🌐 Connect:\n\n'
        '• LinkedIn: https://linkedin.com/in/prashant-ranjan-singh-b9b6b9217\n\n'
        'Thanks for your support!';

    return result;
  }
}
