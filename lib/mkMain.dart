import 'package:flutter/material.dart';

void main() => runApp(const Main());

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
      title: 'title',
      home: const HomePage(),
    );
  }
}


var _pageIndex = 0;
const _pages = <Widget>[
  Page1(),
  Page2(2),
  Page3(),
  Page4(),
  Page5(),
  Page6(),
];

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


late TabController _tabController;

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

  @override
  void initState() {
    _tabController = TabController(
      length: 2,
      vsync: this,  //vsync에 this 형태로 전달해야 애니메이션이 정상 처리됨
    );
    super.initState();
  }

  Widget _appBarButton(String text, int idx) {
    return TextButton(
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.black12),
        foregroundColor: MaterialStateProperty.all(Colors.white),
      ),
      child: Text(text),
      onPressed: () {
        setState(() {
          _pageIndex = idx;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('MOVEMENT BEYOND PHYSICAL THERAPY SOLUTIONS'),
        title: TextButton(
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.pink),
          ),
          child: const Text('MOVEMENT BEYOND PHYSICAL THERAPY SOLUTIONS'),
          onPressed: () {
            setState(() {
              _pageIndex = 0;
            });
          },
        ),
        actions: [
          _appBarButton('HOME', 0),
          _appBarButton('ABOUT US', 1),
          _appBarButton('OUR SERVICES', 2),
          _appBarButton('SUPPLIES', 3),
          _appBarButton('INSURANCES', 4),
          _appBarButton('CONTCT US', 5),
          SizedBox.fromSize(size: const Size.fromWidth(20),)
        ],
      ),
      body: _pages[_pageIndex],
    );
  }

}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          const SizedBox(
              height: 200,
              child: Text('page1')
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network('https://i.pinimg.com/564x/d0/fe/0f/d0fe0f49e9670685e429c3087c159f1c.jpg'),
                ),
              ),
              Column(
                children: const [
                  SelectableText('Our Story1', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                  // SizedBox.fromSize(size: const Size.fromHeight(20),),
                  SizedBox(
                    width: 300,
                    child: SelectableText.rich(
                      textAlign: TextAlign.center,
                      TextSpan(text:'Find out about our organization mission, our methods, and the results of our treatments.We are striving hard to be the best physical therapist in Woodbridge, Virginia.'))),
                ],
              )
            ],
          ),
          SizedBox.fromSize(size: const Size.fromHeight(80),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: const [
                    SelectableText('Our Story2',
                        textAlign: TextAlign.start,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                    ),
                    // SizedBox.fromSize(size: const Size.fromHeight(20),),
                    SizedBox(
                      width: 300,
                      child: SelectableText.rich(
                        TextSpan(text:'Find out about our organization mission, our methods, and the results of our treatments.We are striving hard to be the best physical therapist in Woodbridge, Virginia.'),
                        textAlign: TextAlign.end,
                      )
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 300,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.network('https://i.pinimg.com/564x/74/4e/05/744e054fc7a7384083b365f86be56631.jpg'),
                )

                // Image(
                //   image: NetworkImage('https://i.pinimg.com/564x/74/4e/05/744e054fc7a7384083b365f86be56631.jpg'),
                // ),

                // child: FittedBox(
                //   fit: BoxFit.none, // 가로 길이에 맞추도록 설정.
                //   child: Image(
                //     image: NetworkImage('https://talkimg.imbc.com/TVianUpload/tvian/TViews/image/2022/05/02/0e583323-9caa-4504-bba3-72bf0c4916e6.jpg'),
                //   ),
                // ),
              ),
            ],
          ),
          SizedBox.fromSize(size: const Size.fromHeight(50),),
          const BottomLayout()
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2(this.index, {Key? key}) : super(key: key);
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

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

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

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

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

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

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

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

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
