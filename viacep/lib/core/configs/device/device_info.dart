import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deviceinfo {
  Deviceinfo();

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  bool isMobile(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.iOS ||
      Theme.of(context).platform == TargetPlatform.android;
  // MediaQuery.of(context).size.width <= 600;

  bool isDeskTopMini(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  bool isDeskTop(BuildContext context) =>
      MediaQuery.of(context).size.width > 1000;

  bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width <= 800;

  bool isDeskTopPlatform(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.windows ||
      Theme.of(context).platform == TargetPlatform.linux ||
      Theme.of(context).platform == TargetPlatform.macOS;

  bool isIOS(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.iOS;

  bool isAndroid(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.android;
}
