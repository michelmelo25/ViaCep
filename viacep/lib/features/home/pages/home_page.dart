import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:viacep/core/configs/device/device_info.dart';
import 'package:viacep/core/configs/routes/app_routes.dart';
import 'package:viacep/core/error/failures.dart';
import 'package:viacep/features/home/controllers/home_controller.dart';
import 'package:viacep/features/home/widget/serch_by_cep_widget.dart';
import 'package:viacep/shared/widgets/load_progress_widget.dart';

class HomePage extends StatefulWidget {
  final HomeController controller;
  const HomePage(this.controller, {Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerCep = TextEditingController();
  Deviceinfo deviceinfo = Deviceinfo();
  bool load = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: (load) ? LoadProgressWidget() : buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      width: deviceinfo.width(context),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.blue.shade200],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            children: [
              Container(
                width: 50,
                height: 100,
                child: Image.asset("tower.png"),
              ),
            ],
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 20),
            child: Text("Via CEP"),
          ),
          SerchbyCepWidget(controllerCep: controllerCep, action: action)
        ],
      ),
    );
  }

  void action() async {
    // print(controllerCep.text.replaceAll("-", ""));
    setState(() {
      load = true;
    });
    final response = await widget.controller
        .searchAddresByCep(controllerCep.text.replaceAll("-", ""));
    response.fold((failure) {
      setState(() {
        load = false;
      });
      messagerError(failure);
    }, (address) async {
      await Modular.to.pushNamed(AppRoutes.adressDetails, arguments: address);
      setState(() {
        load = false;
      });
    });
  }

  void messagerError(Failure failure) {}
}
