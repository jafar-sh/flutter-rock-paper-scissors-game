import 'dart:math';

import 'package:flutter/material.dart';
import 'package:rock_paper_scissors_game/util/point.dart';

class RandomManager {
  Color randomColor() {
    Random random = Random();
    Color tempcol = Color.fromRGBO(
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
      1,
    );
    return tempcol;
  }

  int randomType() {
    Random random = Random();
    int num = random.nextInt(2);
    return num;
  }

  MyPoint randomPostinedItem(double screenWidth, double screenHight) {
    final randomx = Random();
    final randomy = Random();
    double tmpx, tmpy;
    tmpx = (randomx.nextDouble() * (screenWidth - 50));
    double x_positioned = tmpx > screenWidth ? tmpx : tmpx;

    tmpy = (randomx.nextDouble() * (screenHight - 50));
    double y_positioned = tmpy > screenHight ? tmpy : tmpy;

    // counterItems = counterItems <= 15 ? counterItems++ : 0;

    return MyPoint(x_positioned, y_positioned);
  }
}
