import 'package:flutter_modular/flutter_modular.dart';
import 'package:viacep/core/configs/bindings/app_bindings.dart';
import 'package:viacep/core/configs/routes/app_routes.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [...AppBindigs.setUp()];

  @override
  final List<ModularRoute> routes = AppRoutes.setUp();
}
