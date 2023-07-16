import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rock_paper_scissors_game/util/constanse.dart';
import 'package:rock_paper_scissors_game/util/point.dart';
import 'package:rock_paper_scissors_game/util/randommanager.dart';

class ItemGameScreenRandom extends StatelessWidget {
  MyPoint point;
  int index;
  int itemType;
  ItemGameScreenRandom(
      {super.key,
      required this.index,
      required this.point,
      required this.itemType});

  @override
  Widget build(BuildContext context) {
    String imgUrl='', typeStr='';
    switch (itemType) {
      case 1:
        imgUrl = 'assets/img/stn.svg';
        typeStr = 'سنگ';
        break;
      case 2:
       imgUrl = 'assets/img/ppr.svg';
        typeStr = 'کاغذ';
        break;
      case 3:
       imgUrl = 'assets/img/scr.svg';
        typeStr = 'قیچی';
        break;
    }
    // MyPoint _point=RandomManager().randomPostinedItem(MediaQuery.of(context).size.width, MediaQuery.of(context).size.height);
    return AnimatedPositioned(
        left: point.x,
        top: point.y,
        duration: Duration(microseconds: 500),
        child: Column(
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                  color: RandomManager().randomColor(),
                  borderRadius: BorderRadius.circular(15)),
              child: Column(
                children: [
                  Expanded(
                      child: SvgPicture.asset(
                    imgUrl,
                    fit: BoxFit.contain,
                  )),
                  Text(
                    typeStr,
                    style: TextStyle(
                        fontSize: 18, color: RandomManager().randomColor()),
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
