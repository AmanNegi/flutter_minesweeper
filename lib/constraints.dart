// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class GameConstraints {
  late BuildContext context;

  setContext(BuildContext context) {
    this.context = context;
  }

  final int MOBILE_COUNT = 5;
  final int TABLET_COUNT = 8;
  final int DESKTOP_COUNT = 10;

  getLen() {
    return getRows() * getCols();
  }

  getRows() {
    if (isMobile()) {
      return MOBILE_COUNT;
    } else if (isTablet()) {
      return TABLET_COUNT;
    } else {
      return DESKTOP_COUNT;
    }
  }

  int getCols() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    var nums = width / getRows();

    return height ~/ nums;
  }

  bool isMobile() => MediaQuery.of(context).size.width < 600;

  bool isTablet() =>
      MediaQuery.of(context).size.width < 1100 &&
      MediaQuery.of(context).size.width >= 600;

  bool isDesktop() => MediaQuery.of(context).size.width >= 1100;

  bool isLargeScreen() => (isTablet() || isDesktop());
}

GameConstraints gameConstraints = GameConstraints();
