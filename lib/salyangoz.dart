import 'dart:math';

import 'package:flutter/material.dart';

class Salyangoz extends StatelessWidget {
  final int salySpriteCount; //1~4
  final String salyDirection;

  Salyangoz({required this.salySpriteCount,required this.salyDirection});

  @override
  Widget build(BuildContext context) {
    if (salyDirection == 'left') {
      return Container(
        alignment: Alignment.bottomCenter,
        height: 50,
        width: 50,
        child: Image.asset(
            'lib/images/salyangoz' + salySpriteCount.toString() + '.png'),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: Container(
          alignment: Alignment.bottomCenter,
          height: 50,
          width: 50,
          child: Image.asset('lib/images/salyangoz'+salySpriteCount.toString() + '.png' ),
        ),
      );
    }
  }
}
