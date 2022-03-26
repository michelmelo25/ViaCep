import 'package:flutter_modular/flutter_modular.dart';
import 'package:viacep/features/address_details/pages/address_details_page.dart';
import 'package:viacep/features/home/pages/home_page.dart';

class AppRoutes {
  static const main = "/";
  static const splashScreen = "/splashScreen";
  static const adress = "/adress";
  static const adressDetails = "/adress/details";

  static List<ModularRoute> setUp() {
    return [
      ChildRoute(AppRoutes.main, child: (_, args) => HomePage()),
      ChildRoute(AppRoutes.adressDetails,
          child: (_, args) => AddressDetailsPage()),
    ];
  }
}
