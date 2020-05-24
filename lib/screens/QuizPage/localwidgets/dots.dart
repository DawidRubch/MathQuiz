import 'package:flutter/material.dart';
import 'package:mathquiz/utils/mediaquery.dart';

class Dot extends StatelessWidget {
  final color;
  Dot(this.color);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(displayWidth(context) * 0.01),
      width: displayWidth(context) * 0.025,
      height: displayHeight(context) * 0.015,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    );
  }
}

class Dots extends StatelessWidget {
  final List colors;
  Dots(this.colors);
  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Dot(colors[0]),
          Dot(colors[1]),
          Dot(colors[2]),
          Dot(colors[3]),
          Dot(colors[4]),
        ]);
  }
}
