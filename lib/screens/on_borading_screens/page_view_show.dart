import 'package:animate_do/animate_do.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:prashant_portfolio/reusable/background.dart';
import 'package:prashant_portfolio/utils/app_color.dart';

class PageViewShow extends StatelessWidget {
  String title;
  String body;
  String lottie;
  double zoom;
  PageViewShow(
      {Key? key,
      required this.title,
      required this.body,
      required this.lottie,
      required this.zoom});

  @override
  Widget build(BuildContext context) {
    return Background(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Background(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).padding.top,
                    ),
                    ElasticIn(
                        duration: const Duration(seconds: 1),
                        child: lottieAnim(context: context)),
                    SizedBox(
                      height: MediaQuery.sizeOf(context).height * 0.01,
                    ),
                    infoArea()
                  ],
                ),
                FadeInDown(
                  duration: const Duration(milliseconds: 2500),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent,
                            Colors.transparent,
                            AppColor.instance().cardShadow.withOpacity(1)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      )),
                )
              ],
            ),
          )),
    );
  }

  Widget lottieAnim({required BuildContext context}) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.95,
      height: MediaQuery.sizeOf(context).height * 0.63,
      child: ClipRect(
        // ClipRect to clip the animation within the container
        child: Transform.scale(
          scale: zoom, // Set your desired zoom level
          child: Lottie.asset(
            lottie,
            reverse: true,
          ),
        ),
      ),
    );
  }

  Widget infoArea() {
    Widget buildDragHandle() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Center(
          child: Container(
            width: 40,
            height: 5,
            margin: const EdgeInsets.symmetric(vertical: 8),
            decoration: BoxDecoration(
              color: AppColor.instance().bottomSheetHandle,
              borderRadius: BorderRadius.circular(2.5),
            ),
          ),
        ),
      );
    }

    Widget heading() {
      return Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: AutoSizeText(title,
            maxLines: 1,
            style: const TextStyle(
                fontFamily: 'Oswald',
                fontWeight: FontWeight.w700,
                fontSize: 32,
                color: Colors.white)),
      );
    }

    Widget subtitle() {
      return Text(
        body,
        style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: AppColor.instance().textLight),
        textAlign: TextAlign.start,
      );
    }

    return Expanded(
        child: Opacity(
      opacity: 1,
      child: FadeInUp(
        // delay: const Duration(milliseconds: 400),
        duration: const Duration(seconds: 1),
        child: Container(
          decoration: BoxDecoration(
            // color: ColorOfApp.cardShadow.withOpacity(0.1),
            gradient: LinearGradient(colors: [
              AppColor.instance().cardShadow.withOpacity(1),
              Colors.transparent
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 60),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildDragHandle(),
                  FadeInLeft(
                      delay: const Duration(milliseconds: 1000),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.decelerate,
                      child: heading()),
                  FadeInUp(
                      delay: const Duration(milliseconds: 1300),
                      child: subtitle()),
                ],
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
