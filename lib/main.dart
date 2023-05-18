import 'package:flutter/material.dart';
import 'package:mkflutter/Component.dart';
import 'package:mkflutter/page1.dart';
import 'package:mkflutter/page2.dart';
import 'package:mkflutter/page3.dart';
import 'package:mkflutter/page4.dart';
import 'package:mkflutter/page5.dart';
import 'package:mkflutter/page6.dart';

void main() => runApp(const Main());

const _bodyPageArray = <Widget>[
  TabPage1(),
  TabPage2(2),
  TabPage3(),
  TabPage4(),
  TabPage5(),
  TabPage6(),
];

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        colorScheme: const ColorScheme.light(
          primary: Colors.orange,
        ),
        primaryColor: Colors.lightGreenAccent,
        primaryColorLight: Colors.pink,
        // appBarTheme:const AppBarTheme(
        //   backgroundColor: Colors.orangeAccent,
        // ),
        // elevatedButtonTheme: ElevatedButtonThemeData(
        //   style: ButtonStyle(backgroundColor: Colors.orangeAccent);
        // )
        // scaffoldBackgroundColor: Color(0xff0a0e21),
      ),
      title: 'MOVEMENT BEYOND PHYSICAL THERAPY SOLUTIONS',
      home: const TabPage(),
    );
  }
}

class TabPage extends StatefulWidget {
  const TabPage({Key? key}) : super(key: key);

  // @override
  // _TabPageState createState() => _TabPageState();
  @override
  State<TabPage> createState() => _TabPageState();
}

class _TabPageState extends State<TabPage> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;

  @override
  void initState() {
    _tabController = TabController(
      length: _bodyPageArray.length,
      vsync: this,  //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    _tabController.addListener(() {
      // setState(() {
      //   _currentIndex = _tabController.index;
      // });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final component = Componenet();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MOVEMENT BEYOND PHYSICAL THERAPY SOLUTIONS',
        ),
      ),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: TabBar(
              tabs: [
                component.tabButton('HOME'),
                component.tabButton('ABOUT US'),
                component.tabButton('OUR SERVICES'),
                component.tabButton('SUPPLIES'),
                component.tabButton('INSURANCES'),
                component.tabButton('CONTCT US'),
              ],

              indicator: const BoxDecoration(
                gradient: LinearGradient(  //배경 그라데이션 적용
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Colors.blueAccent,
                    Colors.pinkAccent,
                  ],
                ),
              ),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.black,
              controller: _tabController,
            ),
          ),

          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: List.generate(_bodyPageArray.length, (i) => component.scrollBody(context, _bodyPageArray[i])),
              // _bodyPageArray
            ),
          ),
        ],
      ),
    );
  }
}










