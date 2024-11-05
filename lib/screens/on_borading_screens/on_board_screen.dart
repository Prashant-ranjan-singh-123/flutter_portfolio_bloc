import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/reusable/background.dart';
import 'package:prashant_portfolio/state_management/on_board/onboard_cubit.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../utils/app_assets.dart';
import '../../utils/app_color.dart';
import 'page_view_show.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late OnboardCubit cubit;
  @override
  void initState() {
    cubit = context.read<OnboardCubit>();
    cubit.onboardOrMainApp(context: context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final controller = PageController();

    List pages;
    pages = [
      PageViewShow(
        title: 'About Me',
        body:
            "Welcome to My portfolio Application! Here\'s You\'ll find everything about me in this portfolio.",
        lottie: AppAssets.instance().lottieAboutMe,
        zoom: 0.5,
      ),
      PageViewShow(
        title: 'Connect With Me',
        body:
            "With the help of my portfolio application you can easily connect with me through many social media platforms.",
        lottie: AppAssets.instance().lottieConnectMe,
        zoom: 1,
      ),
      PageViewShow(
        title: 'Projects and Carrier',
        body:
            "Inside this app, you\'ll discover all about my professional journey, my career milestones and explore my diverse portfolio of projects",
        lottie: AppAssets.instance().lottieProjects,
        zoom: 1,
      ),
    ];

    return OrientationBuilder(builder: (context, snapshot) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        body:
            BlocBuilder<OnboardCubit, OnboardState>(builder: (context, state) {
          final isFirst = state is OnboardInitial && state.isFirst;
          final isLast = state is OnboardInitial && state.isLast;
          if (state is OnboardInitial) {
            return Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: PageView(
                    onPageChanged: (int val) {
                      cubit.onPageChange(val);
                    },
                    controller: controller,
                    children:
                        List.generate(pages.length, (index) => pages[index]),
                  ),
                ),
                Align(
                  alignment: const Alignment(0, 0.96),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(),
                      if (!isFirst)
                        InkWell(
                            onTap: () {
                              controller.previousPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColor.instance().bottomNavCard,
                              child: const Icon(
                                Icons.navigate_before,
                                color: Colors.black,
                              ),
                            ))
                      else
                        const CircleAvatar(
                          backgroundColor: Colors.transparent,
                        ),
                      const SizedBox(),
                      SmoothPageIndicator(
                        controller: controller,
                        count: 3,
                        effect: ExpandingDotsEffect(
                            dotColor: AppColor.instance().textBold,
                            // expansionFactor: 6,
                            activeDotColor:
                                AppColor.instance().backgroundBubble,
                            dotWidth: 7,
                            dotHeight: 7),
                      ),
                      const SizedBox(),
                      if (!isLast)
                        InkWell(
                            onTap: () {
                              controller.nextPage(
                                  duration: const Duration(milliseconds: 200),
                                  curve: Curves.easeIn);
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColor.instance().bottomNavCard,
                              child: const Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            ))
                      else
                        InkWell(
                            onTap: () {
                              cubit.navigateToMainApp(context: context);
                              // Get.off(MainApp(isRTL: false,),
                              //     transition: Transition.zoom,
                              //     duration: const Duration(milliseconds: 450));
                            },
                            child: CircleAvatar(
                              backgroundColor:
                                  AppColor.instance().bottomNavCard,
                              child: const Icon(
                                Icons.navigate_next,
                                color: Colors.black,
                              ),
                            )),
                      const SizedBox()
                    ],
                  ),
                ),
              ],
            );
          } else if (state is WaitingState) {
            return Background(
              child: SizedBox()
              // Center(
              //   child: CircularProgressIndicator.adaptive(
              //     backgroundColor: AppColor.instance().textBold,
              //   ),
              // ),
            );
          } else {
            return Background(child: const SizedBox());
          }
        }),
      );
    });
  }
}
