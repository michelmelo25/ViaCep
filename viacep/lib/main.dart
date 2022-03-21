import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:viacep/core/configs/utils/app_module.dart';
import 'package:viacep/core/configs/utils/app_widget.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
