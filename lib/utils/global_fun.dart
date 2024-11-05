import 'package:flutter/material.dart';

double returnSizeOfScreenWhichIsSmaller({required BuildContext context}) {
  if (MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height) {
    return MediaQuery.sizeOf(context).height;
  } else {
    return MediaQuery.sizeOf(context).width;
  }
}

double returnSizeOfScreenWhichIsBigger({required BuildContext context}) {
  if (MediaQuery.sizeOf(context).width > MediaQuery.sizeOf(context).height) {
    return MediaQuery.sizeOf(context).width;
  } else {
    return MediaQuery.sizeOf(context).height;
  }
}

bool isHeightBigger({required BuildContext context}) {
  return MediaQuery.sizeOf(context).height >= MediaQuery.sizeOf(context).width;
}
