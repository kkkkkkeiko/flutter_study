import 'package:flutter/material.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    void hello(String value) {
      print(value);
    }

    return TextField(
      //無名関数
      //tear-off
      onChanged: hello,
    );
  }
}
