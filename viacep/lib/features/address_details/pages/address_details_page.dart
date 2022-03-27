import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:viacep/core/configs/device/device_info.dart';
import 'package:viacep/shared/models/address_model.dart';
import 'package:viacep/shared/widgets/text_line_widget.dart';

class AddressDetailsPage extends StatelessWidget {
  final AddressModel addressModel;
  const AddressDetailsPage({
    Key? key,
    required this.addressModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Deviceinfo deviceinfo = Deviceinfo();
    return Scaffold(
      appBar: deviceinfo.isMobile(context)
          ? AppBar(
              title: Text("Detalhes"),
              centerTitle: true,
            )
          : null,
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
        width: 350,
        height: deviceinfo.height(context) * 0.5,
        child: Card(
          child: Column(
            children: [
              TextLineWidget(title: "CEP", text: addressModel.cep ?? ''),
              TextLineWidget(
                  title: "Logradouro", text: addressModel.logradouro ?? ''),
              TextLineWidget(
                  title: "Complemento", text: addressModel.complemento ?? ''),
              TextLineWidget(title: "Bairro", text: addressModel.bairro ?? ''),
              TextLineWidget(
                  title: "Localidade", text: addressModel.localidade ?? ''),
              TextLineWidget(title: "UF", text: addressModel.uf ?? ''),
              TextLineWidget(title: "DDD", text: addressModel.ddd ?? ''),
              if (deviceinfo.isDeskTopPlatform(context)) actionButon()
            ],
          ),
        ),
      ),
    );
  }

  Widget actionButon() {
    return Expanded(
      child: Container(
        alignment: Alignment.bottomCenter,
        padding: EdgeInsets.symmetric(vertical: 10),
        constraints: BoxConstraints(
          maxHeight: 50,
        ),
        child: ElevatedButton(
            onPressed: () {
              Modular.to.pop();
            },
            child: Text("Nova Cnsulta")),
      ),
    );
  }
}
