import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/util/point.dart';
import 'package:rock_paper_scissors_game/util/randommanager.dart';
import 'package:rock_paper_scissors_game/widgets/itemgamewidget.dart';

class HomeScreen extends StatefulWidget {
  double myWidth, myHight;
  HomeScreen({super.key, required this.myWidth, required this.myHight});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Timer? timer;
  List<MyPoint> myItemPositioned = List.filled(15, MyPoint(0.0, 0.0));
  List<bool> collisionDetect = List.filled(15, false);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    for (var i = 0; i < myItemPositioned.length; i++) {
      myItemPositioned[i] =
          RandomManager().randomPostinedItem(widget.myWidth, widget.myHight);
    }

    timer = Timer.periodic(Duration(milliseconds: 2000), (timer) {
      myMSG();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff698CBF),
      body: SafeArea(
          child: SizedBox(
        width: widget.myWidth,
        height: widget.myHight,
        child: Stack(
          children: [
            !collisionDetect[0]
          ? ItemGameScreenRandom(
              point: myItemPositioned[0],
              index: 0,
              itemType: 1
              // itemType: RandomManager().randomType(),
            )
          : Text(''),
             !collisionDetect[1]
          ? ItemGameScreenRandom(
              point: myItemPositioned[1],
              index: 1,
              itemType: 2,
              // itemType: RandomManager().randomType(),
            )
          : Text(''),
             !collisionDetect[2]
          ? ItemGameScreenRandom(
              point: myItemPositioned[2],
              index: 2,
              itemType: 3,
              // itemType: RandomManager().randomType(),
            )
          : Text(''),
             collisionDetect[3]
          ? ItemGameScreenRandom(
              point: myItemPositioned[3],
              index: 1,
              itemType: RandomManager().randomType(),
            )
          : Text(''),
             collisionDetect[4]
          ? ItemGameScreenRandom(
              point: myItemPositioned[4],
              index: 1,
              itemType: RandomManager().randomType(),
            )
          : Text(''),
             collisionDetect[5]
          ? ItemGameScreenRandom(
              point: myItemPositioned[5],
              index: 2,
              itemType: 1,
            )
          : Text(''),
             collisionDetect[6]
          ? ItemGameScreenRandom(
              point: myItemPositioned[6],
              index: 6,
              itemType: 2,
            )
          : Text(''),
             collisionDetect[7]
          ? ItemGameScreenRandom(
              point: myItemPositioned[7],
              index: 7,
              itemType: 2,
            )
          : Text(''),
             collisionDetect[8]
          ? ItemGameScreenRandom(
              point: myItemPositioned[8],
              index: 8,
              itemType: 2,
            )
          : Text(''),
             collisionDetect[9]
          ? ItemGameScreenRandom(
              point: myItemPositioned[9],
              index: 9,
              itemType: 2,
            )
          : Text(''),
             collisionDetect[10]
          ? ItemGameScreenRandom(
              point: myItemPositioned[10],
              index: 10,
              itemType: 1,
            )
          : Text(''),
             collisionDetect[11]
          ? ItemGameScreenRandom(
              point: myItemPositioned[11],
              index: 11,
              itemType: 3,
            )
          : Text(''),
             collisionDetect[12]
          ? ItemGameScreenRandom(
              point: myItemPositioned[12],
              index: 12,
              itemType:3,
            )
          : Text(''),
            collisionDetect[13]
          ? ItemGameScreenRandom(
              point: myItemPositioned[13],
              index: 13,
              itemType: 3,
            )
          : Text(''),
            collisionDetect[14]
          ? ItemGameScreenRandom(
              point: myItemPositioned[14],
              index: 14,
              itemType: 3,
            )
          : Text(''),
     
     
          ],
        ),
      )),
    );
  }

  void myMSG() {
    check_collisionObBoard();
    for (var i = 0; i < myItemPositioned.length; i++) {
      check_collision(i);
      
      setState(() {
        myItemPositioned[i] =
            RandomManager().randomPostinedItem(widget.myWidth, widget.myHight);
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    timer?.cancel();
  }

  void check_collision(int index) {
    if (myItemPositioned[index].x == 0 && myItemPositioned[index].y == 0) {
      collisionDetectBodychecker(1, index);
    } else if (myItemPositioned[index].x >= 5 &&
        myItemPositioned[index].y == 0) {
      collisionDetectBodychecker(2, index);
    } else if (myItemPositioned[index].x == 0 &&
        myItemPositioned[index].y >= 585) {
      collisionDetectBodychecker(3, index);
    } else if (myItemPositioned[index].x == 0 &&
        myItemPositioned[index].y >= 5) {
      collisionDetectBodychecker(4, index);
    } else if (myItemPositioned[index].x >= 312 &&
        myItemPositioned[index].y >= 5) {
      collisionDetectBodychecker(5, index);
      ;
    } else if (myItemPositioned[index].x == 0 &&
        myItemPositioned[index].y >= 585) {
      collisionDetectBodychecker(6, index);
    } else if (myItemPositioned[index].x >= 5 &&
        myItemPositioned[index].y >= 585) {
      collisionDetectBodychecker(7, index);
    } else if (myItemPositioned[index].x >= 312 ||
        myItemPositioned[index].y >= 585) {
      collisionDetectBodychecker(8, index);
    }
  }

  /*
  State For check collision With Body:
  1=>Top-Right*
  2=>Top
  3=>Top-Left
  4=>Right
  5=>Left
  6=>Bottom-Right
  7=>Bottom
  8=>Bottom-Left
 

  */

  void collisionDetectBodychecker(int directionCollision, int index) {
    //  collisionDetect[index] = true;
    // removedItems++;
    switch (directionCollision) {
      case 1:
        print('CollisionDetect On Top And Right ');

        break;
      case 2:
        print('CollisionDetect On Top ');

        break;
      case 3:
        print('CollisionDetect On Top And Left ');

        break;
      case 4:
        print('CollisionDetect On Right ');

        break;
      case 5:
        print('CollisionDetect On Left  ');

        break;
      case 6:
        print('CollisionDetect On Bottom and Right ');

        break;
      case 7:
        print('CollisionDetect On Bottom  ');

        break;
      case 8:
        print('CollisionDetect On Bottom and Left ');

        break;
    }
  }

  void check_collisionObBoard() {
    double maxx = 0;
    double maxy = 0;

    for (var i = 0; i < myItemPositioned.length - 1; i++) {
      //----------------Detected On Board----------------

      int maxy =
          myItemPositioned[i].y.toInt() > myItemPositioned[i + 1].y.toInt()
              ? myItemPositioned[i].y.toInt()
              : myItemPositioned[i + 1].y.toInt();
      int miny =
          myItemPositioned[i].y.toInt() < myItemPositioned[i + 1].y.toInt()
              ? myItemPositioned[i].y.toInt()
              : myItemPositioned[i + 1].y.toInt();
      int maxx =
          myItemPositioned[i].x.toInt() > myItemPositioned[i + 1].x.toInt()
              ? myItemPositioned[i].x.toInt()
              : myItemPositioned[i + 1].x.toInt();
      int minx =
          myItemPositioned[i].x.toInt() < myItemPositioned[i + 1].x.toInt()
              ? myItemPositioned[i].x.toInt()
              : myItemPositioned[i + 1].x.toInt();
      if (myItemPositioned[i].x.toInt() == myItemPositioned[i + 1].x.toInt() &&
          myItemPositioned[i].y.toInt() == myItemPositioned[i + 1].y.toInt()) {

        print('100');
      } else if (myItemPositioned[i].x.toInt() ==
              myItemPositioned[i + 1].x.toInt() &&
          miny + 100 == maxy) {
        print('200');
      } else if (myItemPositioned[i].x.toInt() ==
              myItemPositioned[i + 1].x.toInt() &&
          miny <= maxy &&
          (maxy - miny <= 101)) {
        print('300');
      } else if (myItemPositioned[i].y.toInt() ==
              myItemPositioned[i + 1].y.toInt() &&
          minx + 100 == maxx) {
        print('400');
      } else if (myItemPositioned[i].y.toInt() ==
              myItemPositioned[i + 1].y.toInt() &&
          minx <= maxx &&
          (maxx - minx <= 101)) {
        print('500');
      }

      //----------------End OF Detected OnBoard------------
    }
  }


}
