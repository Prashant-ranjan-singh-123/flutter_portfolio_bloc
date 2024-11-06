import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/reusable/background.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/certificate/certificate_cubit.dart';
import 'package:prashant_portfolio/utils/app_color.dart';
import '../../../reusable/motion.dart';
import '../../../state_management/app_drawer/app_drawer_cubit.dart';
import 'certificate_select_category_widget.dart';

class CertificateUi extends StatefulWidget {
  const CertificateUi({super.key});

  @override
  State<CertificateUi> createState() => _CertificateUiState();
}

class _CertificateUiState extends State<CertificateUi> {
  late BuildContext buildContext;

  @override
  void initState() {
    // TODO: implement initState
    buildContext = context;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: myColumn(children: [
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
        BlocBuilder<CertificateCubit, CertificateState>(
          builder: (context, state) {
            return ZoomIn(
              delay: const Duration(milliseconds: 800),
              duration: const Duration(milliseconds: 400),
              curve: Curves.decelerate,
              child: CertificateSelectCategory(
                onCategorySelected: (category) {
                  context
                      .read<CertificateCubit>()
                      .change_category(category: category);
                },
                parentContext: context,
              ),
            );
          },
        ),
        BlocBuilder<CertificateCubit, CertificateState>(
          builder: (context, state) {
            if (state is CertificateInitial) {
              return ZoomIn(
                  delay: const Duration(milliseconds: 1100),
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.decelerate,
                  child:
                      grid_view_items(selectedCategory: state.currentCategory));
            } else {
              return const SizedBox();
            }
          },
        )
      ]),
    );
  }

  Widget myColumn({required List<Widget> children}) {
    return Background(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        height: MediaQuery.sizeOf(context).height,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: children,
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
                'My Certificates',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    color: AppColor.instance().homeIconColor,
                    fontFamily: 'Oswald'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'Verifiable',
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    fontFamily: 'OpenSans',
                    color: Color.fromRGBO(108, 106, 106, 1)),
              ),
            ),
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
          items: buildContext.read<CertificateCubit>().carouselSliderItems,
          options: CarouselOptions(
            aspectRatio: 16 / 7,
            viewportFraction: 0.7,
            initialPage: 3,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            enlargeCenterPage: true,
            enlargeFactor: 0.4,
            onPageChanged: (page, _) {},
            scrollDirection: Axis.horizontal,
          ),
        ),
      ),
    );
  }

  Widget grid_view_items({required String selectedCategory}) {
    Widget _buildItem({required Map<String, dynamic> map}) {
      String certName = map['certName'];
      String featureGraphic = map['featureGraphic'];
      String verifyLink = map['links']['verify_link'];

      return GestureDetector(
        onTap: () {
          _showLargeImage(
              image: featureGraphic,
              context: context,
              certName: certName,
              verifyLink: verifyLink);
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
                    featureGraphic,
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
                        certName,
                        maxLines: 1,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: AppColor.instance().textBold.withOpacity(0.9),
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

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of items in each row
          mainAxisSpacing: 10.0, // spacing between rows
          childAspectRatio: 1 / 1,
          crossAxisSpacing: 25.0, //pacing between columns
        ),
        itemBuilder: (context, index) {
          return _buildItem(
              map: buildContext
                  .read<CertificateCubit>()
                  .experience[selectedCategory]![index]);
        },
        itemCount: buildContext
                .read<CertificateCubit>()
                .experience[selectedCategory]
                ?.length ??
            0,
        // itemCount: 1, // Number of items you want to display
      ),
    );
  }

  void _showLargeImage({
    required String image,
    required BuildContext context,
    required String certName,
    required String verifyLink,
  }) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (BuildContext context) {
        return Dialog(
          // backgroundColor: AppColor.instance().card,
          backgroundColor: Colors.transparent,
          elevation: 10,
          child: AlertDialog(
            backgroundColor: AppColor.instance().card,
            surfaceTintColor: AppColor.instance().card,
            shadowColor: AppColor.instance().cardShadow.withOpacity(1),
            elevation: 10,
            title: Center(
              child: Text(
                certName,
                maxLines: 1,
                style: TextStyle(
                    fontFamily: 'Merriweather',
                    fontSize: 15,
                    color: AppColor.instance().textBold),
              ),
            ),
            content: Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    color: AppColor.instance().cardShadow.withOpacity(0.0),
                    blurStyle: BlurStyle.normal,
                    spreadRadius: 20,
                    blurRadius: 150,
                  )
                ],
              ),
              child: MyMotionWidget(
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                  child: Image.asset(
                    image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromRGBO(113, 43, 62, 1),
                      elevation: 15,
                      padding: const EdgeInsets.all(10),
                      shadowColor: const Color.fromRGBO(113, 43, 62, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Iconsax.back_square,
                          color: Colors.white,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          'Close',
                          style: TextStyle(color: AppColor.instance().textBold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.instance().bottomNavCard,
                      elevation: 10,
                      padding: const EdgeInsets.all(10),
                      shadowColor: AppColor.instance().bottomNavCardShadow,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      CertificateScreenLogicOpenLink.openBachler(
                          link: verifyLink);
                    },
                    child: const Row(
                      children: [
                        Icon(
                          Iconsax.verify,
                          color: Colors.black,
                        ),
                        SizedBox(width: 5),
                        Text(
                          'Verify',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
      // transitionBuilder: (context, animation, secondaryAnimation, child) {
      //   return ScaleTransition(
      //     scale: CurvedAnimation(
      //       parent: animation,
      //       curve: Curves.easeInExpo,
      //     ),
      //     child: child,
      //   );
      // },
    );
  }
}
