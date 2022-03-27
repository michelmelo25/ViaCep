import 'package:flutter/material.dart';

class LoadProgressWidget extends StatelessWidget {
  const LoadProgressWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
