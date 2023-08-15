import 'dart:math';

import 'package:flutter/material.dart';

class Girl extends StatelessWidget {
  final int girlSpriteCount; //1~22
  final String girlDirection;

  Girl({required this.girlSpriteCount,required this.girlDirection});

  @override
  Widget build(BuildContext context) {
    if (girlDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 100,
        width: 100,
        child: Image.asset(
            'lib/images/girlWait' + girlSpriteCount.toString() + '.png'),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 100,
          width: 100,
          child: Image.asset('lib/images/girlWait'+girlSpriteCount.toString() + '.png' ),
        ),
      );
    }
  }
}
