
import 'package:flutter/material.dart';
import 'package:mkflutter/Component.dart';

class TabPage3 extends StatelessWidget {
  const TabPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('page3'),
      ],
    );
  }
}