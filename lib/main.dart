import 'package:flutter/material.dart';
import 'package:mkflutter/src/component/component.dart';
import 'package:mkflutter/src/view/page1.dart';
import 'package:mkflutter/src/view/page2.dart';
import 'package:mkflutter/src/view/page3.dart';
import 'package:mkflutter/src/view/page4.dart';
import 'package:mkflutter/src/view/page5.dart';
import 'package:mkflutter/src/view/page6.dart';
import 'package:mkflutter/src/sizer.dart';

void main() => runApp(const Main());

final menuLabels = [
  'HOME ',
  'ABOUT US',
  'OUR SERVICES',
  'SUPPLIES',
  'INSURANCES',
  'CONTCT US',
];

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
      animationDuration: Duration.zero, // 탭 애니메이션 없앰
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
    final component = Componenent();

    var drawMenus = <Widget>[const DrawerHeader(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                      ),
                        child: Text('헤더'),
                      )];
    drawMenus.addAll(List.generate(menuLabels.length, (i) => component.drawListTile(context, _tabController, menuLabels[i], i)));

    return Scaffold(
      endDrawer: isMobile
        ? Drawer(
          child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: drawMenus,
        ),
      )
      : null,
      appBar: isMobile
        ? AppBar(
          title: TextButton(
            onPressed: () => (_tabController.index = 0),
            child: const Text("Mobile",style: TextStyle(color: Colors.white)),
          ),
        )
        : AppBar(
          title: const Text(
            'MOVEMENT BEYOND PHYSICAL THERAPY SOLUTIONS',
          ),
        ),
      body: Column(
        children: [
          Visibility(
            visible: isPC,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(),
              ),
              child: TabBar(
                tabs: menuLabels.map((label) => component.tabButton(label)).toList(),

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
          ),

          Expanded(
            child: TabBarView(
              physics:
                isMobile
                  ? const NeverScrollableScrollPhysics()
                  : const ClampingScrollPhysics (),
              controller: _tabController,
              children: List.generate(_bodyPageArray.length, (i) =>
                  (i == 4)
                    ? _bodyPageArray[i] // 스크롤 없는 경우
                    : component.scrollBody(context, _bodyPageArray[i]) // 스크롤 필요한 경우
              ),
            ),
          ),
        ],
      ),
    );
  }
}










