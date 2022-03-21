import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Deviceinfo {
  Deviceinfo();

  double width(BuildContext context) => MediaQuery.of(context).size.width;

  double height(BuildContext context) => MediaQuery.of(context).size.height;

  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width <= 600;

  bool isMobileMini(BuildContext context) =>
      MediaQuery.of(context).size.width <= 337;

  bool isDeskTop(BuildContext context) =>
      MediaQuery.of(context).size.width >= 600;

  bool isSmall(BuildContext context) =>
      MediaQuery.of(context).size.width <= 1015;

  bool isIOS(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.iOS;

  bool isAndroid(BuildContext context) =>
      Theme.of(context).platform == TargetPlatform.android;
}
