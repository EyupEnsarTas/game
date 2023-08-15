import 'dart:math';

import 'package:flutter/material.dart';

class Pet extends StatelessWidget {
  final int petSpriteCount; //1~22
  final String petDirection;

  Pet({required this.petSpriteCount,required this.petDirection});

  @override
  Widget build(BuildContext context) {
    if (petDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset(
            'lib/images/pet' + petSpriteCount.toString() + '.png'),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('lib/images/pet'+petSpriteCount.toString() + '.png' ),
        ),
      );
    }
  }
}
