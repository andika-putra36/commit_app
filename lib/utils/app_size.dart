import 'package:flutter/material.dart';

class AppSize {
  static double appBarHeight(BuildContext context) {
    return AppBar().preferredSize.height;
  }

  static double screenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  static double screenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  static double bodyHeight(BuildContext context) {
    // Screen Height - App Bar Height - Status Bar or Notification Bar
    return MediaQuery.of(context).size.height -
        AppBar().preferredSize.height -
        MediaQuery.of(context).padding.top;
  }
}
