import 'package:flutter/material.dart';
import 'package:viacep/core/configs/consts/app_strings.dart';
import 'package:viacep/core/configs/device/device_info.dart';

class SerchByAddressWidget extends StatelessWidget {
  final TextEditingController controllerUF;
  final TextEditingController controllerMunicipio;
  final TextEditingController controllerBairro;
  final Function action;
  const SerchByAddressWidget({
    Key? key,
    required this.controllerUF,
    required this.controllerMunicipio,
    required this.controllerBairro,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Deviceinfo deviceinfo = Deviceinfo();
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Container(
            width: deviceinfo.width(context) * 0.5,
            alignment: Alignment.center,
            color: Colors.white,
            child: TextFormField(
              controller: controllerUF,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.delete_sharp),
                  onPressed: () {
                    clean(controllerUF);
                  },
                ),
                hintText: "Digite sua UF",
              ),
              onFieldSubmitted: (text) {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Container(
              width: deviceinfo.width(context) * 0.5,
              alignment: Alignment.center,
              color: Colors.white,
              child: TextFormField(
                controller: controllerMunicipio,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.delete_sharp),
                    onPressed: () {
                      clean(controllerMunicipio);
                    },
                  ),
                  hintText: "Digite o nome do Municipio",
                ),
                onFieldSubmitted: (text) {},
              ),
            ),
          ),
          Container(
            width: deviceinfo.width(context) * 0.5,
            alignment: Alignment.center,
            color: Colors.white,
            child: TextFormField(
              controller: controllerBairro,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.delete_sharp),
                  onPressed: () {
                    clean(controllerBairro);
                  },
                ),
                hintText: "Digite o nome do Bairro",
              ),
              onFieldSubmitted: (text) {},
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
                SelectableText("Encontre Qualquer endereco do Brasil"),
                SelectableText("Exemplo: CE/Fortaleza/Mucuripe"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clean(TextEditingController controller) {
    controller.text = "";
  }
}
