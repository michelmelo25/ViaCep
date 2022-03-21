import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:viacep/core/configs/consts/app_strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerCep = TextEditingController();
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
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.blue.shade200],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
            child: Text("Via CEP"),
          ),
          Container(
            child: TextFormField(
              controller: controllerCep,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.delete_sharp),
                  onPressed: () {
                    clean();
                  },
                ),
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
            child: ElevatedButton(
              child: Text(AppStrings.consultar),
              onPressed: () {
                action();
              },
            ),
          ),
        ],
      ),
    );
  }

  void action() {
    print(controllerCep.text.replaceAll("-", ""));
  }

  void clean() {
    setState(() {
      controllerCep.text = "";
    });
  }
}
