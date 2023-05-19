
import 'package:flutter/material.dart';
import 'package:mkflutter/Component.dart';

class TabPage3 extends StatelessWidget {
  const TabPage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Componenent componenent = Componenent();
    
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: const Text('메터리얼 Dialog'),
            onPressed: () {
              componenent.showdialog(context, "타이틀", "메터리얼 Dialog", () {
              });
            },
          ),
          SizedBox.fromSize(size: Size.fromHeight(50),),
          ElevatedButton(
            child: const Text('쿠퍼티노 Dialog'),
            onPressed: () {
              componenent.showdialogCupertino(context, "타이틀", "쿠퍼티노 Dialog", () {

              });
            },
          ),
        ],
      ),
    );
  }
}