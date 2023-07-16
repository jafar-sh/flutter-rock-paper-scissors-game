import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rock_paper_scissors_game/util/point.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
  

    List<MyPoint> test1 = List.filled(2, MyPoint(100, 0));
    test1[0] = MyPoint(200, 100);
    test1[1] = MyPoint(99.30, 100);
    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    checkState(test1);
    return Scaffold(
      body: SafeArea(
          child: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          AnimatedPositioned(
            left: test1[0].x,
            // right: 0,
            top: test1[0].y,
            // bottom: 10,
            duration: Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.teal, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Expanded(
                      child: SvgPicture.asset(
                    'assets/img/stn.svg',
                    fit: BoxFit.contain,
                  )),
                  Text(
                    'typeStr',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          AnimatedPositioned(
            left: test1[1].x,
            // right: 0,
            top: test1[1].y,
            // bottom: 10,
            duration: Duration(seconds: 1),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: Colors.brown, borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Expanded(
                      child: SvgPicture.asset(
                    'assets/img/stn.svg',
                    fit: BoxFit.contain,
                  )),
                  Text(
                    'typeStr',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  )
                ],
              ),
            ),
          )
        ]),
      )),
    );
  }

  void checkState(List<MyPoint> testme) {
    int maxy = testme[0].y.toInt() > testme[1].y.toInt()
        ? testme[0].y.toInt()
        : testme[1].y.toInt();
    int miny = testme[0].y.toInt() < testme[1].y.toInt()
        ? testme[0].y.toInt()
        : testme[1].y.toInt();
    int maxx = testme[0].x.toInt() > testme[1].x.toInt()
        ? testme[0].x.toInt()
        : testme[1].x.toInt();
    int minx = testme[0].x.toInt() < testme[1].x.toInt()
        ? testme[0].x.toInt()
        : testme[1].x.toInt();
    if (testme[0].x.toInt() == testme[1].x.toInt() &&
        testme[0].y.toInt() == testme[1].y.toInt()) {
      print('100');
    } else if (testme[0].x.toInt() == testme[1].x.toInt() &&
        miny + 100 == maxy) {
      print('200');
    } else if (testme[0].x.toInt() == testme[1].x.toInt() &&
        miny <= maxy &&
        (maxy - miny <= 101)) {
      print('300');
    } else if (testme[0].y.toInt() == testme[1].y.toInt() &&
        minx + 100 == maxx) {
      print('400');
    } else if (testme[0].y.toInt() == testme[1].y.toInt() &&
        minx <= maxx &&
        (maxx - minx <= 101)) {
      print('500');
    }
  }
}
