import 'package:flutter_modular/flutter_modular.dart';
import 'package:viacep/features/home/controllers/home_controller.dart';
import 'package:viacep/features/home/data/repository/home_repository.dart';

class AppBindigs {
  static List<Bind<Object>> setUp() {
    return [
      ...bindRepositories(),
      ...bindController(),
    ];
  }

  static bindRepositories() {
    return [
      Bind((i) => HomeRepositori()),
    ];
  }

  static bindController() {
    return [Bind((i) => HomeController(i.get<HomeRepositori>()))];
  }
}
