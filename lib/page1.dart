
import 'package:flutter/material.dart';
import 'package:mkflutter/Component.dart';

class TabPage1 extends StatelessWidget {
  const TabPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final component = Componenet();
    return _page1BodyWidget(context);

    // return SingleChildScrollView(
    //   child: Column(
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     mainAxisAlignment: MainAxisAlignment.start,
    //     children: [
    //       // Body
    //       Padding(
    //         padding: const EdgeInsets.symmetric(horizontal:20.0),
    //         child: SizedBox(
    //             width: component.maxWidth(context),
    //             child: _page1BodyWidget(context)
    //         ),
    //       ),
    //       // Bottom
    //       const BottomLayout()
    //     ],
    //   ),
    // );
  }

  Widget _page1BodyWidget(BuildContext context) {
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