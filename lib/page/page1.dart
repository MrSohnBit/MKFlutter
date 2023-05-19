
import 'package:flutter/material.dart';
import 'package:mkflutter/Component.dart';

class TabPage1 extends StatelessWidget {
  const TabPage1({super.key});


  @override
  Widget build(BuildContext context) {
    final componenent = Componenent();
    return _page1BodyWidget(context, componenent);
  }

  Widget _page1BodyWidget(BuildContext context, Componenent componenent) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final deviceHeight = MediaQuery.of(context).size.height;

    return Column(
      children: [
        SizedBox(
            height: 200,
            child: Text('Width : $deviceWidth\nHeight : $deviceHeight')
        ),
        componenent.expededColumnRowLayout(context,
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/d0fe0f49e9670685e429c3087c159f1c.jpg'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:20.0),
                child: Column(
                  children: const [
                    SelectableText('Our Story', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                    // SizedBox.fromSize(size: const Size.fromHeight(20),),
                    SelectableText.rich(
                    textAlign: TextAlign.center,
                    TextSpan(text:'Find out about our organization mission, our methods, and the results of our treatments.We are striving hard to be the best physical therapist in Woodbridge, Virginia.')
                ),
              ],
            ),
          )
        ),

        SizedBox.fromSize(size: const Size.fromHeight(80),),

        componenent.expededColumnRowLayout2(context,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Column(
              children: const [
                SelectableText('Contact Us', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
                // SizedBox.fromSize(size: const Size.fromHeight(20),),
                SelectableText.rich(
                  textAlign: TextAlign.center,
                  TextSpan(text:'Find out about our organization mission, our methods, and the results of our treatments.We are striving hard to be the best physical therapist in Woodbridge, Virginia.')),
              ],
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset('assets/images/744e054fc7a7384083b365f86be56631.jpg'),
          )
        ),
        SizedBox.fromSize(size: const Size.fromHeight(50),),
      ],
    );
  }
}