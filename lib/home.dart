import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double mWidth = 100.0;
  double mHeight = 100.0;
  Color mColor = Colors.green;
  List list = [Colors.yellow,Colors.blue,Colors.orange, Colors.green];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: Center(
        child: Column(
          children: [
            InkWell(
              child: AnimatedContainer(
                  child: Text("Click"),
                  duration: Duration(seconds: 2),
                  width: mWidth,
                  height: mHeight,
                  color: mColor),
              onTap: () {
                // mHeight = mHeight == 100.0 ? 300.0 : 100.0;
                // mWidth = mWidth == 100.0 ? 300.0 : 100.0;
                // mColor = mColor == Colors.green ? Colors.yellow : Colors.green;
                // setState(() {});

                // Timer(Duration(seconds: 2), () {
                //   mHeight = mHeight == 100.0 ? 300.0 : 100.0;
                //   mWidth = mWidth == 100.0 ? 300.0 : 100.0;
                //   mColor =
                //       mColor == Colors.green ? Colors.yellow : Colors.green;
                //   setState(() {});
                // });

                // Random Color
                double random = list[Random().nextInt(list.length-1)];
                mWidth = random;
                mHeight = random;
                mColor = list[Random().nextInt(list.length-1)];
              },
            )
          ],
        ),
      ),
    );
  }
}
