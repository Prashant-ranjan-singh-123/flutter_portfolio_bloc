import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:prashant_portfolio/main.dart';
import 'package:prashant_portfolio/state_management/bottom_nav_bar/certificate/certificate_cubit.dart';
import 'package:prashant_portfolio/utils/app_color.dart';
import '../../reusable/motion.dart';

class Certificate extends StatefulWidget {
  const Certificate({super.key});

  @override
  State<Certificate> createState() => _CertificateState();
}

class _CertificateState extends State<Certificate> {

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
        ZoomIn(
          delay: const Duration(milliseconds: 800),
          duration: const Duration(milliseconds: 400),
          curve: Curves.decelerate,
          child: buildContext.read<CertificateCubit>().CertificateScreenLogic(
            onCategorySelected: (category) {
              setState(() {
                currentCategory = category;
              });
            },
          ),
        ),
        ZoomIn(
            delay: const Duration(milliseconds: 1100),
            duration: const Duration(milliseconds: 400),
            curve: Curves.decelerate,
            child: grid_view_items(selectedCategory: currentCategory))
      ]),
    );
  }

  Widget myColumn({required List<Widget> children}) {
    return CommonUsedWidget.background(
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
          child: IconButton(onPressed: (){
            // drawerController.toggleDrawer();
          }, icon: const Icon(Iconsax.menu, size: 25,)),
        ),
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'My Certificates',
                style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: 25,
                    fontFamily: 'Oswald'),
              ),
            ),
            Padding(
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
                        style: const TextStyle(
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
              map: buildContext.read<CertificateCubit>().experience[selectedCategory]![index]);
        },
        itemCount:
        buildContext.read<CertificateCubit>().experience[selectedCategory]?.length ?? 0,
        // itemCount: 1, // Number of items you want to display
      ),
    );
  }

  void _showLargeImage(
      {required String image,
        required BuildContext context,
        required String certName,
        required String verifyLink}) {
    Get.dialog(
      barrierColor: Colors.black.withOpacity(0.95),
      transitionCurve: Curves.easeInExpo,
      transitionDuration: const Duration(milliseconds: 500),
      AlertDialog(
        backgroundColor: AppColor.instance().card,
        surfaceTintColor: AppColor.instance().card,
        shadowColor: AppColor.instance().cardShadow.withOpacity(1),
        elevation: 100,
        title: Center(
          child: Text(
            certName,
            maxLines: 1,
            style: const TextStyle(fontFamily: 'Merriweather', fontSize: 15),
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
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Close',
                      style: TextStyle(color: AppColor.instance().textBold),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 10), // Add some spacing between buttons
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
                  buildContext.read<CertificateCubit>().openBachler(link: verifyLink);
                },
                child: const Row(
                  children: [
                    Icon(
                      Iconsax.verify,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 5,
                    ),
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
  }
}
