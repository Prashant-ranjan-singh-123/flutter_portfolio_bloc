import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/reusable/motion.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/project/project_cubit.dart';
import 'package:share_plus/share_plus.dart';

import '../../../utils/app_color.dart';

class BottomSheetCustom extends StatefulWidget {
  String heading;
  String imageLocation;
  String shortDiscription;
  String playstoreLink;
  String githubLink;
  String appStoreLink;
  String shareText;
  BuildContext parentContext;
  BottomSheetCustom(
      {super.key,
      required this.heading,
      required this.appStoreLink,
      required this.githubLink,
      required this.imageLocation,
      required this.playstoreLink,
      required this.shareText,
      required this.shortDiscription,
      required this.parentContext
      });

  @override
  State<BottomSheetCustom> createState() => _BottomSheetCustomState();
}

class _BottomSheetCustomState extends State<BottomSheetCustom> {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 1,
      minChildSize: 1,
      maxChildSize: 1,
      builder: (_, controller) {
        return Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
            color: AppColor.instance().background,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Column(
              children: [
                _myPadding(child: _buildDragHandle()),
                _myPadding(
                    child: _myAppBar(
                        shareText: widget.shareText, context: context)),
                Flexible(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _imageShowCase(
                            imageLocation: widget.imageLocation,
                            context: context),
                        _myPadding(
                            child: _headingOfApplication(
                                headingOfProject: widget.heading,
                                context: context)),
                        _myPadding(
                            child: _discription(
                                shortDiscription: widget.shortDiscription)),
                      ],
                    ),
                  ),
                ),
                _myPadding(
                    child: _externalLink(
                        playstore: widget.playstoreLink,
                        github: widget.githubLink,
                        appStore: widget.appStoreLink)),
                const SizedBox(
                  height: 15,
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _externalLink(
      {required String playstore,
      required String github,
      required String appStore}) {
    Widget _githubButton({required VoidCallback onPressed}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: OutlinedButton(
          onPressed: onPressed,
          style: OutlinedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            foregroundColor: AppColor.instance().background,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(MdiIcons.github, color: Colors.white),
              const SizedBox(width: 10),
              const Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    'GitHub',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _playstoreButton({required VoidCallback onPressed}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColor.instance().cardShadow,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(MdiIcons.googlePlay, color: Colors.white),
              const SizedBox(width: 10),
              const Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    'PlayStore',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _appStoreButton({required VoidCallback onPressed}) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColor.instance().background,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5)),
              elevation: 10,
              shadowColor: AppColor.instance().cardShadow),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(MdiIcons.apple, color: Colors.white),
              const SizedBox(width: 10),
              const Flexible(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Text(
                    'App Store',
                    style:
                        TextStyle(color: Colors.white, fontFamily: 'Poppins'),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget _buttonsRow({required List<Widget> buttons}) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Row(
          children: buttons.map((button) => Expanded(child: button)).toList(),
        ),
      );
    }

    if (github.isNotEmpty && playstore.isNotEmpty && appStore.isNotEmpty) {
      print('yehh');
      return _buttonsRow(buttons: [
        _githubButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_github_project(link: github)),
        // const SizedBox(width: 5),
        _playstoreButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_playstore_project(link: playstore)),
        // const SizedBox(width: 5),
        _appStoreButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_appstore_project(link: appStore)),
      ]);
    } else if (github.isNotEmpty && playstore.isNotEmpty) {
      return _buttonsRow(buttons: [
        _githubButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_github_project(link: github)),
        // const SizedBox(width: 15),
        _playstoreButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_playstore_project(link: playstore)),
      ]);
    } else if (github.isNotEmpty && appStore.isNotEmpty) {
      return _buttonsRow(buttons: [
        _githubButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_github_project(link: github)),
        // const SizedBox(width: 15),
        _appStoreButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_appstore_project(link: appStore)),
      ]);
    } else if (playstore.isNotEmpty && appStore.isNotEmpty) {
      return _buttonsRow(buttons: [
        _playstoreButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_playstore_project(link: playstore)),
        // const SizedBox(width: 15),
        _appStoreButton(
            onPressed: () =>
                widget.parentContext.read<ProjectCubit>().open_appstore_project(link: appStore)),
      ]);
    } else if (github.isNotEmpty) {
      return _githubButton(
          onPressed: () => widget.parentContext.read<ProjectCubit>().open_github_project(link: github));
    } else if (playstore.isNotEmpty) {
      return _playstoreButton(
          onPressed: () =>
              widget.parentContext.read<ProjectCubit>().open_playstore_project(link: playstore));
    } else if (appStore.isNotEmpty) {
      return _appStoreButton(
          onPressed: () =>
              widget.parentContext.read<ProjectCubit>().open_appstore_project(link: appStore));
    } else {
      return const SizedBox();
    }
  }

  Widget _buildDragHandle() {
    return Center(
      child: Container(
        width: 40,
        height: 5,
        margin: const EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: AppColor.instance().bottomSheetHandle,
          borderRadius: BorderRadius.circular(2.5),
        ),
      ),
    );
  }

  Widget _myPadding({required child}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: child,
    );
  }

  Widget _myAppBar({required String shareText, required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(
                CupertinoIcons.back,
                color: AppColor.instance().bottomSheetIcon,
                size: 30,
              ),
            ),
          ),
          Text(
            'Information',
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 25,
                color: AppColor.instance().textBold,
                fontFamily: 'Oswald'),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: GestureDetector(
              onTap: () async {
                // BottomSheetLogic.send_button_logic();
                await Share.share(shareText);
              },
              child: Icon(CupertinoIcons.share,
                  color: AppColor.instance().bottomSheetIcon, size: 30),
            ),
          )
        ],
      ),
    );
  }

  Widget _imageShowCase(
      {required imageLocation, required BuildContext context}) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 20.0, bottom: 40, right: 15, left: 15),
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: MyMotionWidget(
          child: Card(
            color: AppColor.instance().card,
            elevation: 20,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            shadowColor: AppColor.instance().cardShadow,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(imageLocation)),
          ),
        ),
      ),
    );
  }

  Widget _headingOfApplication(
      {required String headingOfProject, required BuildContext context}) {
    return Column(
      children: [
        AutoSizeText(
            maxLines: 1,
            headingOfProject,
            style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 35,
                color: AppColor.instance().textBold,
                fontFamily: 'Merriweather')),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.02,
        ),
      ],
    );
  }

  Widget _discription({required shortDiscription}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Text(
        shortDiscription,
        style: TextStyle(
            fontFamily: 'Oswald', color: AppColor.instance().textLight),
      ),
    );
  }
}
