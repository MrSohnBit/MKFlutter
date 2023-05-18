import 'package:flutter/material.dart';

void main() => runApp(const Main());

const _tabPageArray = <Widget>[
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
      length: _tabPageArray.length,
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
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'MOVEMENT BEYOND PHYSICAL THERAPY SOLUTIONS',
        ),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(),
                ),
                child: TabBar(
                  tabs: [
                    _tabButton('HOME'),
                    _tabButton('ABOUT US'),
                    _tabButton('OUR SERVICES'),
                    _tabButton('SUPPLIES'),
                    _tabButton('INSURANCES'),
                    _tabButton('CONTCT US'),
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
                  children: _tabPageArray
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget _tabButton(String text) {
  return Container(
    height: 50,
    alignment: Alignment.center,
    child: Text(
      text,
    ),
  );
}

class TabPage1 extends StatelessWidget {
  const TabPage1({super.key});

  @override
  Widget build(BuildContext context) {

    double maxWidth() {
      final deviceWidth = MediaQuery.of(context).size.width;
      return deviceWidth > 1000 ? 1000 : deviceWidth;
    }

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Body
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: SizedBox(
                width: maxWidth(),
                child: _bodyWidget(context)
            ),
          ),
          // Bottom
          const BottomLayout()
        ],
      ),
    );
  }

  Widget _bodyWidget(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
            height: 200,
            child: Text('page1')
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 5,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network('https://i.pinimg.com/564x/d0/fe/0f/d0fe0f49e9670685e429c3087c159f1c.jpg'),
              ),
            ),

              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Column(
                    children: const [
                      SelectableText('Our Story1', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      // SizedBox.fromSize(size: const Size.fromHeight(20),),
                      SelectableText.rich(
                          textAlign: TextAlign.center,
                          TextSpan(text:'Find out about our organization mission, our methods, and the results of our treatments.We are striving hard to be the best physical therapist in Woodbridge, Virginia.')),
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox.fromSize(size: const Size.fromHeight(80),),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal:20.0),
                  child: Column(
                    children: const [
                      SelectableText('Our Story2', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                      // SizedBox.fromSize(size: const Size.fromHeight(20),),
                      SelectableText.rich(
                          textAlign: TextAlign.center,
                          TextSpan(text:'Find out about our organization mission, our methods, and the results of our treatments.We are striving hard to be the best physical therapist in Woodbridge, Virginia.')),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network('https://i.pinimg.com/564x/74/4e/05/744e054fc7a7384083b365f86be56631.jpg'),
                ),
              ),
            ],
          ),

          SizedBox.fromSize(size: const Size.fromHeight(50),),
        ],
    );
  }
}

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

class TabPage4 extends StatelessWidget {
  const TabPage4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('page4'),
      ],
    );
  }
}

class TabPage5 extends StatelessWidget {
  const TabPage5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('page5'),
      ],
    );
  }
}

class TabPage6 extends StatelessWidget {
  const TabPage6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text('page6'),
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
