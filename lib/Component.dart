
import 'package:flutter/material.dart';

class Componenet {

  // 탭 메뉴 버튼
  Widget tabButton(String text) {
    return Container(
      height: 50,
      alignment: Alignment.center,
      child: Text(
        text,
      ),
    );
  }


  /// 가로 최대 크기 맞추기
  double maxWidth(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth > 1000 ? 1000 : deviceWidth;
  }


  SingleChildScrollView scrollBody(BuildContext context, Widget body) {
    final component = Componenet();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: SizedBox(
                width: component.maxWidth(context),
                child: body
            ),
          ),
          // Bottom
          const BottomLayout()
        ],
      ),
    );
  }
}

class BaseStatelessWidget extends StatelessWidget {
  const BaseStatelessWidget({Key? key}) : super(key: key);
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


class BottomLayout extends StatelessWidget {
  const BottomLayout({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SelectableText('BMH PHYSICAL THERAPY, 4495 CHESHIRE STATION PLAZA, WOODBRIDGE, VA, 22193, UNITED'),
            SelectableText('STATEST. 571-659-2540 M. 571-651-0847BMHPHYSICALTHERAPY@GMAIL.COM'),
          ],
        ),
      ),
    );
  }
}
