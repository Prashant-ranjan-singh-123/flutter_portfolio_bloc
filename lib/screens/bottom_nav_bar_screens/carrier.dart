import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_portfolio/reusable/background.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/carrier/carrier_cubit.dart';
import 'package:timeline_tile/timeline_tile.dart';

import '../../reusable/motion.dart';
import '../../utils/app_color.dart';

class CarrierScreen extends StatefulWidget {
  const CarrierScreen({super.key});

  @override
  State<CarrierScreen> createState() => _CarrierScreenState();
}

class _CarrierScreenState extends State<CarrierScreen> {
  late BuildContext buildContext;

  @override
  void initState() {
    buildContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Background(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  experience(),
                  education(),
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
    bool isCenter = true,
  }) {
    return Padding(
      padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
      child: isCenter
          ? Center(
              child: Text(
                heading,
                style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w800,
                  color: AppColor.instance().textBold,
                ),
              ),
            )
          : Text(
              heading,
              style: TextStyle(
                fontSize: 40,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w800,
                color: AppColor.instance().textBold,
              ),
            ),
    );
  }

  Widget myCustomTimeline({
    required bool isLast,
    required String heading,
    required String body,
    required Function fun,
  }) {
    return TimelineTile(
      alignment: TimelineAlign.manual,
      lineXY:
          1, // Adjust this value to move the timeline line closer to the left
      isLast: isLast,
      beforeLineStyle: LineStyle(
        color: AppColor.instance().carrierTimeline,
        thickness: 1,
      ),
      indicatorStyle: IndicatorStyle(
        width: 20,
        padding: const EdgeInsets.symmetric(vertical: 10),
        height: 50,
        color: AppColor.instance().carrierTimelineDot,
        drawGap: true,
      ),
      startChild: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: GestureDetector(
          onTap: () async {
            fun();
          },
          child: MyMotionWidget(
            child: Card(
              color: AppColor.instance().card,
              shadowColor: AppColor.instance().cardShadow,
              elevation: 15,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColor.instance().textBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      body,
                      style: TextStyle(color: AppColor.instance().textLight),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget education() {
    Widget my_card(
        {required String heading,
        required String body,
        required Function fun,
        required int index}) {
      int delayTimeToShow = (index * 300) + 400;
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: GestureDetector(
          onTap: () {
            fun();
          },
          child: MyMotionWidget(
            child: Card(
              color: AppColor.instance().card,
              shadowColor: AppColor.instance().cardShadow,
              elevation: 15,
              child: Container(
                margin: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: TextStyle(
                          fontFamily: 'Oswald',
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: AppColor.instance().textBold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      body,
                      style: TextStyle(color: AppColor.instance().textLight),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Divider(thickness: 0.5, color: AppColor.instance().textLight),
        heading(heading: 'Education'),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: buildContext.read<CarrierCubit>().education.length,
            itemBuilder: (_, index) {
              return ZoomIn(
                delay: Duration(
                    milliseconds:
                        (buildContext.read<CarrierCubit>().experience.length -
                            1)),
                child: my_card(
                    heading: buildContext
                        .read<CarrierCubit>()
                        .education[index + 1][0],
                    body: buildContext.read<CarrierCubit>().education[index + 1]
                        [1],
                    fun: buildContext.read<CarrierCubit>().education[index + 1]
                        [2],
                    index: index + 1),
              );
            }),
        const SizedBox(
          height: 40,
        ),
      ],
    );
  }

  Widget experience() {
    return Column(
      children: [
        LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return Row(
              children: [
                FadeInDownBig(
                  child: IconButton(
                    onPressed: () {
                      // drawerController.toggleDrawer();
                    },
                    icon: const Icon(Iconsax.menu, size: 25),
                  ),
                ),
                Expanded(
                  child: FadeInDownBig(
                    child: Center(
                      child: heading(heading: 'Experience'),
                    ),
                  ),
                ),
                SizedBox(width: 48),
              ],
            );
          },
        ),
        ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: buildContext.read<CarrierCubit>().experience.length,
            reverse: true,
            itemBuilder: (_, index) {
              if (index == 0) {
                return FadeInDownBig(
                  delay: Duration(
                      milliseconds:
                          (buildContext.read<CarrierCubit>().experience.length -
                                  1 -
                                  index) *
                              300),
                  curve: Curves.decelerate,
                  child: myCustomTimeline(
                      isLast: true,
                      heading: buildContext
                          .read<CarrierCubit>()
                          .experience[index + 1][0],
                      body: buildContext
                          .read<CarrierCubit>()
                          .experience[index + 1][1],
                      fun: buildContext
                          .read<CarrierCubit>()
                          .experience[index + 1][2]),
                );
              } else {
                return FadeInDownBig(
                  delay: Duration(
                      milliseconds:
                          (buildContext.read<CarrierCubit>().experience.length -
                                  1 -
                                  index) *
                              300),
                  curve: Curves.decelerate,
                  child: myCustomTimeline(
                      isLast: false,
                      heading: buildContext
                          .read<CarrierCubit>()
                          .experience[index + 1][0],
                      body: buildContext
                          .read<CarrierCubit>()
                          .experience[index + 1][1],
                      fun: buildContext
                          .read<CarrierCubit>()
                          .experience[index + 1][2]),
                );
              }
            })
      ],
    );
  }
}
