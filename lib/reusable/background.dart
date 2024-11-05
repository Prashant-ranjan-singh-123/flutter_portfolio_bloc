import 'package:aura_box/aura_box.dart';
import 'package:flutter/material.dart';
import 'package:prashant_portfolio/utils/app_color.dart';

class Background extends StatelessWidget {
  Widget child;
  bool isBottomNav;

  Background({super.key, required this.child, this.isBottomNav=false});

  @override
  Widget build(BuildContext context) {
    return AuraBox(
        spots: [
          AuraSpot(
            color: AppColor.instance().backgroundBubble,
            radius: 400.0,
            alignment: const Alignment(0.7,-0.7),
            blurRadius: 0,
            stops: const [0, 0.9],
          ),
          AuraSpot(
            color: AppColor.instance().backgroundBubble,
            radius: 400.0,
            alignment: const Alignment(-0.7,0.7),
            blurRadius: 0,
            stops: const [0, 0.9],
          ),
        ],
        decoration: BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: isBottomNav? Container(
          height: 20,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColor.instance().background.withOpacity(0.9),
                AppColor.instance().background.withOpacity(0.9),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: child,
        )
            :
        Container(
          height: MediaQuery.sizeOf(context).height,
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                AppColor.instance().background.withOpacity(0.9),
                AppColor.instance().background.withOpacity(0.9),
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
          child: child,
        )
    );
  }
}
