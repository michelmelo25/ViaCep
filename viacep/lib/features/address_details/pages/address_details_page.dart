import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:viacep/core/configs/device/device_info.dart';
import 'package:viacep/shared/widgets/text_line_widget.dart';

class AddressDetailsPage extends StatelessWidget {
  const AddressDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detalhes"),
        centerTitle: true,
      ),
      body: buildBody(context),
      backgroundColor: Colors.lightBlueAccent,
    );
  }

  Widget buildBody(BuildContext context) {
    final Deviceinfo deviceinfo = Deviceinfo();
    return Container(
      width: deviceinfo.width(context),
      alignment: Alignment.center,
      padding: EdgeInsets.only(top: 10),
      child: Container(
        width: deviceinfo.width(context) * 0.95,
        height: deviceinfo.height(context) * 0.5,
        child: Card(
          child: Column(
            children: [
              TextLineWidget(title: "CEP", text: "63621-000"),
              TextLineWidget(title: "Logradouro", text: ""),
              TextLineWidget(title: "Complemento", text: ""),
              TextLineWidget(title: "Bairro", text: "São José de Solonópole"),
              TextLineWidget(title: "Localidade", text: "Solonópole"),
              TextLineWidget(title: "UF", text: "CE"),
              TextLineWidget(title: "DDD", text: "88"),
              if (deviceinfo.isDeskTop(context))
                ElevatedButton(
                    onPressed: () {
                      Modular.to.pop();
                    },
                    child: Text("Nova Cnsulta"))
            ],
          ),
        ),
      ),
    );
  }
}
