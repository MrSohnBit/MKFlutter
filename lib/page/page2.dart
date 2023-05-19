
import 'package:flutter/material.dart';
import 'package:mkflutter/Component.dart';

class TabPage2 extends StatelessWidget {
  const TabPage2(this.index, {Key? key}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {

    // 공간 크기를 지정하고, FittedBox를 사용.
    return Row(
      children: [
        SizedBox(
          width: 40,
          child: FittedBox(
            fit: BoxFit.fitWidth, // 가로 길이에 맞추도록 설정.
            child: Text('Item$index'),
          ),
        ),
        Expanded(
          child: Container(
            height: 100,
            color: Colors.blue,
          ),
        )
      ],
    );
  }
}