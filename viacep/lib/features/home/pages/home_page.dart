import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:viacep/core/configs/consts/app_strings.dart';
import 'package:viacep/core/configs/device/device_info.dart';
import 'package:viacep/core/configs/routes/app_routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerCep = TextEditingController();
  Deviceinfo deviceinfo = Deviceinfo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: buildBody(context),
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
          Container(
            width: deviceinfo.width(context) * 0.5,
            alignment: Alignment.center,
            child: TextFormField(
              controller: controllerCep,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.delete_sharp),
                  onPressed: () {
                    clean();
                  },
                ),
                hintText: "Digite seu CEP",
              ),
              inputFormatters: [
                MaskTextInputFormatter(
                  mask: "#####-###",
                  filter: {"#": RegExp(r'[0-9]')},
                  type: MaskAutoCompletionType.lazy,
                )
              ],
            ),
          ),
          Container(
            width: deviceinfo.width(context) * 0.4,
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 20),
            child: ElevatedButton(
              child: Text(AppStrings.consultar),
              onPressed: () {
                action();
              },
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("Encontre Qualquer endereco do Brasil"),
                Text("Exemplo: 8374-837"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void action() {
    print(controllerCep.text.replaceAll("-", ""));
    Modular.to.pushNamed(AppRoutes.adressDetails);
  }

  void clean() {
    setState(() {
      controllerCep.text = "";
    });
  }
}
