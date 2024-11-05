import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:prashant_portfolio/reusable/background.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/about_me/about_me_cubit.dart';
import 'package:prashant_portfolio/utils/app_assets.dart';
import 'package:prashant_portfolio/utils/app_color.dart';
import '../../reusable/animated_stack.dart';
import '../../reusable/motion.dart';
import '../../reusable/refresh_indicator.dart';
import '../../utils/global_fun.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Background(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.sizeOf(context).width * 0.03),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  topImageWidget(context: context),
                  nameOdDev(context: context),
                  professionOfDeveloper(context: context),
                  socialMedia(context: context),
                  aboutText(context: context),
                  skillText(context: context),
                  contactMe(context: context),
                  socialProfileSelf(context: context)
                  // experience()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget padding_between_element({required Widget child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: child,
    );
  }

  Widget heading({
    required String heading,
    double paddingTop = 20.0,
    double paddingBottom = 20.0,
    double fontSize = 40,
    bool isCenter = true,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: isCenter
          ? Center(
              child: AutoSizeText(
                heading,
                maxLines: 1,
                style: TextStyle(
                  fontSize: fontSize,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  color: AppColor.instance().textBold,
                ),
              ),
            )
          : Text(
              heading,
              style: TextStyle(
                fontSize: fontSize,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                color: AppColor.instance().textBold,
              ),
            ),
    );
  }

  Widget topImageWidget({required BuildContext context}) {
    return padding_between_element(
      child: Stack(
        children: [
          MyMotionWidget(
            child: isHeightBigger(context: context)
                ? SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.4,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.asset(AppAssets.instance().iconMine,
                        height: 250.0, width: 250.0),
                  )
                : SizedBox(
                    height: MediaQuery.sizeOf(context).width * 0.5,
                    width: MediaQuery.sizeOf(context).width,
                    child: Image.asset(AppAssets.instance().iconMine,
                        height: 250.0, width: 250.0),
                  ),
          ),
          IconButton(
              onPressed: () {
                // drawerController.toggleDrawer();
              },
              icon: const Icon(
                Iconsax.menu,
                size: 25,
              ))
        ],
      ),
    );
  }

  Widget nameOdDev({required BuildContext context}) {
    return padding_between_element(
      child: isHeightBigger(context: context)
          ? Center(
              child: AutoSizeText(
                context.read<AboutMeCubit>().name,
                maxLines: 1,
                style: TextStyle(
                    color: AppColor.instance().textBold,
                    fontSize: MediaQuery.sizeOf(context).width * 0.1,
                    fontFamily: 'Oswald'),
              ),
            )
          : Center(
              child: AutoSizeText(
                context.read<AboutMeCubit>().name,
                maxLines: 1,
                style: TextStyle(
                    color: AppColor.instance().textBold,
                    fontSize: MediaQuery.sizeOf(context).width * 0.1,
                    fontFamily: 'Oswald'),
              ),
            ),
    );
  }

  Widget professionOfDeveloper({required BuildContext context}) {
    return isHeightBigger(context: context)
        ? Center(
            child: AutoSizeText(
              context.read<AboutMeCubit>().role,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Merriweather',
                  color: AppColor.instance().textLight),
            ),
          )
        : Center(
            child: AutoSizeText(
              context.read<AboutMeCubit>().role,
              maxLines: 1,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Merriweather',
                  color: AppColor.instance().textLight),
            ),
          );
  }

  Widget aboutText({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: MyMotionWidget(
        child: Card(
          color: AppColor.instance().background.withOpacity(0.2),
          shadowColor: AppColor.instance().cardShadow.withOpacity(0.7),
          elevation: 120,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                heading(heading: 'About', paddingTop: 0, paddingBottom: 20),
                Text(
                  context.read<AboutMeCubit>().discription_short,
                  style: TextStyle(color: AppColor.instance().textLight),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget socialMedia({required BuildContext context}) {
    // --Buttons Logic--
    Widget AppButton(
        {required String Assetname,
        required Function fun,
        String iconData = ''}) {
      return Center(
        child: Row(
          children: [
            Card(
              color: AppColor.instance().card,
              elevation: 5,
              shadowColor: AppColor.instance().cardShadow,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.13,
                height: MediaQuery.sizeOf(context).width * 0.13,
                child: IconButton(
                  onPressed: () {
                    fun();
                  },
                  icon: Image.asset(Assetname),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.053,
            )
          ],
        ),
      );
    }

    Widget AppButtonIcon({required IconData Iconname, required Function fun}) {
      return Center(
        child: Row(
          children: [
            Card(
              color: AppColor.instance().card,
              elevation: 5,
              shadowColor: AppColor.instance().cardShadow,
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.13,
                height: MediaQuery.sizeOf(context).width * 0.13,
                child: IconButton(
                  onPressed: () {
                    fun();
                  },
                  icon: Transform.scale(
                      scale: 1.7,
                      child: Icon(
                        Iconname,
                        color: AppColor.instance().homeIconColor,
                      )),
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.sizeOf(context).width * 0.03,
            )
          ],
        ),
      );
    }

    return padding_between_element(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        physics: const AlwaysScrollableScrollPhysics(),
        child: Row(
          children: [
            AppButton(
              Assetname: AppAssets.instance().iconWebsite,
              fun: context.read<AboutMeCubit>().openWebsite,
            ),
            AppButton(
              Assetname: AppAssets.instance().iconLinkedin,
              fun: context.read<AboutMeCubit>().openLinkedin,
            ),
            AppButton(
              Assetname: AppAssets.instance().iconGithub,
              fun: context.read<AboutMeCubit>().openGithub,
            ),
            AppButtonIcon(
              Iconname: MdiIcons.googlePlay,
              fun: context.read<AboutMeCubit>().openGooglePlay,
            ),
            AppButtonIcon(
              Iconname: MdiIcons.gmail,
              fun: context.read<AboutMeCubit>().openGmail,
            ),
          ],
        ),
      ),
    );
  }

  Widget skillText({required BuildContext context}) {
    return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              heading(heading: 'Skills', paddingTop: 0, paddingBottom: 40),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // number of items in each row
                  mainAxisSpacing: 15.0,
                  crossAxisSpacing: 0.0, // spacing between columns
                ),
                itemCount: context
                    .read<AboutMeCubit>()
                    .skills
                    .length, // Number of items in the map
                itemBuilder: (context, index) {
                  // Get the key for the current index
                  final key =
                      context.read<AboutMeCubit>().skills.keys.elementAt(index);

                  // Access the skill data using the key
                  final skillData = context.read<AboutMeCubit>().skills[key]!;

                  return Column(
                    children: [
                      CircularPercentIndicator(
                        animation: true,
                        animationDuration: 6000,
                        radius: MediaQuery.of(context).size.width * 0.08,
                        lineWidth: 10,
                        percent: skillData[1],
                        progressColor: AppColor.instance().homeSkillActive,
                        backgroundColor: AppColor.instance().homeSkillUnachieve,
                        circularStrokeCap: CircularStrokeCap.square,
                      ),
                      const SizedBox(height: 10),
                      AutoSizeText(
                        skillData[0],
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 15,
                          fontFamily: 'OpenSans',
                          color: AppColor.instance().textBold,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      );
  }

  Widget contactMe({required BuildContext context}) {
    return MyMotionWidget(
      child: Card(
        color: AppColor.instance().background.withOpacity(0.1),
        elevation: 150,
        shadowColor: AppColor.instance().cardShadow,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              heading(heading: 'Contact', fontSize: 40),
              Text(
                context.read<AboutMeCubit>().contactDescription,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                  fontFamily: 'OpenSans',
                  color: AppColor.instance().textLight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget socialProfileSelf({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        heading(heading: 'Social Profile', fontSize: 30),
        MyMotionWidget(
          child: Container(
              height: MediaQuery.sizeOf(context).height * 0.35,
              padding: const EdgeInsets.all(38),
              child: AnimatedStackWidget(
                itemCount: context.read<AboutMeCubit>().socialLink.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    switch (index) {
                      case 0:
                        context.read<AboutMeCubit>().openWebsite();
                        break;
                      case 1:
                        context.read<AboutMeCubit>().openGithub();
                        break;
                      case 2:
                        context.read<AboutMeCubit>().openLinkedin();
                        break;
                      case 3:
                        context.read<AboutMeCubit>().openGooglePlay();
                        break;
                      case 4:
                        context.read<AboutMeCubit>().openGmail();
                        break;
                    }
                  },
                  child: MagazineCoverImage(
                    image: context.read<AboutMeCubit>().socialLink[index]![0],
                  ),
                ),
              )),
        ),
        const SizedBox(
          height: 40,
        )
      ],
    );
  }
}
