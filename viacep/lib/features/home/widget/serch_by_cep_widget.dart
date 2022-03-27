import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'package:viacep/core/configs/consts/app_strings.dart';
import 'package:viacep/core/configs/device/device_info.dart';

class SerchbyCepWidget extends StatelessWidget {
  final TextEditingController controllerCep;
  final Function action;
  const SerchbyCepWidget({
    Key? key,
    required this.controllerCep,
    required this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Deviceinfo deviceinfo = Deviceinfo();
    return Container(
      child: Column(
        children: [
          Container(
            width: deviceinfo.width(context) * 0.5,
            alignment: Alignment.center,
            color: Colors.white,
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
              onFieldSubmitted: (text) {
                action();
              },
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
                SelectableText("Exemplo: 8374-837"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void clean() {
    controllerCep.text = "";
  }
}
