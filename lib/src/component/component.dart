
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mkflutter/src/sizer.dart';

class Componenent {

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

  Widget drawListTile(BuildContext context, TabController tabController, String label, int index) {
    return ListTile(
      title: Text(label),
      onTap: () {
        tabController.index = index;
        Navigator.pop(context);
      },
    );
  }

  /// 가로 최대 크기 맞추기
  double maxWidth(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth > breakPointWidth ? breakPointWidth : deviceWidth;
  }

  SingleChildScrollView scrollBody(BuildContext context, Widget body) {
    final component = Componenent();
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
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

  Widget expededColumnRowLayout(BuildContext context, Widget widget1, Widget widget2) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth > mobileWidth
      ? Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 5,
            child: widget1
          ),
          Expanded(
            flex: 5,
            child: widget2
          )
        ],
      )
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget1,
          SizedBox.fromSize(size: const Size.fromHeight(20)),
          widget2,
        ],
      );
  }

  Widget expededColumnRowLayout2(BuildContext context, Widget widget1, Widget widget2) {
    final deviceWidth = MediaQuery.of(context).size.width;
    return deviceWidth > mobileWidth
      ? expededColumnRowLayout(context, widget1, widget2)
      : Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          widget2,
          SizedBox.fromSize(size: const Size.fromHeight(20)),
          widget1,
        ],
      );
  }

  Future<dynamic> showdialog(BuildContext context, String title, String message, VoidCallback callback) {
    return showDialog(
      context: context,
      builder: (BuildContext context) =>
      AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('취소')),
          ElevatedButton(
            onPressed: () {
              callback();
              Navigator.of(context).pop();
            },
            child: const Text('확인')),
        ],
      ),
    );
  }

  Future<dynamic> showdialogCupertino(BuildContext context, String title, String message, VoidCallback callback) {
    return showDialog(
      context: context,
      builder: (BuildContext context) =>
        CupertinoAlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            CupertinoDialogAction(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text('취소')),
            CupertinoDialogAction(
                onPressed: () {
                  callback();
                  Navigator.of(context).pop();
                },
                child: const Text('확인')),
          ],
        ),
    );
  }
}

class CToast {
  static void show(BuildContext context, String message) {

    FToast fToast = FToast();
    fToast.init(context);

    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.check),
          const SizedBox(
            width: 12.0,
          ),
          Text(message),
        ],
      ),
    );

    fToast.showToast(
      child: toast,
      gravity: ToastGravity.BOTTOM,
      toastDuration: const Duration(seconds: 2),
    );

    // Fluttertoast.showToast(
    //     msg: "This is Center Short Toast",
    //     toastLength: Toast.LENGTH_SHORT,
    //     gravity: ToastGravity.CENTER,
    //     timeInSecForIosWeb: 1,
    //     backgroundColor: Colors.red,
    //     textColor: Colors.white,
    //     fontSize: 16.0
    // );
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
